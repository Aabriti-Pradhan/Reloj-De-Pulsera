package com.relojdepulsera.service;

import java.sql.*;
import java.util.*;

import com.relojdepulsera.model.OrderModel;
import com.relojdepulsera.config.DBconfig;

public class PurchaseHistoryService {
	
	private Connection dbConn;

	public PurchaseHistoryService() {
		try {
			this.dbConn = DBconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}


    public List<OrderModel> getOrdersWithWatchNamesByUserId(int userId) {
        List<OrderModel> orderList = new ArrayList<>();

        String query = """
            SELECT o.order_ID, o.order_date, o.order_status, o.total_amount, w.name AS watch_name
            FROM orders o
            JOIN order_item oi ON o.order_ID = oi.order_ID
            JOIN watch w ON oi.watch_ID = w.watch_ID
            WHERE o.user_ID = ?
            ORDER BY o.order_date DESC
        """;

        try{
        	
        	PreparedStatement stmt = dbConn.prepareStatement(query);

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setId(rs.getInt("order_ID"));
                order.setDate(rs.getDate("order_date"));
                order.setStatus(rs.getString("order_status"));
                order.setTotal_amt(rs.getInt("total_amount"));
                order.setCustomerName(rs.getString("watch_name")); // Reused for displaying watch name
                orderList.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderList;
    }
}
