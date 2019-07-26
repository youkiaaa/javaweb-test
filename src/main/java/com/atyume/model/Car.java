package com.atyume.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Car {
    private Map<String,CarItem> list = new LinkedHashMap<>();
    private String number;
    public String getNum(){
        return number;
    }
    public void setNum(String number){
        this.number=number;
    }
    /**
     * 获取购物车中的所有购物车项
     * @return 包含所有购物车项的List
     */
    public Map<String, CarItem> getlist() {
        return list;
    }

    public void setCar(Map<String, CarItem> list) {
        this.list=list;
    }

    /**
     * 添加购物车项到购物车
     */
    public void add(Good good){              //获取得到购物项
        CarItem cartItem =list.get(good.getId());

        //判断购物车是否存在该购物项，如果不存在
        if (cartItem == null) {

            //创建这个购物项对象
            cartItem = new CarItem();

            //将用户传递过来的书籍作为购物项
            cartItem.setGood(good);

            //把该购物项的数量设置为1
            cartItem.setNumber(1);

            //把购物项加入到购物车去
            list.put(good.getId(), cartItem);
        } else {

            //如果存在该购物项，将购物项的数量+1
            cartItem.setNumber(cartItem.getNumber() + 1);
        }
}
    public double getPrice() {

        double totalPrice = 0;

        for (Map.Entry<String, CarItem> me : list.entrySet()) {

            //得到每个购物项
            CarItem cartItem = me.getValue();

            //将每个购物项的钱加起来，就是购物车的总价了！
            totalPrice += cartItem.getPrice();
        }

        return totalPrice;
    }
    /**
     * 从购物车中删除购物车项
     * @param id 需要删除的购物车项ID
     */
    public void remove(String id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId().equals(id)) {
                list.remove(i);
                break;
            }
        }
    }

}
