<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Tours - Urban Adventure</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
<link rel="stylesheet" type="text/css" href="resources/css/common-styles.css">
<style>
/* General Styles */
body {
    font-family: 'Arial', sans-serif;
    color: #333;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* Full viewport height */
}

/* Navbar Styles */
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

/* Footer Styles */
footer {
    background-color: #343a40;
    color: #fff;
    padding: 15px 0;
    text-align: center;
    width: 100%;
    margin-top: auto; /* Pushes footer to the bottom of the page */
}

/* Main Content Styles */
main {
    flex: 1; /* Allows main content to grow and fill available space */
}

/* Responsive Styles */
@media (max-width: 768px) {
    .card-img-top {
        height: 150px;
    }
}
</style>
</head>
<body>
    <header class="bg-primary text-white">
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <a class="navbar-brand" href="userDashboard.jsp"> <img
                src="resources/images/logo.png" alt="Urban Adventure Logo">
            </a> <a class="navbar-brand mx-auto" href="userDashboard.jsp">Urban Adventure</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="userDashboard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchTours.jsp">Search Tours</a></li>
                    <li class="nav-item"><a class="nav-link" href="userProfile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="user?action=logout">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="container my-4">
        <h2>Search Tours</h2>
        <form action="<%=request.getContextPath()%>/searchTours" method="get">
            <div class="form-group">
                <label for="placeName">Enter Place Name</label> 
                <input type="text" class="form-control" id="placeName" name="placeName" required>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </main>

    <footer>
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
