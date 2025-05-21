package com.relojdepulsera.controller;

import java.io.IOException;
import java.util.List;

import com.relojdepulsera.model.OrderModel;
import com.relojdepulsera.service.AdminOrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin-order"})

public class AdminOrderController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String PAGE = "/WEB-INF/pages/admin-order.jsp";
	private AdminOrderService AdminOrderService = new AdminOrderService(); // or inject

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = (String) req.getSession().getAttribute("role");

        if ("admin".equalsIgnoreCase(role)) {
        	List<OrderModel> orders = AdminOrderService.fetchAllOrders();
            req.setAttribute("orders", orders);
            req.getRequestDispatcher(PAGE).forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }

}