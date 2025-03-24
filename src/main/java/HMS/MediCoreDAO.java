package HMS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MediCoreDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/medicore"; // Ensure DB name is correct
    private static final String USER = "root"; // Your MySQL username
    private static final String PASS = "123456"; // Your MySQL password

    public static Connection dbConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Database connected successfully...");
        } catch (Exception e) {
            System.out.println("Database connection failed: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }

    public boolean doctorCheck(String un, String pw) {
        Connection con = dbConnection();
        if (con == null) {
            return false; // Database connection failed
        }

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Ensure column names match the table
            String query = "SELECT * FROM doctor WHERE un=? AND pw=?";
            ps = con.prepareStatement(query);
            ps.setString(1, un);
            ps.setString(2, pw);
            
            System.out.println("Executing query: " + ps.toString());

            rs = ps.executeQuery();
            
            if (rs.next()) {
                System.out.println("Login successful for user: " + un);
                return true;
            } else {
                System.out.println("Invalid username or password.");
            }
        } catch (Exception e) {
            System.out.println("Error checking credentials: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        return false;
    }
    
}
