<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Blog</title>
  
  <style>
    body {
      background-color: #181818;
      color: #fff;
      font-family: sans-serif;
    }
    
    .footer {
      background-color: black;
      color: white;
      padding: 20px 0;
      margin-top: auto;
    }

    .footer-links {
      list-style: none;
      padding: 0;
    }

    .container {
      max-width: 560px;
      margin: 0 auto;
      padding: 20px;
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    .blog-post {
      border: 1px solid #333;
      padding: 20px;
      margin-bottom: 20px;
    }

    .blog-post img {
      width: 100%;
      height: auto;
    }

    .blog-post h2 {
      margin-top: 0;
    }

    .blog-post p {
      line-height: 1.6;
    }

    .blog-post a {
      color: #fff;
      text-decoration: none;
    }

    .blog-post a:hover {
      text-decoration: underline;
    }

    form input[type="email"] {
      padding: 10px;
      width: 70%;
      border: none;
      border-radius: 5px;
      margin-right: 10px;
    }

    form button {
      padding: 10px 20px;
      border: none;
      background-color: #007bff;
      color: white;
      border-radius: 5px;
      cursor: pointer;
    }

    form button:hover {
      background-color: #0056b3;
    }
  </style>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
  <div class="container">
    <h1>Stories and Interviews</h1>
    <p>Subscribe to learn about new product features, the latest technology, solutions, and updates.</p>
    
    <!-- FORM: POST TO SERVLET -->
    <form method="post" action="newsletter">
      <input type="email" name="email" placeholder="Enter your email" required>
      <button type="submit">Subscribe</button>
    </form>

    <h2 class="mt-4">All blog posts</h2>

    <div class="blog-post">
      <img src="https://images.pexels.com/photos/839011/pexels-photo-839011.jpeg?auto=compress&cs=tinysrgb&w=600" alt="Bill Walsh leadership lessons">
      <h2>Bill Walsh leadership lessons</h2>
      <p>Learn the secrets of leadership from a legendary coach who transformed the San Francisco 49ers into a winning team. Discover the principles that guided his success and how they can be applied in various aspects of life.</p>
      <a href="#">Read more</a>
    </div>

    <div class="blog-post">
      <img src="https://images.pexels.com/photos/846741/pexels-photo-846741.jpeg?auto=compress&cs=tinysrgb&w=600" alt="The art of storytelling">
      <h2>The art of storytelling</h2>
      <p>Explore the power of storytelling in communication and how it can captivate audiences. Learn techniques to enhance your storytelling skills and engage listeners effectively.</p>
      <a href="#">Read more</a>
    </div>

    <div class="blog-post">
      <img src="https://images.pexels.com/photos/1172207/pexels-photo-1172207.jpeg?auto=compress&cs=tinysrgb&w=600" alt="Innovative thinking">
      <h2>Innovative thinking</h2>
      <p>Uncover the strategies that foster innovative thinking in teams and organizations. Understand how to create an environment that encourages creativity and problem-solving.</p>
      <a href="#">Read more</a>
    </div>
  </div>

  <footer class="footer mt-5">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h3 class="fw-bold">About</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam.</p>
        </div>
        <div class="col-md-4">
          <h3 class="fw-bold">Quick Links</h3>
          <ul class="list-unstyled">
            <li><a class="text-white" href="#">Home</a></li>
            <li><a class="text-white" href="#">Blog</a></li>
            <li><a class="text-white" href="#">About Us</a></li>
            <li><a class="text-white" href="#">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-4">
          <h3 class="fw-bold">Contact</h3>
          <ul class="list-unstyled">
            <li>Email: info@example.com</li>
            <li>Phone: +123 456 7890</li>
            <li>Address: 123 Street, City, Country</li>
          </ul>
          <div class="mt-3">
            <a class="text-white me-2" href="#"><i class="fab fa-facebook-f"></i></a>
            <a class="text-white me-2" href="#"><i class="fab fa-twitter"></i></a>
            <a class="text-white me-2" href="#"><i class="fab fa-instagram"></i></a>
            <a class="text-white" href="#"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
