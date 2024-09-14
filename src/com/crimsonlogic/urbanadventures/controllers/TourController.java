package com.crimsonlogic.urbanadventures.controllers;

import com.crimsonlogic.urbanadventures.dao.TourDao;
import com.crimsonlogic.urbanadventures.model.Tour;
import com.crimsonlogic.urbanadventures.utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/tour")
public class TourController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TourDao tourDao;

    @Override
    public void init() throws ServletException {
        super.init();
        tourDao = new TourDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("manageTours".equals(action)) {
            handleManageTours(request, response);
        } else if ("edit".equals(action)) {
            handleEditTour(request, response);
        } else {
            long tourId = Long.parseLong(request.getParameter("tourId"));
            HttpSession session = request.getSession();
            try {
                if ("activate".equals(action)) {
                    tourDao.activateTour(tourId);
                    session.setAttribute("updateMessage", "Tour activated successfully.");
                } else if ("deactivate".equals(action)) {
                    tourDao.deactivateTour(tourId);
                    session.setAttribute("updateMessage", "Tour deactivated successfully.");
                }

                List<Tour> toursList = tourDao.getAllTours();
                session.setAttribute("toursList", toursList);
                request.getRequestDispatcher("activate-deactivateTour.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                session.setAttribute("updateMessage", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("activate-deactivateTour.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addTour".equals(action)) {
            addTour(request, response);
        } else if ("updateTour".equals(action)) {
            updateTour(request, response);
        }
    }

    private void addTour(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tourName = request.getParameter("tourName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int availability = Integer.parseInt(request.getParameter("availability"));
        String imageUrl = request.getParameter("imageUrl");
        Tour tour = new Tour();
        tour.setTourId(generateTourId());
        tour.setTourName(tourName);
        tour.setDescription(description);
        tour.setPrice(price);
        tour.setAvailability(availability);
        tour.setImageFileName(imageUrl);

        String message;

        try (Connection connection = JDBCUtils.getConnection()) {
            TourDao tourDao = new TourDao(connection);

            int result = tourDao.addTour(tour);

            if (result > 0) {
                message = "Tour added successfully!";
            } else {
                message = "Failed to add tour.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "An error occurred while adding the tour. Please try again later.";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("addTour.jsp").forward(request, response);
    }

    private void updateTour(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long tourId = Long.parseLong(request.getParameter("tourId"));
        String tourName = request.getParameter("tourName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int availability = Integer.parseInt(request.getParameter("availability"));
        String imageUrl = request.getParameter("imageUrl");

        Tour tour = new Tour();
        tour.setTourId(tourId);
        tour.setTourName(tourName);
        tour.setDescription(description);
        tour.setPrice(price);
        tour.setAvailability(availability);
        tour.setImageFileName(imageUrl);

        String message;

        try (Connection connection = JDBCUtils.getConnection()) {
            TourDao tourDao = new TourDao(connection);

            int result = tourDao.updateTour(tour);

            if (result > 0) {
                message = "Tour updated successfully!";
            } else {
                message = "Failed to update tour.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "An error occurred while updating the tour. Please try again later.";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("updateTour.jsp").forward(request, response);
    }

    private void handleEditTour(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long tourId = Long.parseLong(request.getParameter("tourId"));
        try {
            Tour tour = tourDao.getTourById(tourId);
            request.setAttribute("tour", tour);
            request.getRequestDispatcher("updateTour.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while fetching tour details: " + e.getMessage());
            request.getRequestDispatcher("activate-deactivateTour.jsp").forward(request, response);
        } catch (Exception e) {
			
			e.printStackTrace();
		}
    }

    private void handleManageTours(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            List<Tour> toursList = tourDao.getAllTours();
            session.setAttribute("toursList", toursList);
            request.getRequestDispatcher("activate-deactivateTour.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("updateMessage", "An error occurred while fetching tours: " + e.getMessage());
            request.getRequestDispatcher("activate-deactivateTour.jsp").forward(request, response);
        }
    }

    private long generateTourId() {
        return Math.round(Math.random() * 900000 + 100000);
    }
}
