package com.atyume.servlet;

import com.atyume.model.Car;
import com.atyume.model.CarItem;
import com.atyume.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ListServlet")
public class ListServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 设置编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取输出流
        PrintWriter out = response.getWriter();

        // 获取session，如果使用JSESSIONID没有找到则创建一个
        HttpSession session = request.getSession();
        // 获取session中属性名为car的对象
        Car car = (Car) session.getAttribute("cart");
        // 如果car对象为空，表示还没创建购物车，如果不为空，就表示有购物车，可以依次输出其内容
        if (car != null) {
//            for (CarItem carItem : car.list()) {
            System.out.println("jinbulaiaaaaaaaa");
                request.getRequestDispatcher("jsp/car.jsp").forward(request, response);

//                out.println("商品：" + carItem.getProduct() + " 数量：" + carItem.getNumber() + " <a href='/delete?id=" + carItem.getId() + "'>删除</a>");
//                out.println("<hr>");
//            }
        }
        else {
             out.println("还没购物车，所以没内容");
        }
    }
}