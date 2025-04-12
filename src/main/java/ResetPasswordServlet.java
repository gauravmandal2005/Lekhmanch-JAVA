import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Passwords do not match.");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/project", "root", "");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET password = ? WHERE email = ?");
            ps.setString(1, password);
            ps.setString(2, email);

            int updated = ps.executeUpdate();
            if (updated > 0) {
                session.removeAttribute("email");
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("message", "Failed to reset password.");
                request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Something went wrong.");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        }
    }
}
