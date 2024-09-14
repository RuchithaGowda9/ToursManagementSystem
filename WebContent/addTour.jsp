<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.crimsonlogic.urbanadventures.dao.TourDao"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour"%>
<%@ page import="java.io.IOException"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Tour</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
	border-color: transparent;
	/* Remove border from toggler for a cleaner look */
}

.navbar-nav .nav-link, .navbar-nav .dropdown-item {
	color: #ffffff; /* Text color */
	background-color: #0047AB; /* Button background color */
	border-radius: 5px; /* Curved edges */
	padding: 8px 16px; /* Padding for better appearance */
	transition: background-color 0.3s;
	/* Smooth transition for hover effect */
}

.navbar-nav .nav-link:hover, .navbar-nav .dropdown-item:hover {
	color: #ffffff; /* Text color on hover */
	background-color: #f96714; /* Button background color on hover */
}

.dropdown-menu {
	background-color: #0047AB; /* Dropdown background color */
	border: none; /* Remove border from dropdown */
	border-radius: 5px; /* Curved edges for dropdown */
	padding: 0; /* Remove padding */
}

.dropdown-item {
	color: #ffffff; /* Text color for dropdown items */
}

.dropdown-item:hover {
	background-color: #f96714;
	/* Background color on hover for dropdown items */
	color: #ffffff; /* Text color on hover for dropdown items */
}

.dashboard-content {
	padding: 20px;
	margin-top: 90px; /* Offset for the fixed navbar */
	height: calc(100vh - 90px); /* Full height minus navbar */
	overflow-y: auto; /* Enable vertical scrolling if content overflows */
}

.form-card {
	background-color: rgba(249, 103, 20, 0.1); /* Light orange tint */
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

/* Button styling with #f96714 color */
.btn-primary {
	background-color: #f96714;
	border-color: #f96714;
}

.btn-primary:hover {
	background-color: #e5580c; /* Darker shade on hover */
	border-color: #e5580c;
}

.btn-primary:focus, .btn-primary.focus {
	box-shadow: 0 0 0 0.2rem rgba(249, 103, 20, 0.5);
}

footer {
	background-color: #343a40;
	color: #ffffff;
	text-align: center;
	padding: 1rem;
	position: relative;
	bottom: 0;
	width: 100%;
}

.error {
	color: red;
	font-size: 0.875rem;
}
</style>
</head>
<body>
	<header class="bg-primary text-white">
		<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
			<a class="navbar-brand" href="adminDashboard.jsp"><img
				src="resources/images/logo.png" alt="Urban Adventure Logo"></a> <a
				class="navbar-brand mx-auto" href="adminDashboard.jsp">Admin
				Dashboard</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="adminDashboard.jsp">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="manageToursDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Manage Tours</a>
						<div class="dropdown-menu" aria-labelledby="manageToursDropdown">
							<a class="dropdown-item" href="addTour.jsp">Add Tour</a> <a
								class="dropdown-item" href="tourList.jsp">Tour List</a> <a
								class="dropdown-item" href="activate-deactivateTour.jsp">Update
								Tour </a> <a class="dropdown-item" href="viewBookings.jsp">View
								Bookings</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="admin?action=logout">Logout</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<div class="container mt-4">
		<h2 class="text-center mb-4">Add a New Tour</h2>
		<%
			String message = (String) request.getAttribute("message");
			if (message != null) {
		%>
		<div class="alert alert-info">
			<%=message%>
		</div>
		<%
			}
		%>
		<div class="form-card mx-auto" style="max-width: 600px;">
			<form id="addTourForm" action="tour?action=addTour" method="post"
				class="mx-auto" style="max-width: 600px;">
				<div class="form-group">
					<label for="tourName">Tour Name:</label> <input type="text"
						class="form-control" id="tourName" name="tourName" required>
					<div id="tourNameError" class="error"></div>
				</div>
				<div class="form-group">
					<label for="description">Description:</label>
					<textarea class="form-control" id="description" name="description"
						rows="4" required></textarea>
					<div id="descriptionError" class="error"></div>
				</div>
				<div class="form-group">
					<label for="price">Price:</label> <input type="number"
						class="form-control" id="price" name="price" step="0.01" required>
					<div id="priceError" class="error"></div>
				</div>
				<div class="form-group">
					<label for="availability">Availability:</label> <input
						type="number" class="form-control" id="availability"
						name="availability" required>
					<div id="availabilityError" class="error"></div>
				</div>
				<div class="form-group">
					<label for="imageUrl">Image URL:</label> <input type="text"
						class="form-control" id="imageUrl" name="imageUrl" required>
					<div id="imageUrlError" class="error"></div>
				</div>

				<button type="submit" class="btn btn-primary">Add Tour</button>
				<div id="formError" class="error mt-3"></div>
			</form>
		</div>
	</div>

	<footer>
		<p>© 2024 Urban Adventure. All rights reserved.</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('#addTourForm')
									.on(
											'submit',
											function(event) {
												var isValid = true;

												// Clear previous error messages
												$('.error').text('');

												// Validate each field
												if ($('#tourName').val().trim() === '') {
													$('#tourNameError')
															.text(
																	'Tour Name is required.');
													isValid = false;
												}
												if ($('#description').val()
														.trim() === '') {
													$('#descriptionError')
															.text(
																	'Description is required.');
													isValid = false;
												}
												if ($('#price').val().trim() === '') {
													$('#priceError')
															.text(
																	'Price is required.');
													isValid = false;
												}
												if ($('#availability').val()
														.trim() === '') {
													$('#availabilityError')
															.text(
																	'Availability is required.');
													isValid = false;
												}
												if ($('#imageUrl').val().trim() === '') {
													$('#imageUrlError')
															.text(
																	'Image URL is required.');
													isValid = false;
												}

												if (!isValid) {
													$('#formError')
															.text(
																	'Please fill out all fields before submitting.');
													event.preventDefault(); // Prevent form submission if validation fails
												}
											});
						});
	</script>
</body>
</html>
