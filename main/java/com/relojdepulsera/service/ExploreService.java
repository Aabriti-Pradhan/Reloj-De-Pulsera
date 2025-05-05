package com.relojdepulsera.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.WatchModel;

public class ExploreService {
	
	private Connection dbConn;

	public ExploreService() {
		try {
			this.dbConn = DBconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
	

    public List<WatchModel> getAllProducts() {
    	if (dbConn == null) {
			System.err.println("Database connection is not available!");
			return null;
		}
    	
    	String query = "SELECT name, price, image_url FROM watch";
        List<WatchModel> watches = new ArrayList<WatchModel>();
        
        try {
			PreparedStatement categoryStmt = dbConn.prepareStatement(query);
			ResultSet result = categoryStmt.executeQuery();

			while (result.next()) {
				WatchModel watch = new WatchModel();
				watch.setName(result.getString("name"));
				watch.setPrice(result.getInt("price"));
				watch.setImageURL(result.getString("image_url"));
				watches.add(watch);
			}

			return watches;
		} catch (SQLException e) {
			System.err.println("Error fetching category: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
    }

}
