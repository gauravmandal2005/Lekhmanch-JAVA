<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            width: 350px;
            text-align: center;
        }
        h2 {
            color: #333;
            font-size: 24px;
            font-weight: bold;
        }
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 14px;
            font-weight: 500;
        }
        .input-group input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-size: 14px;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }
        .button-group button {
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
        }
        .button-group button#user-login-btn {
            background-color: #28a745;
            color: #fff;
        }
        .button-group button#user-login-btn:hover {
            background-color: #218838;
        }
        .forgot-button {
            background: none;
            border: none;
            color: #007bff;
            font-weight: bold;
            cursor: pointer;
            text-decoration: underline;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>

        <%-- Display error message from servlet if exists --%>
        <%
            String error = (String) session.getAttribute("error");
            if (error != null) {
        %>
            <p style="color: red; text-align: center; font-weight: bold;"><%= error %></p>
        <%
                session.removeAttribute("error");
            }
        %>

        <form action="existinguser" method="post">
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required onblur="this.value=this.value.trim();">
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="button-group">
                <button type="submit" id="user-login-btn" name="role" value="user">User Login</button>
                <button type="submit" id="admin-login-btn" name="role" value="admin">Admin Login</button>
            </div>
        </form>
        <p style="margin-top: 15px;">
    
</p>

        <%-- Forgot Password Button --%>
        <form action="forgot.jsp" method="get">
            <button type="submit" class="forgot-button">Forgot Password?</button>
        </form>
    </div>
    
</body>
</html>