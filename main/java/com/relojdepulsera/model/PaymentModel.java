package com.relojdepulsera.model;

/**
 * @author Aabriti Pradhan
 */


public class PaymentModel {
	
	private int payment_id;
	private int order_id_pay;
	private int amount_paid;
	private String payment_method;
	private int payment_date;
	private String payment_status;
	
	
	public PaymentModel() {
		
	}
	
	public int getPayment_Id() {
		return payment_id;
	}

	public void setPayment_Id(int Payment_id) {
		this.payment_id = Payment_id;
	}
	
	public int getOrder_Id_Pay() {
		return order_id_pay; 
	}

	public void setOrder_Id_Pay(int Order_Id) {
		this.order_id_pay = Order_Id;
	}
	
	public int getAmount_Paid() {
		return amount_paid;
	}

	public void setAmount_Paid(int Amount_Paid) {
		this.amount_paid = Amount_Paid;
	}
	
	public String getPayment_Method() {
		return payment_method;
	}

	public void setPayment_Method(String Payment_Method) {
		this.payment_method = Payment_Method;
	}
	
	public int getPayment_Date() {
		return payment_date;
	}

	public void setPayment_Date(int Payment_Date) {
		this.payment_date = Payment_Date;
	}
	
	public String getPayment_Status() {
		return payment_status;
	}

	public void setPayment_Status(String Payment_Status) {
		this.payment_status = Payment_Status;
	}

}
