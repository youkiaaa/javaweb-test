<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>shopping</title>
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
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<div class="shop_main">
    <div class="id_style">
        <%String username = request.getSession().getAttribute("userid").toString();%>
        您好，<%=username %>
        <button type="submit" class="bttn" onclick="exit_login()"><a href="<%=basePath%>/index.jsp">退出</a></button>
    </div>
    <script>
        function exit_login(){
            $.ajax({
                type : "POST",
                url : "LogoutServlet",
                success : function(result) {
                    alert(result.d);
                }
            });
            /*xmlHttp = creatXMLHttp();
            //alert(xmlHttp);
            //要给服务器发送数据
            var url = "LogoutServlet";
            xmlHttp.open("POST",url,true);
            xmlHttp.onreadystatechange = callback;
            xmlHttp.send(null);*/
        }
    </script>
    <script>
        var msg = '<%=request.getAttribute("msg")%>';
        if(msg=="nullinput"){
            alert("请输入信息！");
        }
    </script>
    <div class="shopping_title">
        <h2>Priate Pages</h2>
    </div>
    <div style="padding: 3% 0 0 35%;">
        <form action="searchServlet" method="get" class="bs-example bs-example-form" role="form">
            <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" id="txt" class="form-control" name="searchdata" placeholder="请输入">
                        <span class="input-group-btn">
						<button class="btn btn-default" type="submit" id="btn"  onblur="outFouce()">
							搜索
						</button>
					</span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
        </form>
    </div>
    <div class="show_goods">
        <dl>
            <dd style="float: left;">
                <img src="<%=basePath%>/images/1.jpg"/>
            </dd>
            <dd style="float: right;">
                <img src="<%=basePath%>/images/2.jpg"/>
            </dd>
        </dl>
    </div>

</div>
<!-- jquery -->
<script type="text/javascript">
    var xmlHttp;
    function getMoreContents() {
        var content=document.getElementById("keyword");
        if(content.value==""){
            ClearContent();
            return;//如果不设置，传到后台的是空值，所有的值都会被输出
        }
        xmlHttp=creatXMLHttp();
        //alert(xmlHttp);
        //要给服务器发送数据
        var url="searchServlet?name="+escape(content.value);
        xmlHttp.open("GET",url,true);
        xmlHttp.onreadystatechange=callback;
        xmlHttp.send(null);
    }
    //获取XMLHttp对象
    function creatXMLHttp() {
        var xmlHttp;
        if(window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
        }
        if(window.ActiveXObject)
        {
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            if(!xmlHttp){
                xmlHttp=new ActiveXOject("Msxml2.XMLHTTP");
            }
        }
        return xmlHttp;
    } //获取XMLHttp对象
    function callback() {
        if(xmlHttp.readyState==4 && xmlHttp.status==200){
            var result=xmlHttp.responseText;
            //解析数据
            var json=eval("("+result+")");
            //动态显示数据，线束数据在输入框对的下面
            setContent(json);
        }
    }
    //设置关联数据的展示
    function setContent(contents) {
        ClearContent();
        var size=contents.length;
        for(var i=0;i<size;i++)
        {
            var nextNode=contents[i];//json格式的第i个数据
            var li =document.createElement("li");
            li.onmouseover=function(){
                this.className="onmouse";
                document.getElementById("keyword").value=this.innerHTML;
            }
            li.onmouseout=function(){
                this.className="outmouse";
            }
            var text=document.createTextNode(nextNode);
            li.appendChild(text);
            document.getElementById("c").appendChild(li);
        }
    }
    //清空数据
    function ClearContent() {
        document.getElementById("c").innerHTML="";
    }
    //当控件失去焦点时，清空数据
    function outFouce() {
        ClearContent();
    }
    //获得焦点时，
</script>
</body>
</html>
