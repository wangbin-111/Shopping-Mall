<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
	</head>
	<body>
		<!-------------------login-------------------------->
		<div class="login">
			<form action="user?method=login" method="post">
				<h1><a href="index.jsp"><img style="height: 93px;width: 270px;margin: -20px 0 0 0" src="img/sb/sb.jpg"/></a></h1>
				<p></p>
				<c:if test="${empty msg}">
					<div class="msg-warn hide"><b></b>公共场所不建议自动登录，以防账号丢失</div>

				</c:if>
				<c:if test="${!empty msg}">
					<div class="msg-warn hide"><b></b>账号或密码错误，请重新登录</div>
				</c:if>
				<p><input type="text" name="username" placeholder="邮箱"></p>

				<p><input maxlength="20" type="password" name="password" style="padding-left:7px ;font-size: 20px;border: 1px solid rgba(1,1,1,.2)" placeholder="密码"></p>
				<p><input type="submit"  value="登  录"></p>
				<p class="txt"><a class="" href="reg.jsp">免费注册</a></p>
<%--				<a href="forget.jsp">忘记密码？</a>--%>
			</form>
		</div>
		
	</body>
</html>
