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
	background-color: #0047AB;
}

.btn-custom {
	background-color: #f96714;
	color: white;
}

.btn-custom:hover {
	background-color: #d75913;
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

footer {
	background-color: #0047AB;
	color: white;
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
							src="https://png.pngtree.com/thumb_back/fh260/png-vector/20200530/ourmid/pngtree-singapore-landmark-building-merlion-png-image_2213476.jpg"
							alt="Seoul View 1">
					</div>
					<div class="carousel-item">
						<img
							src="https://wallup.net/wp-content/uploads/2019/10/50163-singapore-city-night-748x468.jpg"
							alt="Seoul View 2">
					</div>
					<div class="carousel-item">
						<img
							src="https://media.istockphoto.com/id/694356140/photo/singapore-skyline-at-sunset-time-in-singapore-city.jpg?s=612x612&w=0&k=20&c=1JUMi506Kz9WUmL5SZJtuDdbiK4Q0Gy-MBydKnGGLG8="
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
					<strong>Temperature:</strong> 88 F (31 C)
				</p>
				<p>
					<strong>High:</strong> 89 F (32 C)
				</p>
				<p>
					<strong>Low:</strong> 77 F (25 C)
				</p>
				<h4>Weather Tips</h4>
				<p>
					<strong>Stay Hydrated:</strong> Carry a water bottle and drink
					plenty of fluids to combat the high humidity.
				</p>
				<p>
					<strong>Sun Protection:</strong> Use sunscreen, wear sunglasses,
					and a hat to protect yourself from the strong sun.
				</p>
				<p>
					<strong>Dress Comfortably:</strong> Opt for light, breathable
					clothing to stay cool and comfortable in the tropical climate.
				</p>
				<p>
					<strong>Rain Preparedness:</strong> Keep an umbrella or raincoat
					handy as Singapore experiences frequent, sudden rain showers.
				</p>
			</div>


			<!-- Pick-Up Points -->
			<div class="pick-up-card">
				<h4>Pick-Up Points</h4>
				<p>
					<strong>Nearest Bus/Train Station:</strong> Dhoby Ghaut MRT Station
				</p>
				<p>
					<strong>Nearest Airport:</strong> Singapore Changi Airport
				</p>
				<p class="alert-danger">Note: Reaching these destinations is
					your responsibility. No travel assistance is provided.</p>
				<p>
					<strong>Accommodation:</strong> You will be staying at a
					comfortable hotel in Singapore, and we provide transfers from the
					hotel to various destinations either by car or AC bus based on the
					number of bookings.
				</p>
			</div>

		</div>

		<!-- Right Half: Itinerary -->
		<div class="right-half">
			<h2>Itinerary</h2>
			<div class="accordion" id="itineraryAccordion">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">Day 1: Iconic Landmarks and
								Gardens</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Merlion Park: Start your day
							with a visit to the iconic Merlion statue. It's a great spot for
							photos with the Singapore skyline in the background. Marina Bay
							Sands SkyPark: Head to the Marina Bay Sands SkyPark for panoramic
							views of the city. The observation deck offers a stunning
							perspective of Singapore. Afternoon: Gardens by the Bay: Explore
							the futuristic Gardens by the Bay. Don't miss the Flower Dome and
							Cloud Forest, which house a variety of exotic plants and stunning
							waterfalls. Lunch: Enjoy lunch at Satay by the Bay, a nearby food
							court offering a variety of local dishes. Evening: Supertree
							Grove: Return to Gardens by the Bay to see the Supertrees lit up
							at night. The Garden Rhapsody light and sound show is a must-see.
							Dinner: Dine at one of the many restaurants in the Marina Bay
							area, such as the rooftop restaurant at Marina Bay Sands.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">Day
								2: Cultural Exploration</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Chinatown: Start your day in
							Chinatown. Visit the Buddha Tooth Relic Temple and Museum, and
							explore the vibrant streets filled with shops and eateries.
							Little India: Head to Little India to experience the colorful
							streets and rich culture. Visit the Sri Veeramakaliamman Temple
							and shop at the Mustafa Centre. Afternoon: Kampong Glam: Explore
							Kampong Glam, the Malay-Arab quarter. Visit the Sultan Mosque and
							stroll along Haji Lane, known for its street art and boutique
							shops. Lunch: Enjoy a meal at one of the many cafes or
							restaurants in Kampong Glam. Evening: Clarke Quay: Spend your
							evening at Clarke Quay, a riverside quay known for its vibrant
							nightlife. Enjoy a river cruise and dine at one of the many
							restaurants along the quay.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Day 3: Sentosa Island Adventure</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse"
						aria-labelledby="headingThree" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Sentosa Island: Take the
							cable car to Sentosa Island. Start your adventure with a visit to
							Universal Studios Singapore for thrilling rides and attractions.
							S.E.A. Aquarium: Explore the S.E.A. Aquarium, one of the largest
							aquariums in the world, home to a diverse range of marine life.
							Afternoon: Adventure Cove Waterpark: Cool off at Adventure Cove
							Waterpark, which offers water slides, a lazy river, and
							snorkeling with tropical fish. Lunch: Enjoy lunch at one of the
							many eateries on Sentosa Island. Evening: Wings of Time: End your
							day with the Wings of Time show, a spectacular outdoor night show
							set against the backdrop of the open sea. Dinner: Dine at one of
							the beachside restaurants on Sentosa Island.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFour">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">Day
								4: Nature and Relaxationl</button>
						</h5>
					</div>
					<div id="collapseFour" class="collapse"
						aria-labelledby="headingFour" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Singapore Botanic Gardens:
							Start your day with a visit to the Singapore Botanic Gardens, a
							UNESCO World Heritage site. Don't miss the National Orchid
							Garden. Fort Canning Park: Explore Fort Canning Park, a historic
							hilltop park with lush greenery and interesting historical
							landmarks. Afternoon: Orchard Road: Head to Orchard Road for some
							shopping. This famous shopping street is lined with malls and
							boutiques. Lunch: Enjoy lunch at one of the many restaurants in
							the Orchard Road area. Evening: Singapore Flyer: Take a ride on
							the Singapore Flyer, one of the world's largest observation
							wheels, for a stunning view of the city at sunset. Dinner: End
							your trip with a memorable dinner at a rooftop restaurant, such
							as 1-Altitude or Ce La Vi, offering panoramic views of the city.
							This itinerary ensures a mix of iconic landmarks, cultural
							experiences, adventure, and relaxation. Enjoy your trip to
							Singapore! If you have any specific interests or preferences,
							feel free to let me know, and I can tailor the itinerary further.</div>
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
								<p>"The Singapore tour was a dream come true! The visit to
									the Marina Bay Sands and Gardens by the Bay were highlights.
									The guides were exceptional and made the whole experience
									enjoyable!"</p>
								<p>
									<strong>Anil Mehta</strong>
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<div class="review-content">
								<p>"Exploring Singapore was fantastic. The well-organized
									itinerary and the optional tours like Sentosa Island were
									amazing. Highly recommend this tour!"</p>
								<p>
									<strong>Neha Gupta</strong>
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<div class="review-content">
								<p>"Our trip to Singapore exceeded all expectations. The
									blend of modern attractions and cultural experiences made it
									unforgettable. The accommodations were excellent, and the
									service was top-notch!"</p>
								<p>
									<strong>Arjun Rao</strong>
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
