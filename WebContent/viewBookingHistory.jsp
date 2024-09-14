<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crimsonlogic.urbanadventures.model.BookingWithTourInfo" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Booking History</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        html, body {
            height: 100%; /* Ensure the HTML and body take up the full height */
            margin: 0; /* Remove default margins */
        }

        body {
            display: flex;
            flex-direction: column; /* Stack children vertically */
        }

        main {
            flex: 1; /* Allow the main content to expand and push the footer to the bottom */
        }

        footer {
            background-color: #343a40;
            color: #fff;
            padding: 15px 0;
            text-align: center;
        }

        .navbar-custom {
            background-color: #0047AB;
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
            color: #ffffff;
            background-color: #0047AB;
            border-radius: 0;
        }

        .navbar-toggler {
            border-color: transparent;
        }

        .navbar-nav .nav-link, .navbar-nav .dropdown-item {
            color: #ffffff;
            background-color: #0047AB;
            border-radius: 5px;
            padding: 8px 16px;
            transition: background-color 0.3s;
        }

        .navbar-nav .nav-link:hover, .navbar-nav .dropdown-item:hover {
            color: #ffffff;
            background-color: #f96714;
        }

        .dropdown-menu {
            background-color: #0047AB;
            border: none;
            border-radius: 5px;
            padding: 0;
        }

        .dropdown-item {
            color: #ffffff;
        }

        .dropdown-item:hover {
            background-color: #f96714;
            color: #ffffff;
        }

        .table-wrapper {
            width: 100%;
            max-width: 1000px; /* Adjust the max-width as needed */
            margin: 0 auto; /* Center horizontally */
            margin-top: 20px; /* Add some space from the top */
        }

        table {
            width: 100%; /* Adjusted to 100% for proper fit */
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left; /* Align content to the left */
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #0047AB; /* Dark blue for header */
            color: white; /* White text for header */
        }

        tbody tr:nth-child(odd) {
            background-color: #f2f2f2; /* Light gray for alternating rows */
        }

        tbody tr:nth-child(even) {
            background-color: #ffffff; /* White for alternating rows */
        }
    </style>
</head>
<body>
    <header class="bg-primary text-white">
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <a class="navbar-brand" href="userDashboard.jsp"><img src="resources/images/logo.png" alt="Urban Adventure Logo"></a>
            <a class="navbar-brand mx-auto" href="userDashboard.jsp">Urban Adventure</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="userDashboard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchTours.jsp">Search Tours</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
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

    <main class="container my-4">
        <div class="table-wrapper">
            <h2>Booking History</h2>
            <c:choose>
                <c:when test="${empty bookings}">
                    <div class="alert alert-info" role="alert">
                        No bookings found.
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Tour Name</th>
                                <th>Booking Price</th>
                                <th>Tour Date</th>
                                <th>Booking Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="booking" items="${bookings}">
                                <tr>
                                    <td>${booking.bookingId}</td>
                                    <td>${booking.tourName}</td>
                                    <td>₹${booking.paymentAmount}</td>
                                    <td>${booking.tourDate}</td>
                                    <td>${booking.bookingDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <footer class="bg-dark text-white text-center py-3">
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
