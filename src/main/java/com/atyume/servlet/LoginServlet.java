package com.atyume.servlet;

import com.atyume.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("hello");
        request.setCharacterEncoding("utf-8");
        User user=new User();
        String username=request.getParameter("tel");      //使用的是name
        String password=request.getParameter("password");
        user.setTel(username);
        user.setPass(password);
        String path=request.getContextPath();
        //判断
        if (username == null || password == null) {
            request.setAttribute("msg", "null");
        } else {
            if (username.equals("18359736039") && password.equals("123456")) {
                /* 登录成功 */
                // 将登录状态保存到session对象中
                request.getSession().setAttribute("userid", username);
                request.getRequestDispatcher("jsp/shopping.jsp").forward(request, response);
            }else{
                /* 登录失败 */
                // 将登录状态修改为失败
                request.getSession().setAttribute("userid", "login_error");
                request.setAttribute("msg", "null");
                //request.getRequestDispatcher("/index.jsp").forward(request, response);
                response.sendRedirect("/index.jsp");
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
