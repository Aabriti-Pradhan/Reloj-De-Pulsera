package com.relojdepulsera.model;

public class WatchModel {
	
	private int id;
	private String name;
	private int catid;
	private int price;
	private String desc;
	private int stock;
	private String imageURL;
	
	public WatchModel() {
		
	}
	
	public WatchModel(String Name, int Price, String ImageURL) {
		this.name = Name;
		this.price = Price;
		this.imageURL = ImageURL;
	}
	
	public WatchModel(int Id, String Name, int Catid, int Price, String Discription, int Stock, String ImageURL) {
		this.id = Id;
		this.name = Name;
		this.catid = Catid;
		this.price = Price;
		this.desc = Discription;
		this.stock = Stock;
		this.imageURL = ImageURL;
	}
	
	public WatchModel(String Name, int Catid, int Price, String Discription, int Stock, String ImageURL) {
		this.name = Name;
		this.catid = Catid;
		this.price = Price;
		this.desc = Discription;
		this.stock = Stock;
		this.imageURL = ImageURL;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int Id) {
		this.id = Id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String Name) {
		this.name = Name;
	}
	
	public int getCategoryID() {
		return catid;
	}

	public void setCategoryID(int Catid) {
		this.catid = Catid;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int Price) {
		this.price = Price;
	}
	
	public String getDescription() {
		return desc;
	}

	public void setDescription(String Description) {
		this.desc = Description;
	}
	
	public int getStock() {
		return stock;
	}

	public void setStock(int Stock) {
		this.stock = Stock;
	}
	
	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String ImageURL) {
		this.imageURL = ImageURL;
	}

}
