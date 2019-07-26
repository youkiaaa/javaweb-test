package com.atyume.bean;

import java.sql.*;

public class my_dao {
    private static String className="com.mysql.jdbc.Driver"; //驱动名
    private static String url= "jdbc:mysql://localhost:3306/data_test"; //连接数据库的URL地址
    private static String username= "root"; //数据库的用户名
    private static String password= "123456"; //数据库的密码
    static{
        try {
            Class.forName(className);
        } catch (ClassNotFoundException e) {
            System.out.println("加载数据库驱动程序失败！");
            e.printStackTrace();
        }
    }
    public static Connection getConnection(){
        Connection conn = null;
        try{
            //使用DriverManager来获取连接
            conn = (Connection)DriverManager.getConnection(url,username,password);
            System.out.println("连接数据库成功!");
        }catch(SQLException e){
            e.printStackTrace();
        }
        return conn;
    }
    public static void free(ResultSet rs,Connection conn,Statement stmt){
        try{
            if(rs != null)
                rs.close();                        //关闭结果集
        }catch(SQLException e){
            System.out.println("关闭ResultSet失败!");
            e.printStackTrace();
        }finally{

            try{
                if(conn != null)
                    conn.close();                //关闭连接
            }catch(SQLException e){
                System.out.println("关闭Connection失败!");
                e.printStackTrace();
            }finally{
                try{
                    if(stmt != null)
                        stmt.close();            //关闭Statement对象
                }catch(SQLException e){
                    System.out.println("关闭Statement失败!");
                    e.printStackTrace();
                }
            }
        }
    }
}