package com.relojdepulsera.service;

/**
 * @author Aabriti Pradhan
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.UserModel;

public class AdminCustomerService {
	
	public List<UserModel> getAllCustomer() {
        List<UserModel> userList = new ArrayList<>();

        String sql = "SELECT user_ID, first_name, last_name, email, phone, address, username, image_path FROM user";

        try (Connection conn = DBconfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
            	UserModel user = new UserModel();
            	user.setId(rs.getInt("user_ID"));
            	user.setFirstName(rs.getString("first_name"));
            	user.setLastName(rs.getString("last_name"));
            	user.setUserName(rs.getString("username"));
            	user.setEmail(rs.getString("email"));
            	user.setPhone(rs.getString("phone"));
            	user.setaddress(rs.getString("address"));
            	user.setImageURL(rs.getString("image_path"));

                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }

}
