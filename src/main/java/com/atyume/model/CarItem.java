package com.atyume.model;

public class CarItem {
    private Good good;
    private String id;
    private String product;
    private Integer number;
    private double price;
    public double getPrice() {
        return good.getPrice() * this.number;
    }
    public void setGood(Good good){
        this.good=good;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}
