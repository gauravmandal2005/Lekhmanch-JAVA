
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/newsletter")
public class NewsletterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private final String jdbcURL = "jdbc:mysql://localhost:3306/project";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = ""; // Keep this empty if you're using XAMPP's default

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Insert query
            String sql = "INSERT INTO newsletter_subscribers (email) VALUES (?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.executeUpdate();

            // Close resources
            statement.close();
            connection.close();

            // Redirect or show a message
            response.sendRedirect("loginHome.jsp"); // Create this page optionally

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
