package model.bo;

import java.util.List;
import model.bean.BookingBean;
import model.bean.CustomerBean;
import model.bean.TourBean;
import model.dao.BookingDAO;
import model.dao.CustomerDAO;
import model.dao.TourDAO;

public class BookingBO {
    private BookingDAO bookingDAO = new BookingDAO();
    private CustomerDAO customerDAO = new CustomerDAO();
    private TourDAO tourDAO = new TourDAO(); // Thêm TourDAO để check slot

    public boolean processBooking(BookingBean booking, CustomerBean customer) {
        // 1. Kiểm tra dữ liệu đầu vào
        if (booking.getTourId() <= 0 || customer.getName() == null) {
            return false;
        }

        // 2. CHECK CAPACITY: Kiểm tra xem tour còn chỗ không
        TourBean tour = tourDAO.getTourById(booking.getTourId());
        if (tour == null || tour.getAvailableSlots() <= 0) {
            return false; // Tour không tồn tại hoặc đã hết chỗ
        }

        // 3. Xử lý khách hàng (cũ/mới)
        CustomerBean existingCustomer = customerDAO.getCustomerByUserId(customer.getUserId());
        if (existingCustomer != null) {
            booking.setCustomerId(existingCustomer.getId());
        } else {
            customerDAO.saveCustomer(customer);
            booking.setCustomerId(customer.getId());
        }

        // 4. Lưu booking
        if (booking.getCustomerId() > 0) {
            bookingDAO.saveBooking(booking);
            return true;
        }
        return false;
    }

    public List<BookingBean> getBookingsByCustomer(int customerId) {
        return bookingDAO.getBookingsByCustomer(customerId);
    }
    
    // Hàm mới cho Admin
    public List<BookingBean> getAllBookings() {
        return bookingDAO.getAllBookings();
    }

    public boolean cancelBooking(int bookingId, int userId) {
        return bookingDAO.cancelBooking(bookingId, userId);
    }
}