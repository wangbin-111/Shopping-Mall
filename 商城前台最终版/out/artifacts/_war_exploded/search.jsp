<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>搜索</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/proList.css"/>
	</head>
	<style>
		.page{
			width: 100%;
			height: 40px;
			text-align: center;
			font-size: 20px;
		}
		.page a{
			margin-left: 5px;
		}

		.go{
			border: 1px solid black;
			width: 50px;
		}
		.go:hover{
			background-color: crimson;
		}
	</style>
	<body>
		<!------------------------------head------------------------------>
		<%@include file="topbar.jsp"%>
		<!------------------------------搜索列表------------------------------>
<%--		<div class="schBox">--%>
<%--			<ul class="wrapper sch">--%>
<%--				<li>--%>
<%--					<h4>干花类型：</h4>--%>
<%--					<a href="#">干花枝</a>--%>
<%--					<a href="#">干花包</a>--%>
<%--					<a href="#">花瓣</a>--%>
<%--					<a href="#">树叶</a>--%>
<%--				</li>--%>
<%--				<li>--%>
<%--					<h4>摆放空间：</h4>--%>
<%--					<a href="#">摆放花卉</a>--%>
<%--					<a href="#">落地花卉</a>--%>
<%--					<a href="#">挂壁花卉</a>--%>
<%--					<a href="#">吊篮花卉</a>--%>
<%--				</li>--%>
<%--				<li>--%>
<%--					<h4>干花类型：</h4>--%>
<%--					<a href="#">干花枝</a>--%>
<%--					<a href="#">干花包</a>--%>
<%--					<a href="#">花瓣</a>--%>
<%--					<a href="#">树叶</a>--%>
<%--				</li>--%>
<%--				<li>--%>
<%--					<h4>适用对象：</h4>--%>
<%--					<a href="#">朋友/同事</a>--%>
<%--					<a href="#">客户</a>--%>
<%--					<a href="#">爱人</a>--%>
<%--					<a href="#">领导/长辈</a>--%>
<%--				</li>--%>
<%--				<li>--%>
<%--					<h4>家居饰品：</h4>--%>
<%--					<a href="#">干花/干枝/花瓣</a>--%>
<%--					<a href="#">仿真花卉</a>--%>
<%--					<a href="#">花瓶</a>--%>
<%--					<a href="#">窗型花器</a>--%>
<%--				</li>--%>
<%--				<li>--%>
<%--					<h4>您是不是想找：</h4>--%>
<%--					<a href="#">干花花束</a>--%>
<%--					<a href="#">满天星干花</a>--%>
<%--					<a href="#">干花真花</a>--%>
<%--					<a href="#">干花花瓶</a>--%>
<%--					<a href="#">干花批发</a>--%>
<%--				</li>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<!-----------------address------------------------------->
		<div class="address">
			<div class="wrapper clearfix">
				<a href="index.jsp">首页</a>
				<span>/</span>
				<c:if test="${requestScope.text==null}">
					<a class="on">搜索“${requestScope.searchtext}”</a>
				</c:if>
			</div>
		</div>
		<!-------------------current---------------------->
		<div class="current">
			<div class="wrapper clearfix">
				<h3 class="fl">搜索结果：<h1>${requestScope.text}</h1></h3>
