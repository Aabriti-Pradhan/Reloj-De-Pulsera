package com.relojdepulsera.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin-customer"})

public class AdminCustomerController extends  HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final String PAGE = "/WEB-INF/pages/admin-customer.jsp";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = (String) req.getSession().getAttribute("role");

        if ("admin".equalsIgnoreCase(role)) {
            req.getRequestDispatcher(PAGE).forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }

}
