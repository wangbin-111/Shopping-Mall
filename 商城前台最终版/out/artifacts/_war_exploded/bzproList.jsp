<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>抱枕</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/proList.css"/>
	</head>
	<body>
		<!------------------------------head------------------------------>
		<div class="head">
			<div class="wrapper clearfix">
				<div class="clearfix" id="top">
					<h1 class="fl"><a href="index.jsp"><img src="img/logo.png"/></a></h1>
					<div class="fr clearfix" id="top1">
						<p class="fl">
							<a href="login.jsp" id="login">登录</a>
							<a href="reg.jsp" id="reg">注册</a>
						</p>
						<form action="#" method="get" class="fl">
							<input type="text" placeholder="搜索" />
							<input type="button" />
						</form>
						<div class="btn fl clearfix">
							<a href="mygxin.jsp"><img src="img/grzx.png"/></a>
							<a href="#" class="er1"><img src="img/ewm.png"/></a>
							<a href="cart.jsp"><img src="img/gwc.png"/></a>
							<p><a href="#"><img src="img/smewm.png"/></a></p>
						</div>
					</div>
				</div>
				<ul class="clearfix" id="bott">
					<li><a href="index.jsp">首页</a></li>
					<li>
						<a href="#">所有商品</a>
						<div class="sList">
							<div class="wrapper  clearfix">
								<a href="paint.jsp">
									<dl>
										<dt><img src="img/nav1.jpg"/></dt>
										<dd>浓情欧式</dd>
									</dl>
								</a>
								<a href="paint.jsp">
									<dl>
										<dt><img src="img/nav2.jpg"/></dt>
										<dd>浪漫美式</dd>
									</dl>
								</a>
								<a href="paint.jsp">
									<dl>
										<dt><img src="img/nav3.jpg"/></dt>
										<dd>雅致中式</dd>
									</dl>
								</a>
								<a href="paint.jsp">
									<dl>
										<dt><img src="img/nav6.jpg"/></dt>
										<dd>简约现代</dd>
									</dl>
								</a>
								<a href="paint.jsp">
									<dl>
										<dt><img src="img/nav7.jpg"/></dt>
										<dd>创意装饰</dd>
									</dl>
								</a>
							</div>
						</div>
					</li>
					<li>
						<a href="flowerDer.jsp">装饰摆件</a>
						<div class="sList2">
							<div class="clearfix">
								<a href="proList.jsp">干花花艺</a>
								<a href="vase_proList.jsp">花瓶花器</a>
							</div>
						</div>
					</li>
					<li>
						<a href="decoration.jsp">布艺软饰</a>
						<div class="sList2">
							<div class="clearfix">
								<a href="zbproList.jsp">桌布罩件</a>
								<a href="bzproList.jsp">抱枕靠垫</a>
							</div>
						</div>
					</li>
					<li><a href="paint.jsp">墙式壁挂</a></li>
					<li><a href="perfume.jsp">蜡艺香薰</a></li>
					<li><a href="idea.jsp">创意家居</a></li>
				</ul>
			</div>
		</div>
		<!------------------------------banner------------------------------>
		<div class="banner">
			<a href="#"><img src="img/temp/bzbig.jpg"/></a>
		</div>
		<!-----------------address------------------------------->
		<div class="address">
			<div class="wrapper clearfix">
				<a href="index.jsp">首页</a>
				<span>/</span>
				<a href="decoration.jsp">布艺软饰</a>
				<span>/</span>
				<a href="bzproList.jsp" class="on">抱枕</a>
			</div>
		</div>
		<!-------------------current---------------------->
		<div class="current">
			<div class="wrapper clearfix">
				<h3 class="fl">桌布</h3> 
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
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz08.jpg"></dt>
						<dd>【最家】清新乡村田园抱枕</dd>
						<dd>￥19.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz07.jpg"></dt>
						<dd>【最家】法式乡村复古抱枕</dd>
						<dd>￥17.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz06.jpg"></dt>
						<dd>【最家】时尚图案抱枕</dd>
						<dd>￥17.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz05.jpg"></dt>
						<dd>【最家】北欧时尚现代动物抱枕</dd>
						<dd>￥59.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz04.jpg"></dt>
						<dd>【最家】简约格子抱枕</dd>
						<dd>￥20.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<dl>
					<dt><img src="img/temp/bz03.jpg"></dt>
					<dd>【最家】纯色棉麻抱枕</dd>
					<dd>￥47.90</dd>
				</dl>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz02.jpg"></dt>
						<dd>【最家】时尚现代叮当猫抱枕</dd>
						<dd>￥37.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz01.jpg"></dt>
						<dd>【最家】欧式现代棉麻抱枕</dd>
						<dd>￥39.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz08.jpg"></dt>
						<dd>【最家】清新乡村田园抱枕</dd>
						<dd>￥19.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz07.jpg"></dt>
						<dd>【最家】法式乡村复古抱枕</dd>
						<dd>￥17.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz06.jpg"></dt>
						<dd>【最家】时尚图案抱枕</dd>
						<dd>￥17.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz05.jpg"></dt>
						<dd>【最家】北欧时尚现代动物抱枕</dd>
						<dd>￥59.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz04.jpg"></dt>
						<dd>【最家】简约格子抱枕</dd>
						<dd>￥20.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<dl>
					<dt><img src="img/temp/bz03.jpg"></dt>
					<dd>【最家】纯色棉麻抱枕</dd>
					<dd>￥47.90</dd>
				</dl>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz02.jpg"></dt>
						<dd>【最家】时尚现代叮当猫抱枕</dd>
						<dd>￥37.90</dd>
					</dl>
				</a>
			</li>
			<li>
				<a href="proDetail.jsp">
					<dl>
						<dt><img src="img/temp/bz01.jpg"></dt>
						<dd>【最家】欧式现代棉麻抱枕</dd>
						<dd>￥39.90</dd>
					</dl>
				</a>
			</li>
		</ul>
		
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
						<p>数量&nbsp;&nbsp;库存<span>2096</span>件</p>
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
		<%@include file="footer.jsp"%>

		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
