<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LEKHMANCH Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .card-hover:hover { transform: scale(1.05); transition: all 0.3s ease-in-out; }
        .sidebar { width: 250px; background: #2D3748; height: 100vh; position: fixed; padding-top: 20px; }
        .sidebar a { display: block; color: white; padding: 10px; text-decoration: none; }
        .sidebar a:hover { background: #4A5568; }
        .main-content { margin-left: 260px; padding: 20px; }
        .chart-container { width: 100%; max-width: 600px; }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100">
    <div class="sidebar">
        <h2 class="text-white text-center text-xl font-bold mb-4">LEKHMANCH</h2>
        <a href="dashboard">Dashboard</a>
        <a href="#">User Activity</a>
        <a href="#">Admin Panel</a>
        <a href="dashboardSetting.jsp">Settings</a>
        <a href="login.jsp" class="text-red-500">Logout</a>
    </div>
    
    <div class="main-content">
        <nav class="bg-blue-600 p-4 text-white flex justify-between items-center rounded-lg shadow-lg">
            <h1 class="text-2xl font-bold">Dashboard</h1>
            <button class="bg-white text-blue-600 px-4 py-2 rounded-lg shadow-md">Logout</button>
        </nav>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-5">
            <div class="bg-blue-500 text-white p-5 rounded-lg shadow-lg text-center card-hover">
                <h3 class="text-xl font-semibold">Total Users</h3>
                <p class="text-3xl font-bold"> <%= request.getAttribute("totalUsers") %> </p>
            </div>
            <div class="bg-green-500 text-white p-5 rounded-lg shadow-lg text-center card-hover">
                <h3 class="text-xl font-semibold">Total Posts</h3>
                <p class="text-3xl font-bold"> <%= request.getAttribute("totalPosts") %> </p>
            </div>
            <div class="bg-yellow-500 text-white p-5 rounded-lg shadow-lg text-center card-hover">
                <h3 class="text-xl font-semibold">Total Comments</h3>
                <p class="text-3xl font-bold"> <%= request.getAttribute("totalComments") %> </p>
            </div>
        </div>
        
        <div class="mt-5 bg-white p-5 shadow-lg rounded-lg">
            <h2 class="text-xl font-semibold mb-3">User Activity</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Action</th>
                        <th>Post Title</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <!-- to be included -->
                </tbody>
            </table>
        </div>

        <div class="mt-5 bg-white p-5 shadow-lg rounded-lg">
            <h2 class="text-xl font-semibold mb-3">Admin Panel</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Post ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <!-- to be included -->
                </tbody>
            </table>
        </div>

        <div class="mt-5 bg-white p-5 shadow-lg rounded-lg">
            <h2 class="text-xl font-semibold mb-3">Site Analytics</h2>
            <div class="chart-container">
                <canvas id="userChart"></canvas>
            </div>
        </div>
    </div>
    
    <script>
        var ctx = document.getElementById('userChart').getContext('2d');
        var userChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Users', 'Posts', 'Comments'],
                datasets: [{
                    label: 'Statistics',
                    data: [<%= request.getAttribute("totalUsers") %>, <%= request.getAttribute("totalPosts") %>, <%= request.getAttribute("totalComments") %>],
                    backgroundColor: ['#3498db', '#2ecc71', '#f1c40f'],
                    borderColor: ['#2980b9', '#27ae60', '#f39c12'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
