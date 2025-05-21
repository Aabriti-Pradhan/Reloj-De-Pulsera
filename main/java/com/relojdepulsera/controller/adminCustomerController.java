package com.relojdepulsera.controller;

import java.io.IOException;
import java.util.List;

import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.service.AdminCustomerService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin-customer"})

public class AdminCustomerController extends  HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final String PAGE = "/WEB-INF/pages/admin-customer.jsp";
	private AdminCustomerService customerService = new AdminCustomerService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = (String) req.getSession().getAttribute("role");

        if ("admin".equalsIgnoreCase(role)) {
        	List<UserModel> customers = customerService.getAllCustomer(); // <- get customer list
            req.setAttribute("customer", customers); // pass to JSP
            req.getRequestDispatcher(PAGE).forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }

}
