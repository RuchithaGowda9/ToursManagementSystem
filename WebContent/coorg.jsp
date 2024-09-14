<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seoul Tour - Urban Adventure</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
.navbar-custom {
	background-color: #0047AB; /* Match background color */
}

.navbar-brand, .nav-link {
	color: #ffffff; /* White text color */
}

.navbar-toggler {
	border-color: transparent; /* Remove border for cleaner look */
}

.btn-custom {
	background-color: #f96714; /* Orange background color for buttons */
	color: white;
}

.btn-custom:hover {
	background-color: #d75913; /* Darker orange for hover effect */
}

.navbar-nav .nav-link {
	color: #ffffff; /* White text color for navbar links */
	background-color: #0047AB; /* Match navbar background color */
	border-radius: 5px; /* Rounded corners for navbar links */
	padding: 8px 16px; /* Padding for better appearance */
}

.navbar-nav .nav-link:hover {
	color: #ffffff; /* White text color on hover */
	background-color: #f96714; /* Orange background color on hover */
}

footer {
	background-color: #0047AB; /* Match footer background color */
	color: #ffffff; /* White text color */
	text-align: center;
	padding: 15px 0; /* Padding for footer */
	margin-top: auto; /* Push footer to bottom */
}

.carousel-container {
	max-width: 600px;
}

.carousel-inner {
	height: 300px; /* Set fixed height for carousel */
}

.carousel-item img {
	height: 100%;
	object-fit: cover;
	width: 100%;
}

.weather-card, .pick-up-card, .review-card {
	background-color: #f4f4f4;
	padding: 15px;
	border-radius: 8px;
	margin-top: 15px;
	border: 1px solid #0047AB;
}

.weather-card h4, .pick-up-card h4, .review-card h4 {
	color: #0047AB;
}

.alert-danger {
	color: #f96714;
	font-weight: bold;
}

.container-fluid {
	padding: 0;
}

.main-content {
	display: flex;
	justify-content: space-between;
}

.left-half, .right-half {
	width: 50%;
	padding: 15px;
}

.book-now-container {
	text-align: center;
	margin: 20px 0;
}

.card-body ul {
	padding-left: 20px;
}

.review-card {
	position: relative;
	max-width: 400px;
	/* Reduced width for review box */
	max-height: 200px;
	margin: 30px auto;
	max-width: 400px; /* Center the reviews box and add margin */
}

.review-card p {
	font-style: italic;
	margin: 0; /* Remove default margin */
	padding-bottom: 10px; /* Add space between reviews */
}

.carousel-control-prev, .carousel-control-next {
	width: 5%; /* Adjust width as needed */
	top: 50%; /* Center vertically */
	transform: translateY(-50%); /* Adjust alignment */
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: #0047AB;
	/* Optional: background color for visibility */
}

