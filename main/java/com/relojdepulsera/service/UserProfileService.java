package com.relojdepulsera.service;

/**
 * @author Aabriti Pradhan
 */


import java.sql.Connection;
import java.sql.PreparedStatement;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.UserModel;

public class UserProfileService {

    public boolean updateUserProfile(UserModel user) {
    	System.out.println("SQL update values:");
    	System.out.println("First Name: " + user.getFirstName());
    	System.out.println("Last Name: " + user.getLastName());
    	System.out.println("Email: " + user.getEmail());
    	System.out.println("Phone: " + user.getPhone());
    	System.out.println("Address: " + user.getaddress());
    	System.out.println("User ID: " + user.getId());

        String sql = "UPDATE user SET first_name=?, last_name=?, email=?, phone=?, address=? WHERE user_ID=?";

        try (Connection conn = DBconfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getaddress());
            ps.setInt(6, user.getId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public boolean deleteUser(int userId) {
        String deleteOrderItems = "DELETE FROM order_item WHERE order_ID IN (SELECT order_ID FROM orders WHERE user_ID = ?)";
        String deletePayments = "DELETE FROM payment WHERE order_ID IN (SELECT order_ID FROM orders WHERE user_ID = ?)";
        String deleteOrders = "DELETE FROM orders WHERE user_ID = ?";
        String deleteUser = "DELETE FROM user WHERE user_ID = ?";

        try (Connection conn = DBconfig.getDbConnection()) {
            conn.setAutoCommit(false); // Start transaction

            try (
                PreparedStatement ps1 = conn.prepareStatement(deleteOrderItems);
                PreparedStatement ps2 = conn.prepareStatement(deletePayments);
                PreparedStatement ps3 = conn.prepareStatement(deleteOrders);
                PreparedStatement ps4 = conn.prepareStatement(deleteUser);
            ) {
                ps1.setInt(1, userId);
                ps1.executeUpdate();

                ps2.setInt(1, userId);
                ps2.executeUpdate();

                ps3.setInt(1, userId);
                ps3.executeUpdate();

                ps4.setInt(1, userId);
                int rowsDeleted = ps4.executeUpdate();

                conn.commit(); // Commit transaction

                return rowsDeleted > 0;
            } catch (Exception e) {
                conn.rollback(); // Rollback on error
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
