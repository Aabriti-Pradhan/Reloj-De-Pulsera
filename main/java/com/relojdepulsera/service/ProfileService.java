package com.relojdepulsera.service;

/**
 * @author Aabriti Pradhan
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.util.PasswordUtil;

public class ProfileService {

	private Connection dbConn;

	public ProfileService() {
		try {
			this.dbConn = DBconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	public UserModel getUser(int id) {
		if (dbConn == null) {
			System.err.println("Database connection is not available!");
			return null;
		}

		String query = "SELECT * FROM user WHERE user_ID = ?";

		try {
			PreparedStatement userStmt = dbConn.prepareStatement(query);
			userStmt.setInt(1, id);
			ResultSet result = userStmt.executeQuery();

			if (result.next()) {
				UserModel user = new UserModel();
				user.setId(result.getInt("user_ID"));
				user.setFirstName(result.getString("first_name"));
				user.setLastName(result.getString("last_name"));
				user.setUserName(result.getString("username"));
				user.setEmail(result.getString("email"));
				user.setPhone(result.getString("phone"));
				user.setPassword(result.getString("password"));
				user.setrole(result.getString("role"));
				user.setaddress(result.getString("address"));
				user.setImageURL(result.getString("image_path"));
				return user;
			}

		} catch (SQLException e) {
			System.err.println("Error fetching user: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public void updateUser(UserModel user) {

		if (dbConn == null) {
			System.err.println("Database connection is not available!");
			return;
		}

		String query = "UPDATE user SET username = ?, email = ?, phone = ?, address = ?, password = ? WHERE user_ID = ?";
		String getPass = "SELECT password, username FROM user WHERE user_ID = ?";

		try {
			PreparedStatement userStmt = dbConn.prepareStatement(query);
			PreparedStatement getpassquery = dbConn.prepareStatement(getPass);

			getpassquery.setInt(1, user.getId());
			ResultSet result = getpassquery.executeQuery();

			if (result.next()) {
				
				String currentEncryptedPassword = result.getString("password");
				String currentUsername = result.getString("username");
				String newUsername = user.getUserName();
				
				String encryptedPasswordToUpdate = currentEncryptedPassword;
				
				if (!newUsername.equals(currentUsername)) {
					
					String decryptedPassword = PasswordUtil.decrypt(currentEncryptedPassword, currentUsername);
					
					if (decryptedPassword == null) {
				        System.err.println("Password decryption failed — maybe username was changed without re-encryption?");
				        return;
				    }
					
					encryptedPasswordToUpdate = PasswordUtil.encrypt(newUsername, decryptedPassword);


				    System.out.println("Old Username: " + currentUsername);
				    System.out.println("New Username: " + newUsername);
				    System.out.println("Encrypted Password (before): " + currentEncryptedPassword);
				    System.out.println("Decrypted Password: " + decryptedPassword);
				    System.out.println("Encrypted Password (after): " + encryptedPasswordToUpdate);

	            }
				
				if (encryptedPasswordToUpdate == null) {
				    System.err.println("Failed to encrypt password with new username. Aborting update.");
				    return;
				}


				userStmt.setString(1, user.getUserName());
				userStmt.setString(2, user.getEmail());
				userStmt.setString(3, user.getPhone());
				userStmt.setString(4, user.getaddress());
				userStmt.setString(5, encryptedPasswordToUpdate);
				userStmt.setInt(6, user.getId());

				userStmt.executeUpdate();
				System.out.println("User updated successfully!");
			} else {
				System.out.println("User not found with ID: " + user.getId());
			}

		} catch (SQLException e) {
			e.printStackTrace(); // Or log properly
		}
	}

}
