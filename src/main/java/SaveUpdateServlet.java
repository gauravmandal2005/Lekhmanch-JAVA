import java.io.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SaveUpdateServlet")
public class SaveUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String story = request.getParameter("story");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lekhmanch", "root", "");
             PreparedStatement ps = con.prepareStatement("UPDATE poststore SET title=?, story=? WHERE id=?")) {

            ps.setString(1, title);
            ps.setString(2, story);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("myposts.jsp");
    }
}
