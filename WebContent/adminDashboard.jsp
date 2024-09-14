<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Urban Adventure</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
	background-color: #0047AB;
	/* Match dropdown background to navbar background */
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
	margin-top: 70px; /* Adjust for fixed navbar height */
	height: calc(100vh - 70px); /* Full height minus navbar */
	overflow-y: auto; /* Enable vertical scrolling if content overflows */
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

/* Carousel and Hero Section Styling */
.carousel-item img {
	width: 100%;
	height: 100vh; /* Full viewport height */
	object-fit: cover;
}

.carousel-container {
	position: relative;
	height: 100vh; /* Ensure container is full height */
	overflow: hidden;
}

.hero {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh; /* Full viewport height */
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
	text-align: center;
	z-index: 10; /* Ensure it is above the carousel */
	background: rgba(0, 0, 0, 0.5);
	/* Optional: Add a semi-transparent background for better text visibility */
}

.hero-content {
	z-index: 20; /* Ensure content is above any possible background */
}

.hero-content h2 {
	font-size: 3rem;
	margin-bottom: 1rem;
}

.hero-content p {
	font-size: 1.5rem;
	margin-bottom: 2rem;
}

.btn-primary {
	background-color: #FC6A03;
	border-color: #FC6A03;
}

.btn-primary:hover {
	background-color: #f37a24;
	border-color: #f37a24;
}
</style>
</head>
<body>
	<header>
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
					<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="manageToursDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Manage Tours</a>
						<div class="dropdown-menu" aria-labelledby="manageToursDropdown">
							<a class="dropdown-item" href="addTour.jsp">Add Tour</a> <a
								class="dropdown-item" href="tourList.jsp">Tour List</a>
							<a class="dropdown-item" href="activate-deactivateTour.jsp">Update
								Tour</a> <a class="dropdown-item" href="viewBookings.jsp">View
								Bookings</a>
							<!-- New link added here -->

						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="admin?action=logout">Logout</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<!-- Carousel and Hero Section Wrapper -->
	<div class="carousel-container">
		<!-- Carousel -->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://www.onmycanvas.com/wp-content/uploads/2019/08/madikericoorgkarnatakasouthindia.jpeg"
						class="d-block w-100" alt="Coorg">
				</div>
				<div class="carousel-item">
					<img
						src="https://as2.ftcdn.net/v2/jpg/02/09/82/45/1000_F_209824591_K05Tob490TmBlTekkPlNrxh1Hy7IKMTU.jpg"
						class="d-block w-100" alt="Kerala">
				</div>
				<div class="carousel-item">
					<img
						src="https://www.seatemperatu.re/site/images/illustration/coree-du-sud_181.jpg"
						class="d-block w-100" alt="Singapore">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- Hero Section -->
		<div class="hero">
			<div class="hero-content">
				<%
					session = request.getSession(false);
					if (session != null && session.getAttribute("user") != null) {
						User user = (User) session.getAttribute("user");
						String username = user.getFirstName();
				%>
				<h2>
					Welcome back,
					<%=username%>!
				</h2>
				<p>Manage tours and more.</p>
				<%
					} else {
				%>
				<h2>Access Denied</h2>
				<p>Please log in to access the admin dashboard.</p>
				<%
					}
				%>
			</div>
		</div>
	</div>

	<!-- Footer -->
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
