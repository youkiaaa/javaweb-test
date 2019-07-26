<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html>
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    function check(form) {
        if(document.forms.loginForm.userName.value==""){
            alert("请输入用户名");
            document.forms.loginForm.userName.focus();
            return false;
        } else if (document.forms.loginForm.password.value==""){
            alert("请输入用户密码");
            document.forms.loginForm.password.focus();
            return false;
        }
    }
</script>
<body>
<section class="main">
    <div class="layer">
        <div class="content-view">
            <div class="content-bottom">
                <form action="LoginServlet" method="post" name="loginForm">
                    <div class="field-group">
                        <div class="input_file">
                            <input type="text" class="form-control" style="height: 40px;border-radius: 35px;" name="tel" placeholder="用户名" id="tel" value="" required/>
<%--                            <input name="text1" id="text1" type="text" value="" placeholder="用户名" required>--%>
                        </div>
                    </div>
                    <div class="field-group">
                        <div class="input_file">
                            <input type="password" name="password" id="password" style="height: 40px;border-radius: 35px" class="form-control" placeholder="密码" required/>
<%--                            <input name="password" id="myInput" type="password" placeholder="密码">--%>
                        </div>
                    </div>
                    <div class="wthree-field">
                        <div align="left">
                            <button type="submit" class="left_btn" id="left_btn" onclick="check(this);">注册</button>
                        </div>
                        <div align="right">
                            <button type="submit" class="right_btn" id="right_btn" onclick="check(this);">登录</button>
                        </div>
                    </div>
                    <ul class="list-login">
                        <li class="switch-agileits">
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider round" style="color:black" ></span>
                                记住密码
                            </label>
                        </li>
                        <li>
                            <a href="#" class="text-right">忘记密码</a>
                        </li>
                        <li class="clearfix"></li>
                    </ul>
                </form>
                <script>
                    var msg = '<%=request.getAttribute("msg")%>';
                    if(msg=="null"){
                        alert("请登录！");
                    }
                </script>
            </div>
        </div>
    </div>
</section>

</body>
</html>
