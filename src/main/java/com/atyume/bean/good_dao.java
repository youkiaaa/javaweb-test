package com.atyume.bean;

import com.atyume.model.CarItem;

import java.sql.*;

public class good_dao {
    public void add_good(CarItem carItem) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            //调用JDBC_Connection类的getConnection方法连接数据库
            conn = my_dao.getConnection();
            //添加数据库的SQL语句
            String sql = "insert into GoodItem(car_no,good_id,buy_number)values(?,?,?)";
            pstm = conn.prepareStatement(sql);
            //把添加的id值存入pstm对象中，int类型的值用setInt方法
            pstm.setString(1, carItem.getId());
            pstm.setString(2, carItem.getProduct());
            pstm.setInt(3, carItem.getNumber());
            pstm.executeUpdate();        //提交pstm对象

            System.out.println("添加成功!添加的内容如下：");
            System.out.println("id:" + carItem.getId() + "\t name:" + carItem.getProduct()
                    + "\t age:" + carItem.getNumber());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            my_dao.free(rs, conn, pstm);
        }
    }
}
