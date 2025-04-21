import java.io.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GetCommentsServlet")
public class GetCommentsServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String DB_USER = "your_username";
    private static final String DB_PASS = "your_password";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        int postId;
        try {
            postId = Integer.parseInt(request.getParameter("post_id"));
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("<div class='text-red-500'>Invalid post ID</div>");
            return;
        }
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sql = "SELECT username, comment_text, created_at FROM comments " +
                         "WHERE post_id = ? ORDER BY created_at DESC";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, postId);
                ResultSet rs = stmt.executeQuery();
                
                if (!rs.isBeforeFirst()) {
                    out.print("<div class='text-gray-400 p-2'>No comments yet</div>");
                    return;
                }
                
                while (rs.next()) {
                    out.print("<div class='comment mb-3'>");
                    out.print("<div class='comment-author'>" + rs.getString("username") + "</div>");
                    out.print("<div class='comment-text'>" + rs.getString("comment_text") + "</div>");
                    out.print("<div class='comment-time'>" + rs.getTimestamp("created_at") + "</div>");
                    out.print("</div>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("<div class='text-red-500'>Error loading comments</div>");
        }
    }
}