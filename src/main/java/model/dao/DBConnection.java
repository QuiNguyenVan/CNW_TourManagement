package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Cập nhật password của bạn tại đây
    private static final String URL = "jdbc:mysql://localhost:3306/tourdb";
    private static final String USER = "root";
    private static final String PASS = ""; 

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("Error loading MySQL Driver: " + e.getMessage());
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}