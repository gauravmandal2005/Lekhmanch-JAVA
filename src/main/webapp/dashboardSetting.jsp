<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - LEKHMANCH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .container { 
        max-width: 600px; 
        margin: 50px auto; 
        background: white; 
        padding: 10px; 
        border-radius: 10px; 
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        body.dark-mode {
            background-color: #121212;
            color: white;
        }
        .container.dark-mode {
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="container">
        <h2 class="text-2xl font-bold text-center mb-4">Settings</h2>

        <div class="mb-4">
            <label class="form-label">Dark Mode</label>
            <input type="checkbox" id="darkModeToggle" onchange="toggleDarkMode()">
        </div>

        <div class="mb-4">
            <label class="form-label">Email Notifications</label>
            <input type="checkbox" id="emailNotifications">
        </div>

        <div class="mb-4">
            <label class="form-label">Push Notifications</label>
            <input type="checkbox" id="pushNotifications">
        </div>

        <div class="mb-4">
            <label class="form-label">Change Password</label>
            <input type="password" class="form-control" placeholder="New Password">
        </div>

        <div class="mb-4">
            <button onclick="saveSettings()" class="btn btn-primary w-100">Save Settings</button>
        </div>

        <div class="text-center">
            <button onclick="deleteAccount()" class="btn btn-danger">Delete Account</button>
        </div>

        <div class="text-center mt-3">
            <button onclick="goBack()" class="btn btn-secondary">Back</button>
        </div>
    </div>

    <script>
        function toggleDarkMode() {
            const isChecked = document.getElementById('darkModeToggle').checked;
            if (isChecked) {
                document.body.classList.add('dark-mode');
                document.querySelector('.container').classList.add('dark-mode');
            } else {
                document.body.classList.remove('dark-mode');
                document.querySelector('.container').classList.remove('dark-mode');
            }
        }

        function saveSettings() {
            alert("Settings saved successfully!");
        }

        function deleteAccount() {
            if (confirm("Are you sure you want to delete your account? This action cannot be undone.")) {
                alert("Your account has been deleted.");
            }
        }

        function goBack() {
            window.history.back();
        }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
