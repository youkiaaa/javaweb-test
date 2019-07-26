var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用

// 登陆
var JsonData = { tel: tel, psd: password};
//此处做为ajax内部判断
var url = "";
if(JsonData.tel == "18359736039" && JsonData.psd == "123456"){
    url = "Ajax/Login";
}else{
    url = "Ajax/LoginFalse";
}

AjaxPost(url, JsonData,
    function () {
        //ajax加载中
    },
    function (data) {
        //ajax返回
        //认证完成
        setTimeout(function () {
            $('.authent').show().animate({ right: 90 }, {
                easing: 'easeOutQuint',
                duration: 600,
                queue: false
            });
            $('.authent').animate({ opacity: 0 }, {
                duration: 200,
                queue: false
            }).addClass('visible');
            $('.login').removeClass('testtwo'); //平移特效
        }, 2000);
        setTimeout(function () {
            $('.authent').hide();
            $('.login').removeClass('test');
            if (data.Status == 'ok') {
                //登录成功
                $('.login div').fadeOut(100);
                $('.success').fadeIn(1000);
                $('.success').html(data.Text);
                //跳转操作

            } else {
                AjaxErro(data);
            }
        }, 2400);
    })

if(ajaxmockjax == 1){
    $.mockjax({
        url: 'Ajax/Login',
        status: 200,
        responseTime: 50,
        responseText: {"Status":"ok","Text":""}
    });
    $.mockjax({
        url: 'Ajax/LoginFalse',
        status: 200,
        responseTime: 50,
        responseText: {"Status":"Erro","Erro":"账号名或密码或验证码有误"}
    });
}