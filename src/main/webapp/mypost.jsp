<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<html>
<head>
    <title>Your Posts</title>
    <style>
        body {
            background: #121212;
            color: white;
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        h1 {
            color: #f0f0f0;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #1e1e1e;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        th {
            background-color: #2c2c2c;
            color: #ffffff;
        }

        td img {
            max-width: 150px;
            height: auto;
            border-radius: 6px;
        }

        .actions form {
            display: inline-block;
            margin-right: 10px;
        }

        .actions input[type="submit"] {
            background: #4CAF50;
            border: none;
            padding: 8px 16px;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        .actions input[type="submit"]:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <h1>Your Blog Posts</h1>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
            ps = con.prepareStatement("SELECT * FROM poststore WHERE user_email = ?");
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.isBeforeFirst()) {
    %>
    <table>
        <tr>
            <th>Title</th>
            <th>Story</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("story") %></td>
            <td>
                <%
                    String imagePath = rs.getString("image_path");
                    if (imagePath != null && !imagePath.trim().isEmpty()) {
                %>
                    <img src="<%= imagePath %>" alt="Post Image"/>
                <%
                    } else {
                        out.print("No image");
                    }
                %>
            </td>
            <td class="actions">
                <form action="PostServlet" method="get">
                	<input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <input type="submit" value="Edit">
                </form>
                <form action="PostServlet" method="post">
                	<input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
            out.println("<p>No posts found.</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
    %>
</body>
</html>
