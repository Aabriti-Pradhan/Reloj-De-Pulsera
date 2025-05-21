package com.relojdepulsera.controller;

import java.io.IOException;
import java.util.List;

import com.relojdepulsera.model.WatchModel;
import com.relojdepulsera.service.ExploreService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/productView"})

public class ProductViewController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private ExploreService exploreService = new ExploreService();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idParam = req.getParameter("id");
		if (idParam != null) {
			try {
				int productId = Integer.parseInt(idParam);
				WatchModel product = exploreService.getProductById(productId); // You’ll create this method
				if (product != null) {
					List<WatchModel> relatedProducts = exploreService.getRelatedProducts(productId, 5);
					req.setAttribute("product", product);
					req.setAttribute("related", relatedProducts);
					req.getRequestDispatcher("WEB-INF/pages/productView.jsp").forward(req, resp);
				} else {
					resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
				}
			} catch (NumberFormatException e) {
				resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
			}
		} else {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID missing");
		}
	}

}
