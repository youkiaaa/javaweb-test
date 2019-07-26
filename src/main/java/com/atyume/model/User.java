package com.atyume.model;

public class User {
    private String usename;
    private String usetel;
    private String usepassword;
    private String carnumber;
    public String getCar(){
        return carnumber;
    }
    public void setCar(String carnumber){
        this.carnumber=carnumber;
    }
    public String getName(){
        return usename;
    }
    public void setName(String name){
        this.usename=name;
    }
    public String getTel(){
        return usetel;
    }
    public void setTel(String tel){
        this.usetel=tel;
    }
    public String getPass(){
        return usepassword;
    }
    public void setPass(String password){
        this.usepassword=password;
    }

}
