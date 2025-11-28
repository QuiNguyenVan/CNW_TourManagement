package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Review;
import model.bean.TourBean;
import model.bo.ReviewBO;
import model.bo.TourBO;

import java.io.IOException;
import java.util.List;

@WebServlet("/tourDetail")
public class TourDetailServlet extends HttpServlet {

    private TourBO tourBO = new TourBO();
    private ReviewBO reviewBO = new ReviewBO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int tourId = Integer.parseInt(req.getParameter("tourId"));

        // lấy thông tin tour
        TourBean tour = tourBO.getTourById(tourId);

        // lấy danh sách review theo tourId
        List<Review> reviews = reviewBO.getReviewsByTour(tourId);

        req.setAttribute("tour", tour);
        req.setAttribute("reviews", reviews);

        req.getRequestDispatcher("/jsp/tour/tourDetail.jsp").forward(req, resp);
    }
}

