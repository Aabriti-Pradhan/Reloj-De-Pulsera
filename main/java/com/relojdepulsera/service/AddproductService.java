package com.relojdepulsera.service;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.CategoryModel;
import com.relojdepulsera.model.WatchModel;

public class AddproductService {

	private Connection dbConn;

	public AddproductService() {
		try {
			this.dbConn = DBconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	public List<CategoryModel> getDistinctCategory() {
		if (dbConn == null) {
			System.err.println("Database connection is not available!");
			return null;
		}

		String query = "SELECT category_id, category_name FROM category";
		List<CategoryModel> category = new ArrayList<CategoryModel>();

		try {
			PreparedStatement categoryStmt = dbConn.prepareStatement(query);
			ResultSet result = categoryStmt.executeQuery();

			while (result.next()) {
				CategoryModel categories = new CategoryModel();
				categories.setId(result.getInt("category_id"));
				categories.setName(result.getString("category_name"));
				category.add(categories);
			}

			return category;
		} catch (SQLException e) {
			System.err.println("Error fetching category: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	public Boolean addWatch(WatchModel watchModel) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

		String insertQuery = "INSERT INTO watch (name, category_ID, price, description, stock_quantity, image_url) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery);
			// Insert watch details
			insertStmt.setString(1, watchModel.getName());
			insertStmt.setLong(2, watchModel.getCategoryID());
			insertStmt.setLong(3, watchModel.getPrice());
			insertStmt.setString(4, watchModel.getDescription());
			insertStmt.setLong(5, watchModel.getStock());
			insertStmt.setString(6, watchModel.getImageURL());
			
			int rows = insertStmt.executeUpdate();
			System.out.println("Insert executed, rows affected: " + rows);

	        if (!dbConn.getAutoCommit()) {
	            dbConn.commit(); // commit if autoCommit is false
	        }

	        return rows > 0;
		} catch (SQLException e) {
			System.err.println("Error during watch insertion: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
