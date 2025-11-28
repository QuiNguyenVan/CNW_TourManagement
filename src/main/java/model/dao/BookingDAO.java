package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.bean.BookingBean;

public class BookingDAO {

    // ... (Giữ nguyên hàm saveBooking)
    public void saveBooking(BookingBean booking) {
        String sql = "INSERT INTO booking (tour_id, customer_id, booking_date, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, booking.getTourId());
            ps.setInt(2, booking.getCustomerId());
            ps.setString(3, booking.getBookingDate());
            ps.setString(4, booking.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 1. Hàm lấy danh sách chi tiết cho Admin (JOIN 3 bảng để xem thống kê)
    public List<BookingBean> getAllBookings() {
        List<BookingBean> bookings = new ArrayList<>();
        // Lấy tên khách, tên tour, sđt để Admin liên hệ khi cần
        String sql = "SELECT b.*, t.name AS tour_name, t.price, c.name AS cust_name, c.phone " +
                     "FROM booking b " +
                     "JOIN tour t ON b.tour_id = t.id " +
                     "JOIN customer c ON b.customer_id = c.id " +
                     "ORDER BY b.booking_date DESC";
                     
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                BookingBean bean = new BookingBean(
                    rs.getInt("id"), 
                    rs.getInt("tour_id"), 
                    rs.getInt("customer_id"), 
                    rs.getString("booking_date"), 
                    rs.getString("status")
                );
                // Gán thông tin hiển thị
                bean.setTourName(rs.getString("tour_name"));
                bean.setTourPrice(rs.getDouble("price"));
                bean.setCustomerName(rs.getString("cust_name"));
                bean.setCustomerPhone(rs.getString("phone"));
                
                bookings.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // 2. Hàm lấy booking của User (Cũng JOIN để hiện tên Tour)
    public List<BookingBean> getBookingsByCustomer(int customerId) {
        List<BookingBean> bookings = new ArrayList<>();
        String sql = "SELECT b.*, t.name AS tour_name, t.price FROM booking b JOIN tour t ON b.tour_id = t.id WHERE customer_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BookingBean bean = new BookingBean(
                        rs.getInt("id"), rs.getInt("tour_id"), rs.getInt("customer_id"), 
                        rs.getString("booking_date"), rs.getString("status")
                    );
                    bean.setTourName(rs.getString("tour_name"));
                    bean.setTourPrice(rs.getDouble("price"));
                    bookings.add(bean);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // 3. Hàm hủy booking (Cho User)
    public boolean cancelBooking(int bookingId, int userId) {
        String sql = "DELETE b FROM booking b JOIN customer c ON b.customer_id = c.id WHERE b.id = ? AND c.user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}