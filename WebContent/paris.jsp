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
							src="https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg"
							alt="Seoul View 1">
					</div>
					<div class="carousel-item">
						<img
							src="https://www.planetware.com/wpimages/2023/08/france-paris-tourist-attractions-eiffel-tower-and-river.jpg"
							alt="Seoul View 2">
					</div>
					<div class="carousel-item">
						<img
							src="https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-chateau-de-chenonceau.jpg"
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
					<strong>Temperature:</strong> 65 F (18 C)
				</p>
				<p>
					<strong>High:</strong> 75 F (24 C)
				</p>
				<p>
					<strong>Low:</strong> 60 F (16 C)
				</p>
				<h4>Weather Tips</h4>
				<p>
					<strong>Stay Hydrated:</strong> Carry a water bottle and drink
					plenty of fluids.
				</p>
				<p>
					<strong>Sun Protection:</strong> Use sunscreen, wear sunglasses,
					and a hat.
				</p>
				<p>
					<strong>Dress Comfortably:</strong> Opt for light, breathable
					clothing.
				</p>
				<p>
					<strong>Rain Preparedness:</strong> Keep an umbrella or raincoat
					handy as there is a chance of rain.
				</p>
			</div>

			<!-- Pick-Up Points -->
			<div class="pick-up-card">
				<h4>Pick-Up Points</h4>
				<p>
					<strong>Nearest Bus/Train Station:</strong> Gare du Nord
				</p>
				<p>
					<strong>Nearest Airport:</strong> Charles de Gaulle Airport
				</p>
				<p class="alert-danger">Note: Reaching these destinations is
					your responsibility. No travel assistance is provided.</p>
				<p>
					<strong>Accommodation:</strong> You will be staying at a
					comfortable hotel in Paris, and we provide transfer from the hotel
					to the various destinations either by car or AC bus based on the
					number bookings.
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
								aria-controls="collapseOne">Day 1: Welcome to Paris</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#itineraryAccordion">
						<div class="card-body">As you land in Paris, our friendly
							guide will be there to greet you. Enjoy a comfortable transfer to
							your hotel and take a well-deserved rest.we will begin our
							journey in the picturesque Montmartre district. As we wander
							through its charming cobblestone streets, you'll feel the
							artistic spirit that has inspired many famous artists.Our first
							stop is the Sacre-Coeur Basilica, Next, we will head to Place du
							Tertre, a lively square filled with artists painting and selling
							their work.After lunch, we will visit the iconic Eiffel Tower.
							We've pre-booked our tickets to avoid the long lines.o wrap up
							our first day, we will enjoy a relaxing Seine River cruise</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">Day
								2: Louvre, Champs - Elyees and Arc de Triomphe</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#itineraryAccordion">
						<div class="card-body">On the second day we will dive into
							the world of art and history at the Louvre Museum. we will start
							early to make the most of our time here. Highlights include the
							Mona Lisa, the Venus de Milo, and the vast collection of Egyptian
							antiquities. The museum is enormous, so we will focus on the
							must-see pieces. Afternoon: Tuileries Garden: After our museum
							visit, we will take a leisurely stroll through the Tuileries
							Garden. It's a perfect spot to relax and enjoy the beautiful
							surroundings. Place de la Concorde: we will then head to Place de
							la Concorde, one of the major public squares in Paris, known for
							its historical significance and impressive fountains.
							Champs - Elyees: we will walk down this famous avenue, stopping at
							shops and cafes along the way. Evening: Arc de Triomphe: we will
							end our day by climbing to the top of the Arc de Triomphe for
							another great view of the city</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Day 3: Notre-Dame, Sainte-Chapelle & Latin Quarter</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse"
						aria-labelledby="headingThree" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Notre-Dame Cathedral: we
							will start our day with a visit to the iconic Notre-Dame
							Cathedral. Sainte-Chapelle: Next, we will visit Sainte-Chapelle,
							known for its stunning stained glass windows. It's a true gem of
							Gothic architecture. Afternoon: Latin Quarter: we will spend the
							afternoon exploring the vibrant Latin Quarter. This historic area
							is home to the Sorbonne University and is filled with narrow
							streets, bookshops, and cafes. Luxembourg Gardens: we will take a
							relaxing stroll through the beautiful Luxembourg Gardens, a
							favorite spot for both locals and tourists. Evening: Dinner in
							the Latin Quarter: we will enjoy a delicious dinner in one of the
							many charming restaurants in the Latin Quarter.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFour">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">Day
								4: Farewell to Paris</button>
						</h5>
					</div>
					<div id="collapseFour" class="collapse"
						aria-labelledby="headingFour" data-parent="#itineraryAccordion">
						<div class="card-body">Today marks the end of your memorable
							stay in Paris.You will be transported to the airport, where you
							will catch your flight back home or to your next exciting
							destination.</div>
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
								<p>"The Paris tour was a dream come true! The highlights of
									the Eiffel Tower,was just spectacular.
									The guides were exceptionally knowledgeable and made the trip
									unforgettable. Highly recommend this tour for anyone visiting
									Paris!"</p>
								<p>
									<strong>Anushka Rao</strong>
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<div class="review-content">
								<p>"Exploring Paris with this tour was an amazing
									experience. The itinerary was well-balanced, allowing us to see
									the best of the city without feeling rushed. A fantastic
									experience overall!"</p>

								<strong>Raj Kumar</strong>
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<div class="review-content">
								<p>"Our trip to Paris exceeded all expectations. The
									free time for shopping and exploration was perfectly timed. The
									trip was beautifully organized and worth every penny. Can't
									wait to return!"</p>

								<strong>Monish Mandanna</strong>
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
