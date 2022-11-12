<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
	</head>
	<style>
		.card{
			display: inline-block;
			background-color: rgba(255, 255, 255, 4);
			width: 110px;
			height: 41px;
			line-height: 41px;
			position: absolute;
			margin-left: 8px;
			text-align: center;
			font-size: 20px;
			font-family: Georgia, 'Times New Roman', Times, serif;
		}

	</style>
	<body>
		<!-------------------reg-------------------------->
		<div class="reg">
			<form action="user?method=add" name="f" method="post"  onsubmit="return flag">
				<h1><a href="index.jsp"><img style="height: 93px;width: 270px;margin: -20px 0 0 0;opacity: .3" src="img/sb/sb.jpg"/></a></h1>
				<p>用户注册</p>
				<p><input type="text" name="email" placeholder="请输入邮箱"></p>
				<p><input type="password" maxlength="20" style="padding-left:7px ;font-size: 20px" name="password" placeholder="请输入密码"></p>
				<p><input type="password" maxlength="20"  style="padding-left:7px ;font-size: 20px" name="qrpassword" placeholder="请确认密码"></p>
				<p class="txtL txt"><input class="code" type="text" name="card" value="" placeholder="验证码"><span class="card"></span></p>
				<p> <input type="submit" value="注册" onclick="reg()"></p>
				<p class="txtL txt">完成此注册，即表明您同意了我们的<a href="#"> <使用条款和隐私策略> </a></p>
				<p class="txt"><a  href="login.jsp"><span></span>已有账号登录</a></p>
			</form>
		</div>
	</body>
	<script>
		var card=document.querySelector(".card")

		var flag=true;

		window.onload=function(){
				var a=Math.floor(Math.random()*8999)+1000
				card.innerHTML=a
			
		}
		  	function reg(){
				let pwd=document.getElementsByName("password")[0].value;
				let qrpwd=document.getElementsByName("qrpassword")[0].value;
				let card1=document.getElementsByName("card")[0].value;
				let email=document.getElementsByName("email")[0].value;

				var reg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/

				if(reg.test(email)){
					// 判断两次密码是否相同
					if(pwd!=qrpwd){
						alert("两次密码不匹配")
						flag=false;
					}else{
						if(card.innerHTML!=card1){
							alert("验证码错误")
							flag=false;
						}else {
							flag=true;
						}
					}
				}else{
					alert("邮箱格式不正确")
					flag=false;

				}
			  }
			//   验证码切换
			  card.onclick=function(){
				var a=Math.floor(Math.random()*8999)+1000
				card.innerHTML=a
			  }

	</script>
</html>
