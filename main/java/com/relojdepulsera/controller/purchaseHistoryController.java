package com.relojdepulsera.controller;

import java.io.IOException;
import java.util.List;

import com.relojdepulsera.model.OrderModel;
import com.relojdepulsera.service.PurchaseHistoryService;
import com.relojdepulsera.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Aabriti Pradhan
 */


@WebServlet(asyncSupported = true, urlPatterns = { "/purchaseHistory" })
public class purchaseHistoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PurchaseHistoryService historyService = new PurchaseHistoryService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get user from session
        Object userObj = SessionUtil.getAttribute(req, "user");
        if (userObj == null) {
            resp.sendRedirect("login"); // redirect if not logged in
            return;
        }

        int userId = ((com.relojdepulsera.model.UserModel) userObj).getId();

        // Get order list for the user
        List<OrderModel> orders = historyService.getOrdersWithWatchNamesByUserId(userId);

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("WEB-INF/pages/purchaseHistory.jsp").forward(req, resp);
    }
}
