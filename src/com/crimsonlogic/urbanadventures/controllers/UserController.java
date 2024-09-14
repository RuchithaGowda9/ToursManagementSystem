package com.crimsonlogic.urbanadventures.controllers;

import com.crimsonlogic.urbanadventures.dao.UserDao;
import com.crimsonlogic.urbanadventures.exceptions.UserAlreadyRegisteredException;
import com.crimsonlogic.urbanadventures.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        super.init();
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("userDashboard.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            register(request, response);
        } else if ("updateProfile".equals(action)) {
            updateProfile(request, response);
        }
    }

    private long generateUserId() {
        return Math.round(Math.random() * 900000 + 100000);
    }

    private void register(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String id = request.getParameter("idNumber");

        User user = new User();
        user.setUserId(generateUserId());
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setPassword(password);
        user.setUsername(username);
        user.setID(id);

        try {
            int result = userDao.registerUser(user);
            if (result == 1) {
                response.sendRedirect(request.getContextPath() + "/login.jsp?message=User Registered Successfully!");
            } else {
                response.sendRedirect(request.getContextPath() + "/register.jsp?message=User Registration Failed!");
            }
        } catch (UserAlreadyRegisteredException e) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?message=You have already registered. Please login");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/register.jsp?message=Error: " + e.getMessage());
        }
    }


    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        try {
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);

            boolean isUpdated = userDao.updateUser(user);

            if (isUpdated) {
                session.setAttribute("updateMessage", "Profile updated successfully.");
            } else {
                session.setAttribute("updateMessage", "Failed to update profile.");
            }
        } catch (Exception e) {
            session.setAttribute("updateMessage", "An error occurred: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(request, response);
    }
}
