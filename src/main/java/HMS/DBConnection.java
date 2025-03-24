package HMS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/medicore?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "root";
        String password = "123456";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Ensure MySQL driver is loaded
            System.out.println("Connecting to database...");
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Database connected successfully.");
            return conn;
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found! Add it to your classpath.");
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database.");
            e.printStackTrace();
            return null;
        }
    }
}
