

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/existinguser")
public class existinguser extends HttpServlet {
	  private static final long serialVersionUID = 1L;
	    private static final String DB_URL = "jdbc:mysql://localhost:3306/project"; // Ensure database exists
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = ""; // Update with correct password
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public existinguser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        String email = request.getParameter("email").trim();   // Trim to avoid extra spaces
        String password = request.getParameter("password").trim();
        String role = request.getParameter("role");

        HttpSession session = request.getSession();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Database Connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Database connected successfully!");

            // Use correct column names from the 'users' table
            String query = "SELECT full_name FROM users WHERE email=? AND password=?";
            pst = conn.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if (rs.next()) {
                String fullName = rs.getString("full_name"); // Fetch user's name

                // Sanitize cookie value to avoid invalid characters
                String sanitizedUser = fullName.replaceAll("\\s+", "_").trim();

                // Store user information in session
                session.setAttribute("user", sanitizedUser);

                // Create a cookie with sanitized username
                Cookie userCookie = new Cookie("user", sanitizedUser);
                userCookie.setMaxAge(1800); // 30-minute expiry
                response.addCookie(userCookie);

                // Redirect based on role
                response.sendRedirect("user".equals(role) ? "loginHome.jsp" : "adminDashboard.jsp");
            } else {
                session.setAttribute("error", "Invalid email or password.");
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Database connection error: " + e.getMessage());
            response.sendRedirect("dashboard");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (Exception ignored) {}
        }
	}

}
