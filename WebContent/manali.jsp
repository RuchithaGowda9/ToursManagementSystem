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
							src="https://i.pinimg.com/originals/8a/87/7d/8a877d2abbfc2d2d51c8649190171070.jpg"
							alt="Seoul View 1">
					</div>
					<div class="carousel-item">
						<img
							src="https://static.toiimg.com/thumb/msid-35784725,width-748,height-499,resizemode=4,imgsize-217013/.jpg"
							alt="Seoul View 2">
					</div>
					<div class="carousel-item">
						<img
							src="https://i.pinimg.com/736x/ac/48/6a/ac486aa837863b2e696b0ca9cc655189.jpg"
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
					<strong>Temperature:</strong> 55 F (13 C)
				</p>
				<p>
					<strong>High:</strong> 65 F (18 C)
				</p>
				<p>
					<strong>Low:</strong> 45 F (7 C)
				</p>
				<h4>Weather Tips</h4>
				<p>
					<strong>Layer Up:</strong> Manali temperatures can vary, so wear
					layers that you can adjust according to the weather.
				</p>
				<p>
					<strong>Stay Warm:</strong> Even during the day, it can get chilly.
					Bring a warm jacket, especially if you're heading into higher
					altitudes.
				</p>
				<p>
					<strong>Sun Protection:</strong> Even in cooler weather, the sun
					can be strong. Use sunscreen and wear sunglasses.
				</p>
				<p>
					<strong>Rain Preparedness:</strong> Manali can experience
					unexpected showers. Carry an umbrella or a waterproof jacket.
				</p>
			</div>


			<!-- Pick-Up Points -->
			<div class="pick-up-card">
				<h4>Pick-Up Points</h4>
				<p>
					<strong>Nearest Bus/Train Station:</strong> Manali Bus Stand
				</p>
				<p>
					<strong>Nearest Airport:</strong> Bhuntar Airport (Kullu-Manali
					Airport)
				</p>
				<p class="alert-danger">Note: Reaching these destinations is
					your responsibility. No travel assistance is provided.</p>
				<p>
					<strong>Accommodation:</strong> You will be staying at a
					comfortable hotel in Manali, and we provide transfers from the
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
								aria-controls="collapseOne">Day 1: Arrival and Local
								Sightseeing</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#itineraryAccordion">
						<div class="card-body">As you land in Manali, our friendly
							guide will be there to greet you. After checking into your hotel,
							take some time to relax and freshen up. Hadimba Temple: Start
							your exploration with a visit to the Hadimba Temple, a beautiful
							wooden temple set amidst a serene cedar forest. Afternoon:

							Vashisht Hot Springs: Head to the nearby Vashisht village to
							enjoy the natural hot springs and visit the Vashisht Temple. Manu
							Temple: Explore the Manu Temple, dedicated to the sage Manu,
							believed to be the creator of the human race in Hindu mythology.
							Evening: Mall Road: Stroll along Mall Road, the main shopping
							street in Manali, where you can shop for souvenirs and enjoy
							local cuisine at one of the many cafes and restaurants.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">Day
								2: Solang Valley and Adventure Activities</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Solang Valley: After
							breakfast, we'll drive to Solang Valley, known for its stunning
							views and adventure activities. You can try paragliding, zorbing,
							or a cable car ride to get a bird's-eye view of the valley.
							Afternoon: Snow Activities: If you're visiting in winter, enjoy
							snow activities like skiing and snowboarding. In summer, you can
							go for a trek or a horse ride. Evening: Return to Manali: Head
							back to Manali and spend the evening at leisure. You might want
							to explore more of Mall Road or relax at your hotel.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Day 3: Rohtang Pass and Scenic Beauty</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse"
						aria-labelledby="headingThree" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Rohtang Pass: Today, we'll
							take an early morning drive to Rohtang Pass, a high mountain pass
							offering breathtaking views of the Himalayas. The journey itself
							is an adventure, with winding roads and stunning landscapes.
							Afternoon: Snow Play: Spend some time playing in the snow,
							building snowmen, or simply enjoying the majestic scenery. Don't
							forget to take lots of photos! Evening: Return to Manali: Drive
							back to Manali in the late afternoon. You can spend the evening
							relaxing at your hotel or exploring more of the town.</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingFour">
							<h5 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">Day
									4: Naggar Castle and Departure</button>
							</h5>
						</div>
						<div id="collapseFour" class="collapse"
							aria-labelledby="headingFour" data-parent="#itineraryAccordion">
							<div class="card-body">Naggar Castle: On your final day,
								we'll visit Naggar Castle, a historic castle with beautiful
								architecture and stunning views of the Kullu Valley. The castle
								also houses a small museum and an art gallery. Afternoon:

								Nicholas Roerich Art Gallery: Visit the nearby Nicholas Roerich
								Art Gallery, dedicated to the famous Russian painter and
								explorer. The gallery showcases his works and offers a glimpse
								into his life. Evening: Departure: After a fulfilling day, it's
								time to head back to your hotel, collect your belongings, and
								prepare for your departure.</div>
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
								<div class="review-content">
									<p>"The Manali tour was absolutely breathtaking, with
										stunning views and great guides making the experience
										unforgettable."</p>
									<p>
										<strong>Ravi Patel</strong>
									</p>
								</div>
							</div>
							<div class="carousel-item">
								<div class="review-content">
									<p>"Exploring Manali was a fantastic experience; the
										natural beauty and well-planned itinerary made it a perfect
										getaway."</p>
									<p>
										<strong>Neha Sharma</strong>
									</p>
								</div>
							</div>
							<div class="carousel-item">
								<div class="review-content">
									<p>"Our Manali trip was amazing; the snow-capped mountains
										and adventure activities were the highlights of our vacation."</p>
									<p>
										<strong>Arjun Singh</strong>
									</p>
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
