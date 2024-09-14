<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Confirmation</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
/* General Styles */
html, body {
    height: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
}

body {
    display: flex;
    flex-direction: column;
}

.container {
    flex: 1;
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

.navbar-nav {
    display: none; /* Hide the nav links */
}

/* Footer Styles */
footer {
    background-color: #343a40;
    color: #ffffff;
    text-align: center;
    padding: 1rem;
    width: 100%;
    position: relative;
    bottom: 0;
}

/* Payment Confirmation Page Styles */
.payment-card {
    background-color: #ffffff; /* White background for the payment card */
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-top: 20px;
}

.btn-back-home {
    margin-top: 20px;
}
</style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <a class="navbar-brand" href="home.jsp">
                <img src="resources/images/logo.png" alt="Urban Adventure Logo">
            </a>
            <a class="navbar-brand mx-auto" href="home.jsp">Urban Adventures</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <!-- Nav links removed as requested -->
                </ul>
            </div>
        </nav>
    </header>

    <div class="container mt-5">
        <div class="payment-card">
            <div class="alert alert-success">
                <h4 class="alert-heading">Your payment has been successfully processed!</h4>
                <p>Your booking has been confirmed. Here are your booking details:</p>
                <ul>
                    <li>Booking ID: ${param.bookingId}</li>
                    <li>Payment ID: ${param.paymentId}</li>
                    <li>Total Amount Paid: Rs ${param.amount}</li>
                </ul>
                <p>A few days before your tour, you will receive an email with the contact details of your tour guide and any last-minute instructions.
If you have any immediate questions or need further assistance, please do not hesitate to contact our support team at support@urbanadventure.com or call us at +1 800-123-4567. Please reach out to our support team. We will respond to your queries within 24-48 hours. If you need immediate help, please call our customer service hotline. Thank you for choosing Urban Adventure!</p>
                <a href="userDashboard.jsp" class="btn btn-primary btn-back-home">Back to Home</a>
            </div>
        </div>
    </div>

    <footer>
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
