package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.bean.TourBean;
import model.bean.UserBean;
import model.bo.TourBO;

public class TourController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TourBO tourBO = new TourBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("edit".equals(action)) {
            // Chức năng hiển thị form sửa (Chỉ Admin)
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                TourBean tour = tourBO.getTourById(id);
                if (tour != null) {
                    request.setAttribute("tour", tour);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/tour/editTour.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.sendRedirect("tours");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("tours");
            }
        } else {
            // Mặc định: Liệt kê danh sách tour (Cho tất cả mọi người)
            List<TourBean> tours = tourBO.getAvailableTours();
            request.setAttribute("tours", tours);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/tour/listTour.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
       
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        
        if (user == null || !"admin".equals(user.getRole())) {
            response.sendRedirect("jsp/user/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        
        try {
            if ("add".equals(action)) {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                String startDate = request.getParameter("startDate");
                
                // Lấy capacity (mặc định 20 nếu người dùng nhập sai hoặc để trống)
                int capacity = 20;
                try {
                    String capStr = request.getParameter("capacity");
                    if (capStr != null && !capStr.isEmpty()) {
                        capacity = Integer.parseInt(capStr);
                    }
                } catch (NumberFormatException e) {
                    // Giữ nguyên mặc định 20
                }
                String imageURL = request.getParameter("imageURL");
                // Tạo bean mới (bookedCount mặc định là 0 vì mới tạo)
                TourBean tour = new TourBean(0, name, description, price, startDate, capacity, 0,imageURL);
                
                if (tourBO.addTour(tour)) {
                    response.sendRedirect("tours");
                } else {
                    request.setAttribute("error", "Thêm tour thất bại (Dữ liệu không hợp lệ)");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/tour/addTour.jsp");
                    dispatcher.forward(request, response);
                }

            } else if ("update".equals(action)) {
                // Lấy dữ liệu cập nhật
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                String startDate = request.getParameter("startDate");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                String imageURL = request.getParameter("imageURL");

                // Tạo bean để update (bookedCount truyền 0 cũng được vì DAO update không sửa cột này)
                TourBean tour = new TourBean(id, name, description, price, startDate, capacity,0,imageURL);
                
                if (tourBO.updateTour(tour)) {
                    response.sendRedirect("tours");
                } else {
                    request.setAttribute("error", "Cập nhật thất bại");
                    request.setAttribute("tour", tour); // Giữ lại thông tin để hiện lại ở form
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/tour/editTour.jsp");
                    dispatcher.forward(request, response);
                }

            } else if ("delete".equals(action)) {
                // Xóa tour
                int id = Integer.parseInt(request.getParameter("id"));
                tourBO.deleteTour(id);
                response.sendRedirect("tours");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi bất ngờ (như lỗi format số), quay về danh sách
            response.sendRedirect("tours");
        }
    }
}