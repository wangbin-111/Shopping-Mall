<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>个人信息</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mygrxx.css" />
	</head>
	<style>
		.card{
			display: inline-block;
			background-color: rgba(255, 255, 255, 4);
			width: 60px;
			height: 41px;
			line-height: 41px;
			position: absolute;
			margin-left: 8px;
			text-align: center;
			font-size: 20px;
			font-family: Georgia, 'Times New Roman', Times, serif;
			border: 1px solid rgba(0,0,0,.6);
			top: 420px;
			left: 850px;
		}
	</style>
	<body>
		<!------------------------------head------------------------------>
		<%@ include file="top2.jsp"%>
		<!------------------------------idea------------------------------>
		<div class="address mt">
			<div class="wrapper clearfix">
				<a href="index.jsp" class="fl">首页</a>
				<span>/</span>
				<a href="mygxin.jsp" class="on">个人信息</a>
			</div>
		</div>
		<!------------------------------Bott------------------------------>
		<div class="Bott">
			<div class="wrapper clearfix">

	<%@ include file="mygZuo.jsp"%>

	<div class="you fl">
					<h2>修改密码</h2>
					<form action="user?method=updateUserPwd&id=${sessionScope.user.u_id}"  method="post" class="remima"  onsubmit="return flag">
						<p><span>验证身份方式：</span>密码验证</p>
						<p><span>原密码：</span><input name="oldpassword"  type="text" />${msg}</p>
						<p class="op">输入原密码</p>
						<p><span>新密码：</span><input name="password"  type="text" /></p>
<%--						<p class="op">6-16 个字符，需使用字母、数字或符号组合，不能使用纯数字、纯字母、纯符号</p>--%>
						<p><span>重复新密码：</span><input name="qrpassword" type="text" /></p>
						<p class="op">请再次输入密码</p>
						<p><span>验证码：</span><input type="text" name="card"/><p class="card"></p></p>
						<p class="op">按右图输入验证码，不区分大小写</p>
						<input type="submit" value="提交" onclick="reg()"/>
					</form>
				</div>
			</div>
		</div>
		
		<!--返回顶部-->
		<div class="gotop">
			<a href="cart.jsp">
			<dl>
				<dt><img src="img/gt1.png"/></dt>
				<dd>去购<br />物车</dd>
			</dl>
			</a>
			<a href="#" class="dh">
			<dl>
				<dt><img src="img/gt2.png"/></dt>
				<dd>联系<br />客服</dd>
			</dl>
			</a>
			<a href="mygxin.jsp">
			<dl>
				<dt><img src="img/gt3.png"/></dt>
				<dd>个人<br />中心</dd>
			</dl>
			</a>
			<a href="#" class="toptop" style="display: none">
			<dl>
				<dt><img src="img/gt4.png"/></dt>
				<dd>返回<br />顶部</dd>
			</dl>
			</a>
			<p>400-800-8200</p>
		</div>
		<!--footer-->
		<div class="footer">
			<div class="top">
				<div class="wrapper">
					<div class="clearfix">
						<a href="#2" class="fl"><img src="img/foot1.png"/></a>
						<span class="fl">7天无理由退货</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="img/foot2.png"/></a>
						<span class="fl">15天免费换货</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="img/foot3.png"/></a>
						<span class="fl">满599包邮</span>
					</div>
					<div class="clearfix">
						<a href="#2" class="fl"><img src="img/foot4.png"/></a>
						<span class="fl">手机特色服务</span>
					</div>
				</div>
			</div>
			<p class="dibu">最家家居&copy;2013-2017公司版权所有 京ICP备080100-44备0000111000号<br />
			违法和不良信息举报电话：400-800-8200，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</p>
		</div>
		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
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
				// 判断两次密码是否相同
				if(pwd!=qrpwd){
					alert("两次密码不匹配")
					flag=false;
				}else{
					if(card.innerHTML!=card1){
						alert("验证码错误")
						flag=false;
					}
				}
			}
			//   验证码切换
			card.onclick=function(){
				var a=Math.floor(Math.random()*8999)+1000
				card.innerHTML=a
			}

		</script>
	</body>
</html>
