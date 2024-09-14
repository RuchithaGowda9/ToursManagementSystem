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

@WebServlet("/showTours")
public class ShowToursController extends HttpServlet {

    private static final long serialVersionUID = -8599099253612726004L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        List<Tour> tourList = null;
        HttpSession session = request.getSession();
        
        try (Connection connection = JDBCUtils.getConnection()) {
            TourDao tourDao = new TourDao(connection);
            tourList = tourDao.getAllActiveTours();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        session.setAttribute("tourList", tourList);
        response.sendRedirect("addTour.jsp");
    }
}
