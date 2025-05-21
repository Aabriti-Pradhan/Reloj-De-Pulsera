package com.relojdepulsera.model;

public class OrderModel {
	
	private int id;
	private int total_amt;
	private int date;
	private String status;
	private int user_id;
	
	
	public OrderModel() {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int Id) {
		this.id = Id;
	}
	
	public int getTotal_amt() {
		return total_amt;
	}

	public void setTotal_amt(int Total_amt) {
		this.total_amt = Total_amt;
	}
	
	public int getDate() {
		return date;
	}

	public void setDate(int Date) {
		this.date = Date;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String Status) {
		this.status = Status;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int User_id) {
		this.user_id = User_id;
	}
	
	

}
