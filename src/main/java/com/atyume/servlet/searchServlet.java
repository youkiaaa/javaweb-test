package com.atyume.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import net.sf.json.JSONArray;

@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static List<String> datas = new ArrayList<String>();

    static {
        datas.add("T恤");
        datas.add("短裙");
        datas.add("裤子");
        datas.add("帽子");
        datas.add("鞋子");
        datas.add("袜子");
        datas.add("外套");
        datas.add("腰带");
    }

    /**
     * @see HttpServlet#HttpServlet()
     */
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("search");
        // TODO Auto-generated method stub
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String txt = request.getParameter("searchdata");
        System.out.println(txt);
        List<String> listdata = getData(txt);
        System.out.println("listdata="+listdata);
        System.out.println("search");
        if(txt.equals(listdata.get(0))){
            request.getRequestDispatcher("jsp/addgoods.jsp").forward(request, response);
        }
        else{
            request.setAttribute("msg", "nullinput");
            request.getRequestDispatcher("jsp/shopping.jsp").forward(request, response);
        }
//        // 返回json,以流的形式写到前台
//        response.getWriter().write(JSONArray.fromObject(listdata).toString());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    //获取假数据中符合条件的值
    public List<String> getData(String txt) {
        List<String> list = new ArrayList<String>();
        for (String data : datas) {
            if (data.equals(txt)) {
                list.add(data);
            }
        }
        System.out.println("list="+list);
        return list;
    }
}
