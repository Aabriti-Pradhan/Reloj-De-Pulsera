package com.relojdepulsera.model;

/**
 * @author Aabriti Pradhan
 */


public class UserModel {
	
	private int id;
	private String firstname;
	private String lastname;
	private String username;
	private String email;
	private String phone;
	private String password;
	private String role;
	private String address;
	private String imageURL;
	
	public UserModel() {
	}

	public UserModel(String username, String pasword) {
		this.username = username;
		this.password = pasword;
	}

	public UserModel(int id, String Firstname, String Lastname, String Password, String Email,
			String Phone, String Address, String Role, String Username, String ImageURL) {
		super();
		this.id = id;
		this.firstname = Firstname;
		this.lastname = Lastname;
		this.username = Username;
		this.email = Email;
		this.phone = Phone;
		this.password = Password;
		this.role = Role;
		this.address = Address;
		this.imageURL = ImageURL;
	}

	public UserModel(String Firstname, String Lastname, String Password, String Email,
			String Phone, String Address, String Role, String Username, String ImageURL) {
		this.firstname = Firstname;
		this.lastname = Lastname;
		this.username = Username;
		this.email = Email;
		this.phone = Phone;
		this.password = Password;
		this.role = Role;
		this.address = Address;
		this.imageURL = ImageURL;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstname;
	}

	public void setFirstName(String firstName) {
		this.firstname = firstName;
	}

	public String getLastName() {
		return lastname;
	}

	public void setLastName(String lastName) {
		this.lastname = lastName;
	}

	public String getUserName() {
		return username;
	}

	public void setUserName(String userName) {
		this.username = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getrole() {
		return role;
	}

	public void setrole(String role) {
		this.role = role;
	}
	
	public String getaddress() {
		return address;
	}

	public void setaddress(String address) {
		this.address = address;
	}
	
	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String ImageURL) {
		this.imageURL = ImageURL;
	}

}
