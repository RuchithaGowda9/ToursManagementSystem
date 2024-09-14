<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Urban Adventure</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
    <link rel="stylesheet" type="text/css" href="resources/css/common-styles.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar-custom {
            background-color: #0047AB; /* Navbar Background Color */
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand img {
            height: 60px;
            width: auto;
        }

        .navbar-brand.mx-auto {
            color: #ffffff; /* Text color for the title */
            background-color: #0047AB; /* Background color for the title */
            border-radius: 0; /* No curved edges for the title */
        }

        .navbar-toggler {
            border-color: transparent; /* Remove border from toggler for a cleaner look */
        }

        .navbar-nav .nav-link, .navbar-nav .dropdown-item {
            color: #ffffff; /* Text color */
            background-color: #0047AB; /* Button background color */
            border-radius: 5px; /* Curved edges */
            padding: 8px 16px; /* Padding for better appearance */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }

        .navbar-nav .nav-link:hover, .navbar-nav .dropdown-item:hover {
            color: #ffffff; /* Text color on hover */
            background-color: #f96714; /* Button background color on hover */
        }

        .dropdown-menu {
            background-color: #0047AB; /* Match dropdown background to navbar background */
            border: none; /* Remove border from dropdown */
            border-radius: 5px; /* Curved edges for dropdown */
            padding: 0; /* Remove padding */
        }

        .dropdown-item {
            color: #ffffff; /* Text color for dropdown items */
        }

        .dropdown-item:hover {
            background-color: #f96714; /* Background color on hover for dropdown items */
            color: #ffffff; /* Text color on hover for dropdown items */
        }

        .footer {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 1rem;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        /* Adjust footer for full height layout */
        html, body {
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
        }

        /* Error message styling */
        .error-message {
            color: #dc3545; /* Red color for error messages */
            margin-top: 10px;
            font-size: 0.875rem;
        }

        /* Success message styling */
        .success-message {
            color: #28a745; /* Green color for success messages */
            margin-top: 10px;
            font-size: 1rem;
            font-weight: bold;
        }

        /* Styling for mandatory fields */
        .required:after {
            content: " *";
            color: #dc3545; /* Red color for asterisks */
        }

        /* Login card styles */
        .login-card {
            background-color: rgba(249, 103, 20, 0.1); /* Very light orange tint */
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        /* Password field with checkbox 
        .password-container {
            margin-top: 10px;
        }

        .password-container input {
            padding-right: 40px; /* Add space for the checkbox 
        }

        .password-container label {
            display: block;
            margin-bottom: 5px; /* Add space between label and input */
        }

        .show-password-container {
            margin-top: 5px;
        }

        .show-password-container input {
            cursor: pointer;
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
        <a class="navbar-brand" href="home.jsp"><img src="resources/images/logo.png" alt="Urban Adventure Logo"></a>
        <a class="navbar-brand mx-auto" href="home.jsp">Urban Adventures</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="contactUs.jsp">Contact Us</a></li>
            </ul>
        </div>
    </nav>
</header>

<main class="container mt-4">
    <h2 class="text-center mb-4">Please login to continue exploring</h2>
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="login-card">
                <!-- Display the success message if present -->
                <c:if test="${param.message != null}">
                    <div class="alert alert-success success-message" role="alert">
                        ${param.message}
                    </div>
                </c:if>
                <form id="loginForm" action="<%=request.getContextPath()%>/login" method="post">
                    <div class="form-group">
                        <label for="username" class="required">User Name:</label>
                        <input type="text" id="username" name="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password" class="required">Password:</label>
                        <input type="password" id="password" name="password" class="form-control">
                    </div>
                    <!-- <div class="password-container"> -->
                        <div class="show-password-container">                   
                            <input type="checkbox" id="showPassword">
                            <label for="showPassword">Show Password</label>
                        <!-- </div> -->
                    </div>
                    <div id="errorContainer" class="error-message">
                        <c:if test="${param.error != null}">
                            ${param.error}
                        </c:if>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Log in</button>
                </form>
                <p class="mt-3 text-center">
                    Don't have an account? <a href="register.jsp">Register</a>
                </p>
            </div>
        </div>
    </div>
</main>

<footer class="footer">
    <p>© 2024 Urban Adventure. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        var username = document.getElementById('username').value.trim();
        var password = document.getElementById('password').value.trim();
        var errorContainer = document.getElementById('errorContainer');

        // Clear any previous error messages
        errorContainer.textContent = '';

        // Check if username and password fields are filled
        if (username === '' || password === '') {
            errorContainer.textContent = 'Please fill all the details.';
            event.preventDefault(); // Prevent form submission
        }
    });

    // Toggle password visibility
    document.getElementById('showPassword').addEventListener('change', function() {
        var passwordField = document.getElementById('password');
        var type = this.checked ? 'text' : 'password';
        passwordField.setAttribute('type', type);
    });
</script>
</body>
</html>
