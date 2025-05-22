package com.relojdepulsera.model;

/**
 * @author Aabriti Pradhan
 */


public class OrderItemModel {
	
	private int item_id;
	private int order_id;
	private int watch_id;
	private int quantity;
	private int price_at_order;
	
	
	public OrderItemModel() {
		
	}
	
	public int getItem_Id() {
		return item_id;
	}

	public void setItem_Id(int Item_id) {
		this.item_id = Item_id;
	}
	
	public int getOrder_Id() {
		return order_id; 
	}

	public void setOrder_Id(int Order_Id) {
		this.order_id = Order_Id;
	}
	
	public int getWatch_Id() {
		return watch_id;
	}

	public void setWatch_Id(int Watch_Id) {
		this.watch_id = Watch_Id;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int Quantity) {
		this.quantity = Quantity;
	}
	
	public int getPrice_at_order() {
		return price_at_order;
	}

	public void setPrice_at_order(int Price_at_order) {
		this.price_at_order = Price_at_order;
	}

}
