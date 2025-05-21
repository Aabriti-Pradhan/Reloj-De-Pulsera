package com.relojdepulsera.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.relojdepulsera.config.DBconfig;
import com.relojdepulsera.model.WatchModel;

public class AdminProductService {

    public List<WatchModel> getAllWatches() {
        List<WatchModel> watchList = new ArrayList<>();

        String sql = "SELECT watch_ID, name, category_ID, price, description, stock_quantity, image_url FROM watch";

        try (Connection conn = DBconfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                WatchModel watch = new WatchModel();
                watch.setId(rs.getInt("watch_ID"));
                watch.setName(rs.getString("name"));
                watch.setCategoryID(rs.getInt("category_ID"));
                watch.setPrice(rs.getInt("price"));
                watch.setDescription(rs.getString("description"));
                watch.setStock(rs.getInt("stock_quantity"));
                watch.setImageURL(rs.getString("image_url"));

                watchList.add(watch);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return watchList;
    }
}
