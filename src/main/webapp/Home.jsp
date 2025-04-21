<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>LEKHMANCH</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .comment-container {
            max-height: 200px;
            overflow-y: auto;
            padding: 10px;
            background-color: #2d3748;
            border-radius: 0.5rem;
            margin-top: 10px;
        }
        .comment {
            padding: 8px;
            margin-bottom: 8px;
            background-color: #4a5568;
            border-radius: 0.375rem;
        }
        .comment-author {
            font-weight: bold;
            color: #ffffff;
        }
        .comment-text {
            color: #e2e8f0;
            margin-top: 4px;
        }
        .comment-time {
            font-size: 0.75rem;
            color: #a0aec0;
            margin-top: 4px;
        }
    </style>
</head>
<body class="bg-gray-900 text-white">
<header class="text-center py-8">
    <h1 class="text-5xl font-bold">LEKHMANCH</h1>
    <nav class="mt-4">
        <a class="text-gray-400 hover:text-white mx-2" href="detailblog.jsp">Blog</a>
        <a class="text-gray-400 hover:text-white mx-2" href="newsletter.jsp">NewsLetter</a>
        <a class="text-gray-400 hover:text-white mx-2" href="signup.jsp">Create account</a>
    </nav>
</header>

<main class="max-w-6xl mx-auto px-4">
    <!-- Display success/error messages -->
    <% if (request.getParameter("success") != null) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <%= request.getParameter("success") %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <%= request.getParameter("error") %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>

    <section class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Recent blogs</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Post 1 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Blog image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://storage.googleapis.com/a1aa/image/7bu40XYw36bdnoq4vY80m1zf05pzdxtT-RD4GME31U0.jpg" />
                <h3 class="text-xl font-semibold mb-2">Taste of Sweet</h3>
                <p class="text-gray-400 mb-4">Provide quick, healthy recipes that can be prepared in advance.</p>
                <a class="text-blue-500 hover:underline" href="https://www.ftc.gov/business-guidance/blog">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="1">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-1" class="comment-container mt-2"></div>
            </div>
            
            <!-- Post 2 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Blog image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://images.pexels.com/photos/9242811/pexels-photo-9242811.jpeg?auto=compress&cs=tinysrgb&w=600" />
                <h3 class="text-xl font-semibold mb-2">Tech Innovations</h3>
                <p class="text-gray-400 mb-4">Exploring the latest trends in technology and innovation.</p>
                <a class="text-blue-500 hover:underline" href="https://edublogs.org/">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="2">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-2" class="comment-container mt-2"></div>
            </div>
            
            <!-- Post 3 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Blog image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://images.pexels.com/photos/30770033/pexels-photo-30770033/free-photo-of-energetic-runners-participating-in-outdoor-marathon.jpeg?auto=compress&cs=tinysrgb&w=600" />
                <h3 class="text-xl font-semibold mb-2">Healthy Living</h3>
                <p class="text-gray-400 mb-4">Tips on maintaining a healthy and balanced lifestyle.</p>
                <a class="text-blue-500 hover:underline" href="https://www.ftc.gov/business-guidance/blog">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="3">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-3" class="comment-container mt-2"></div>
            </div>
        </div>
    </section>
    
    <!-- Business Section -->
    <section class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Business</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Post 4 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Business image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://images.pexels.com/photos/8348627/pexels-photo-8348627.jpeg?auto=compress&cs=tinysrgb&w=600" />
                <h3 class="text-xl font-semibold mb-2">Startup Success</h3>
                <p class="text-gray-400 mb-4">Insights on how startups can grow and succeed.</p>
                <a class="text-blue-500 hover:underline" href="https://business.amazon.in/en/discover-more/blog">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="4">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-4" class="comment-container mt-2"></div>
            </div>
            
            <!-- Post 5 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Business image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://images.pexels.com/photos/5716052/pexels-photo-5716052.jpeg?auto=compress&cs=tinysrgb&w=600" />
                <h3 class="text-xl font-semibold mb-2">Market Trends</h3>
                <p class="text-gray-400 mb-4">Understanding the latest market trends and economy shifts.</p>
                <a class="text-blue-500 hover:underline" href="https://www.coursera.org/in/articles/marketing-blogs">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="5">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-5" class="comment-container mt-2"></div>
            </div>
            
            <!-- Post 6 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Business image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://images.pexels.com/photos/8370426/pexels-photo-8370426.jpeg?auto=compress&cs=tinysrgb&w=600" />
                <h3 class="text-xl font-semibold mb-2">Investment Tips</h3>
                <p class="text-gray-400 mb-4">Best practices for smart investments and financial planning.</p>
                <a class="text-blue-500 hover:underline" href="https://www.investindia.gov.in/team-india-blogs">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="6">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-6" class="comment-container mt-2"></div>
            </div>
        </div>
    </section>
    
    <!-- Educational Section -->
    <section class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Educational</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Post 7 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Business image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://images.pexels.com/photos/159866/books-book-pages-read-literature-159866.jpeg?auto=compress&cs=tinysrgb&w=600" />
                <h3 class="text-xl font-semibold mb-2">Startup Success</h3>
                <p class="text-gray-400 mb-4">Insights on how startups can grow and succeed.</p>
                <a class="text-blue-500 hover:underline" href="https://blogs.worldbank.org/en/education">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="7">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-7" class="comment-container mt-2"></div>
            </div>
            
            <!-- Post 8 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Business image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://images.pexels.com/photos/6595038/pexels-photo-6595038.jpeg?auto=compress&cs=tinysrgb&w=600" />
                <h3 class="text-xl font-semibold mb-2">Market Trends</h3>
                <p class="text-gray-400 mb-4">Understanding the latest market trends and economy shifts.</p>
                <a class="text-blue-500 hover:underline" href="https://www.lcp.com/en/investment/insights/blogs">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="8">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-8" class="comment-container mt-2"></div>
            </div>
            
            <!-- Post 9 -->
            <div class="bg-gray-800 p-4 rounded-lg">
                <img alt="Business image" class="w-full h-40 object-cover rounded-lg mb-4" src="https://images.pexels.com/photos/9873987/pexels-photo-9873987.jpeg?auto=compress&cs=tinysrgb&w=600" />
                <h3 class="text-xl font-semibold mb-2">Investment Tips</h3>
                <p class="text-gray-400 mb-4">Best practices for smart investments and financial planning.</p>
                <a class="text-blue-500 hover:underline" href="https://www.safalniveshak.com/blog/">Read more</a>
                <div class="mt-4 flex justify-between">
                    <button class="text-gray-400 hover:text-white">👍 Like</button>
                    <button class="text-gray-400 hover:text-white">🔄 Share</button>
                    <button class="text-gray-400 hover:text-white comment-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#commentModal"
                            data-post-id="9">
                        💬 Comment
                    </button>
                </div>
                <div id="commentsContainer-9" class="comment-container mt-2"></div>
            </div>
        </div>
    </section>
