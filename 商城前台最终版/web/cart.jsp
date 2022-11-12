<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>cart</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/proList.css" />
	</head>
	<body>
		<!--------------------------------------cart--------------------->
		<%@ include file="top2.jsp"%>
		<div class="cart mt">
			<!-----------------logo------------------->
			<!--<div class="logo">
				<h1 class="wrapper clearfix">
					<a href="index.html"><img class="fl" src="img/temp/logo.png"></a>
					<img class="top" src="img/temp/cartTop01.png">
				</h1>
			</div>-->
			<!-----------------site------------------->
<%--			进入页面发送请求展示购物车内容--%>
			<c:if test="${empty requestScope.cartList &&empty msg}">
				<c:redirect url="user?method=FindCart&id=${sessionScope.user.u_id}">

				</c:redirect>
			</c:if>
			

			<div class="site">
				<p class=" wrapper clearfix">
<%--					<span class="fl">购物车</span>--%>
					<span class="fl" onclick="window.history.back()" style="color: #C10000;cursor: pointer">返回</span>
					<img class="top" src="img/temp/cartTop01.png">
					<a href="index.jsp" class="fr">继续购物&gt;</a>
				</p>
			</div>
			<!-----------------table------------------->
			<div class="table wrapper">
				<div class="tr">
					<div>商品</div>
					<div>单价</div>
					<div>数量</div>
					<div>小计</div>
					<div>操作</div>
				</div>
			<c:forEach items="${requestScope.cartList}" var="c" varStatus="v">
				<div class="th">
					<div class="pro clearfix">
						<label class="fl">
							<input class="g_id" type="hidden" value="${c.goods.g_id}"/>
							<input class="c_id" type="hidden" value="${c.c_id}"/>

							<input class="checkBtn" type="checkbox"/>
							<span  class="checkBtn1"></span>
						</label>
						<a class="fl" href="#">
							<dl class="clearfix">
								<dt class="fl"><img style="width: 80px;height: 100px" src="${c.goods.g_url}"></dt>
								<dd class="fl">
									<p>${c.goods.g_name}</p>
									<p>颜色分类:</p>
									<p class="c_type">${c.c_type}</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">￥${c.goods.g_price}</div>
					<div class="number">
						<p class="num clearfix">
							<img class="fl sub" src="img/temp/sub.jpg">
							<span class="fl gCount">${c.c_count}</span>
							<img class="fl add" src="img/temp/add.jpg">
						</p>
					</div>
					<div class="price sAll">￥${c.goods.g_price * c.c_count}</div>
					<div class="price"><a onclick="delFun(${c.c_id},${sessionScope.user.u_id},${v.index})" class="del" href="#">删除</a></div>
				</div>
			</c:forEach>

				<div class="goOn">空空如也~<a href="index.jsp">去逛逛</a></div>
				<div class="tr clearfix">
					<label class="fl">
						<input class="checkAll" type="checkbox"/>
						<span></span>
					</label>
					<p class="fl">
						<a href="#">全选</a>
						<a href="#" class="delAll">删除</a>
					</p>
					<p class="fr">
						<span>共<small id="sl">0</small>件商品</span>
						<span>合计:&nbsp;<small id="all">￥0.00</small></span>
<%--						<a href="order.jsp" class="count">结算</a>--%>
						<input class="u_id"  type="hidden" value="${sessionScope.user.u_id}"/>
						<a href="#" class="count  jiesuan">结算</a>

					</p>
				</div>
			</div>
		</div>

		<!--返回顶部-->
		<%@include file="footer.jsp"%>

		<!----------------mask------------------->
<%--		<div class="mask"></div>--%>

		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
	<script>

		//如果没有商品
		window.onload=function (){
			if($(".th").length==0){
				$(".table .goOn").show();
				jiesuan.onclick=function (){
					jiesuan.href="#"
				}
			}
		}
		var jiesuan=document.querySelector(".jiesuan")

		var checkBtn=document.querySelectorAll(".checkBtn")

		jiesuan.onclick=function (){
				let ctype=document.querySelectorAll(".c_type")

				let gid=document.querySelectorAll(".g_id")
				let gCount=document.querySelectorAll(".gCount")
				let u_id=document.querySelector(".u_id").value
				let cid=document.querySelectorAll(".c_id")
				var g_id="";
				var c_id="";
				var c_type="";
			var count1=" ";
				for (let j = 0; j < checkBtn.length; j++) {
					if(checkBtn[j].checked){
						g_id+=gid[j].value+","
						c_id+=cid[j].value+","
						count1+=gCount[j].innerText+","
						c_type+=ctype[j].innerHTML+","
					}
				}
			jiesuan.href="goods?method=buyGood&id="+u_id+"&g_id="+g_id.substring(0,g_id.length-1)+"&count="+count1.substring(0,count1.length-1).trim()+"&c_id="+c_id.substring(0,c_id.length-1)+"&c_type="+c_type.substring(0,c_type.length-1);
		}
		//删除购物车

		var del=document.querySelectorAll(".del")
		//批量删除按钮
		var delAll=document.querySelector(".delAll")

		function delFun(a,b,index){
			if(confirm("您是否确定将此商品从购物车删除")){
			del[index].href="goods?method=deleteCart&c_id="+a+"&u_id="+b
			}else {
				return;
			}
		}
	//	批量删除 购物车商品
		delAll.onclick=function (){
			let cid=document.querySelectorAll(".c_id")
			let u_id=document.querySelector(".u_id").value
			let c_id="";
			for (let j = 0; j < checkBtn.length; j++) {
				if(checkBtn[j].checked){
					c_id+=cid[j].value+","
				}
			}
			delAll.href="goods?method=deleteCart&c_id="+c_id.substring(0,c_id.length-1)+"&u_id="+u_id;
		}
	</script>
	</body>
</html>
