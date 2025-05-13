package SchoolManagementPackage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static String url = "jdbc:mysql://localhost:3306/sims"; // Added database name
    private static String username = "root"; // Replace with your database username
    private static String password = "admin"; // Replace with your database password
    private static Connection con;
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Database connection successful");
        } catch (ClassNotFoundException e) {
            System.out.println("Database driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Database connection error: " + e.getMessage());
        }
        
        
       if (con== null) {
        	System.out.println("Connection Error");
        } 
        return con;
    }
}  