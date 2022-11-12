<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>个人信息</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mygxin.css" />
	</head>
	<body>
		<!------------------------------head------------------------------>
		<%@ include file="top2.jsp"%>
		<!------------------------------idea------------------------------>
		<div class="address mt" id="add">
			<div class="wrapper clearfix">
				<a href="index.jsp" class="fl">首页</a>
				<span>/</span>
				<a href="mygxin.jsp" class="on">个人中心</a>
			</div>
		</div>
		
		<!------------------------------Bott------------------------------>
		<div class="Bott">
			<div class="wrapper clearfix">
<%--页面引入--%>
				<%@ include file="mygZuo.jsp"%>


	<c:if test="${empty requestScope.daicount&& empty requestScope.msg}">
		<c:redirect url="goods?method=showOrderCount&u_id=${sessionScope.user.u_id}"></c:redirect>
	</c:if>
				<div class="you fl">
					<div class="tx clearfix">
						<div class="fl clearfix">
							<a href="#" class="fl"><img style="width: 92px ;height: 92px;border-radius: 50%" src="${sessionScope.user.headimg}"/></a>
							<p class="fl"><span>${sessionScope.user.name}</span><a href="mygrxx.jsp">修改个人信息></a></p>
						</div>
						<div class="fr">绑定邮箱:${sessionScope.user.email.substring(0,3)}****</div>
					</div>
					<div class="bott">
						<div class="clearfix">
							<a href="#" class="fl"><img src="img/gxin2.jpg"/></a>
							<p class="fl"><span>待收货的订单：<strong>${requestScope.daicount}</strong></span>
								<a href="goods?method=showDai">查看待收货订单></a>
							</p>
						</div>
						<div class="clearfix">
							<a href="#" class="fl"><img src="img/gxin3.jpg"/></a>
							<p class="fl"><span>待评价的订单：<strong>${requestScope.yicount}</strong></span>
								<a href="goods?method=showYi">查看待评价订单></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%@include file="footer.jsp"%>

		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
		
	</body>
</html>
