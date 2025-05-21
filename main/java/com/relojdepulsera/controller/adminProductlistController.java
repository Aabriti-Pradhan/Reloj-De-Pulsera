package com.relojdepulsera.controller;

import java.io.IOException;
import java.util.List;

import com.relojdepulsera.model.WatchModel;
import com.relojdepulsera.service.AdminProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin-productlist"})

public class AdminProductlistController extends  HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final String PAGE = "/WEB-INF/pages/admin-productlist.jsp";
	private AdminProductService productService = new AdminProductService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = (String) req.getSession().getAttribute("role");

        if ("admin".equalsIgnoreCase(role)) {
            List<WatchModel> watches = productService.getAllWatches(); // <- get watch list
            req.setAttribute("watches", watches); // pass to JSP
            req.getRequestDispatcher(PAGE).forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }

}
