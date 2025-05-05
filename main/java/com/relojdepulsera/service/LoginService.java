package com.relojdepulsera.service;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.util.PasswordUtil;

public class LoginService {

	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
	public LoginService() {
		try {
			dbConn = DBconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Validates the user credentials against the database records.
	 *
	 * @param studentModel the StudentModel object containing user credentials
	 * @return true if the user credentials are valid, false otherwise; null if a
	 *         connection error occurs
	 */
	public UserModel loginUser(UserModel userModel) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}
		
		System.out.println("Attempting login with username: " + userModel.getUserName());

		String query = "SELECT * FROM user WHERE username = ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, userModel.getUserName());
			ResultSet result = stmt.executeQuery();

			if (result.next()) {
				String dbPassword = result.getString("password");
				String decrypted = PasswordUtil.decrypt(dbPassword, result.getString("username"));
			    
			    if (decrypted != null && decrypted.equals(userModel.getPassword())) {
					// return full user object with role
					UserModel loggedInUser = new UserModel();
					loggedInUser.setId(result.getInt("user_id"));
					loggedInUser.setUserName(result.getString("username"));
					loggedInUser.setPassword(dbPassword);
					loggedInUser.setrole(result.getString("role"));
					// you can set other fields if needed
					return loggedInUser;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return null;
	}


	/**
	 * Validates the password retrieved from the database.
	 *
	 * @param result       the ResultSet containing the username and password from
	 *                     the database
	 * @param studentModel the StudentModel object containing user credentials
	 * @return true if the passwords match, false otherwise
	 * @throws SQLException if a database access error occurs
	 */
	private boolean validatePassword(ResultSet result, UserModel userModel) throws SQLException {
		String dbUsername = result.getString("username");
		String dbPassword = result.getString("password");

		return dbUsername.equals(userModel.getUserName())
				&& PasswordUtil.decrypt(dbPassword, dbUsername).equals(userModel.getPassword());
	}

}
