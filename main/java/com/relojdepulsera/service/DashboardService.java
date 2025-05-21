package com.relojdepulsera.service;

import java.sql.*;
import java.util.*;

import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.model.OrderModel;
import com.relojdepulsera.config.DBconfig;

public class DashboardService {

	private Connection dbConn;

	public DashboardService() {
		try {
			this.dbConn = DBconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

    public int getTotalOrders() {
        try {
            PreparedStatement ps = dbConn.prepareStatement("SELECT COUNT(*) FROM orders");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalProducts() {
        try {
            PreparedStatement ps = dbConn.prepareStatement("SELECT COUNT(*) FROM watch");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalCustomers() {
        try {
            PreparedStatement ps = dbConn.prepareStatement("SELECT COUNT(*) FROM user WHERE role = 'user'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public double getTotalRevenue() {
        try {
            PreparedStatement ps = dbConn.prepareStatement("SELECT SUM(total_amount) FROM orders");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getDouble(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    public int getPendingOrders() {
        try {
            PreparedStatement ps = dbConn.prepareStatement("SELECT COUNT(*) FROM orders WHERE order_status = 'Pending'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getCompletedOrders() {
        try {
            PreparedStatement ps = dbConn.prepareStatement("SELECT COUNT(*) FROM orders WHERE order_status = 'Completed'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 🔥 TOP 3 CUSTOMERS (No CustomerModel)
    public List<Map<String, Object>> getTopCustomers() {
        List<Map<String, Object>> customers = new ArrayList<>();
        try {
            String query = "SELECT u.user_ID, u.first_name, u.last_name, COUNT(o.order_ID) as order_count " +
                           "FROM user u JOIN orders o ON u.user_ID = o.user_ID " +
                           "WHERE u.role = 'user' " +
                           "GROUP BY u.user_ID, u.first_name, u.last_name " +
                           "ORDER BY order_count DESC LIMIT 3";
            PreparedStatement ps = dbConn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> customer = new HashMap<>();
                customer.put("id", rs.getInt("user_ID"));
                customer.put("name", rs.getString("first_name") + " " + rs.getString("last_name"));
                customer.put("orderCount", rs.getInt("order_count"));
                customers.add(customer);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }
}
