<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Tours</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* Center the content in the main section */
.dashboard-content {
    padding: 20px;
    margin-top: 70px; /* Space for header */
    margin-bottom: 70px; /* Space for footer */
    height: calc(100vh - 140px); /* Height to avoid overlap */
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    align-items: center; /* Center content horizontally */
}

/* Center the table container */
.table-container {
    width: 100%;
    max-width: 800px; /* Adjust the max-width as needed */
    margin: 0 auto; /* Center horizontally */
}

/* Table styling */
/* Container for table and search bar */
/* Ensure the search container is directly beneath the navbar with no extra space */
.search-container {
    position: relative; /* Relative positioning for proper placement */
    margin: 0; /* Remove margin */
    padding: 0; /* Remove padding */
    top: 0; /* Ensure it’s aligned at the top */
    left: 0; /* Align to the left */
    width: 100%; /* Ensure it takes full width of the parent container */
    box-sizing: border-box; /* Include padding and border in the width calculation */
}

/* Wrapper for table and search bar */
.table-wrapper {
    position: relative; /* Relative positioning to contain the search bar and table */
    max-width: 800px; /* Adjust as needed */
    margin: 0 auto; /* Center the wrapper horizontally */
    width: 100%; /* Ensure full width */
    margin-top: 0; /* Remove top margin to align with search bar */
    padding: 0; /* Remove padding */
}

/* Search bar styling */
.search-bar {
    width: 120%; /* Slightly increase width */
    max-width: 400px; /* Optional max-width */
    box-sizing: border-box; /* Include padding and border in the width calculation */
}

/* Table styling */
.table {
    width: 100%; /* Ensure table fits within its container */
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 20px; /* Ensure space below search bar, adjust as needed */
}


/* Other styles remain the same */


/* Header row styling */
.table thead th {
    background-color: #0047Ab; /* Dark blue color */
    color: white;
    text-align: center;
    padding: 12px;
}

/* Data rows styling */
.table tbody tr:nth-child(odd) {
    background-color: #f2f2f2; /* Light gray for alternating rows */
}

.table tbody tr:nth-child(even) {
    background-color: #ffffff; /* White for alternating rows */
}

/* Cell padding and alignment */
.table td {
    padding: 10px;
    text-align: left;
}

/* Button styles */
.btn {
    border-radius: 5px;
    padding: 5px 10px;
    font-size: 14px;
}

.btn-info {
    background-color: #0047Ab; /* Dark blue color for update button */
    border-color: #0047Ab;
}

.btn-info:hover {
    background-color: #00359c; /* Slightly darker blue on hover */
}

.btn-danger {
    background-color: #f96714; /* Orange color for deactivate button */
    border-color: #f96714;
}

.btn-danger:hover {
    background-color: #e8560b; /* Slightly darker orange on hover */
}

.btn-success {
    background-color: #28a745; /* Green color for activate button */
    border-color: #28a745;
}

.btn-success:hover {
    background-color: #218838; /* Slightly darker green on hover */
}

/* Badge styling */
.badge-success {
    background-color: #28a745; /* Green color for active status */
}

.badge-danger {
    background-color: #dc3545; /* Red color for inactive status */
}

/* Navbar custom styles */
.navbar-custom {
    background-color: #0047Ab; /* Dark blue color for the navbar */
    height: 70px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add subtle shadow for depth */
}

/* Navbar brand */
.navbar-brand img {
    height: 60px;
    width: auto;
}

/* Navbar title */
.navbar-brand.mx-auto {
    color: #ffffff; /* White text color for the title */
    background-color: #0047Ab; /* Background color for the title */
    border-radius: 0; /* No curved edges for the title */
}

/* Navbar toggler */
.navbar-toggler {
    border-color: transparent; /* Remove border from toggler for a cleaner look */
}

/* Navbar links and dropdown items */
.navbar-nav .nav-link, .navbar-nav .dropdown-item {
    color: #ffffff; /* White text color */
    background-color: #0047Ab; /* Dark blue background color */
    border-radius: 5px; /* Rounded edges */
    padding: 8px 16px; /* Padding for better appearance */
    transition: background-color 0.3s; /* Smooth transition for hover effect */
}

/* Navbar links and dropdown items on hover */
.navbar-nav .nav-link:hover, .navbar-nav .dropdown-item:hover {
    color: #ffffff; /* White text color on hover */
    background-color: #f96714; /* Orange background color on hover */
}

/* Dropdown menu */
.dropdown-menu {
    background-color: #0047Ab; /* Dark blue background color for dropdown */
    border: none; /* Remove border from dropdown */
    border-radius: 5px; /* Rounded edges for dropdown */
    padding: 0; /* Remove padding */
}

/* Dropdown items */
.dropdown-item {
    color: #ffffff; /* White text color for dropdown items */
}

/* Dropdown items on hover */
.dropdown-item:hover {
    background-color: #f96714; /* Orange background color on hover */
}



/* Footer */
footer {
    background-color: #343a40;
    color: #ffffff;
    text-align: center;
    padding: 1rem;
    position: fixed; /* Fix the footer to the bottom */
    bottom: 0;
    width: 100%;
    box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
}
        
    </style>
</head>
<body>
    <!-- Header -->
    <header class="bg-primary text-white">
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
            <a class="navbar-brand" href="adminDashboard.jsp"><img src="resources/images/logo.png" alt="Urban Adventure Logo"></a>
            <a class="navbar-brand mx-auto" href="adminDashboard.jsp">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Home</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="manageToursDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Manage Tours</a>
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

    <!-- Main Content -->
    <main class="dashboard-content">
        <c:if test="${not empty sessionScope.updateMessage}">
            <div class="alert alert-success">${sessionScope.updateMessage}</div>
        </c:if>

        <!-- Table Wrapper -->
        <div class="table-wrapper">
            <!-- Search bar -->
            <div class="search-container">
                <input type="text" id="searchInput" class="search-bar" placeholder="Search by Tour ID or Name">
            </div>

            <!-- Table Container -->
            <div class="table-container">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Tour ID</th>
                            <th>Tour Name</th>
                            <th>Status</th>
                            <th class="action-column">Action</th>
                        </tr>
                    </thead>
                    <tbody id="tourTableBody">
                        <c:forEach var="tour" items="${sessionScope.toursList}">
                            <tr>
                                <td>${tour.tourId}</td>
                                <td>${tour.tourName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${tour.isActive}">
                                            <span class="badge badge-success">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-danger">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${tour.isActive}">
                                            <a href="tour?action=deactivate&tourId=${tour.tourId}" class="btn btn-danger btn-sm">Deactivate</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="tour?action=activate&tourId=${tour.tourId}" class="btn btn-success btn-sm">Activate</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="tour?action=edit&tourId=${tour.tourId}" class="btn btn-info btn-sm ml-2">Update</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer>
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Search functionality -->
    <script>
        document.getElementById('searchInput').addEventListener('input', function() {
            var input = this.value.toLowerCase();
            var rows = document.querySelectorAll('#tourTableBody tr');
            rows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                var tourId = cells[0].innerText.toLowerCase();
                var tourName = cells[1].innerText.toLowerCase();
                if (tourId.includes(input) || tourName.includes(input)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
