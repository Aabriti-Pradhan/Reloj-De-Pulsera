package com.relojdepulsera.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin-dashboard", "/dashboard", "/admin" })

public class adminController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String ADMIN_DASHBOARD_PAGE = "/WEB-INF/pages/admin-dashboard.jsp";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = (String) req.getSession().getAttribute("role");
        
        // Only allow if admin
        if ("admin".equalsIgnoreCase(role)) {
            req.getRequestDispatcher(ADMIN_DASHBOARD_PAGE).forward(req, resp);
        } else {
            // Redirect to index or 403 page if not authorized
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }

}
