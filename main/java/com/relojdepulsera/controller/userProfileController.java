package com.relojdepulsera.controller;

import java.io.IOException;

import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.service.UserProfileService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(asyncSupported = true, urlPatterns = { "/userProfile" })
public class UserProfileController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserProfileService userService = new UserProfileService();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/pages/userProfile.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("save".equals(action)) {
			HttpSession session = req.getSession();
			UserModel user = (UserModel) session.getAttribute("user");

			if (user != null) {
				// Fetch updated values
				user.setFirstName(req.getParameter("firstName"));
				user.setLastName(req.getParameter("lastName"));
				user.setEmail(req.getParameter("email"));
				user.setPhone(req.getParameter("phone"));
				user.setaddress(req.getParameter("address"));
				
				System.out.println("Updating user with ID: " + user.getId());

				// Update in database
				boolean updated = userService.updateUserProfile(user);

				if (updated) {
					session.setAttribute("user", user); // Update session object
				}

				// Redirect to profile page (GET request)
				resp.sendRedirect(req.getContextPath() + "/userProfile");
			} else {
				resp.sendRedirect(req.getContextPath() + "/login");
			}
		}
		else if ("delete".equals(action)) {
	    HttpSession session = req.getSession();
	    UserModel user = (UserModel) session.getAttribute("user");

	    if (user != null) {
	        boolean deleted = userService.deleteUser(user.getId());

	        if (deleted) {
	            session.invalidate(); // Clear session
	            resp.sendRedirect(req.getContextPath() + "/login"); // Or homepage
	        } else {
	            resp.sendRedirect(req.getContextPath() + "/user-profile?error=deleteFailed");
	        }
	    }
	}

	}
}
