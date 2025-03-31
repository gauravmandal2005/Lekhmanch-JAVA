<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>LEKHMANCH</title>
  <style>
    body {
      background-color: #121212;
      color: white;
      font-family: 'Arial', sans-serif;
      margin: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    /* Navbar Styling */
    .navbar {
      width: 100%;
      background-color: rgb(51,51,51);
      padding: 15px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    }

    .navbar h1 {
      margin: 8px;
      font-size: 24px;
      color: #fff;
    }

    .nav-links {
      display: flex;
      gap: 35px;
      padding-right:20px;
      
    }

    .nav-links a {
      color: #b3b3b3;
      text-decoration: none;
      font-weight: bold;
      font-size: 16px;
      transition: color 0.3s ease;
    }

    .nav-links a:hover {
      color: #4CAF50; /* Green hover effect */
    }

    /* Content Styling */
    .content {
      text-align: center;
      flex: 1;
      margin-top: 80px;
      padding: 0 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .content h2 {
      font-size: 30px;
      margin-bottom: 20px;
      font-weight: 600;
    }

    .button-container {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 20px;
    }

    .add-image-button {
      background-color: #4CAF50;
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    .add-image-button:hover {
      background-color: #45a049;
    }

    .story-textarea {
      width: 100%;
      max-width: 800px;
      height: 200px;
      margin-top: 20px;
      padding: 15px;
      border-radius: 5px;
      border: 1px solid #555;
      resize: none;
      font-size: 16px;
      background-color: #333;
      color: white;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* Footer Styling */
    .footer {
      background-color: #1e1e1e;
      color: white;
      padding: 16px 0;
      margin-top: auto;
      box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.2);
    }

    .footer .container {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
    }

    .footer .col-md-4 {
      flex: 1;
      max-width: 33%;
      padding: 10px;
    }

    .footer h3 {
      font-size: 22px;
      font-weight: bold;
      margin-bottom: 15px;
      color: #4CAF50;
    }

    .footer ul {
      list-style: none;
      padding: 0;
    }

    .footer ul li {
      margin-bottom: 10px;
    }

    .footer .social-links a {
      color: white;
      font-size: 20px;
      margin-right: 10px;
      transition: color 0.3s ease;
    }

    .footer .social-links a:hover {
      color: #4CAF50;
    }
  </style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

  <!-- Navbar -->
  <div class="navbar">
    <h1>LEKHMANCH</h1>
    <div class="nav-links">
      <a href="detailblog.jsp">Blog</a>
      <a href="Home.jsp">About</a>
      <a href="newsletter.jsp">Newsletter</a>
      <a href="post.jsp">Create Post</a>
      <a href="loginHome.jsp">Home</a>
    </div>
  </div>

  <!-- Content -->
  <div class="content">
    <h2>Title...</h2>
    
    <!-- Button container for proper positioning -->
    <div class="button-container">
      <button class="add-image-button">
        <i class="fas fa-image"></i> Add Image
      </button>
    </div>
    
    <textarea class="story-textarea" placeholder="Tell a Story..."></textarea>
  </div>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="col-md-4">
        <h3>About</h3>
        <p>A platform where users can read and write the blogs.</p>
      </div>
      <div class="col-md-4">
        <h3>Quick Links</h3>
        <ul>
          <li><a class="text-white" href="#">Home</a></li>
          <li><a class="text-white" href="#">Blog</a></li>
          <li><a class="text-white" href="#">About Us</a></li>
          <li><a class="text-white" href="#">Contact</a></li>
        </ul>
      </div>
      <div class="col-md-4">
        <h3>Contact</h3>
        <ul>
          <li>Email: info@example.com</li>
          <li>Phone: +123 456 7890</li>
          <li>Address: 123 Street, City, Country</li>
        </ul>
        <div class="social-links">
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-linkedin-in"></i></a>
        </div>
      </div>
    </div>
  </footer>

</body>
</html>