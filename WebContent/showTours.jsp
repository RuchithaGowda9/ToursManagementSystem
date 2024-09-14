<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crimsonlogic.urbanadventures.model.Tour" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tours List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Tours List</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Tour Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Availability</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Tour> tours = (List<Tour>) request.getAttribute("tours");
                    if (tours != null && !tours.isEmpty()) {
                        for (Tour tour : tours) { 
                %>
                    <tr>
                        <td><%= tour.getTourName()%></td>
                        <td><%= tour.getDescription() %></td>
                        <td><%= tour.getPrice() %></td>
                        <td><%= tour.getDescription() %></td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="4">No tours found</td>
                    </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
