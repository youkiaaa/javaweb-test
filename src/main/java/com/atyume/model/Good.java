package com.atyume.model;

public class Good {
    private String goodname;
    private double price;
    private String id;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName(){
        return goodname;
    }
    public void setName(String name){
        this.goodname=name;
    }
    public Double getPrice(){
        return price;
    }
    public void setPrice(Double price){
        this.price=price;
    }
}
