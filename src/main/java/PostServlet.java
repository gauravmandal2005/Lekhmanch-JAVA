import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

@WebServlet("/PostServlet")
@MultipartConfig(maxFileSize = 16177215) // 16MB max image size
public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String story = request.getParameter("story");
        InputStream imageStream = null;

        // Get image file
        Part imagePart = request.getPart("image");
        if (imagePart != null) {
            imageStream = imagePart.getInputStream();
        }

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");

            String query = "INSERT INTO posts (title, story, image) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, story);
            ps.setBlob(3, imageStream); // storing image as LONGBLOB

            int result = ps.executeUpdate();
            con.close();

            if (result > 0) {
                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('Post submitted successfully!');");
                response.getWriter().println("window.location.href = 'post.jsp';");
                response.getWriter().println("</script>");
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('Something went wrong. Please try again.');");
                response.getWriter().println("window.location.href = 'post.jsp';");
                response.getWriter().println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
