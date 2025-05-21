package com.relojdepulsera.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.OrderModel;

public class AdminOrderService {

    public List<OrderModel> fetchAllOrders() {
        List<OrderModel> orders = new ArrayList<>();

        String query = "SELECT o.order_ID, o.total_amount, o.order_date, o.order_status, " +
                "CONCAT(u.first_name, ' ', u.last_name) AS customer_name " +
                "FROM `order` o JOIN `user` u ON o.user_ID = u.user_ID " +
                "WHERE u.role = 'User'";

        try (Connection con = DBconfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setId(rs.getInt("order_ID"));
                order.setDate(rs.getInt("order_date"));
                order.setUser_id(rs.getInt("user_ID"));
                order.setStatus(rs.getString("order_status"));
                order.setTotal_amt(rs.getInt("total_amount"));
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
}