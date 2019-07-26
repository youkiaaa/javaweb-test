<%@ page import="java.util.Map" %>
<%@ page import="com.atyume.model.CarItem" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购物车</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="<%=basePath%>/css/shop.css" type="text/css" media="all">
</head>
<body class="shop_main">
<div class="id_style" style="width: 100%">
    <%String username = request.getSession().getAttribute("userid").toString();%>
    您好，<%=username %>
    <%System.out.println(username);%>
    <button type="submit" class="bttn" onclick="exit_login()"><a href="<%=basePath%>/index.jsp">退出</a></button>

</div>
<script>
    function exit_login(){
        xmlHttp = creatXMLHttp();
        //alert(xmlHttp);
        //要给服务器发送数据
        var url = "LogoutServlet";
        xmlHttp.open("POST",url,true);
        xmlHttp.onreadystatechange = callback;
        xmlHttp.send(null);
    }
</script>
<%Map<String, CarItem> carlist = (Map)request.getSession().getAttribute("shoplist");
    System.out.println(carlist);
%>
<h1 style="text-align: center;margin-top:10px;margin-bottom: 30px;">购物车详情</h1>
<table id="customers">
    <tr style="text-align: center;font-size:32px;border:1px solid black"><th>商品名称</th><th>商品价格</th></tr>
    <c:set value="0" var="sum" />
    <%
        Iterator<Map.Entry<String, CarItem>> it = carlist.entrySet().iterator();
        while(it.hasNext())
        {
            Map.Entry<String, CarItem> en = it.next();
    %>
    <tr style="width:50%;text-align: center;font-size: 30px;border:1px solid black;">
        <td style="width:25%;text-align: center;font-size: 30px;border:1px solid black;"><%=en.getKey()%></td>
        <td style="width:25%;text-align: center;font-size: 30px;border:1px solid black;"><%=en.getValue().getPrice()%></td>
        <c:set value="<%=en.getValue().getPrice()%>" var="item" />
        <c:set value="${sum + item}" var="sum" />
    </tr>
    <%
        }
    %>
    <tr style="width:50%;text-align: center;font-size: 30px;border:1px solid black;">
        <td style="width:25%;text-align: center;font-size: 30px;border:1px solid black;">总价</td>
        <td style="width:25%;text-align: center;font-size: 30px;border:1px solid black;">${sum}</td>
    </tr>
</table>
</body>
</html>
