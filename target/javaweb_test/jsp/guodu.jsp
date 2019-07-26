<%--
  Created by IntelliJ IDEA.
  User: EDZ
  Date: 2019/7/25
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>过渡</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="<%=basePath%>/css/shop.css" type="text/css" media="all">
</head>
<body class="shop_main">
<div style="margin-top: 50px;">
<h1 style="text-align: center">已成功添加进购物车</h1><br/>
<h2 style="text-align: center"><a href="<%=path%>/jsp/addgoods.jsp">继续添加</a></h2><br/>
<h2 style="text-align: center"><a href="<%=path%>/ListServlet"> 查看购物车</a></h2>
</div>
</body>
</html>
