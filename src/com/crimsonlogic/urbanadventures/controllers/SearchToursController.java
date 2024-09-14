package com.crimsonlogic.urbanadventures.controllers;

import com.crimsonlogic.urbanadventures.dao.TourDao;
import com.crimsonlogic.urbanadventures.model.Tour;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/searchTours")
public class SearchToursController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String placeName = request.getParameter("placeName");
        System.out.println("Received placeName: " + placeName); // Debugging line

        if (placeName != null && !placeName.trim().isEmpty()) {
            TourDao tourDao = new TourDao();
            List<Tour> getTourBySearch = null;
			getTourBySearch = tourDao.getToursByPlaceName(placeName);
            HttpSession session = request.getSession();
            session.setAttribute("searchResultList", getTourBySearch);
            RequestDispatcher dispatcher = request.getRequestDispatcher("searchResults.jsp");
            dispatcher.forward(request, response);
        } else {
            // Handle case where placeName is missing or empty
            response.sendRedirect("searchTours.jsp");
        }
    }
}
