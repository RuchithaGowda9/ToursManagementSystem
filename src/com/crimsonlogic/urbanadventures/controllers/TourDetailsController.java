package com.crimsonlogic.urbanadventures.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.urbanadventures.dao.TourDao;
import com.crimsonlogic.urbanadventures.model.Tour;

@WebServlet("/tourDetails")
public class TourDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String recievedId = request.getParameter("tourId");
        String action = request.getParameter("action");

        // Retrieve tourId from the request parameter
        Long tourId = Long.parseLong(recievedId);

        TourDao tourDao = new TourDao();
        Tour tour = null;
        try {
            tour = tourDao.getTourById(tourId);
            session.setAttribute("tour", tour); // Store tour in session
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/tourNotFound.jsp");
            return;
        }

        if (tour == null) {
            response.sendRedirect(request.getContextPath() + "/tourNotFound.jsp");
            return;
        }

        if ("bookNow".equals(action)) {
            // Forward request to booking.jsp with tour details
            request.getRequestDispatcher("/booking.jsp").forward(request, response);
        } else {
            // Map to redirect to the static page based on tourId
            Map<String, String> tourPageMap = new HashMap<>();
            tourPageMap.put("836288", "seoul.jsp");
            tourPageMap.put("280864", "singapore.jsp");
            tourPageMap.put("774820", "manali.jsp");
            tourPageMap.put("208259", "ooty.jsp");
            tourPageMap.put("616342", "paris.jsp");
            tourPageMap.put("259563", "gokarna.jsp");
            tourPageMap.put("258261", "coorg.jsp");

            String page = tourPageMap.get(recievedId);
            if (page != null) {
                response.sendRedirect(request.getContextPath() + "/" + page);
            } else {
                response.sendRedirect(request.getContextPath() + "/tourNotFound.jsp");
            }
        }
    }
}
