package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Review;
import model.bean.UserBean;
import model.bo.ReviewBO;

import java.io.IOException;

@WebServlet("/addReview")
public class AddReviewServlet extends HttpServlet {

    private ReviewBO reviewBO = new ReviewBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int tourId = Integer.parseInt(req.getParameter("tourId"));
        int rating = Integer.parseInt(req.getParameter("rating"));
        String comment = req.getParameter("comment");

        UserBean user = (UserBean) req.getSession().getAttribute("user");

        Review rv = new Review();
        rv.setTourId(tourId);
        rv.setUserId(user.getId());
        rv.setRating(rating);
        rv.setComment(comment);

        reviewBO.addReview(rv);

        resp.sendRedirect(req.getContextPath() + "/tourDetail?tourId=" + tourId);
    }
}

