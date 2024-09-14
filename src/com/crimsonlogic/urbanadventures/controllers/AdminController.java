package com.crimsonlogic.urbanadventures.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    private static final long serialVersionUID = 5430119516235376102L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        } else if ("addTourForm".equals(action)) {
            request.getRequestDispatcher("addTour.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
        }
    }
}
