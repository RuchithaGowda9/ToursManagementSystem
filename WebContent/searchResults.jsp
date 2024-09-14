<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results - Urban Adventure</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/common-styles.css">
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* Ensure body takes up full viewport height */
}

header {
	background-color: #0047AB; /* Header background color */
	margin-bottom: auto; /* Push the footer to the bottom */
}

.navbar-custom {
	background-color: #0047AB; /* Navbar background color */
}

.navbar-brand {
	color: #f96714; /* Navbar brand color */
}

.navbar-nav .nav-link {
	color: #f96714; /* Navbar links color */
}

.navbar-nav .nav-link:hover {
	color: #fff; /* Navbar links hover color */
}

.card {
	border: 1px solid #ddd; /* Light border color */
	border-radius: 8px; /* Rounded corners */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
	transition: transform 0.3s, box-shadow 0.3s;
	background-color: #fff; /* Card background color */
}

.card:hover {
	transform: translateY(-5px); /* Lift card on hover */
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
	/* Enhanced shadow on hover */
}

.card-img-top {
	border-bottom: 1px solid #ddd; /* Border between image and card body */
	max-height: 200px; /* Ensure the image fits well */
	object-fit: cover; /* Maintain image aspect ratio */
	border-radius: 8px 8px 0 0; /* Rounded corners for top of the card */
}

.card-body {
	padding: 1.25rem; /* Padding inside card body */
}

.card-title {
	color: #0047AB; /* Card title color */
}

.card-text {
	color: #333; /* Card text color */
}

.btn-primary {
	background-color: #f96714; /* Button background color */
	border: none; /* Remove border */
	border-radius: 4px; /* Rounded button corners */
}

.btn-primary:hover {
	background-color: #e8590f; /* Darker button color on hover */
	color: #fff; /* Ensure text color is white */
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
	<header class="bg-primary text-white">
		<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
			<a class="navbar-brand" href="userDashboard.jsp"> <img
				src="resources/images/logo.png" alt="Urban Adventure Logo">
			</a> <a class="navbar-brand mx-auto" href="userDashboard.jsp">Urban
				Adventure</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="userDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="searchTours.jsp">Search Tours</a></li>
					<li class="nav-item"><a class="nav-link"
						href="userProfile.jsp">Profile</a></li>
					<li class="nav-item"><a class="nav-link" href="user?action=logout">Logout</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<main class="container my-4">
	<h2>Search Results</h2>
	<div class="row">
		<c:choose>
			<c:when test="${not empty sessionScope.searchResultList}">
				<c:forEach var="tour" items="${sessionScope.searchResultList}">
					<div class="col-md-4 mb-4">
						<div class="card">
							<img src="${tour.imageFileName}" class="card-img-top"
								alt="${tour.tourName}">
							<div class="card-body">
								<h5 class="card-title">${tour.tourName}</h5>
								<p class="card-text">${tour.description}</p>
								<p class="card-text">Price: ${tour.price}</p>
								<p class="card-text">Availability :${tour.availability}</p>
								<a
									href="${pageContext.request.contextPath}/tourDetails?tourId=${tour.tourId}"
									class="btn btn-primary">View Details</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<hi>Oops! No tours available for your search at the moment.</h1>
			</c:otherwise>
		</c:choose>
	</div>
	</main>

	<footer>
		<p>© 2024 Urban Adventure. All rights reserved.</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
