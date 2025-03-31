<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LEKHMANCH - Blog</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="menu.jsp">Hi, Gaurav</a>
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
        <h2 class="fw-bold">BLOG CATEGORIES</h2>
    </section>

    <!-- Blog Section -->
    <div class="container py-4">
        <h3>Technology</h3>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/8386440/pexels-photo-8386440.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="AI">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 10 Feb 2025</p>
                        <h5 class="card-title">The Rise of AI</h5>
                        <p class="card-text">How artificial intelligence is revolutionizing various industries.</p>
                        <a href="#" class="btn btn-sm btn-primary">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/2085831/pexels-photo-2085831.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="Robotics">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 10 Feb 2025</p>
                        <h5 class="card-title">Robotics in Daily Life</h5>
                        <p class="card-text">The impact of robotics on our everyday tasks and industries.</p>
                        <a href="#" class="btn btn-sm btn-primary">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="Cybersecurity">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 10 Feb 2025</p>
                        <h5 class="card-title">Cybersecurity Trends</h5>
                        <p class="card-text">Protecting yourself in the digital age from online threats.</p>
                        <a href="#" class="btn btn-sm btn-primary">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/887751/pexels-photo-887751.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="AI">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 10 Feb 2025</p>
                        <h5 class="card-title">Using of phone</h5>
                        <p class="card-text">How artificial intelligence is revolutionizing various industries.</p>
                        <a href="#" class="btn btn-sm btn-primary">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/159304/network-cable-ethernet-computer-159304.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="AI">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 10 Feb 2025</p>
                        <h5 class="card-title">Using of Internet</h5>
                        <p class="card-text">How artificial intelligence is revolutionizing various industries.</p>
                        <a href="#" class="btn btn-sm btn-primary">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.pexels.com/photos/844127/pexels-photo-844127.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="AI">
                    <div class="card-body">
                        <p class="text-muted">Sunday, 10 Feb 2025</p>
                        <h5 class="card-title">Importance of Blockhain</h5>
                        <p class="card-text">How artificial intelligence is revolutionizing various industries.</p>
                        <a href="#" class="btn btn-sm btn-primary">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <!-- Footer -->
    <footer class="bg-black text-white py-5 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <h4 class="fw-bold">About</h4>
                    <p>LEKHMANCH is a platform where people can share and explore blogs on various topics, covering technology, business, lifestyle, and education.</p>
                </div>

                <div class="col-md-3">
                    <h4 class="fw-bold">Connect With Us</h4>
                    <div class="mt-2">
                        <a class="text-white me-3" href="#"><i class="fab fa-facebook-f"></i> Facebook</a><br>
                        <a class="text-white me-3" href="#"><i class="fab fa-twitter"></i> Twitter</a><br>
                        <a class="text-white me-3" href="#"><i class="fab fa-instagram"></i> Instagram</a><br>
                        <a class="text-white" href="#"><i class="fab fa-linkedin-in"></i> LinkedIn</a>
                    </div>
                </div>

                <div class="col-md-3">
                    <h4 class="fw-bold">Contact</h4>
                    <ul class="list-unstyled">
                        <li>Email: info@lekhmanch.com</li>
                        <li>Phone: +123 456 7890</li>
                    </ul>
                </div>

                <div class="col-md-3">
                    <h4 class="fw-bold">Categories</h4>
                    <ul class="list-unstyled">
                        <li><a class="text-white" href="#">Technology</a></li>
                        <li><a class="text-white" href="#">Business</a></li>
                        <li><a class="text-white" href="#">Lifestyle</a></li>
                        <li><a class="text-white" href="#">Education</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
