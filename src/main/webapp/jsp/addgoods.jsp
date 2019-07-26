<%--
  Created by IntelliJ IDEA.
  User: EDZ
  Date: 2019/7/25
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="<%=basePath%>/css/shop.css" type="text/css" media="all">
</head>
<body class="shop_main">
<div class="id_style" style="width: 100%;margin-bottom:20px;">
    <div style="float: left;">
        <%String username = request.getSession().getAttribute("userid").toString();%>
        您好，<%=username %>
        <button type="submit" class="bttn" onclick="exit_login()"><a href="<%=basePath%>/index.jsp">退出</a></button>
    </div>
    <div style="float: right;margin-right: 5%">
        <a href="<%=basePath%>ListServlet">查看购物车</a>
    </div>
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
<table class="show_ad" >
    <tr>
        <td style="margin: 20px">
            <span><img src="<%=basePath%>/images/1.jpg" width="300" height="200" style="margin: 20px 20px 0 20px" /></span><br/>
            <span style="text-align: left;margin-left: 20px;">桔梗裙</span><a href="<%=basePath%>BuyServlet?name=0"><span style="color: red;float: right;margin-right: 20px;">加入购物车</span></a>
        </td>
        <td>
            <span><img src="<%=basePath%>/images/2.jpg" width="300" height="200" style="margin: 20px 20px 0 20px" /></span><br/>
            <span style="text-align: left;margin-left: 20px;">A字裙</span><a href="<%=basePath%>BuyServlet?name=1"><span style="color: red;float: right;margin-right: 20px;">加入购物车</span></a>
        </td>
    </tr>
    <tr>
        <td>
            <span><img src="<%=basePath%>/images/3.jpg" width="300" height="200" style="margin: 20px 20px 0 20px" /></span><br/>
            <span style="text-align: left;margin-left: 20px;">百褶裙</span><a href="<%=basePath%>BuyServlet?name=2"><span style="color: red;float: right;margin-right: 20px;">加入购物车</span></a>
        </td>
        <td>
            <span><img src="<%=basePath%>/images/4.jpg" width="300" height="200" style="margin: 20px 20px 0 20px"  /></span><br/>
            <span style="text-align: left;margin-left: 20px;">纱裙</span><a href="<%=basePath%>BuyServlet?name=3"><span style="color: red;float: right;margin-right: 20px;">加入购物车</span></a>
        </td>
    </tr>
</table>
</body>
</html>
