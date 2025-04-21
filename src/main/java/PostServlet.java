import java.io.*;
import java.nio.file.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/PostServlet")
@MultipartConfig
public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("email");

        int id = Integer.parseInt(request.getParameter("id"));

        switch (action) {
            case "list":
                break;
            case "edit":
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    List<Map<String, String>> postList = new ArrayList<>();

                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                         PreparedStatement ps = con.prepareStatement("SELECT * FROM poststore WHERE id = ? AND user_email = ?")) {

                        ps.setInt(1, id);
                        ps.setString(2, userEmail);

                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            Map<String, String> post = new HashMap<>();
                            post.put("id", String.valueOf(rs.getInt("id")));
                            post.put("title", rs.getString("title"));
                            post.put("story", rs.getString("story"));
                            post.put("image_path", rs.getString("image_path"));
                            post.put("user_email", rs.getString("user_email"));
                            postList.add(post);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    request.setAttribute("postList", postList);
                    request.getRequestDispatcher("editpost.jsp").forward(request, response);

                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                break;
            default:
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("email");

        String title = request.getParameter("title");
        String story = request.getParameter("story");
        String imagePath = null;

        Part filePart = null;
        if (!"delete".equals(action)) {
            filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + "uploads";
                Files.createDirectories(Paths.get(uploadPath));
                imagePath = "uploads/" + fileName;
                filePart.write(uploadPath + File.separator + fileName);
            }
        }

        switch (action) {
            case "insert":
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                         PreparedStatement ps = con.prepareStatement("INSERT INTO poststore (title, story, image_path, user_email) VALUES (?, ?, ?, ?)")) {

                        ps.setString(1, title);
                        ps.setString(2, story);
                        ps.setString(3, imagePath);
                        ps.setString(4, userEmail);
                        ps.executeUpdate();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    return;
                }
                break;

            case "update":
                int updatePostId = Integer.parseInt(request.getParameter("id"));
                String email = request.getParameter("email");
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                     PreparedStatement ps = (imagePath != null)
                        ? con.prepareStatement("UPDATE poststore SET title = ?, story = ?, image_path = ? WHERE id = ? AND user_email = ?")
                        : con.prepareStatement("UPDATE poststore SET title = ?, story = ? WHERE id = ? AND user_email = ?")) {

                    ps.setString(1, title);
                    ps.setString(2, story);

                    if (imagePath != null) {
                        ps.setString(3, imagePath);
                        ps.setInt(4, updatePostId);
                        ps.setString(5, email);
                    } else {
                        ps.setInt(3, updatePostId);
                        ps.setString(4, email);
                    }
                    System.out.println("Edited Successfully");
                    ps.executeUpdate();
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    return;
                }
                
                break;

            case "delete":
                int deletePostId = Integer.parseInt(request.getParameter("id"));
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                     PreparedStatement ps = con.prepareStatement("DELETE FROM poststore WHERE id = ? AND user_email = ?")) {

                    ps.setInt(1, deletePostId);
                    ps.setString(2, userEmail);
                    ps.executeUpdate();
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    return;
                }
                break;
        }

        response.sendRedirect("mypost.jsp");
    }
}
