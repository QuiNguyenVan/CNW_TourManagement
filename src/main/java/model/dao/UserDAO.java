package model.dao;

import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;
import model.bean.UserBean;

public class UserDAO {

    public void registerUser(UserBean user) {
        String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        String sql = "INSERT INTO user (username, password, role) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, user.getUsername());
            ps.setString(2, hashedPassword);
            ps.setString(3, user.getRole());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public UserBean loginUser(String username, String password) {
        String sql = "SELECT * FROM user WHERE username = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password");
                    boolean isHashed = storedPassword.startsWith("$2a$") || storedPassword.startsWith("$2b$") || storedPassword.startsWith("$2y$");
                    
                    if (!isHashed) {
                        // Logic tự sửa lỗi: Nếu pass trong DB chưa hash thì so sánh thường rồi hash lại
                        if (storedPassword.equals(password)) {
                            String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
                            updatePassword(username, hashed);
                            return new UserBean(rs.getInt("id"), rs.getString("username"), hashed, rs.getString("role"));
                        }
                    } else {
                        // Check pass đã hash
                        if (BCrypt.checkpw(password, storedPassword)) {
                            return new UserBean(rs.getInt("id"), rs.getString("username"), storedPassword, rs.getString("role"));
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void updatePassword(String username, String hashedPassword) {
        String sql = "UPDATE user SET password = ? WHERE username = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, hashedPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}