</main>

<!-- Comment Modal -->
<div class="modal fade" id="commentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-gray-800 text-white">
            <div class="modal-header">
                <h5 class="modal-title">Add Comment</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="GetCommentServlet" method="post" onsubmit="return handleCommentSubmit(event)">
                <div class="modal-body"> 
                    <input type="hidden" id="postId" name="post_id" value="">
                    <div class="mb-3">
                        <label for="commentText" class="form-label">Your Comment</label>
                        <textarea class="form-control bg-gray-700 text-white" id="commentText" name="comment_text" rows="3" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Post Comment</button>
                </div>
            </form>
        </div>
    </div>
</div>

<footer class="bg-gray-800 py-8 mt-12">
    <div class="max-w-6xl mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-8">
        <div>
            <h3 class="text-xl font-semibold mb-4">About</h3>
            <p class="text-gray-400">Our website Lekhmanch is a platform where user can post and read the blogs.</p>
        </div>
        <div>
            <h3 class="text-xl font-semibold mb-4">Quick Links</h3>
            <ul>
                <li><a class="text-gray-400 hover:text-white" href="Home.jsp">Home</a></li>
                <li><a class="text-gray-400 hover:text-white" href="Home.jsp">Blog</a></li>
                <li><a class="text-gray-400 hover:text-white" href="loginHome.jsp">About</a></li>
                <li><a class="text-gray-400 hover:text-white" href="newsletter.jsp">Newsletter</a></li>
            </ul>
        </div>
        <div>
            <h3 class="text-xl font-semibold mb-4">Contact</h3>
            <p class="text-gray-400">Email: info@example.com</p>
            <p class="text-gray-400">Phone: 8541897504</p>
            <p class="text-gray-400">Address: 123 Street, City, Country</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Get all comment buttons
    const commentButtons = document.querySelectorAll('.comment-btn');
    
    // Add click event to each button
    commentButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Get the post ID from data attribute
            const postId = this.getAttribute('data-post-id');
            // Set the post ID in the hidden input field
            document.getElementById('postId').value = postId;
            
            // Load existing comments
            loadComments(postId);
        });
    });
    
    // Function to load comments for a post
    function loadComments(postId) {
        fetch('GetCommentsServlet?post_id=' + postId)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => {
                document.getElementById('commentsContainer-' + postId).innerHTML = data;
            })
            .catch(error => {
                console.error('Error loading comments:', error);
                document.getElementById('commentsContainer-' + postId).innerHTML = 
                    '<p class="text-red-500">Error loading comments. Please try again.</p>';
            });
    }
A
    // Check for success message in URL and show alert
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('success')) {
        // Show success message
        const successMessage = urlParams.get('success');
        const alertDiv = document.createElement('div');
        alertDiv.className = 'alert alert-success alert-dismissible fade show';
        alertDiv.setAttribute('role', 'alert');
        alertDiv.innerHTML = `
            ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        `;
        document.querySelector('main').prepend(alertDiv);
        
        // Remove success parameter from URL
        urlParams.delete('success');
        const newUrl = window.location.pathname + '?' + urlParams.toString();
        window.history.replaceState({}, document.title, newUrl);
    }
});

function handleCommentSubmit(event) {
    event.preventDefault();
    
    const form = event.target;
    const formData = new FormData(form);
    const postId = formData.get('post_id');
    
    fetch('GetCommentServlet', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (response.redirected) {
            window.location.href = response.url;
        } else if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text();
    })
    .then(() => {
        // Close the modal
        const modal = bootstrap.Modal.getInstance(document.getElementById('commentModal'));
        modal.hide();
        
        // Reload comments
        loadComments(postId);
        
        // Clear the form
        form.reset();
    })
    .catch(error => {
        console.error('Error submitting comment:', error);
        alert('Error submitting comment. Please try again.');
    });
    
    return false;
}
</script>
</body>
</html>