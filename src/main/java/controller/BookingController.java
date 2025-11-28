package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.bean.BookingBean;
import model.bean.CustomerBean;
import model.bean.UserBean;
import model.bo.BookingBO;
import model.dao.CustomerDAO;

public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingBO bookingBO = new BookingBO();
    private CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("jsp/user/login.jsp");
            return;
        }
        
        List<BookingBean> bookings = new ArrayList<>();

        // LOGIC MỚI: Nếu là ADMIN thì xem HẾT, nếu là USER thì xem RIÊNG
        if ("admin".equals(user.getRole())) {
            bookings = bookingBO.getAllBookings();
        } else {
            CustomerBean customer = customerDAO.getCustomerByUserId(user.getId());
            if (customer != null) {
                bookings = bookingBO.getBookingsByCustomer(customer.getId());
            }
        }
        
        request.setAttribute("bookings", bookings);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/booking/listBookings.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("jsp/user/login.jsp");
            return;
        }
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("book".equals(action)) {
            try {
                int tourId = Integer.parseInt(request.getParameter("tourId"));
                String customerName = request.getParameter("customerName");
                String customerEmail = request.getParameter("customerEmail");
                String customerPhone = request.getParameter("customerPhone");
                String bookingDate = request.getParameter("bookingDate");
                
                CustomerBean customer = new CustomerBean(0, customerName, customerEmail, customerPhone, user.getId());
                BookingBean booking = new BookingBean(0, tourId, 0, bookingDate, "Confirmed");

                if (bookingBO.processBooking(booking, customer)) {
                    // LOGIC MỚI: Đặt thành công -> Chuyển hướng về trang danh sách Booking
                    response.sendRedirect("bookings"); 
                } else {
                    request.setAttribute("error", "Đặt tour thất bại (Có thể tour đã hết chỗ).");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/booking/bookTour.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("tours");
            }
        } else if ("cancel".equals(action)) {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            bookingBO.cancelBooking(bookingId, user.getId());
            response.sendRedirect("bookings");
        }
    }
}