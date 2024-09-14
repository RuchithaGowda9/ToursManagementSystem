package com.crimsonlogic.urbanadventures.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crimsonlogic.urbanadventures.dao.BookingDao;
import com.crimsonlogic.urbanadventures.dao.LoginDao;
import com.crimsonlogic.urbanadventures.dao.TourDao;
import com.crimsonlogic.urbanadventures.exceptions.IncorrectUsernamePasswordException;
import com.crimsonlogic.urbanadventures.model.Booking;
import com.crimsonlogic.urbanadventures.model.BookingWithTourInfo;
import com.crimsonlogic.urbanadventures.model.LoginBean;
import com.crimsonlogic.urbanadventures.model.Tour;
import com.crimsonlogic.urbanadventures.model.User;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;

	@Override
	public void init() {
		loginDao = new LoginDao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		authenticate(request, response);
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);

		try {
			User user = loginDao.validate(loginBean);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setAttribute("userId", user.getUserId());
				TourDao tourDao = new TourDao();
				List<Tour> tourList = tourDao.getAllTours();
				session.setAttribute("toursList", tourList);
				List<Tour> activeTourList = tourDao.getAllActiveTours();
				session.setAttribute("activeTourList", activeTourList);
				BookingDao bookingDao = new BookingDao();
	            List<BookingWithTourInfo> bookingWithTourInfoList = bookingDao.getBookingsWithTourInfo();
	            session.setAttribute("bookingWithTourInfoList", bookingWithTourInfoList);

//				if (!user.isAdmin()) {
//					TourDao tourDao = new TourDao();
//					List<Tour> tourList = tourDao.getAllTours();
//					session.setAttribute("toursList", tourList);
//					List<Tour> activeTourList = tourDao.getAllActiveTours();
//					session.setAttribute("activeTourList", activeTourList);
//				}
				String redirectUrl = user.isAdmin() ? "adminDashboard.jsp" : "userDashboard.jsp";
				response.sendRedirect(redirectUrl);
			} else {
				throw new IncorrectUsernamePasswordException("Incorrect username or password");
			}
		} catch (IncorrectUsernamePasswordException e) {
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		} catch (ClassNotFoundException e) {
			// Log the exception properly and show a generic error message
			e.printStackTrace(); // Consider using a logging framework
			request.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// Handle other possible exceptions
			e.printStackTrace(); // Consider using a logging framework
			request.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
