package com.relojdepulsera.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.relojdepulsera.service.DashboardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin-dashboard", "/dashboard", "/admin" })

public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ADMIN_DASHBOARD_PAGE = "/WEB-INF/pages/admin-dashboard.jsp";
	private DashboardService dashboardService = new DashboardService();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = (String) req.getSession().getAttribute("role");
        
        if (!"admin".equalsIgnoreCase(role)) {
            resp.sendRedirect(req.getContextPath() + "/index");
            return;
        }

        try {
            // Set all dashboard metrics as request attributes
            req.setAttribute("totalOrders", dashboardService.getTotalOrders());
            req.setAttribute("totalProducts", dashboardService.getTotalProducts());
            req.setAttribute("totalCustomers", dashboardService.getTotalCustomers());
            
            double revenue = dashboardService.getTotalRevenue();
            req.setAttribute("revenue", revenue);
            req.setAttribute("net", revenue * 0.7); // Assuming 30% costs
            
            req.setAttribute("pendingOrders", dashboardService.getPendingOrders());
            req.setAttribute("completedOrders", dashboardService.getCompletedOrders());
            req.setAttribute("latestCustomers", dashboardService.getLatestCustomers());
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle error appropriately
        }

        req.getRequestDispatcher(ADMIN_DASHBOARD_PAGE).forward(req, resp);
    }
}
