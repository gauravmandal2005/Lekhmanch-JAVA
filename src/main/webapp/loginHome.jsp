<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <% 
 	HttpSession sessions = request.getSession(false);
 	if(session == null || session.getAttribute("user") == null){
 		response.sendRedirect("login.jsp");
 		return;
 	}
 	String username = (String) session.getAttribute("user");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LEKHMANCH - Blog</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="profile.jsp">Hi, <%= username %></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="detailblog.jsp">Blog</a></li>
                    <li class="nav-item"><a class="nav-link" href="post.jsp">Create Post</a></li>
                    <li class="nav-item"><a class="nav-link" href="newsletter.jsp">Newsletter</a></li>
                    <li class="nav-item"><a class="nav-link" href="Home.jsp">Home</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Hero Section -->
    <section class="hero text-center py-5 bg-dark text-white">
        <div class="container">
            <h1 class="display-3 fw-bold">LEKHMANCH</h1>
        </div>
    </section>

    <!-- Blog Categories -->
    <section class="blog-categories text-center py-4">
        <h2 class="fw-bold">BLOGS CATEGORIES</h2>
    </section>

    <!-- Blog Section -->
    <div class="container py-4">
        <h3>Educational</h3>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/301920/pexels-photo-301920.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 1 Jan 2023</p>
                        <h5 class="card-title">Bill Walsh leadership lessons</h5>
                        <p class="card-text">Learn how to build a winning team.</p>
                        <a href="https://www.angazacenter.org/news/blogs/?gad_source=1&gclid=Cj0KCQjw782_BhDjARIsABTv_JAAEZM52LqBUqw_1ZWREdkUDpOhqxYSRLh2haDA_aDxwrXAbcswUQoaAhGhEALw_wcB" class="btn btn-sm btn-primary">Research</a>
                    
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/142815/pexels-photo-142815.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 1 Jan 2023</p>
                        <h5 class="card-title">PM mental models</h5>
                        <p class="card-text">Mental models for complex processes.</p>
                        <a href="https://edublogs.org/" class="btn btn-sm btn-primary">Research</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/1462630/pexels-photo-1462630.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 1 Jan 2023</p>
                        <h5 class="card-title">What is Wireframing?</h5>
                        <p class="card-text">Introduction to Wireframing principles.</p>
                        <a href="https://world-education-blog.org/" class="btn btn-sm btn-primary">Research</a>
                    </div>
                </div>
            </div>
        </div>
        
        <h3 class="mt-4">Business</h3>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/3184416/pexels-photo-3184416.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 1 Jan 2023</p>
                        <h5 class="card-title">Bill Walsh leadership lessons</h5>
                        <p class="card-text">Learn how to build a winning team.</p>
                        <a href="https://www.yeatoday.org/bulletin?gad_source=1&gclid=Cj0KCQjw782_BhDjARIsABTv_JDwQPXaAbrIm817IvOhu3Apjc7su6hPLw8MWaDgUyjfiUk1M0b3GLcaAntYEALw_wcB" class="btn btn-sm btn-primary">Research</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/327533/pexels-photo-327533.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 1 Jan 2023</p>
                        <h5 class="card-title">PM mental models</h5>
                        <p class="card-text">Mental models for complex processes.</p>
                        <a href="https://www.siegemedia.com/strategy/business-blog-examples" class="btn btn-sm btn-primary">Research</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/859265/pexels-photo-859265.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 1 Jan 2023</p>
                        <h5 class="card-title">What is Wireframing?</h5>
                        <p class="card-text">Introduction to Wireframing principles.</p>
                        <a href="https://www.ftc.gov/business-guidance/blog" class="btn btn-sm btn-primary">Research</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="bg-black text-white py-5 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3 class="fw-bold">About</h3>
                    <p>Lekhmanch is a website where user can read or post the blogs.</p>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
