package com.relojdepulsera.controller;

import java.io.IOException;

import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.service.ProfileService;
import com.relojdepulsera.util.CookiesUtil;
import com.relojdepulsera.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Aabriti Pradhan
 */


@WebServlet(urlPatterns = { "/admin-profile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class adminProfileController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	ProfileService profileService = new ProfileService();
	
	private static final String PAGE = "/WEB-INF/pages/admin-profile.jsp";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = (String) req.getSession().getAttribute("role");
        
        int userId = -1;
    	Cookie userIdCookie = CookiesUtil.getCookie(req, "userId");
    	if (userIdCookie != null) {
    		userId = Integer.parseInt(userIdCookie.getValue());
    	}

    	if (userId != -1) {
    		UserModel user = profileService.getUser(userId);
    		SessionUtil.setAttribute(req, "user", user); // or session attribute if needed
    	}

        if ("admin".equalsIgnoreCase(role)) {
            req.getRequestDispatcher(PAGE).forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Get user ID from session or cookie
        Cookie userIdCookie = CookiesUtil.getCookie(req, "userId");
        int userId = (userIdCookie != null) ? Integer.parseInt(userIdCookie.getValue()) : -1;

        if (userId != -1) {
            // Get updated form data
            String userName = req.getParameter("username");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String address = req.getParameter("address");

            // Create and populate updated UserModel
            UserModel updatedUser = new UserModel();
            updatedUser.setId(userId);
            updatedUser.setUserName(userName);
            updatedUser.setEmail(email);
            updatedUser.setPhone(phone);
            updatedUser.setaddress(address);
            
            System.out.println("username: " + userName);
            System.out.println("email: " + email);
            System.out.println("phone: " + phone);
            System.out.println("address: " + address);


            // Call update method in ProfileService
            profileService.updateUser(updatedUser);

            // Update session data
            SessionUtil.setAttribute(req, "user", updatedUser);
        }

        // Redirect to GET so the page reloads with updated info
        resp.sendRedirect(req.getContextPath() + "/admin-profile");
    }


}
