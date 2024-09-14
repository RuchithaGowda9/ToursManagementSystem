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
							src="https://t4.ftcdn.net/jpg/04/84/89/97/360_F_484899772_NNPAaNfsfnehJthkoATLI5vsmS5oX7vo.jpg"
							alt="Seoul View 1">
					</div>
					<div class="carousel-item">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQePfpYg-hoTf-vnpLdsLCHz1ZYB1LTGWNQsg&s"
							alt="Seoul View 2">
					</div>
					<div class="carousel-item">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8okUbCyrKwz1dQRwh1oaQsKUlGp3_IRK6Uw&s"
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
					<strong>Temperature:</strong> 85 F (29 C)
				</p>
				<p>
					<strong>High:</strong> 90 F (32 C)
				</p>
				<p>
					<strong>Low:</strong> 75 F (24 C)
				</p>
				<h4>Weather Tips</h4>
				<p>
					<strong>Stay Hydrated:</strong> Gokarna can be quite warm, so carry
					a water bottle and drink plenty of fluids.
				</p>
				<p>
					<strong>Sun Protection:</strong> Use sunscreen, wear sunglasses,
					and a wide-brimmed hat to protect against strong sunlight.
				</p>
				<p>
					<strong>Dress Comfortably:</strong> Opt for light, breathable
					clothing to stay cool in the heat.
				</p>
				<p>
					<strong>Rain Preparedness:</strong> Gokarna experiences occasional
					rain showers, so keep an umbrella or raincoat handy.
				</p>
			</div>


			<!-- Pick-Up Points -->
			<!-- Pick-Up Points -->
			<div class="pick-up-card">
				<h4>Pick-Up Points</h4>
				<p>
					<strong>Nearest Bus/Train Station:</strong> Gokarna Bus Stand
				</p>
				<p>
					<strong>Nearest Airport:</strong> Dabolim Airport (Goa
					International Airport)
				</p>
				<p class="alert-danger">Note: Reaching these destinations is
					your responsibility. No travel assistance is provided.</p>
				<p>
					<strong>Accommodation:</strong> You will be staying at a
					comfortable hotel in Gokarna, and we provide transfers from the
					hotel to various destinations either by car or AC bus based on the
					number of bookings.
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
								aria-controls="collapseOne">Day 1: Arrival and Beach
								Exploration</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Arrival and Check-in: Settle
							into your accommodation and freshen up. Gokarna Main Beach: Start
							your day with a visit to Gokarna Main Beach. It's a great spot
							for a morning walk and to soak in the local vibe. Afternoon:

							Mahabaleshwar Temple: Visit this ancient temple dedicated to Lord
							Shiva. It's a significant pilgrimage site and offers a glimpse
							into the local culture. Lunch: Enjoy a traditional South Indian
							meal at a local restaurant. Evening: Kudle Beach: Head to Kudle
							Beach for a relaxing evening. It's a popular spot for both locals
							and tourists, known for its beautiful sunset views. Dinner: Try
							one of the beachside shacks for dinner, offering a variety of
							cuisines.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">Day
								2: Beach Hopping and Trekking</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Om Beach: Start your day at
							Om Beach, named for its shape resembling the Om symbol. You can
							enjoy water sports like banana boat rides and jet skiing. Half
							Moon Beach: Trek from Om Beach to Half Moon Beach. The trek is
							scenic and offers stunning views of the coastline. Afternoon:

							Paradise Beach: Continue your trek to Paradise Beach. It's a
							secluded spot, perfect for a peaceful afternoon. You can also
							reach here by a short boat ride from Om Beach. Lunch: Pack a
							picnic or enjoy snacks from the small shacks on the beach.
							Evening: Return to Om Beach: Head back to Om Beach and relax at
							one of the cafes. Enjoy the laid-back atmosphere and perhaps some
							live music.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Day 3: Cultural and Natural Exploration</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse"
						aria-labelledby="headingThree" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Mirjan Fort: Take a short
							drive to Mirjan Fort, a historic site with impressive
							architecture and lush surroundings. Yana Caves: Visit the Yana
							Caves, known for their unique rock formations. It's a bit of a
							hike, but the natural beauty is worth it. Afternoon: Lunch: Enjoy
							a meal at a local restaurant on your way back to Gokarna. Gokarna
							Beach Trek: If you're up for more adventure, try the Gokarna
							Beach Trek, which covers multiple beaches and offers breathtaking
							views. Evening: Relaxation: Spend your evening relaxing at your
							hotel or exploring the local market for souvenirs.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFour">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">Day
								4: Leisure and Departure</button>
						</h5>
					</div>
					<div id="collapseFour" class="collapse"
						aria-labelledby="headingFour" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Vibhooti Falls: Visit
							Vibhooti Falls, a beautiful waterfall located a short drive from
							Gokarna. It's a great spot for a refreshing dip. Lunch: Have
							lunch at a local eatery near the falls. Afternoon: Shopping:
							Return to Gokarna and explore the local shops for souvenirs and
							handicrafts. Relaxation: Spend some time at your favorite beach,
							soaking in the last moments of your trip. Evening: Departure:
							Check out from your accommodation and head to your departure
							point, carrying wonderful memories of Gokarna.</div>
					</div>
				</div>
			</div>

			<!-- Reviews -->
			<div class="review-card">
				<h4>What Our Travelers Say</h4>
				<div id="reviewCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#reviewCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#reviewCarousel" data-slide-to="1"></li>
						<li data-target="#reviewCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="review-content">
								<p>"The Gokarna tour was an absolute delight! The serene
									beaches and tranquil temples made the trip memorable. The local
									guides were fantastic, adding great value to the experience.
									Highly recommended!"</p>
								<p>
									<strong>Aditi Shenoy</strong>
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<div class="review-content">
								<p>"Exploring Gokarna was a refreshing getaway; the
									picturesque landscapes and peaceful surroundings were just
									perfect. The itinerary was well-structured and allowed us to
									enjoy every moment!"</p>
								<p>
									<strong>Kiran Rao</strong>
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<div class="review-content">
								<p>"Our visit to Gokarna was fantastic; the stunning beaches
									and cultural spots were highlights of our vacation. The trip
									was well-organized and exceeded our expectations!"</p>
								<p>
									<strong>Ritika Kulkarni</strong>
								</p>
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
