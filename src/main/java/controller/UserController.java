package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.bean.UserBean;
import model.bo.UserBO;

public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserBO userBO = new UserBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false); 

        if ("logout".equals(action)) {
            if (session != null) {
                session.invalidate(); 
            }
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        if (session != null && session.getAttribute("user") != null) {
            UserBean user = (UserBean) session.getAttribute("user");
            if ("admin".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/jsp/admin/dashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/jsp/user/dashboard.jsp");
            }
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/user/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("register".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            UserBean user = new UserBean(0, username, password, "user");
            
            if (userBO.register(user)) {
                response.sendRedirect(request.getContextPath() + "/jsp/user/login.jsp?success=1");
            } else {
                request.setAttribute("error", "Đăng ký thất bại (Username đã tồn tại hoặc lỗi hệ thống)");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/user/register.jsp");
                dispatcher.forward(request, response);
            }

        } else if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            UserBean user = userBO.login(username, password);
            
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                if ("admin".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/jsp/admin/dashboard.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/jsp/user/dashboard.jsp");
                }
            } else {
                request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/user/login.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}