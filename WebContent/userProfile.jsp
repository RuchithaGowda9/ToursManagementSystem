<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.crimsonlogic.urbanadventures.model.User" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    User user = (User) session.getAttribute("user");
    String updateMessage = (String) session.getAttribute("updateMessage");
    session.removeAttribute("updateMessage");
    String alertClass = "";
    if (updateMessage != null) {
        if (updateMessage.contains("successfully")) {
            alertClass = "alert-success";
        } else {
            alertClass = "alert-danger";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile - Urban Adventure</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            flex-direction: column;
        }
        main {
            flex: 1;
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
        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: rgba(249, 103, 20, 0.1);
            border-radius: 8px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .alert {
            margin-top: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control:focus {
            border-color: #f96714;
            box-shadow: 0 0 0 0.2rem rgba(249, 103, 20, 0.25);
        }
        .btn-primary {
            background-color: #f96714;
            border: none;
            border-radius: 4px;
        }
        .btn-primary:hover {
            background-color: #e8590f;
            color: #fff;
        }
        footer {
            background-color: #343a40;
            color: #fff;
            padding: 15px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
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
                            <a class="dropdown-item" href="viewBookingHistory.jsp">View Booking History</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="user?action=logout">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="container my-4">
        <h2>User Profile</h2>

        <!-- Display Update Message -->
        <%
            if (updateMessage != null) {
        %>
            <div class="alert <%= alertClass %>">
                <%= updateMessage %>
            </div>
        <%
            }
        %>

        <!-- Profile Update Form -->
        <div class="form-container">
            <form action="<%=request.getContextPath()%>/update" method="post">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" value="<%= user != null ? user.getFirstName() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" value="<%= user != null ? user.getLastName() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="username">User Name</label>
                    <input type="text" class="form-control" id="username" name="username" value="<%= user != null ? user.getUsername() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= user != null ? user.getEmail() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<%= user != null ? user.getPhoneNumber() : "" %>" required>
                </div>
                <button type="submit" class="btn btn-primary">Update Profile</button>
            </form>
        </div>
    </main>

    <footer>
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
