package model.bean;

import java.util.Date;

public class Review {
	int reviewId,userId,tourId,rating;
	String comment;
	String name;
	Date createdAt;
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getTourId() {
		return tourId;
	}
	public void setTourId(int tourId) {
		this.tourId = tourId;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createAt) {
		this.createdAt = createAt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
