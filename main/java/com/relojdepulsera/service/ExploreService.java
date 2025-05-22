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
    	
    	String query = "SELECT watch_ID, name, price, image_url FROM watch";
        List<WatchModel> watches = new ArrayList<WatchModel>();
        
        try {
			PreparedStatement categoryStmt = dbConn.prepareStatement(query);
			ResultSet result = categoryStmt.executeQuery();

			while (result.next()) {
				WatchModel watch = new WatchModel();
				watch.setId(result.getInt("watch_ID"));
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
    
    public WatchModel getProductById(int id) {
    	if (dbConn == null) {
    		System.err.println("Database connection is not available!");
    		return null;
    	}

    	String query = "SELECT watch_ID, name, category_ID, price, description, stock_quantity, image_url FROM watch WHERE watch_ID = ?";
    	
    	try {
    		PreparedStatement stmt = dbConn.prepareStatement(query);
    		stmt.setInt(1, id);
    		ResultSet result = stmt.executeQuery();

    		if (result.next()) {
    			WatchModel watch = new WatchModel();
    			watch.setId(result.getInt("watch_ID"));
    			watch.setName(result.getString("name"));
    			watch.setCategoryID(result.getInt("category_ID"));
    			watch.setPrice(result.getInt("price"));
    			watch.setDescription(result.getString("description"));
    			watch.setStock(result.getInt("stock_quantity"));
    			watch.setImageURL(result.getString("image_url"));

    			return watch;
    		}
    	} catch (SQLException e) {
    		System.err.println("Error fetching product by ID: " + e.getMessage());
    		e.printStackTrace();
    	}
    	
    	return null;
    }
    
    public List<WatchModel> getRelatedProducts(int excludeProductId, int limit) {
    	if (dbConn == null) {
    		System.err.println("Database connection is not available!");
    		return null;
    	}
    	
        String sql = "SELECT * FROM watch WHERE watch_ID != ? LIMIT ?";
        List<WatchModel> relatedProducts = new ArrayList<>();

        try (
             PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            
            stmt.setInt(1, excludeProductId);
            stmt.setInt(2, limit);
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                WatchModel watch = new WatchModel();
                watch.setId(rs.getInt("watch_ID"));
                watch.setName(rs.getString("name"));
                watch.setPrice(rs.getInt("price"));
                watch.setImageURL(rs.getString("image_url"));
                watch.setDescription(rs.getString("description"));
                relatedProducts.add(watch);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return relatedProducts;
    }
    
    




}
