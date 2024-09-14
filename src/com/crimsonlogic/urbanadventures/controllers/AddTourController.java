package com.crimsonlogic.urbanadventures.controllers;

import com.crimsonlogic.urbanadventures.dao.TourDao;
import com.crimsonlogic.urbanadventures.model.Tour;
import com.crimsonlogic.urbanadventures.utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/addtour")
public class AddTourController extends HttpServlet {

    private static final long serialVersionUID = -8599099253612726004L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String tourName = request.getParameter("tourName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int availability = Integer.parseInt(request.getParameter("availability"));
        String imageUrl = request.getParameter("imageUrl");

        // Create a Tour object
        Tour tour = new Tour();
        tour.setTourId(generateTourId());
        tour.setTourName(tourName);
        tour.setDescription(description);
        tour.setPrice(price);
        tour.setAvailability(availability);
        tour.setImageFileName(imageUrl);

        String message = null;
        
        try (Connection connection = JDBCUtils.getConnection()) {
            TourDao tourDao = new TourDao(connection);

            int result = tourDao.addTour(tour);

            if (result > 0) {
                message = "Tour added successfully!";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "An error occurred while adding the tour. Please try again later.";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("addTour.jsp").forward(request, response);
    }

    private long generateTourId() {
        return Math.round(Math.random() * 900000 + 100000);
    }
}
