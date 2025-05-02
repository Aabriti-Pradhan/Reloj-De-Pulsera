package com.relojdepulsera.controller;


import java.io.IOException;

import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.service.RegisterService;
import com.relojdepulsera.util.ImageUtil;
import com.relojdepulsera.util.PasswordUtil;
import com.relojdepulsera.util.RedirectionUtil;
import com.relojdepulsera.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * @author Aabriti Pradhan
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/register"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB


public class registerCotroller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private final ValidationUtil validationUtil = new ValidationUtil();
	private final RedirectionUtil redirectionUtil = new RedirectionUtil();
	private final String rootURL = "WEB-INF/pages";
	private final String registerURL = rootURL+"/register.jsp";
	private final String indexURL = rootURL+"/index.jsp";

	private ImageUtil imageUtil;
	private RegisterService registerService;
	/**private RedirectionUtil redirectionUtil;**/
	
	@Override
	public void init() throws ServletException {
		this.registerService = new RegisterService();
		this.imageUtil = new ImageUtil();
		/*this.redirectionUtil = new RedirectionUtil();*/
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("roles", registerService.getDistinctRoles());
		req.getRequestDispatcher(redirectionUtil.registerUrl).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setAttribute("roles", registerService.getDistinctRoles());
		
		String firstName = req.getParameter("firstname");
		String lastName = req.getParameter("lastname");
		String password = req.getParameter("password");
		String retypePassword = req.getParameter("retype");
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String phoneNumber = req.getParameter("phone");
		String role = req.getParameter("role");
		String address = req.getParameter("address");


		if (validationUtil.isNullOrEmpty(firstName) || 
			validationUtil.isNullOrEmpty(lastName) || 
			validationUtil.isNullOrEmpty(username)|| 
			validationUtil.isNullOrEmpty(email) || 
			validationUtil.isNullOrEmpty(phoneNumber) || 
			validationUtil.isNullOrEmpty(role) ||
			validationUtil.isNullOrEmpty(address)) {
			redirectionUtil.setMsgAndRedirect(req, resp, "error", "You have not filled the feilds!", registerURL);
		} else {
			
			try {
				UserModel userModel = extractUserModel(req, resp);
				Boolean isAdded = registerService.addUser(userModel);

				if (isAdded == null) {
					redirectionUtil.setMsgAndRedirect(req, resp, "error",
							"An unexpected error occurred. Please try again later!", RedirectionUtil.registerUrl);
				} else if (isAdded) {
					if (uploadImage(req)) {
						redirectionUtil.setMsgAndRedirect(req, resp, "success", "Your account is successfully created!",
								RedirectionUtil.loginUrl);
					} else {
						redirectionUtil.setMsgAndRedirect(req, resp, "error",
								"Could not upload the image. Please try again later!", RedirectionUtil.registerUrl);
					}
				} else {
					redirectionUtil.setMsgAndRedirect(req, resp, "error",
							"Could not register your account. Please try again later!", RedirectionUtil.registerUrl);
				}
			} catch (Exception e) {
				redirectionUtil.setMsgAndRedirect(req, resp, "error",
						"Try catch ko error. Please try again later!", RedirectionUtil.registerUrl);
				e.printStackTrace(); // Log the exception
			}
			
		}

	}
	
	private UserModel extractUserModel(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String firstName = req.getParameter("firstname");
		String lastName = req.getParameter("lastname");
		String password = req.getParameter("password");
		String retypePassword = req.getParameter("retype");
		String email = req.getParameter("email");
		String phoneNumber = req.getParameter("phone");
		String address = req.getParameter("address");
		String role = req.getParameter("role");
		String username = req.getParameter("username");

		if (password == null || !password.equals(retypePassword)) {
			redirectionUtil.setMsgAndRedirect(req, resp, "pass-error", "Please correct your password & retype-password!",
					RedirectionUtil.registerUrl);
		}

		password = PasswordUtil.encrypt(username, password);

		Part image = req.getPart("image");
		String imageUrl = null; // Default value
	    
	    if (image != null && image.getSize() > 0) {
	        imageUrl = imageUtil.getImageNameFromPart(image);
	    }

		return new UserModel(firstName, lastName, password, email, phoneNumber, address, role, username, imageUrl);
	}
	
	private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
		Part image = req.getPart("image");
		if (image == null || image.getSize() == 0) {
	        return false; // No image to upload
	    }
		return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "user");
	}
	
	
	
	

}
