<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
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
        .forgot-container {
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
        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 14px;
        }
        button {
            background-color: #007bff;
            color: #fff;
            padding: 12px;
            border-radius: 8px;
            border: none;
            font-size: 14px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="forgot-container">
        <h2>Forgot Password</h2>
        <form action="ForgotPasswordServlet" method="post">
            <input type="email" name="email" placeholder="Enter your registered email" required>
            <button type="submit">Reset Password</button>
        </form>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p style="color: red;"><%= message %></p>
        <%
            }
        %>
    </div>
</body>
</html>
