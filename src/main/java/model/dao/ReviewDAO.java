package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.bean.Review;

public class ReviewDAO {
	public List<Review> getReviewsByTour(int tourId) {
	    List<Review> list = new ArrayList<>();
	    String sql = "SELECT * FROM review r JOIN customer u ON r.userID=u.user_id WHERE tourID=?";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, tourId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Review r = new Review();
	            r.setReviewId(rs.getInt("reviewID"));
	            r.setTourId(rs.getInt("tourID"));
	            r.setUserId(rs.getInt("userID"));
	            r.setName(rs.getString("name"));
	            r.setComment(rs.getString("comment"));
	            r.setRating(rs.getInt("rating"));
	            r.setCreatedAt(rs.getDate("createdAt"));
	            list.add(r);
	        }

	    } catch (Exception e) { e.printStackTrace(); }

	    return list;
	}

	public void addReview(Review rv) {
		String sql = "INSERT INTO review(userID, tourID, rating, comment)"
				+ "VALUES (?,?,?,?)";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, rv.getUserId());
	        ps.setInt(2,rv.getTourId());
	        ps.setInt(3, rv.getRating());
	        ps.setString(4, rv.getComment());
	        ps.executeUpdate();

	    } catch (Exception e) { e.printStackTrace(); }

	}

}
