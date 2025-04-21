import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String email = request.getParameter("email");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/project", "root", "");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Optional: you can redirect to a page where user resets password
                HttpSession session = request.getSession();
                session.setAttribute("email", email); 
                response.sendRedirect("resetpassword.jsp");
            } else {
                request.setAttribute("message", "Email not found.");
                request.getRequestDispatcher("forgot.jsp").forward(request, response);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Something went wrong.");
            request.getRequestDispatcher("forgot.jsp").forward(request, response);
        }
    }
}
