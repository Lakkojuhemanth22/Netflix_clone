package JDBC;

import java.sql.*;

public class JDBCUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/netflix_clone";
    private static final String USER = "root";
    private static final String PASSWORD = "Hemanth@2212";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
