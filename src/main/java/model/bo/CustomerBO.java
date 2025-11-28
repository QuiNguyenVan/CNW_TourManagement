package model.bo;

import model.bean.CustomerBean;
import model.dao.CustomerDAO;

public class CustomerBO {

	 private CustomerDAO customerDAO = new CustomerDAO();

	    public CustomerBean getCustomerByUserId(int userId) {
	        return customerDAO.getCustomerByUserId(userId);
	    }

	    public CustomerBean getCustomerById(int id) {
	        return customerDAO.getCustomerById(id);
	    }

	    public boolean updateCustomer(CustomerBean customer) {
	        return customerDAO.updateCustomer(customer);
	    }


}
