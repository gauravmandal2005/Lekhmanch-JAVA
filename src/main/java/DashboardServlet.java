

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int totalUsers = 0, totalPosts = 0, totalComments = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lekhmanch", "root", "");

            Statement stmt = con.createStatement();

            ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM users");
            if (rs1.next()) totalUsers = rs1.getInt(1);

            ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM posts");
            if (rs2.next()) totalPosts = rs2.getInt(1);

            ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM comments");
            if (rs3.next()) totalComments = rs3.getInt(1);

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalPosts", totalPosts);
        request.setAttribute("totalComments", totalComments);

        RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
        rd.forward(request, response);
    }
}
