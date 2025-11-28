package model.dao;

import java.sql.*;
import model.bean.CustomerBean;

public class CustomerDAO {

    // 1. Lưu khách hàng mới và lấy về ID vừa tạo
    public void saveCustomer(CustomerBean customer) {
        String sql = "INSERT INTO customer (name, email, phone, user_id) VALUES (?, ?, ?, ?)";
        
        // Sử dụng RETURN_GENERATED_KEYS để lấy ID tự tăng
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPhone());
            ps.setInt(4, customer.getUserId());
            
            int affectedRows = ps.executeUpdate();

            // Lấy ID vừa được tạo ra từ database gán ngược lại cho object customer
            if (affectedRows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        customer.setId(rs.getInt(1)); 
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 2. [QUAN TRỌNG] Hàm này được BookingBO gọi để kiểm tra khách hàng cũ
    public CustomerBean getCustomerByUserId(int userId) {
        String sql = "SELECT * FROM customer WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new CustomerBean(
                        rs.getInt("id"), 
                        rs.getString("name"), 
                        rs.getString("email"), 
                        rs.getString("phone"), 
                        rs.getInt("user_id")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu chưa tìm thấy khách hàng nào gắn với user này
    }

    // 3. Lấy thông tin khách hàng theo ID (dùng cho các chức năng khác nếu cần)
    public CustomerBean getCustomerById(int id) {
        String sql = "SELECT * FROM customer WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new CustomerBean(
                        rs.getInt("id"), 
                        rs.getString("name"), 
                        rs.getString("email"), 
                        rs.getString("phone"), 
                        rs.getInt("user_id")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}