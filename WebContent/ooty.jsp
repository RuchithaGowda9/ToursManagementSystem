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
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAIQIPSRaPIsgFkWfCc61hBiDA2E1RTwkY0A&s"
							alt="Seoul View 1">
					</div>
					<div class="carousel-item">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzIABYLZRgfATT62p9aOuxmBTVtR4yyDmjmw&s"
							alt="Seoul View 2">
					</div>
					<div class="carousel-item">
						<img
							src="https://t3.ftcdn.net/jpg/04/16/66/30/360_F_416663024_MDoibghS8s4oxHea0PjRezhDJy17RtPd.jpg"
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
					<strong>Temperature:</strong> 60 F (16 C)
				</p>
				<p>
					<strong>High:</strong> 70 F (21 C)
				</p>
				<p>
					<strong>Low:</strong> 50 F (10 C)
				</p>
				<h4>Weather Tips</h4>
				<p>
					<strong>Layer Up:</strong> Ooty weather can be cool, especially in
					the mornings and evenings. Layered clothing is advisable.
				</p>
				<p>
					<strong>Stay Warm:</strong> Bring a warm jacket or sweater, as
					temperatures can drop in the evenings.
				</p>
				<p>
					<strong>Sun Protection:</strong> The sun can be strong even at
					cooler temperatures. Use sunscreen and wear sunglasses.
				</p>
				<p>
					<strong>Rain Preparedness:</strong> Ooty experiences occasional
					rain. Carry an umbrella or a waterproof jacket.
				</p>
			</div>



			<!-- Pick-Up Points -->
			<!-- Pick-Up Points -->
			<div class="pick-up-card">
				<h4>Pick-Up Points</h4>
				<p>
					<strong>Nearest Bus/Train Station:</strong> Ooty Bus Stand
				</p>
				<p>
					<strong>Nearest Airport:</strong> Coimbatore International Airport
				</p>
				<p class="alert-danger">Note: Reaching these destinations is
					your responsibility. No travel assistance is provided.</p>
				<p>
					<strong>Accommodation:</strong> You will be staying at a
					comfortable hotel in Ooty, and we provide transfers from the hotel
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
								aria-controls="collapseOne">Day 1: Exploring Ooty Town</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Arrival and Check-in: Settle
							into your hotel and freshen up. Botanical Gardens: Start your day
							with a visit to the Government Botanical Gardens. Enjoy the lush
							greenery and diverse plant species. Afternoon: Ooty Lake: Head to
							Ooty Lake for a relaxing boat ride. You can also enjoy cycling
							around the lake. Thread Garden: Visit the nearby Thread Garden,
							which showcases beautiful artificial flowers and plants made
							entirely of thread. Evening: Rose Garden: Spend your evening at
							the Ooty Rose Garden, home to thousands of varieties of roses.
							Local Market: Explore the local market for some shopping and try
							local delicacies.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">Day
								2: Scenic Views and Tea Estates</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Doddabetta Peak: Visit the
							highest peak in the Nilgiri Hills for panoramic views. Don't
							forget to bring your camera! Tea Factory and Museum: On your way
							back, stop by the Tea Factory and Museum to learn about tea
							processing and enjoy a cup of fresh Nilgiri tea. Afternoon: St.
							Stephen's Church: Visit this historic church, known for its
							beautiful architecture and serene surroundings. Wax World Museum:
							Explore the Wax World Museum, which features wax statues of
							famous personalities. Evening: Nilgiri Mountain Railway: Take a
							ride on the famous toy train from Ooty to Coonoor. The scenic
							journey through the hills is a must-do.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Day 3: Day Trip to Coonoor</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse"
						aria-labelledby="headingThree" data-parent="#itineraryAccordion">
						<div class="card-body">Morning: Sim's Park: Start your day
							with a visit to Sim's Park, a beautiful botanical garden in
							Coonoor. Lamb's Rock: Head to Lamb's Rock for stunning views of
							the Coimbatore plains and tea estates. Afternoon: Dolphin's Nose:
							Visit Dolphin's Nose for breathtaking views of the surrounding
							valleys and Catherine Falls. Tea Gardens: Spend some time
							exploring the tea gardens and enjoy a tea-tasting session.
							Evening: Return to Ooty: Head back to Ooty and relax at your
							hotel or explore more of the local market.</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingFour">
							<h5 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">Day
									4: Adventure and Wildlife</button>
							</h5>
						</div>
						<div id="collapseFour" class="collapse"
							aria-labelledby="headingFour" data-parent="#itineraryAccordion">
							<div class="card-body">Morning: Avalanche Lake: Take a trip
								to Avalanche Lake, a serene spot perfect for picnics and nature
								walks. Emerald Lake: Visit the nearby Emerald Lake for more
								scenic beauty and tranquility. Afternoon: Mudumalai National
								Park: Head to Mudumalai National Park for a wildlife safari. You
								might spot elephants, tigers, and various bird species. Evening:

								Return to Ooty: Return to Ooty and spend your last evening
								enjoying a leisurely stroll or visiting any spots you might have
								missed.</div>
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
										<p>"The Ooty tour was enchanting, with its lush gardens
											and picturesque landscapes offering a truly refreshing
											escape."</p>

										<strong>Priya Menon</strong>
										</p>
									</div>
								</div>
								<div class="carousel-item">
									<div class="review-content">
										<p>"Exploring Ooty was a delightful experience; the serene
											lakes and charming tea gardens made it a memorable trip."</p>

										<strong>Kiran Kumar</strong>
										</p>
									</div>
								</div>
								<div class="carousel-item">
									<div class="review-content">
										        <p>"Our Ooty visit was wonderful; the cool climate and stunning views provided the perfect setting for a relaxing holiday."</p>

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
