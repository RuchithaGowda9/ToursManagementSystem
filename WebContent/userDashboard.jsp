<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour" %>
<%@ page import="com.crimsonlogic.urbanadventures.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Home - Urban Adventure</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        /* Navbar Styles */
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
            border-color: transparent; /* Remove border from toggler for a cleaner look */
        }
        .navbar-nav .nav-link, .navbar-nav .dropdown-item {
            color: #ffffff; /* Text color */
            background-color: #0047AB; /* Button background color */
            border-radius: 5px; /* Curved edges */
            padding: 8px 16px; /* Padding for better appearance */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }
        .navbar-nav .nav-link:hover, .navbar-nav .dropdown-item:hover {
            color: #ffffff; /* Text color on hover */
            background-color: #f96714; /* Button background color on hover */
        }
        .dropdown-menu {
            background-color: #0047AB; /* Match dropdown background to navbar background */
            border: none; /* Remove border from dropdown */
            border-radius: 5px; /* Curved edges for dropdown */
            padding: 0; /* Remove padding */
        }
        .dropdown-item {
            color: #ffffff; /* Text color for dropdown items */
        }
        .dropdown-item:hover {
            background-color: #f96714; /* Background color on hover for dropdown items */
            color: #ffffff; /* Text color on hover for dropdown items */
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
        /* Featured Tours */
        .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .card-text {
            font-size: 1rem;
            margin-bottom: 10px;
        }
        footer {
            background-color: #343a40;
            color: #fff;
            padding: 15px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        footer p {
            margin: 0;
        }
        /* Responsive Styles */
        @media (max-width: 768px) {
            .hero-content {
                padding: 20px;
            }
            .hero h2 {
                font-size: 2rem;
            }
            .hero p {
                font-size: 1rem;
            }
            .card-img-top {
                height: 150px;
            }
        }
    </style>
</head>
<body>
    <header class="bg-primary text-white">
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <a class="navbar-brand" href="userDashboard.jsp"><img
                src="resources/images/logo.png" alt="Urban Adventure Logo"></a>
            <a class="navbar-brand mx-auto" href="userDashboard.jsp">Urban Adventure</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="userDashboard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchTours.jsp">Search Tours</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Profile</a>
                        <div class="dropdown-menu" aria-labelledby="profileDropdown">
                            <a class="dropdown-item" href="userProfile.jsp">Update Profile</a>
                            <a class="dropdown-item" href="viewbookinghistory">View Booking History</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="user?action=logout">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Carousel and Hero Section Wrapper -->
    <div class="carousel-container">
        <!-- Carousel -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://www.onmycanvas.com/wp-content/uploads/2019/08/madikericoorgkarnatakasouthindia.jpeg"
                         class="d-block w-100" alt="Coorg">
                </div>
                <div class="carousel-item">
                    <img src="https://as2.ftcdn.net/v2/jpg/02/09/82/45/1000_F_209824591_K05Tob490TmBlTekkPlNrxh1Hy7IKMTU.jpg"
                         class="d-block w-100" alt="Kerala">
                </div>
                <div class="carousel-item">
                    <img src="https://transcode-v2.app.engoo.com/image/fetch/f_auto,c_lfill,w_300,dpr_3/https://assets.app.engoo.com/images/3BoY3mrOBOcDNIEl3Nmb8W.jpeg"
                         class="d-block w-100" alt="Singapore">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- Hero Section -->
        <div class="hero">
            <div class="hero-content">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <c:set var="user" value="${sessionScope.user}" />
                        <h2 class="welcome-message">
                            Welcome, ${user.firstName}!<br> <br> Explore and book
                            amazing tours tailored just for you.
                        </h2>
                    </c:when>
                    <c:otherwise>
                        <h2 class="welcome-message">Access Denied</h2>
                    </c:otherwise>
                </c:choose>
                <p></p>
                <a class="btn btn-primary" href="searchTours.jsp">Find Your Next
                    Adventure</a>
            </div>
        </div>
    </div>

    <main class="container my-4">
        <section class="text-center mb-4">
            <h2>Featured Tours</h2>
            <p>Check out some of our most popular tour packages.</p>
            <%
                session = request.getSession();
                List<Tour> tourList = (List<Tour>) session.getAttribute("activeTourList");
            %>
            <div class="row">
                <c:choose>
                    <c:when test="${not empty sessionScope.activeTourList}">
                        <c:forEach var="tour" items="${sessionScope.activeTourList}">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="${tour.imageFileName}" class="card-img-top" alt="${tour.tourName}">
                                    <div class="card-body">
                                        <h5 class="card-title">${tour.tourName}</h5>
                                        <p class="card-text">${tour.description}</p>
                                        <p class="card-text">Price: ₹${tour.price}</p>
                                        <p class="card-text">Availability :${tour.availability}</p>
                                        <a href="${pageContext.request.contextPath}/tourDetails?tourId=${tour.tourId}" class="btn btn-primary">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>No tours available at the moment.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </main>

    <footer class="bg-dark text-white text-center py-3">
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
