<!-- profile.jsp -->
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("profile.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/project";
    String dbUser = "root";
    String dbPass = "password";

    String name = "", email = "", bio = "", phone = "", website = "", profilePic = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        String sql = "SELECT name, email, bio, phone, website, profile_pic FROM profile WHERE id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, userId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            bio = rs.getString("bio");
            phone = rs.getString("phone");
            website = rs.getString("website");
            profilePic = rs.getString("profile_pic");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Profile Page</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .profile-container {
            max-width: 700px;
            background: white;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .profile-field {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>
<div class="profile-container">
    <h2>Your Profile</h2>
    <% if (profilePic != null && !profilePic.isEmpty()) { %>
        <img src="<%= profilePic %>" class="profile-pic" alt="Profile Picture">
    <% } else { %>
        <img src="default-profile.png" class="profile-pic" alt="Default Profile Picture">
    <% } %>
    <form action="updateProfile.jsp" method="post">
        <div class="profile-field">
            <label>Name:</label>
            <input type="text" name="name" value="<%= name %>" required>
        </div>
        <div class="profile-field">
            <label>Email:</label>
            <input type="email" name="email" value="<%= email %>" required>
        </div>
        <div class="profile-field">
            <label>Phone:</label>
            <input type="text" name="phone" value="<%= phone %>" placeholder="e.g. +1234567890">
        </div>
        <div class="profile-field">
            <label>Website:</label>
            <input type="text" name="website" value="<%= website %>" placeholder="https://yourwebsite.com">
        </div>
        <div class="profile-field">
            <label>Bio:</label>
            <textarea name="bio"><%= bio %></textarea>
        </div>
        <div class="profile-field">
            <label>Profile Picture URL:</label>
            <input type="text" name="profilePic" value="<%= profilePic %>">
        </div>
        <button type="submit" class="btn">Update Profile</button>
    </form>
    <form action="logout.jsp" method="post" style="margin-top: 20px;">
        <button type="submit" class="btn btn-danger">Logout</button>
    </form>
</div>
</body>
</html>
