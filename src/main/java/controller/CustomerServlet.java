package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import model.bean.CustomerBean;
import model.bean.UserBean;
import model.bo.CustomerBO;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private CustomerBO customerBO = new CustomerBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/user/login.jsp");
            return;
        }
        CustomerBean customer = customerBO.getCustomerByUserId(user.getId());
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/jsp/user/customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        CustomerBean customer = new CustomerBean();
        customer.setId(id);
        customer.setName(name);
        customer.setEmail(email);
        customer.setPhone(phone);

        boolean success = customerBO.updateCustomer(customer);
        if (success) {
            request.setAttribute("message", "Cập nhật thông tin thành công!");
        } else {
            request.setAttribute("message", "Cập nhật thất bại. Vui lòng thử lại.");
        }
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        CustomerBean updatedCustomer = customerBO.getCustomerByUserId(user.getId());
        request.setAttribute("customer", updatedCustomer);
        request.getRequestDispatcher("/jsp/user/customer.jsp").forward(request, response);
    }
}
