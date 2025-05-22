package com.relojdepulsera.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.relojdepulsera.service.DashboardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Aabriti Pradhan
 */


@WebServlet(urlPatterns = { "/admin-dashboard", "/dashboard", "/admin" })

public class adminController extends HttpServlet {
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

        	req.setAttribute("totalOrders", dashboardService.getTotalOrders());
        	req.setAttribute("totalProducts", dashboardService.getTotalProducts());
        	req.setAttribute("totalCustomers", dashboardService.getTotalCustomers());

        	double totalRevenue = dashboardService.getTotalRevenue();
        	req.setAttribute("totalRevenue", totalRevenue);
        	req.setAttribute("netRevenue", totalRevenue * 0.7); // 70% profit

        	req.setAttribute("pendingOrders", dashboardService.getPendingOrders());
        	req.setAttribute("completedOrders", dashboardService.getCompletedOrders());

        	// Top customers
        	req.setAttribute("topCustomers", dashboardService.getTopCustomers());

            
        } catch (Exception e) {
            e.printStackTrace();
            // Handle error appropriately
        }

        req.getRequestDispatcher(ADMIN_DASHBOARD_PAGE).forward(req, resp);
    }
}
