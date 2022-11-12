<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>服饰</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/proList.css"/>
	</head>

	<body>
		<!------------------------------head------------------------------>

		<%@ include file="topbar.jsp"%>

		<!------------------------------banner------------------------------>
		<div class="banner">
			<a href="#"><img height="400px" src="img/image/yifu.jpg"/></a>
		</div>
		<!-----------------address------------------------------->
		<div class="address">
			<div class="wrapper clearfix">
				<a href="index.html">首页</a>
				<span>/</span>
				<a href="decoration.jsp" class="on">服饰</a>
			</div>
		</div>
		<!-------------------current---------------------->
		<div class="current">
			<div class="wrapper clearfix">
				<h3 class="fl">服饰</h3>
				<div class="fr choice">
					<p class="default">排序方式</p>
					<ul class="select">
						<li>新品上市</li>
						<li>销量从高到低</li>
						<li>销量从低到高</li>
						<li>价格从高到低</li>
						<li>价格从低到高</li>
					</ul>
				</div>
			</div>
		</div>
		<!----------------proList------------------------->
		<ul class="proList wrapper clearfix">
			<c:if test="${empty requestScope.goodsList}">
				<c:redirect url="goods?method=findAll1&page=1"></c:redirect>
			</c:if>
			<c:forEach items="${requestScope.goodsList}" var="g">
				<li>
					<a href="goods?method=showInfo&g_id=${g.g_id}">
						<dl>
							<dt><img src="${g.g_url}"></dt>
							<dd>${g.g_name}</dd>
							<dd>￥${g.g_price}</dd>
						</dl>
					</a>
				</li>
			</c:forEach>
		</ul>
		<div  style="margin-left:650px; width:300px; height:40px;" >
			<a href="goods?method=findAll1&page=1"><input type="button" value="首页" style="width:80px; height: 40px"/></a>

			<c:if test="${requestScope.page==1}" >
				<a href="javascript:;"><input type="button" value="上一页" style="width:100px; height: 40px"/></a>

			</c:if>
			<c:if test="${requestScope.page!=1}" >
				<a href="goods?method=findAll1&page=${page-1}"><input type="button" value="上一页" style="width:100px; height: 40px"/></a>
			</c:if>


			<a href="goods?method=findAll1&page=${page+1}"><input type="button" value="下一页" style="width:100px; height: 40px"/></a>
		</div>

		<%@include file="footer.jsp"%>

		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
