package com.relojdepulsera.controller;

/**
 * @author Aabriti Pradhan
 */


import java.io.IOException;
import java.util.List;

import com.relojdepulsera.model.WatchModel;
import com.relojdepulsera.service.ExploreService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/index", "/" })
public class indexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ExploreService exploreService = new ExploreService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// You don't need to exclude anything, so just pass -1
		List<WatchModel> watchList = exploreService.getRelatedProducts(-1, 5);

		request.setAttribute("watchList", watchList);

		request.getRequestDispatcher("WEB-INF/pages/index.jsp").forward(request, response);
	}
}
