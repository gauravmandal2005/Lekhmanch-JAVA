<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Account</title>
<style>
body {
  font-family: Arial, sans-serif; 
  background-color: #f4f4f4;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}

.container {
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  padding: 30px;
  width: 350px;
}

h2 {
  text-align: center;
  margin-bottom: 20px;
  color: #333;
}

input[type="text"],
input[type="email"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  margin: 10px 0;
  border: 1px solid #ddd;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  margin: 10px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}

button:hover {
  background-color: #45a049;
}

.signup-link {
  text-align: center;
  margin-top: 10px;
  color: #333;
}

.signup-link a {
  color: #007bff;
  text-decoration: none;
}
</style>
</head>
<body>
<div class="container">
  <h2>Create An Account</h2>
  <form action="newuser" method="post"> <!-- Updated to 'NewUser' -->
    <div>
      <label for="full-name">Full Name</label>
      <input type="text" id="full-name" name="full-name" required>
    </div>
    <div>
      <label for="email">Email</label>
      <input type="email" id="email" name="email" required>
    </div>
    <div>
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>
    </div>
    <div>
      <label for="confirm-password">Confirm Password</label>
      <input type="password" id="confirm-password" name="confirm-password" required>
    </div>
    <button type="submit">Create Account</button>
  </form>
  <p class="signup-link">Already have an account? <a href="login.jsp">Sign in!</a></p>
</div>
</body>
</html>
