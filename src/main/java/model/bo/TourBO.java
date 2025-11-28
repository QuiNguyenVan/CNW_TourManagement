package model.bo;

import java.util.List;
import model.bean.TourBean;
import model.dao.TourDAO;

public class TourBO {
    private TourDAO tourDAO = new TourDAO();

    public List<TourBean> getAvailableTours() {
        return tourDAO.getAllTours(); 
    }

    public boolean addTour(TourBean tour) {
        if (tour.getPrice() > 0 && tour.getName() != null && !tour.getName().isEmpty()) {
            tourDAO.addTour(tour);
            return true;
        }
        return false;
    }

    public boolean updateTour(TourBean tour) {
        if (tour.getId() > 0 && tour.getPrice() > 0) {
            return tourDAO.updateTour(tour);  
        }
        return false;
    }

    public boolean deleteTour(int id) {
        return tourDAO.deleteTour(id); 
    }

    public TourBean getTourById(int id) {
        return tourDAO.getTourById(id);
    }
}