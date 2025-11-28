package model.bo;

import java.util.List;

import model.bean.Review;
import model.dao.ReviewDAO;

public class ReviewBO {
	ReviewDAO reviewDAO = new ReviewDAO();

	public List<Review> getReviewsByTour(int tourId) {
		return reviewDAO.getReviewsByTour(tourId);
		
	}

	public void addReview(Review rv) {
		reviewDAO.addReview(rv);
		
	}
	
}
