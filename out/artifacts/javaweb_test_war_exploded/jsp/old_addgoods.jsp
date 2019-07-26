<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>添加商品</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<div class="id_style" style="width: 100%;">
    <div style="float: left;">
        <%String username = request.getSession().getAttribute("userid").toString();%>
        hello，<%=username %>
        <button type="submit" onclick="exit_login()"><a href="<%=basePath%>/index.jsp">exit</a></button>
    </div>
    <div style="float: right;margin-right: 5%">
        <a href="<%=basePath%>ListServlet">shopcart</a>
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
<table class="show_ad">
    <tr>
        <td style="margin: 20px">
            <img src="<%=basePath%>/images/1.jpg" width="300" height="200" /><br/>
            <span style="text-align: left;margin-left: 20px;">skirt1</span><a href="<%=basePath%>BuyServlet?name=0"><span style="color: red;float: right;">add list</span></a>
        </td>
        <td>
            <img src="<%=basePath%>/images/2.jpg" width="300" height="200" /><br/>
            <span style="text-align: left;margin-left: 20px;">skirt2</span><a href="<%=basePath%>BuyServlet?name=1"><span style="color: red;float: right;">add list</span></a>
        </td>
    </tr>
    <tr>
        <td>
            <img src="<%=basePath%>/images/3.jpg" width="300" height="200" /><br/>
            <span style="text-align: left;margin-left: 20px;">skkirt3</span><a href="<%=basePath%>BuyServlet?name=2"><span style="color: red;float: right;">add list</span></a>
        </td>
        <td>
            <img src="<%=basePath%>/images/4.jpg" width="300" height="200" /><br/>
            <span style="text-align: left;margin-left: 20px;">skirt4</span><a href="<%=basePath%>BuyServlet?name=3"><span style="color: red;float: right;">add list</span></a>
        </td>
    </tr>
</table>
</body>
</html>
