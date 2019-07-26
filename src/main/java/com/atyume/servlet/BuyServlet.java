package com.atyume.servlet;

import com.atyume.model.Car;
import com.atyume.model.CarItem;
import com.atyume.model.Good;
import com.atyume.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
    private static Map<String,CarItem> map=new LinkedHashMap<>();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 设置编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取打印流
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");    //获取到商品编号
        int intName = Integer.parseInt(name);
        // 通过JSESSIONID,获取session对象，如果没有获取到，则新创建一个session对象
        HttpSession session = request.getSession();
        // 在session中获取user属性的对象
        // 在session中获取car属性的对象
        Car car = (Car) session.getAttribute("cart");
        Cookie cookie = new Cookie("JSESSIONID",session.getId());
        cookie.setMaxAge(60*60&24);
        response.addCookie(cookie);
        String[] products = new String[]{"超短裙", "百褶裙", "A字裙", "包臀裙"};
        Double[] prices = new Double[]{55.5, 57.9,56.0, 99.7};
        // 如果购物车为空，则创建一个购物车，并添加到Session
        if (car == null) {
            car = new Car();
            session.setAttribute("cart", car);
        }

        Good good=new Good();
        good.setId(products[intName]);
        good.setPrice(prices[intName]);

        CarItem carItem = new CarItem();
        carItem.setId(name);
        carItem.setProduct(products[intName]);
        carItem.setNumber(1);
        carItem.setGood(good);

        car.add(good);

        map.put(good.getId(),carItem);

        car.setCar(map);
        session.setAttribute("shoplist",map);
        request.getRequestDispatcher("jsp/guodu.jsp").forward(request, response);
//        out.println("加入购物车成功<br/>");
//        String path = request.getContextPath()+"/LoginServlet";
//        System.out.println("buypath:"+path);
//        out.println("<a href='jsp/shopping.jsp'>继续购买</a><br/>");
//        out.println("<a href='/ListServlet'>购物车</a><br/>");
    }

}