package model.bo;

import model.bean.UserBean;
import model.dao.UserDAO;

public class UserBO {
    private UserDAO userDAO = new UserDAO();

    public boolean register(UserBean user) {
        if (user.getUsername() != null && !user.getUsername().isEmpty() && user.getPassword().length() >= 6) {
            user.setRole("user");
            userDAO.registerUser(user);
            return true;
        }
        return false;
    }

    public UserBean login(String username, String password) {
        return userDAO.loginUser(username, password);
    }
}