<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* CSS Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            margin-bottom: 20px;
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
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .input-group input:focus {
            border-color: #6a11cb;
            outline: none;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .button-group button {
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.2s ease;
            flex: 1;
        }

        .button-group button#user-login-btn {
            background-color: #28a745;
            color: #fff;
        }

        .button-group button#user-login-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        .button-group button#admin-login-btn {
            background-color: #007bff;
            color: #fff;
        }

        .button-group button#admin-login-btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        /* Background Animation */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1), transparent);
            animation: rotate 10s linear infinite;
            z-index: -1;
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <!-- Login Form -->
    <div class="login-container">
        <h2>Login</h2>
        <form id="login-form">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="button-group">
                <button type="button" id="user-login-btn">User Login</button>
                <button type="button" id="admin-login-btn">Admin Login</button>
            </div>
        </form>
    </div>

    <!-- JavaScript for Navigation -->
    <script>
        // Redirect to home page on user login button click
        document.getElementById('user-login-btn').addEventListener('click', function() {
            window.location.href = 'loginHome.jsp'; // Navigate to home page
        });

        // Redirect to dashboard page on admin login button click
        document.getElementById('admin-login-btn').addEventListener('click', function() {
            window.location.href = 'dashboard.jsp'; // Navigate to dashboard page
        });
    </script>
</body>
</html>