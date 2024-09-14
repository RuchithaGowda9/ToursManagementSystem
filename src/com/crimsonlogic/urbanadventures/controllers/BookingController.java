package com.crimsonlogic.urbanadventures.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.urbanadventures.dao.BookingDao;
import com.crimsonlogic.urbanadventures.dao.PaymentDao;
import com.crimsonlogic.urbanadventures.dao.TourDao;
import com.crimsonlogic.urbanadventures.model.BookingWithTourInfo;
import com.crimsonlogic.urbanadventures.utils.JDBCUtils;

@WebServlet({ "/processbooking", "/viewbookinghistory" })
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId"); // Cast to Long

        // Handle null userId
        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if userId is not found
            return;
        }

        // Retrieve and validate parameters
        String tourIdParam = request.getParameter("tourId");
        String numPeopleParam = request.getParameter("numPeople");
        String tourDateStr = request.getParameter("tourDate");
        String paymentMethod = request.getParameter("paymentMethod");
        String totalPriceParam = request.getParameter("totalPrice");

        // Validate parameters
        if (tourIdParam == null || numPeopleParam == null || tourDateStr == null || paymentMethod == null || totalPriceParam == null) {
        	System.out.println("Missing parameters:");
            System.out.println("tourIdParam: " + tourIdParam);
            System.out.println("numPeopleParam: " + numPeopleParam);
            System.out.println("tourDateStr: " + tourDateStr);
            System.out.println("paymentMethod: " + paymentMethod);
            System.out.println("totalPriceParam: " + totalPriceParam);
        	response.sendRedirect("errorPage.jsp"); // Redirect to error page if parameters are missing
            return;
        }

        int tourId;
        int numPeople;
        double totalPrice;

        try {
            tourId = Integer.parseInt(tourIdParam);
            numPeople = Integer.parseInt(numPeopleParam);
            totalPrice = Double.parseDouble(totalPriceParam.replace("Rs ", ""));
        } catch (NumberFormatException e) {
        	e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Redirect if number format is invalid
            return;
        }

        Date tourDate;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Adjust format as needed
        try {
            java.util.Date parsedDate = sdf.parse(tourDateStr);
            tourDate = new Date(parsedDate.getTime()); // Convert to java.sql.Date
        } catch (ParseException e) {
        	e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Redirect if date parsing fails
            return;
        }

        Random rand = new Random();
        int bookingId = 100000 + rand.nextInt(900000); // Generate 6-digit booking ID
        int paymentId = 100000 + rand.nextInt(900000); // Generate 6-digit payment ID

        try (Connection conn = JDBCUtils.getConnection()) {
            BookingDao bookingDAO = new BookingDao(conn);
            PaymentDao paymentDAO = new PaymentDao(conn);
            TourDao tourDAO = new TourDao(conn);

            bookingDAO.addBooking(bookingId, userId, tourId, numPeople, tourDate);

            paymentDAO.addPayment(paymentId, userId, tourId, totalPrice, paymentMethod);

            tourDAO.updateAvailability(tourId, numPeople);

           
            response.sendRedirect("paymentConfirmation.jsp?bookingId=" + bookingId + "&paymentId=" + paymentId + "&amount=" + totalPrice);

        } catch (SQLException e) {
            e.printStackTrace(); 
            response.sendRedirect("errorPage.jsp"); 
        }
    }


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getServletPath();
		HttpSession session = request.getSession();
		Long userId = (Long) session.getAttribute("userId"); 
		System.out.println(userId);
		if (userId == null) {
			response.sendRedirect("login.jsp"); 
			return;
		}

		try (Connection conn = JDBCUtils.getConnection()) {
			BookingDao bookingDAO = new BookingDao(conn);

			if ("/viewbookinghistory".equals(action)) {
				List<BookingWithTourInfo> bookings = bookingDAO.getBookingsByUserId(userId);
				request.setAttribute("bookings", bookings);
				request.getRequestDispatcher("/viewBookingHistory.jsp").forward(request, response);
			} else {
				response.sendRedirect("errorPage.jsp"); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("errorPage.jsp");
		}
	}
}
