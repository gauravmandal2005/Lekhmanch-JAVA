import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        String author = request.getParameter("author");
        String commentText = request.getParameter("commentText");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lekhmanch", "root", "");
            PreparedStatement ps = con.prepareStatement("INSERT INTO comments(post_id, author, comment_text) VALUES (?, ?, ?)");
            ps.setInt(1, postId);
            ps.setString(2, author);
            ps.setString(3, commentText);
            ps.executeUpdate();
            con.close();
            response.sendRedirect("home.jsp?success=Comment added successfully");
        } catch (Exception e) {
            response.sendRedirect("home.jsp?error=Failed to add comment");
        }
    }
}
