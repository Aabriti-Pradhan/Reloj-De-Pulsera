package com.relojdepulsera.service;

import com.relojdepulsera.model.CustomerModel;
import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.config.DBconfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DashboardService {
    
    public int getTotalOrders() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBconfig.getDbConnection();
            stmt = conn.prepareStatement("SELECT COUNT(*) FROM order");
            rs = stmt.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        } finally {
            closeResources(conn, stmt, rs);
        }
    }
    
    public int getTotalProducts() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBconfig.getDbConnection();
            stmt = conn.prepareStatement("SELECT COUNT(*) FROM watch");
            rs = stmt.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        } finally {
            closeResources(conn, stmt, rs);
        }
    }
    
    public int getTotalCustomers() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBconfig.getDbConnection();
            stmt = conn.prepareStatement("SELECT COUNT(*) FROM user WHERE role='user'");
            rs = stmt.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        } finally {
            closeResources(conn, stmt, rs);
        }
    }
    
    public double getTotalRevenue() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBconfig.getDbConnection();
            stmt = conn.prepareStatement("SELECT SUM(total_amount) FROM order");
            rs = stmt.executeQuery();
            return rs.next() ? rs.getDouble(1) : 0.0;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        } finally {
            closeResources(conn, stmt, rs);
        }
    }
    
    public int getPendingOrders() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBconfig.getDbConnection();
            stmt = conn.prepareStatement("SELECT COUNT(*) FROM order WHERE order_status='Pending'");
            rs = stmt.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        } finally {
            closeResources(conn, stmt, rs);
        }
    }
    
    public int getCompletedOrders() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBconfig.getDbConnection();
            stmt = conn.prepareStatement("SELECT COUNT(*) FROM order WHERE order_status='Completed'");
            rs = stmt.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        } finally {
            closeResources(conn, stmt, rs);
        }
    }
    
    
    
    public List<CustomerModel> getLatestCustomers() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<CustomerModel> customers = new ArrayList<>();
        
        try {
            conn = DBconfig.getDbConnection();
            // Query to get top customers by order count
            String query = "SELECT u.first_name, u.last_name, " +
                          "COUNT(o.user_ID) as order_count FROM user u " +
                          "LEFT JOIN orders o ON u.user_ID = o.user_ID " +
                          "WHERE u.role='user' " +
                          "GROUP BY u.user_ID ORDER BY order_count DESC LIMIT 3";
            
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                String name = rs.getString("first_name") + " " + rs.getString("last_name");
                int orderCount = rs.getInt("order_count");
                customers.add(new CustomerModel(name, orderCount));
            }
            return customers;
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        } finally {
            closeResources(conn, stmt, rs);
        }
    }
    
    private void closeResources(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}