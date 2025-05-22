package com.relojdepulsera.controller;


import java.io.IOException;   


import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.util.ValidationUtil;
import com.relojdepulsera.util.CookiesUtil;
import com.relojdepulsera.util.RedirectionUtil;
import com.relojdepulsera.util.SessionUtil;
import com.relojdepulsera.service.LoginService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Aabriti Pradhan
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/login"})

public class loginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private final ValidationUtil validationUtil = new ValidationUtil();
	private final RedirectionUtil redirectionUtil = new RedirectionUtil();
	private final String rootURL = "WEB-INF/pages";
	private final String loginURL = rootURL+"/login.jsp";
	private final String indexURL = rootURL+"/index.jsp";
	


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher(loginURL).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");


		if (validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(password)) {
			redirectionUtil.setMsgAndRedirect(req, resp, "error", "You have not filled the feilds!", loginURL);
		} else {
			if (!validationUtil.isNullOrEmpty(username) && !validationUtil.isNullOrEmpty(password)) {

				UserModel userModel = new UserModel(username, password);// creates a usermodel object
				UserModel loggedInUser = new LoginService().loginUser(userModel); //checking with database if the user exists

				if (loggedInUser != null) {
					SessionUtil.setAttribute(req, "username", loggedInUser.getUserName());
					SessionUtil.setAttribute(req, "role", loggedInUser.getrole());
					
					SessionUtil.setAttribute(req, "user", loggedInUser); // ✅ Save full user object
					
					CookiesUtil.addCookie(resp, "userId", String.valueOf(loggedInUser.getId()), 5 * 30); 
					
					System.out.println("Logged in user ID: " + loggedInUser.getId());

				} else {
					handleLoginFailure(req, resp, false);
				}
			}
		}

	}
	
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "User credential mismatch. Please try again!";
		}
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher(RedirectionUtil.loginUrl).forward(req, resp);
	}

}
