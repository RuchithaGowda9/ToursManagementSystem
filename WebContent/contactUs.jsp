<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - Urban Adventure</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
<style>
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

.navbar-nav .nav-link {
    color: #ffffff; /* Text color */
    background-color: #0047AB; /* Button background color */
    border-radius: 5px; /* Curved edges */
    padding: 8px 16px; /* Padding for better appearance */
    transition: background-color 0.3s; /* Smooth transition for hover effect */
}

.navbar-nav .nav-link:hover {
    color: #ffffff; /* Text color on hover */
    background-color: #f96714; /* Button background color on hover */
}

/* Footer Styles */
footer {
    background-color: #343a40;
    color: #ffffff;
    text-align: center;
    padding: 1rem;
    position: relative;
    bottom: 0;
    width: 100%;
}

/* Contact Page Styles */
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

.hero-content {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
    text-align: center;
    z-index: 10; /* Ensure it is above the carousel */
    background: rgba(0, 0, 0, 0.5); /* Semi-transparent background for better text visibility */
}

.contact-card {
    position: relative;
    z-index: 20; /* Ensure card is above the background */
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: rgba(0, 71, 171, 0.1); /* Very light tint using navbar color */
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.contact-card h3 {
    margin-bottom: 20px;
}

.contact-card p {
    font-size: 1.2rem;
}
</style>
</head>
<body>
    <header class="bg-primary text-white">
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <a class="navbar-brand" href="home.jsp"> <img
                src="resources/images/logo.png"
                alt="Urban Adventure Logo"></a> <a class="navbar-brand mx-auto"
                href="home.jsp">Urban Adventures</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
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
                    <img src="https://www.onmycanvas.com/wp-content/uploads/2019/08/madikericoorgkarnatakasouthindia.jpeg" class="d-block w-100" alt="Coorg">
                </div>
                <div class="carousel-item">
                    <img src="https://as2.ftcdn.net/v2/jpg/02/09/82/45/1000_F_209824591_K05Tob490TmBlTekkPlNrxh1Hy7IKMTU.jpg" class="d-block w-100" alt="Kerala">
                </div>
                <div class="carousel-item">
                    <img src="https://www.seatemperatu.re/site/images/illustration/coree-du-sud_181.jpg" class="d-block w-100" alt="Singapore">
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
        <div class="hero-content">
            <div class="contact-card">
                <h3>Contact Us</h3>
                <p>Urban Adventure is here to assist you with any inquiries you may have. Feel free to reach out to us through the contact details below, and we'll get back to you as soon as possible.</p>
                <p><strong>Email:</strong> support@urbanadventure.com</p>
                <p><strong>Phone:</strong> +91 9945852789</p>
                <p><strong>Address:</strong> 123 Avenue Lane, Devanahalli, Bengaluru</p>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer>
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
