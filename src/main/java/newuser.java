import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/newuser")
public class newuser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public newuser() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fullName = request.getParameter("full-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        // Password match check
        if (fullName == null || email == null || password == null || confirmPassword == null ||
            fullName.isEmpty() || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
            out.println("<h3 style='color:red;'>All fields are required.</h3>");
            return;
        }

        if (!password.equals(confirmPassword)) {
            out.println("<h3 style='color:red;'>Passwords do not match. Please try again.</h3>");
            return;
        }

        try {
            // DB Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");

            String query = "INSERT INTO users (full_name, email, password) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setString(3, password);

            int result = pstmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("login.jsp");
            } else {
                out.println("<h3 style='color:red;'>Error creating account. Please try again.</h3>");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>An error occurred: " + e.getMessage() + "</h3>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("signup.jsp");
    }
}
