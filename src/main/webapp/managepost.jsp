<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Posts - LEKHMANCH</title>
    <style>
        body {
            background-color: #121212;
            color: white;
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .post {
            background-color: #1e1e1e;
            margin: 20px 0;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px #000;
        }
        .post img {
            max-width: 100%;
            border-radius: 5px;
        }
        .post h3 {
            color: #4CAF50;
        }
        .btn {
            padding: 10px 15px;
            margin: 5px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            color: white;
            font-weight: bold;
        }
        .btn-edit {
            background-color: #2196F3;
        }
        .btn-delete {
            background-color: #f44336;
        }
        form textarea, form input[type=text] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 5px;
            border: none;
        }
    </style>
</head>
<body>
    <h1>Your Posts</h1>

    <%
        String email = (String) session.getAttribute("email"); // Logged-in user's email
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lekhmanch", "root", ""); // Adjust credentials
            stmt = conn.prepareStatement("SELECT * FROM posts WHERE user_email = ?");
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int postId = rs.getInt("id");
                String title = rs.getString("title");
                String story = rs.getString("story");
                String image = rs.getString("image_path");
    %>
        <div class="post">
            <h3><%= title %></h3>
            <img src="<%= image %>" alt="Post Image"/>
            <p><%= story %></p>
            
            <!-- Update Form -->
            <form action="UpdatePostServlet" method="post">
                <input type="hidden" name="id" value="<%= postId %>" />
                <input type="text" name="title" value="<%= title %>" required />
                <textarea name="story" required><%= story %></textarea>
                <button type="submit" class="btn btn-edit">Update</button>
            </form>

            <!-- Delete Form -->
            <form action="DeletePostServlet" method="post" onsubmit="return confirm('Are you sure?')">
                <input type="hidden" name="id" value="<%= postId %>" />
                <button type="submit" class="btn btn-delete">Delete</button>
            </form>
        </div>
    <%
            }
        } catch(Exception e) {
            out.print("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
