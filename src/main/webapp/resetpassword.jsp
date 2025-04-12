<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
</head>
<body>
    <h2>Reset Password</h2>
    <form action="ResetPasswordServlet" method="post">
        <input type="password" name="password" placeholder="Enter new password" required><br><br>
        <input type="password" name="confirmpassword" placeholder="Confirm new password" required><br><br>
        <button type="submit">Update Password</button>
    </form>
</body>
</html>
