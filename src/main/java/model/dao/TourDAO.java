package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.bean.TourBean;

public class TourDAO {

    public List<TourBean> getAllTours() {
        List<TourBean> tours = new ArrayList<>();
        // Query này lấy thông tin tour VÀ đếm số lượng booking của tour đó
        String sql = "SELECT t.*, (SELECT COUNT(*) FROM booking b WHERE b.tour_id = t.id) as booked_count " +
                     "FROM tour t";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                tours.add(new TourBean(
                    rs.getInt("id"), 
                    rs.getString("name"), 
                    rs.getString("description"), 
                    rs.getDouble("price"), 
                    rs.getString("start_date"),
                    rs.getInt("capacity"),
                    rs.getInt("booked_count"), // Lấy số lượng đã đặt
                    rs.getString("imageURL")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tours;
    }

    public void addTour(TourBean tour) {
        String sql = "INSERT INTO tour (name, description, price, start_date, capacity,imageURL) VALUES (?, ?, ?, ?, ?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tour.getName());
            ps.setString(2, tour.getDescription());
            ps.setDouble(3, tour.getPrice());
            ps.setString(4, tour.getStartDate());
            ps.setInt(5, tour.getCapacity());
            ps.setString(6,tour.getImageURL());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateTour(TourBean tour) {
        String sql = "UPDATE tour SET name=?, description=?, price=?, start_date=?, capacity=?,imageURL=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tour.getName());
            ps.setString(2, tour.getDescription());
            ps.setDouble(3, tour.getPrice());
            ps.setString(4, tour.getStartDate());
            ps.setInt(5, tour.getCapacity());
            ps.setString(6,tour.getImageURL());
            ps.setInt(7, tour.getId());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteTour(int id) {
        String sql = "DELETE FROM tour WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public TourBean getTourById(int id) {
        // Cần đếm số lượng đã đặt để kiểm tra full chỗ chưa
        String sql = "SELECT t.*, (SELECT COUNT(*) FROM booking b WHERE b.tour_id = t.id) as booked_count FROM tour t WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new TourBean(
                        rs.getInt("id"), 
                        rs.getString("name"), 
                        rs.getString("description"), 
                        rs.getDouble("price"), 
                        rs.getString("start_date"),
                        rs.getInt("capacity"),
                        rs.getInt("booked_count"),
                        rs.getString("imageURL")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}