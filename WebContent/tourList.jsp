<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour List - Urban Adventure</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
html, body {
    height: 100%; /* Full height to use flexbox properly */
    margin: 0;
}

body {
    display: flex;
    flex-direction: column;
    font-family: Arial, sans-serif;
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
    position: relative;
    width: 100%;
    max-width: 1000px;
    margin: 0 auto;
    margin-top: 20px;
}

.search-bar {
    width: 50%; /* Set the width to 50% of its container */
    max-width: 500px; /* Optional: Limit the maximum width */
    margin: 20px 0; /* Add margin to push the search bar below the heading */
}

h2 {
    margin-bottom: 10px; /* Add space below the heading */
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #0047AB;
    color: white;
}

tbody tr:nth-child(odd) {
    background-color: #f2f2f2;
}

tbody tr:nth-child(even) {
    background-color: #ffffff;
}

.footer {
    margin-top: auto; 
    padding: 20px;
    background-color: #343a40;
    color: #ffffff;
    text-align: center;
    padding: 1rem;
    position: fixed; 
    bottom: 0;
    width: 100%;
    box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1); 
}

main {
    padding-bottom: 80px; 
}

</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
			<a class="navbar-brand" href="adminDashboard.jsp"><img
				src="resources/images/logo.png" alt="Urban Adventure Logo"></a> <a
				class="navbar-brand mx-auto" href="adminDashboard.jsp">Admin
				Dashboard</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="adminDashboard.jsp">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="manageToursDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Manage Tours</a>
						<div class="dropdown-menu" aria-labelledby="manageToursDropdown">
							<a class="dropdown-item" href="addTour.jsp">Add Tour</a> <a
								class="dropdown-item" href="tourList.jsp">Tour List</a> <a
								class="dropdown-item" href="activate-deactivateTour.jsp">Update
								Tour</a> <a class="dropdown-item" href="viewBookings.jsp">View
								Bookings</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="admin?action=logout">Logout</a></li>
				</ul>
			</div>
		</nav>
	</header>
<main class="container my-4">
    <div class="table-wrapper">
        <h2>Tour List</h2>

        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" id="searchInput" class="form-control" placeholder="Search by Tour ID or Name">
        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Tour ID</th>
                    <th>Tour Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Availability</th>
                </tr>
            </thead>
            <tbody id="tourTableBody">
                <% 
                    session = request.getSession();
                    List<Tour> toursList = (List<Tour>) session.getAttribute("toursList");
                    if (toursList != null) {
                        for (Tour tour : toursList) {
                %>
                <tr>
                    <td><%=tour.getTourId()%></td>
                    <td><%=tour.getTourName()%></td>
                    <td><%=tour.getDescription()%></td>
                    <td>₹<%=tour.getPrice()%></td>
                    <td><%=tour.getAvailability()%></td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No tours available.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</main>


	<footer class="footer">
		<p>© 2024 Urban Adventure. All rights reserved.</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		document.getElementById('searchInput').addEventListener(
				'keyup',
				function() {
					var input = this.value.toLowerCase();
					var rows = document.querySelectorAll('#tourTableBody tr');

					rows
							.forEach(function(row) {
								var tourId = row.cells[0].textContent
										.toLowerCase();
								var tourName = row.cells[1].textContent
										.toLowerCase();

								if (tourId.includes(input)
										|| tourName.includes(input)) {
									row.style.display = '';
								} else {
									row.style.display = 'none';
								}
							});
				});
	</script>
</body>
</html>
