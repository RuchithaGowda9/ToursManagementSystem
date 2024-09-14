<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Tour</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
  /* Header styling */
/* Header styling */
header {
    background-color: #0047AB; /* Header background color */
    margin-bottom: auto; /* Push the footer to the bottom */
}

/* Navbar custom styling */
.navbar-custom {
    background-color: #0047AB; /* Navbar background color */
    padding: 0; /* Remove default padding */
    height: 70px; /* Set navbar height */
}

.navbar-custom .navbar-brand,
.navbar-custom .navbar-nav .nav-link {
    height: 70px; /* Ensure nav items fit the height */
    display: flex;
    align-items: center; /* Center items vertically */
}

/* Navbar brand styling */
.navbar-brand {
    color: #f96714; /* Navbar brand color */
    height: 70px; /* Ensure brand fits the height */
}

/* Navbar link styling */
.navbar-nav .nav-link {
    color: #f96714; /* Navbar links color */
}

/* Navbar link hover styling */
.navbar-nav .nav-link:hover {
    color: #fff; /* Navbar links hover color */
}

/* Ensure the image is sized appropriately */
.navbar-brand img {
    height: 50px; /* Adjust as needed to fit within the navbar height */
    width: auto;
}


/* Main content styling */
main.container {
    padding: 20px;
    background-color: #f2f2f2; /* Light gray background for the form */
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px; /* Set the maximum width of the form */
    margin: 0 auto; /* Center the form horizontally */
}

h2 {
    color: #0047AB; /* Dark blue color for the heading */
    margin-bottom: 20px;
}

.form-control {
    border: 1px solid #0047AB; /* Dark blue border for inputs */
    border-radius: 4px;
}

.form-control:focus {
    border-color: #f96714; /* Orange border on focus */
    box-shadow: 0 0 0 0.2rem rgba(249, 103, 20, 0.25); /* Light orange shadow on focus */
}

.btn-primary {
    background-color: #0047AB; /* Dark blue color for the button */
    border-color: #0047AB;
}

.btn-primary:hover {
    background-color: #00359c; /* Slightly darker blue on hover */
    border-color: #00359c;
}

.table thead th {
    background-color: #0047AB; /* Dark blue color */
    color: white;
    text-align: center;
    padding: 12px;
}

.table tbody tr:nth-child(odd) {
    background-color: #f2f2f2; /* Light gray for alternating rows */
}

.table tbody tr:nth-child(even) {
    background-color: #ffffff; /* White for alternating rows */
}

.table td {
    padding: 10px;
    text-align: center;
}

.btn-info {
    background-color: #0047AB; /* Dark blue color for update button */
    border-color: #0047AB;
}

.btn-info:hover {
    background-color: #00359c; /* Slightly darker blue on hover */
}

.btn-danger {
    background-color: #f96714; /* Orange color for deactivate button */
    border-color: #f96714;
}

.btn-danger:hover {
    background-color: #e8560b; /* Slightly darker orange on hover */
}

.btn-success {
    background-color: #28a745; /* Green color for activate button */
    border-color: #28a745;
}

.btn-success:hover {
    background-color: #218838; /* Slightly darker green on hover */
}

.badge-success {
    background-color: #28a745; /* Green color for active status */
}

.badge-danger {
    background-color: #dc3545; /* Red color for inactive status */
}
footer {
    background-color: #343a40; /* Footer background color */
    color: #fff; /* Footer text color */
    padding: 15px 0; /* Padding for footer */
    text-align: center; /* Center align text */
    width: 100%; /* Full width */
    margin-top: auto; /* Push footer to the bottom */
}

</style>
</head>
<body>
	<!-- Header -->
<header>
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <a class="navbar-brand" href="adminDashboard.jsp"><img src="resources/images/logo.png" alt="Urban Adventure Logo"></a>
            <a class="navbar-brand mx-auto" href="adminDashboard.jsp">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="manageToursDropdown" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Manage Tours</a>
                        <div class="dropdown-menu" aria-labelledby="manageToursDropdown">
                            <a class="dropdown-item" href="addTour.jsp">Add Tour</a>
                            <a class="dropdown-item" href="viewBookings.jsp">View Bookings</a>
                            <a class="dropdown-item" href="activate-deactivateTour.jsp">Update Tour</a>
                            <a class="dropdown-item" href="viewBookings.jsp">View Bookings</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="admin?action=logout">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>


	<main class="container mt-4">
		<h2>Update Tour</h2>

		<c:if test="${not empty requestScope.message}">
			<div class="alert alert-info">${requestScope.message}</div>
		</c:if>

		<form action="tour" method="post">
			<input type="hidden" name="action" value="updateTour">
			<input type="hidden" name="tourId" value="${tour.tourId}">
			<div class="form-group">
				<label for="tourName">Tour Name</label>
				<input type="text" class="form-control" id="tourName" name="tourName" value="${tour.tourName}" required>
			</div>
			<div class="form-group">
				<label for="description">Description</label>
				<textarea class="form-control" id="description" name="description" rows="3" required>${tour.description}</textarea>
			</div>
			<div class="form-group">
				<label for="price">Price</label>
				<input type="number" class="form-control" id="price" name="price" value="${tour.price}" step="0.01" required>
			</div>
			<div class="form-group">
				<label for="availability">Availability</label>
				<input type="number" class="form-control" id="availability" name="availability" value="${tour.availability}" required>
			</div>
			<div class="form-group">
				<label for="imageUrl">Image URL</label>
				<input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${tour.imageFileName}" required>
			</div>
			<button type="submit" class="btn btn-primary">Update Tour</button>
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
