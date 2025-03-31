<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  background-color: #000;
  color: #fff;
  font-family: Arial, sans-serif;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
}

.profile-picture {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  margin-bottom: 20px;
}

h1 {
  font-size: 2em;
  margin-bottom: 30px;
}

a {
  color: #fff;
  text-decoration: none;
  margin: 10px 0;
  transition: color 0.3s;
}

a:hover {
  color: #ccc;
}

.logout-icon {
  font-size: 2em;
  margin-top: 30px;
}
</style>
</head>
<body>
  <img src="https://images.pexels.com/photos/11805697/pexels-photo-11805697.jpeg?auto=compress&cs=tinysrgb&h=226.525&fit=crop&w=253.17499999999998&dpr=1" alt="Profile Picture" class="profile-picture">
  <h1>Hi, Gaurav</h1>
  <a href="detailblog.jsp">Blog</a>
  <a href="newsletter.jsp">Newsletter</a>
  <a href="detailblog.jsp">About</a>
  <a href="Home.jsp">Logout</a>
  <span class="logout-icon">&#128274;</span>
</body>
</html>