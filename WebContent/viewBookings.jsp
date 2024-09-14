<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crimsonlogic.urbanadventures.model.BookingWithTourInfo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Bookings - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <style>
 body {
    margin: 0;
    font-family: Arial, sans-serif;
}

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

.dashboard-content {
    padding: 20px;
    margin-top: 70px; /* Adjust for fixed navbar height */
    height: calc(100vh - 70px); /* Full height minus navbar */
    overflow-y: auto; /* Enable vertical scrolling if content overflows */
    display: flex;
    justify-content: center; /* Center content horizontally */
    align-items: flex-start; /* Align items to the start (top) */
}

.table-wrapper {
    width: 100%;
    max-width: 1000px; /* Adjust the max-width as needed */
    margin: 0 auto; /* Center horizontally */
    margin-top: -20px; /* Move table upwards */
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

footer {
    background-color: #343a40;
    color: #ffffff;
    text-align: center;
    padding: 1rem;
    position: relative;
    bottom: 0;
    width: 100%;
}
  
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <a class="navbar-brand" href="adminDashboard.jsp"><img src="resources/images/logo.png" alt="Urban Adventure Logo"></a>
            <a class="navbar-brand mx-auto" href="adminDashboard.jsp">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Home</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="manageToursDropdown" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Manage Tours</a>
                        <div class="dropdown-menu" aria-labelledby="manageToursDropdown">
                            <a class="dropdown-item" href="addTour.jsp">Add Tour</a>
                            <a class="dropdown-item" href="tourList.jsp">Tour List</a>
                            <a class="dropdown-item" href="activate-deactivateTour.jsp">Update Tour</a>
                            <a class="dropdown-item" href="viewBookings.jsp">View Bookings</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="admin?action=logout">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="dashboard-content">
        <div class="table-wrapper">
            <h2>Bookings Overview</h2>

            <%-- Retrieve the list of bookings from the session --%>
            <%
                List<BookingWithTourInfo> bookingWithTourInfoList = (List<BookingWithTourInfo>) session.getAttribute("bookingWithTourInfoList");
            %>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Tour ID</th>
                        <th>Tour Name</th>
                        <th>Tour Date</th>
                        <th>Booking Date</th>
                        <th>Number of People</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (bookingWithTourInfoList != null && !bookingWithTourInfoList.isEmpty()) { %>
                        <% for (BookingWithTourInfo booking : bookingWithTourInfoList) { %>
                            <tr>
                                <td><%= booking.getBookingId() %></td>
                                <td><%= booking.getTourId() %></td>
                                <td><%= booking.getTourName() %></td>
                                <td><%= booking.getTourDate() %></td>
                                <td><%= booking.getBookingDate() %></td>
                                <td><%= booking.getNumPeople() %></td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="6">No bookings found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
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