.carousel-indicators {
	bottom: 10px; /* Adjust bottom position as needed */
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
			<a class="navbar-brand" href="userDashboard.jsp"> <img
				src="resources/images/logo.png" alt="Urban Adventure Logo"
				height="50">
			</a> <a class="navbar-brand mx-auto" href="userDashboard.jsp">Urban
				Adventure</a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link btn btn-custom mx-2"
						href="userDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link btn btn-custom mx-2"
						href="userProfile.jsp">User Profile</a></li>
					<li class="nav-item"><a class="nav-link btn btn-custom mx-2"
						href="${pageContext.request.contextPath}/tourDetails?tourId=${tour.tourId}&action=bookNow"
						class="btn btn-primary">Book Now</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<main class="container-fluid my-4">
	<div class="main-content">
		<!-- Left Half: Carousel and Additional Information -->
		<div class="left-half">
			<!-- Carousel for Tour Images -->
			<div id="tourCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#tourCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#tourCarousel" data-slide-to="1"></li>
					<li data-target="#tourCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="https://www.traveldealsfinder.com/wp-content/uploads/Abbey-Falls-Coorg.jpg"
							alt="Seoul View 1">
					</div>
					<div class="carousel-item">
						<img
							src="https://t3.ftcdn.net/jpg/02/74/03/98/360_F_274039865_qHpF7VEuSDlZ5bBa2xRx9k52i8OSua3b.jpg"
							alt="Seoul View 2">
					</div>
					<div class="carousel-item">
						<img
							src="https://ginormousnature.wordpress.com/wp-content/uploads/2017/01/coorg.jpeg"
							alt="Seoul View 3">
					</div>
				</div>
				<a class="carousel-control-prev" href="#tourCarousel" role="button"
					data-slide="prev"> <span class="carousel-control-prev-icon"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#tourCarousel" role="button"
					data-slide="next"> <span class="carousel-control-next-icon"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>
			</div>

			<!-- Weather Information -->
			<div class="weather-card">
				<h4>Weather Information</h4>
				<p>
					<strong>Temperature:</strong> 70 F (21 C)
				</p>
				<p>
					<strong>High:</strong> 80 F (27 C)
				</p>
				<p>
					<strong>Low:</strong> 60 F (16 C)
				</p>
				<h4>Weather Tips</h4>
				<p>
					<strong>Layer Up:</strong> Coorg weather can be pleasantly cool in
					the mornings and evenings, so light layers are recommended.
				</p>
				<p>
					<strong>Stay Comfortable:</strong> Wear breathable and comfortable
					clothing as it can be humid during the day.
				</p>
				<p>
					<strong>Sun Protection:</strong> Even with the mild temperatures,
					the sun can be strong. Use sunscreen and wear a hat.
				</p>
				<p>
					<strong>Rain Preparedness:</strong> Coorg can have sudden rain
					showers. Carry an umbrella or a raincoat.
				</p>
			</div>



			<!-- Pick-Up Points -->
			<div class="pick-up-card">
				<h4>Pick-Up Points</h4>
				<p>
					<strong>Nearest Bus/Train Station:</strong> Madikeri Bus Stand
				</p>
				<p>
					<strong>Nearest Airport:</strong> Mangalore Airport (Bajpe)
				</p>
				<p class="alert-danger">Note: Reaching these destinations is
					your responsibility. No travel assistance is provided.</p>
				<p>
					<strong>Accommodation:</strong> You will be staying at a
					comfortable hotel in Coorg, and we provide transfers from the hotel
					to various destinations either by car or AC bus based on the number
					of bookings.
				</p>
			</div>


		</div>

		<!-- Right Half: Itinerary -->
		<div class="right-half">
			<h2>Itinerary for 3N4D</h2>
			<div class="accordion" id="itineraryAccordion">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">Day 1: Arrival and Dubare
								Elephant Camp</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#itineraryAccordion">
						<div class="card-body">Arrive in Coorg and check into your
							accommodation. Visit Dubare Elephant Camp to interact with
							elephants, enjoy a boat ride, and take a nature walk along the
							Cauvery River..</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">Day
								2: Talakaveri and Abbey Falls</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#itineraryAccordion">
						<div class="card-body">Start your day with a visit to
							Talakaveri, the source of the River Cauvery, and explore the
							nearby temples. In the afternoon, head to Abbey Falls and later
							relax at Raja's Seat, a beautiful garden with panoramic views..</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Day 3: Coffee Plantation and Madikeri Fort</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse"
						aria-labelledby="headingThree" data-parent="#itineraryAccordion">
						<div class="card-body">Take a guided tour of a coffee
							plantation to learn about coffee cultivation and processing. In
							the afternoon, visit Madikeri Fort and the Omkareshwara Temple,
							followed by a stroll through the local markets.</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingFour">
							<h5 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">Day
									4 : Tibetan Monastery and Departure</button>
							</h5>
						</div>
						<div id="collapseFour" class="collapse"
							aria-labelledby="headingFour" data-parent="#itineraryAccordion">
							<div class="card-body">Spend your morning at the Namdroling
								Monastery (Golden Temple) in Bylakuppe, experiencing the serene
								atmosphere and intricate architecture. After lunch, prepare for
								your departure back to Bangalore or your next destination.</div>
						</div>
					</div>
				</div>

				<!-- Reviews -->
				<div class="review-card">
					<h4>What Our Travelers Say</h4>
					<div id="reviewCarousel" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#reviewCarousel" data-slide-to="0"
								class="active"></li>
							<li data-target="#reviewCarousel" data-slide-to="1"></li>
							<li data-target="#reviewCarousel" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="carousel-item active">
									<div class="review-content">
										<p>"The Coorg tour was incredible, with lush greenery and
											serene landscapes making it a truly relaxing experience."</p>
										<p>
											<strong>Anita Reddy</strong>
										</p>
									</div>
								</div>
								<div class="carousel-item">
									<div class="review-content">
										<p>"Exploring Coorg was a delightful experience; the
											coffee plantations and beautiful waterfalls made it
											unforgettable."</p>
										<p>
											<strong>Kiran Kumar</strong>
										</p>
									</div>
								</div>
								<div class="carousel-item">
									<div class="review-content">
										<p>"Our trip to Coorg was fantastic; the scenic beauty and
											pleasant weather were the perfect backdrop for a memorable
											vacation."</p>
										<p>
											<strong>Deepa Gowda</strong>
										</p>
									</div>
								</div>

							</div>

						</div>
					</div>
					<a class="carousel-control-prev" href="#reviewCarousel"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#reviewCarousel"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>



		</div>
	</div>
	</main>

	<footer class="bg-dark text-white text-center py-3">
		<p>© 2024 Urban Adventure. All rights reserved.</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
