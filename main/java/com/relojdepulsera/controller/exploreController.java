package com.relojdepulsera.controller;

/**
 * @author Aabriti Pradhan
 */


import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.relojdepulsera.model.WatchModel;
import com.relojdepulsera.service.ExploreService;

@WebServlet(asyncSupported = true, urlPatterns = { "/explore"})

public class exploreController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private ExploreService exploreService = new ExploreService();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<WatchModel> products = exploreService.getAllProducts();  // Fetch products from the database
        req.setAttribute("products", products);
		req.getRequestDispatcher("WEB-INF/pages/explore.jsp").forward(req, resp);
	}

}
