package com.crimsonlogic.urbanadventures.controllers;

import com.crimsonlogic.urbanadventures.dao.UserDao;
import com.crimsonlogic.urbanadventures.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/update")
public class UpdateProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
            return;
        }

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        try {
            // Assuming you have a UserDAO class with an updateUser method
            UserDao userDAO = new UserDao();
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);

            boolean isUpdated = userDAO.updateUser(user);

            if (isUpdated) {
                session.setAttribute("updateMessage", "Profile updated successfully.");
            } else {
                session.setAttribute("updateMessage", "Failed to update profile.");
            }
        } catch (Exception e) {
            session.setAttribute("updateMessage", "An error occurred: " + e.getMessage());
        }

        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }
}
