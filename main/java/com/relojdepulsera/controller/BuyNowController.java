package com.relojdepulsera.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Random;

import com.relojdepulsera.model.OrderItemModel;
import com.relojdepulsera.model.OrderModel;
import com.relojdepulsera.model.PaymentModel;
import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/buyNow")
public class BuyNowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("BuyNowServlet triggered");

			
			int productId = Integer.parseInt(request.getParameter("productId"));
			int price = Integer.parseInt(request.getParameter("price"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			// Dummy user ID for now (replace with session.getUser().getId() later)
			HttpSession session = request.getSession();
			UserModel user = (UserModel) session.getAttribute("user");
			
			System.out.println("Checking user session");
			if (user == null) {
			    response.sendRedirect(request.getContextPath() + "/productView.jsp"); // or your login page
			    return;
			}
			System.out.println("User is logged in");
			int userId = user.getId();
			
			System.out.println("Checking product ID");
			String productIdParam = request.getParameter("productId");
			if (productIdParam == null || productIdParam.isEmpty()) {
			    System.out.println("Product ID is missing.");
			    response.sendRedirect("error.jsp");
			    return;
			}

			System.out.println("Checking product ID");

			String productIdParam1 = request.getParameter("productId");
			if (productIdParam1 == null || productIdParam1.isEmpty()) {
			    System.out.println("Product ID is missing.");
			    response.sendRedirect("error.jsp");
			    return;
			}

			int productId1 = Integer.parseInt(productIdParam1);
			System.out.println("Product ID received: " + productId1);

			// Optional: also log price if you pass it
			String priceParam = request.getParameter("price");
			if (priceParam == null || priceParam.isEmpty()) {
			    System.out.println("Price is missing.");
			    response.sendRedirect("error.jsp");
			    return;
			}

			int price1 = Integer.parseInt(priceParam);
			System.out.println("Price received: " + price1);

			
			
			// Step 1: Create Order
			OrderModel order = new OrderModel();
			order.setTotal_amt(price1 * quantity);
			order.setStatus(getRandomStatus());
			order.setDate((int) (System.currentTimeMillis() / 1000)); // or store as SQL Date
			order.setUser_id(userId);

			int orderId = orderService.insertOrder(order);

			// Step 2: Add Order Item
			OrderItemModel item = new OrderItemModel();
			item.setOrder_Id(orderId);
			item.setWatch_Id(productId1);
			item.setQuantity(quantity);
			item.setPrice_at_order(price1);

			orderService.insertOrderItem(item);

			// Step 3: Add Payment Record
			PaymentModel payment = new PaymentModel();
			payment.setOrder_Id_Pay(orderId);
			payment.setAmount_Paid(price1 * quantity);
			payment.setPayment_Method("Online");
			payment.setPayment_Date((int) (System.currentTimeMillis() / 1000));
			payment.setPayment_Status(getRandomStatus());


			orderService.insertPayment(payment);

			// Redirect to success page
			System.out.println("Order placed successfully for user ID: " + userId + ", Order ID: " + orderId);
			String redirectUrl = request.getContextPath() + "/pages/index.jsp";
			System.out.println("Redirecting to: " + redirectUrl);
			response.sendRedirect(redirectUrl);



		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
	
	private String getRandomStatus() {
	    return Math.random() < 0.5 ? "Pending" : "Completed";
	}
}
