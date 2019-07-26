package com.atyume.servlet;

import com.atyume.model.Car;
import com.atyume.model.CarItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/SessionBSServlet")
public class SessionBSServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");    //获取到商品编号
        int intName = Integer.parseInt(name);
        Car cart=(Car) request.getSession().getAttribute("cart");
        if (cart == null) {
            //用户第一次添加商品时
            cart = new Car();
            request.getSession().setAttribute("cart", cart);
        }
        CarItem cartService = new CarItem();

        request.getRequestDispatcher("/listcart.jsp").forward(request, response);
        String[] products = new String[]{"超短裙", "百褶裙", "A字裙", "包臀裙"};
        String productName = products[intName];
        HttpSession session = request.getSession();
        Map<String, Integer> map = (Map<String, Integer>) session.getAttribute("car");
        if (map != null) {
            Integer count = map.get(productName);
            if (count == null) {
                count = 1;
            } else {
                count++;
            }
            map.put(productName, count);
        } else {
            map = new LinkedHashMap<String, Integer>();
            map.put(productName, 1);
        }
        session.setAttribute("car", map);
        response.sendRedirect(request.getContextPath() + "/car.jsp");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
