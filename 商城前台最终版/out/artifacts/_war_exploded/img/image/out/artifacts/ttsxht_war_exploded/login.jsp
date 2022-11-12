<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/10/22
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>登录-向日葵小商店后台管理系统</title>
    <link rel="icon" href="avatar.ico" type="img/ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">

    <style>
        .lyear-wrapper {
            position: relative;
        }
        .lyear-login {
            display: flex !important;
            min-height: 100vh;
            align-items: center !important;
            justify-content: center !important;
        }
        .login-center {
            background: #fff;
            min-width: 38.25rem;
            padding: 2.14286em 3.57143em;
            border-radius: 5px;
            margin: 2.85714em 0;
        }
        .login-header {
            margin-bottom: 1.5rem !important;
        }
        .login-center .has-feedback.feedback-left .form-control {
            padding-left: 38px;
            padding-right: 12px;
        }
        .login-center .has-feedback.feedback-left .form-control-feedback {
            left: 0;
            right: auto;
            width: 38px;
            height: 38px;
            line-height: 38px;
            z-index: 4;
            color: #dcdcdc;
        }
        .login-center .has-feedback.feedback-left.row .form-control-feedback {
            left: 15px;
        }
    </style>
</head>
<body>
<div class="row lyear-wrapper">
    <div class="lyear-login">
        <div class="login-center">
            <div class="login-header text-center">
                <img style="width:400px;height: 100px" src="img/logo.jpg">
            </div>
            <form name="f" action="admi?method=login" method="post" onsubmit="return flag">
                <div class="form-group has-feedback feedback-left">
                    <input type="text" id="admiusername" placeholder="请输入您的用户名" class="form-control" name="admiusername"  />
                    <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <input type="password"  id="admipassword" placeholder="请输入密码" class="form-control" name="admipassword" />
                    <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left row">
                    <div class="col-xs-7">
                        <input type="text" id="captch" name="captcha" class="form-control" placeholder="验证码">
                        <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="col-xs-5">
                        <input type="text" name="check" id="captcha" class="form-control" onclick="checks(event)" title="点击刷新"  readonly>
                    </div>
                </div>
                <span id="err" style="color: red">${msg}</span>
                <div class="form-group">
                    <input type="submit" class="btn btn-block btn-primary" value="立即登录" onclick="checs()">
                </div>
            </form>
            <hr>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">;</script>
</body>
<script>
<%--    验证码--%>
    function checks(e){
        var Num="";
        for(var i =0;i<4;i++){
            Num+= Math.floor(Math.random()*10);
        }
        document.getElementById("captcha").value=Num;
    }
//null
var flag=true;
function checs(){
    var s = document.getElementById("admipassword");
    var k = document.getElementById("admiusername");
    var m = document.getElementById("captch");
    if(s.value.length===0||k.value.length===0||m.value.length===0){
        flag = false;
        $("#err").html("用户名/密码/验证码为空");
   }else {
        document.f.submit();
   }
}

</script>
</html>