<%--				<div class="fr choice">--%>
<%--					<p class="default">排序方式</p>--%>
<%--					<ul class="select">--%>
<%--						<li>新品上市</li>--%>
<%--						<li>销量从高到低</li>--%>
<%--						<li>销量从低到高</li>--%>
<%--						<li>价格从高到低</li>--%>
<%--						<li>价格从低到高</li>--%>
<%--					</ul>--%>
<%--				</div>--%>
			</div>
		</div>
		<!----------------proList------------------------->
		<ul class="proList wrapper clearfix">
			<c:forEach items="${requestScope.pager.list}" var="p">
				<li>
					<a href="goods?method=showInfo&g_id=${p.g_id}">
						<dl>
							<dt><img src="${p.g_url}"></dt>
							<dd>${p.g_id}【最家】${p.g_bigtype}${p.g_smalltype}${p.g_name}</dd>
							<dd>￥${p.g_price}</dd>
						</dl>
					</a>
				</li>
			</c:forEach>
		</ul>

		<%--分页--%>
		<div class="page" >
			<a href="show?method=keyWord&searchtext=${requestScope.searchtext}&page=1">首页</a>
			<c:if test="${requestScope.pager.page==1}">
				<a href="show?method=keyWord&searchtext=${requestScope.searchtext}&page=1">上一页</a>
			</c:if>
			<c:if test="${requestScope.pager.page!=1}">
				<a href="show?method=keyWord&searchtext=${requestScope.searchtext}&page=${requestScope.pager.page-1}">上一页</a>
			</c:if>
			<c:if test="${requestScope.pager.page==requestScope.pager.total}">
				<a href="show?method=keyWord&searchtext=${requestScope.searchtext}&page=${requestScope.pager.total}">下一页</a>
			</c:if>
			<c:if test="${requestScope.pager.page!=requestScope.pager.total}">
				<a href="show?method=keyWord&searchtext=${requestScope.searchtext}&page=${requestScope.pager.page+1}">下一页</a>
			</c:if>
			<a href="show?method=keyWord&searchtext=${requestScope.searchtext}&page=${requestScope.pager.total}">末页</a>

			<input  type="text" id="n" style="width: 60px;border: 1px solid black" value="${requestScope.pager.page}"/>
			<input class="go" type="button" value="GO" onclick="gopage(1,${requestScope.pager.total},'${requestScope.searchtext}')" />

			<select onchange="window.location.href='show?method=keyWord&searchtext=${requestScope.searchtext}&page='+this.value" style="border: 1px solid black">
				<c:forEach begin="1" end="${requestScope.pager.total}" step="1" varStatus="vs">
					<option value="${vs.index}" <c:if test="${vs.index==requestScope.pager.page}">selected</c:if>>${vs.index}</option>
				</c:forEach>
			</select>
		</div>

		<!----------------mask------------------->
		<div class="mask"></div>
		<!-------------------mask内容------------------->
		<div class="proDets">
			<img class="off" src="img/temp/off.jpg" />
			<div class="tit clearfix">
				<h4 class="fl">【最家】非洲菊仿真花干花</h4>
				<span class="fr">￥17.90</span>
			</div>
			<div class="proCon clearfix">
				<div class="proImg fl">
					<img class="list" src="img/temp/proDet.jpg"  />
					<div class="smallImg clearfix">
						<img src="img/temp/proDet01.jpg" data-src="img/temp/proDet01_big.jpg">
						<img src="img/temp/proDet02.jpg" data-src="img/temp/proDet02_big.jpg">
						<img src="img/temp/proDet03.jpg" data-src="img/temp/proDet03_big.jpg">
						<img src="img/temp/proDet04.jpg" data-src="img/temp/proDet04_big.jpg">
					</div>
				</div>
				<div class="fr">
					<div class="proIntro">
						<p>颜色分类</p>
						<div class="smallImg clearfix categ">
							<p class="fl"><img src="img/temp/prosmall01.jpg" alt="白瓷花瓶+20支快乐花" data-src="img/temp/proBig01.jpg"></p>
							<p class="fl"><img src="img/temp/prosmall02.jpg" alt="白瓷花瓶+20支兔尾巴草" data-src="img/temp/proBig02.jpg"></p>
							<p class="fl"><img src="img/temp/prosmall03.jpg" alt="20支快乐花" data-src="img/temp/proBig03.jpg"></p>
							<p class="fl"><img src="img/temp/prosmall04.jpg" alt="20支兔尾巴草" data-src="img/temp/proBig04.jpg"></p>
						</div>
						<p>数量</p>
						<div class="num clearfix">
							<img class="fl sub" src="img/temp/sub.jpg">
							<span class="fl" contentEditable="true">1</span>
							<img class="fl add" src="img/temp/add.jpg">
							<p class="please fl">请选择商品属性!</p>
						</div>
					</div>
					<div class="btns clearfix">
						<a href="#2"><p class="buy fl">立即购买</p></a>
						<a href="#2"><p class="cart fr">加入购物车</p></a>
					</div>
				</div>
			</div>
			<a class="more" href="proDetail.jsp">查看更多细节</a>
		</div>
		<!--返回顶部-->
		<div class="gotop">
			<a href="cart.jsp">
			<dl class="goCart">
				<dt><img src="img/gt1.png"/></dt>
				<dd>去购<br />物车</dd>
				<span>1</span>
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
			<a href="#" class="toptop" style="display: none;">
			<dl>
				<dt><img src="img/gt4.png"/></dt>
				<dd>返回<br />顶部</dd>
			</dl>
			</a>
			<p>400-800-8200</p>
		</div>
		<div class="msk"></div>
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
			违法和不良信息举报电话：188-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</p>
		</div>
		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
		<script>
			function gopage(min,max,t1){
				var n = document.getElementById("n");
				if(isNaN(n.value)||n.value==null||n.value<min||n.value>max){
					alert("请输入有效范围内数字");
					return;
				}else {
					window.location.href="show?method=keyWord&searchtext="+t1+"&page="+n.value;
				}
			}
		</script>


	</body>
</html>
