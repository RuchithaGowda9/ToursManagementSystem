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
							src="https://149990825.v2.pressablecdn.com/wp-content/uploads/2023/09/Seoul1.jpg"
							alt="Seoul View 1">
					</div>
					<div class="carousel-item">
						<img
							src="https://e1.pxfuel.com/desktop-wallpaper/69/314/desktop-wallpaper-seoul-tower-namsan-tower-thumbnail.jpg"
							alt="Seoul View 2">
					</div>
					<div class="carousel-item">
						<img
							src="https://img.traveltriangle.com/blog/wp-content/uploads/2019/06/og-for-Places-To-Visit-In-Seoul.jpg"
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
					<strong>Low:</strong> 71 F (22 C)
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
			</div>

			<!-- Pick-Up Points -->
			<div class="pick-up-card">
				<h4>Pick-Up Points</h4>
				<p>
					<strong>Nearest Bus/Train Station:</strong> Seoul Station
				</p>
				<p>
					<strong>Nearest Airport:</strong> Incheon International Airport
				</p>
				<p class="alert-danger">Note: Reaching these destinations is
					your responsibility. No travel assistance is provided.</p>
				<p>
					<strong>Accommodation:</strong> You will be staying at a
					comfortable hotel in Seoul, and we provide transfer from the hotel
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
								aria-controls="collapseOne">Day 1: Welcome to Seoul</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#itineraryAccordion">
						<div class="card-body">As you land at Incheon airport, our
							friendly guide will be there to greet you. Enjoy a comfortable
							transfer to your hotel and take a well-deserved rest. The day is
							yours to explore the vibrant streets filled with Indian
							restaurants. Wander through the bustling Myeongdong street,
							renowned for its lively shopping scene. Later, venture into the
							exciting Itaewon Street, known for its diverse bars and
							restaurants. Your night will be spent in the comfort of your
							Seoul hotel.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">Day
								2: Exploring Seoul</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#itineraryAccordion">
						<div class="card-body">
							After a delightful breakfast, your day unfolds with the freedom
							to explore at your own pace. Consider joining our optional Palace
							Tour with lunch on a shared basis (SIC) for an additional Rs 7,800.
							The tour runs from 09:00 to 17:00 and promises a day filled with
							captivating experiences.
							<p>The optional tour includes:</p>
							<ul>
								<li>09:00: Pick-up at your hotel by a knowledgeable guide.</li>
								<li>Enchanting sights: Pass by Joggye Buddhist Temple and
									catch a glimpse of the Blue House, the official residence of
									the Korean President.</li>
								<li>Cultural immersion: Visit the iconic Gyeongbok Palace
									and witness the awe-inspiring Royal Guard Changing Ceremony.</li>
								<li>Stroll through history: Wander down the charming
									Insadong antique shopping street.</li>
								<li>Local flavors: Enjoy lunch at a local restaurant.</li>
								<li>Market exploration: Immerse yourself in the vibrant
									atmosphere of Namdaemun Traditional Market.</li>
								<li>Architectural beauty: Conclude the day with a visit to
									Changdeok Palace.</li>
								<li>At 17:00, return to your hotel for a well-deserved
									rest.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								Day 3: Seoul - A Day of Exploration</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse"
						aria-labelledby="headingThree" data-parent="#itineraryAccordion">
						<div class="card-body">
							After a mouthwatering breakfast, take the time to discover Seoul
							at your own pace. The city has so much to offer, from its vibrant
							street life to historical landmarks. Enjoy the freedom to roam
							and immerse yourself in the local culture. Your overnight stay
							awaits at the hotel in Seoul.
							<p>Optional Tours:</p>
							<ul>
								<li>DMZ Half Day Tour (Option: Rs 6,230 per person) - Time:
									08:00-14:00 (Closed on Mondays and Holidays). Passport
									Required.</li>
								<li>Nami Island & Petit France Tour (Option: Rs 11,610 per
									person) - Time: 09:00-17:00.</li>
								<li>Everland Tour (Option: Rs 11,610 per person) - Time:
									09:00-17:00.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFour">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour">Day
								4: Farewell to Seoul</button>
						</h5>
					</div>
					<div id="collapseFour" class="collapse"
						aria-labelledby="headingFour" data-parent="#itineraryAccordion">
						<div class="card-body">Today marks the end of your memorable
							stay in Seoul.You will be transported to the airport, where you
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
								<p>"The Seoul tour was absolutely fantastic! The itinerary
									was well-planned, and the guides were knowledgeable and
									friendly. Highly recommended!"</p>
								<p>
									<strong>Priya Sharma</strong>
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<div class="review-content">
								<p>"Had an amazing experience exploring Seoul. The optional
									tours were worth every penny, and the accommodations were
									top-notch. Will definitely book again!"</p>
								<p>
									<strong>Rajesh Kumar</strong>
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<div class="review-content">
								<p>"Everything about this trip was perfect. From the
									friendly staff to the beautiful locations, it was an
									unforgettable experience. Thanks for the great service!"</p>
								<p>
									<strong>Simran Patel</strong>
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
