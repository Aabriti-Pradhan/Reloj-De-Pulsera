package com.relojdepulsera.controller;

import java.io.IOException; 

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Aabriti Pradhan
 */



@WebServlet(asyncSupported = true, urlPatterns = { "/aboutUs"})

public class AboutUs extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/pages/aboutUs.jsp").forward(req, resp);

	}

}
