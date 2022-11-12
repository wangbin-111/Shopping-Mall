<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>个人信息</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/myorder.css" />
	</head>
	<body>
		<!------------------------------head------------------------------>
		<%@ include file="top2.jsp"%>
		<!------------------------------idea------------------------------>
		<div class="address mt">
			<div class="wrapper clearfix">
				<a href="index.jsp" class="fl">首页</a>
				<span>/</span>
				<a href="myorderq.jsp" class="on">我的订单</a>
				<span>/</span>
				<a href="#" class="on">订单详情</a>
			</div>
		</div>
		
		<!------------------------------Bott------------------------------>
		<div class="Bott">
			<div class="wrapper clearfix">
				<%@ include file="mygZuo.jsp"%>

				<div class="you fl">
					<div class="my clearfix">
						<h2>订单详情<a href="#">请谨防钓鱼链接或诈骗电话，了解更多&gt;</a></h2>
						<h3>订单号：<span>${requestScope.orderInfo.orders.ordernum}</span></h3>
					</div>
					<div class="orderList">
						<div class="orderList1">
							<h3>已收货</h3>
							<c:forEach items="${requestScope.orderInfo.goods}" var="og" varStatus="oo">
								<div class="clearfix" style="position: relative">
									<a href="#" class="fl"><img style="height: 80px;width: 60px" src="${og.g_url}"/></a>
									<p class="fl"><a href="#">${og.g_name}</a><a href="#">¥${og.g_price}*${requestScope.orderInfo.orders.count.split(",")[oo.index]}</a></p>

									<p style="position: absolute;top: 30px;left: 79px">类 型： ${requestScope.orderInfo.orders.type.split(",")[oo.index]}</p>

								</div>
							</c:forEach>
						</div>
						<div class="orderList1">

							<h3>收货信息</h3>
							<p>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<span>${requestScope.ship.ship_name}</span></p>
							<p>联系电话：<span>${requestScope.ship.ship_num.substring(0,3)}****${requestScope.ship.ship_num.substring(7)}</span></p>
							<p>收货地址：<span>${requestScope.ship.ship_address} ${requestScope.ship.ship_da}</span></p>
						</div>
						<div class="orderList1">
							<h3>支付方式及送货时间</h3>
							<p>支付方式：<span>${requestScope.orderInfo.orders.paytype}</span></p>
							<p>送货时间：<span>不限送货时间</span></p>
						</div>
						<div class="orderList1 hei">
							<h3><strong>商品总价：</strong><span>¥${requestScope.orderInfo.orders.allmoney}</span></h3>
							<p><strong>运费：</strong><span>¥0</span></p>
							<p><strong>订单金额：</strong><span>¥${requestScope.orderInfo.orders.allmoney}</span></p>
							<p><strong>实付金额：</strong><span>¥${requestScope.orderInfo.orders.allmoney}</span></p>
						</div>
						
					</div>
					
					
				</div>
			</div>
		</div>
		<
		
		<!--返回顶部-->
	<%@include file="footer.jsp" %>

		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
