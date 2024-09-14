<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tour Details - Urban Adventure</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .tour-details {
            margin-top: 20px;
        }
        .tour-image {
            max-width: 100%;
            height: auto;
        }
        .btn-back {
            margin-top: 20px;
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
                    <li class="nav-item"><a class="nav-link" href="userProfile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="container tour-details">
        <c:choose>
            <c:when test="${not empty param.tourId}">
                <c:set var="tourId" value="${param.tourId}" />
                <c:forEach var="tour" items="${sessionScope.tourList}">
                    <c:if test="${tour.tourId == tourId}">
                        <div class="row">
                            <div class="col-md-6">
                                <img src="${tour.imageFileName}" class="tour-image" alt="${tour.tourName}">
                            </div>
                            <div class="col-md-6">
                                <h1>${tour.tourName}</h1>
                                <p>${tour.description}</p>
                                <p><strong>Price:</strong> ₹${tour.price}</p>
                                <a href="searchTours.jsp" class="btn btn-primary btn-back">Back to Tours</a>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>Tour not found.</p>
            </c:otherwise>
        </c:choose>
    </main>

    <footer class="bg-dark text-white text-center py-3">
        <p>© 2024 Urban Adventure. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
