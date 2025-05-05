package com.relojdepulsera.model;

public class CategoryModel {
	
	private int id;
    private String name;
    
    public CategoryModel() {
    	
    }
    
    public CategoryModel(int ID, String Name) {
    	super();
    	this.id = ID;
    	this.name = Name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
