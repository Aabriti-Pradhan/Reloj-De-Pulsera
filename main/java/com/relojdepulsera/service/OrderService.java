package com.relojdepulsera.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.OrderItemModel;
import com.relojdepulsera.model.OrderModel;
import com.relojdepulsera.model.PaymentModel;

/**
 * @author Aabriti Pradhan
 */


public class OrderService {
	
	private Connection dbConn;

	public OrderService() {
		try {
			this.dbConn = DBconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	public int insertOrder(OrderModel order) throws Exception {
		String sql = "INSERT INTO orders (total_amount, order_date, order_status, user_ID) VALUES (?, ?, ?, ?)";
		PreparedStatement stmt = dbConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, order.getTotal_amt());
		stmt.setDate(2, new java.sql.Date(order.getDate().getTime()));
		stmt.setString(3, order.getStatus());
		stmt.setInt(4, order.getUser_id());
		stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs.next()) {
			return rs.getInt(1); // return generated order ID
		}
		throw new Exception("Failed to insert order");
	}

	public void insertOrderItem(OrderItemModel item) throws Exception {
		String sql = "INSERT INTO order_item (order_ID, watch_ID, quantity, price_at_order) VALUES (?, ?, ?, ?)";
		PreparedStatement stmt = dbConn.prepareStatement(sql);
		stmt.setInt(1, item.getOrder_Id());
		stmt.setInt(2, item.getWatch_Id());
		stmt.setInt(3, item.getQuantity());
		stmt.setInt(4, item.getPrice_at_order());
		stmt.executeUpdate();
	}

	public void insertPayment(PaymentModel payment) throws Exception {
		String sql = "INSERT INTO payment (order_ID, amount_paid, payment_method, payment_date, payment_status) VALUES (?, ?, ?, FROM_UNIXTIME(?), ?)";
		PreparedStatement stmt = dbConn.prepareStatement(sql);
		stmt.setInt(1, payment.getOrder_Id_Pay());
		stmt.setInt(2, payment.getAmount_Paid());
		stmt.setString(3, payment.getPayment_Method());
		stmt.setInt(4, payment.getPayment_Date());
		stmt.setString(5, payment.getPayment_Status());
		stmt.executeUpdate();
	}

}
