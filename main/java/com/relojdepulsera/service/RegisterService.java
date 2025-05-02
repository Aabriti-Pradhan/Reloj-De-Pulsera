package com.relojdepulsera.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.UserModel;

public class RegisterService {
	
	private Connection dbConn;
	
	public RegisterService() {
		try {
			this.dbConn = DBconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	
	public List<UserModel> getDistinctRoles() {
		if (dbConn == null) {
			System.err.println("Database connection is not available!");
			return null;
		}

		String query = "SELECT DISTINCT role FROM user";
		List<UserModel> roles = new ArrayList<UserModel>();

		try {
			PreparedStatement userStmt = dbConn.prepareStatement(query);
			ResultSet result = userStmt.executeQuery();

			while (result.next()) {
				UserModel user = new UserModel();
	            user.setrole(result.getString("role"));
	            roles.add(user);
			}

			return roles;
		} catch (SQLException e) {
			System.err.println("Error fetching roles: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	
	public Boolean addUser(UserModel userModel) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

		String insertQuery = "INSERT INTO user (first_name, last_name, password, email, phone, address, role, username, image_path) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery);
			// Insert user details
			insertStmt.setString(1, userModel.getFirstName());
			insertStmt.setString(2, userModel.getLastName());
			insertStmt.setString(3, userModel.getPassword());
			insertStmt.setString(4, userModel.getEmail());
			insertStmt.setString(5, userModel.getPhone());
			insertStmt.setString(6, userModel.getaddress());
			insertStmt.setString(7, userModel.getrole());
			insertStmt.setString(8, userModel.getUserName());
			insertStmt.setString(9, userModel.getImageURL());

			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
