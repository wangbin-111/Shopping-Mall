<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>最家</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
<%--		<link rel="stylesheet" type="text/css" href="css/mygxin.css" charset="utf-8"/>--%>
		<style>
			/*bott*/
			.Bott{
				background: #f5f5f5;
			}
			.Bott .zuo{
				margin: 20px 20px 20px 0;
				width: 180px;
				background: #fff;
				text-align: center;
				line-height: 40px;
				border: 1px solid #e4e4e4;
			}
			.Bott .zuo h3{
				border-bottom: 1px solid #A10000;
				cursor: pointer;
				padding: 10px 0;
				font-weight: normal;
			}
			.Bott .zuo h3 a img{
				display: block;
				margin: 0 auto;
			}
			.Bott .zuo h3 p{
				width: 70%;
				margin: 0 auto;
			}
			.Bott .zuo h3 p span{
				border-bottom: 1px solid #fff;
			}
			.Bott .zuo h3 span:hover{
				color: #A10000;
				border-bottom: 1px solid #A10000;
			}
			.Bott .zuo div{
				background: #fcfcff;
			}
			.Bott .zuo  h4{
				cursor: pointer;
				width: 90%;
				color: #444;
				font-size: 14px;
			}
			.Bott .zuo ul li a{
				display: inline-block;
				color: #757575;
				width: 40%;
				text-align: left;
				font-size: 14px;
			}
			.Bott .zuo ul li.on a,.Bott .zuo ul li a:hover{
				color: #A10000;
			}



			.Bott .you{
				background: #fff;
				width: 840px;
				padding: 50px;
				margin: 20px 0;
				border: 1px solid #e4e4e4;
			}
			.Bott .you  h2{
				font-size: 22px;
				font-weight: normal;
				padding-bottom: 20px;
				border-bottom: 1px solid #E6E6E6;
				margin-bottom: 30px;
			}
			/*个人信息*/
			.Bott .you .tx {
				padding-bottom:10px ;
				border-bottom: 1px solid #E6E6E6;
			}
			.Bott .you .tx div a.fl{
				display: block;
				width: 90px;
				height: 90px;
				border-radius: 45px;
				border: 1px solid #e3e3e3;
				padding: 1px;
			}
			.Bott .you .tx div p{
				margin: 25px 0 0 15px;
			}
			.Bott .you .tx div p span{
				display: block;
				font-size: 16px;
				margin-bottom: 10px;
			}
			.Bott .you .tx div p a{
				display: block;
				color: #A10000;
			}
			.Bott .you .tx div.fr{
				margin: 40px 0 0 0;
				color: #757575;
			}
			.Bott .you .bott{
				padding: 20px 0;
				display: flex;
				flex-wrap: wrap;
			}
			.Bott .you .bott div{
				flex: 1 1 50%;
				margin: 20px 0;
			}
			.Bott .you .bott div p{
				font-size: 15px;
				color: #757575;
				margin: 35px 0 0 15px;
			}
			.Bott .you .bott div p strong{
				color: #A10000;
			}
			.Bott .you .bott div a{
				display: block;
				font-size: 12px;
				color: #757575;
				margin-top: 10px;
			}








			/*地址管理*/
			.Bott .you .add{
				display: flex;
				flex-wrap: wrap;
				justify-content: space-around;
			}
			.Bott .you .add div:nth-child(1){
				width: 268px;
				height: 178px;
				border: 1px solid #E0E0E0;
				padding: 0;
				text-align: center;
			}
			.Bott .you .add div:nth-child(1) a{
				width: 30px;
				display: block;
				margin: 60px auto 0;
			}
			.Bott .you .add div{
				width: 244px;
				height: 158px;
				border: 1px solid #E0E0E0;
				padding: 20px 0 0 24px;
				color: #757575;
				line-height: 20px;
			}
			.Bott .you .add div p:nth-child(1){
				font-size: 18px;
				margin-bottom: 25px;
				color: #262626;
			}
			.Bott .you .add div a{
				color: #A10000;
				display: inline-block;
				margin-right: 10px;
			}




			/*添加地址*/
			body{
				position: relative;
			}
			/*遮罩*/
			.mask{
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(0,0,0,0.5);
				z-index: 20;
				/*display: none;*/
			}
			/*
                 提交订单页面的修改地址为居中
             */
			.editAddre{
				position: fixed;
				top: 50%;
				left: 50%;
				margin-top: -180px;
				margin-left: -150px;
			}
			.adddz{
				width: 300px;
				position: absolute;
				top: 50%;
				left: 38%;
				margin-top: -180px;
				margin-left: -150px;
				z-index: 30;
				background: #fff;
				border: 1px solid #A10000;
				padding: 30px;
				display: none;
			}
			.readd{
				width: 300px;
				position: absolute;
				top: 50%;
				left: 60%;
				margin-top: -180px;
				margin-left: -150px;
				z-index: 30;
				background: #fff;
				border: 1px solid #A10000;
				padding: 30px;
				/*display: none;*/
			}
			.adddz form input,.readd form input{
				border: 1px solid #e0e0e0;
				display: block;
				margin-bottom: 15px;
				width: 100%;
				height: 40px;
				line-height: 40px;
				text-indent: 5px;
			}
			.adddz form input.on,.readd form input.on{
				border: 1px solid #A10000;
			}
			.adddz form div.city select,.readd form div.city select{
				width: 142px;
				height: 40px;
				line-height: 40px;
				border: 1px solid #E0E0E0;
				padding: 10px;
				margin-bottom:10px;
			}
			.adddz form div.city select:nth-child(odd),.readd form div.city select:nth-child(odd){
				margin-right: 10px;
			}
			.adddz form textarea,.readd form textarea{
				width: 100%;
				height: 50px;
				padding-top:10px;
				text-indent: 5px;
				margin-bottom: 15px;
			}
			.adddz form div.bc,.readd form div.bc{
				margin-top: 30px;
				display: flex;
				justify-content: space-around;
			}
			.adddz form div.bc input,.readd form div.bc input{
				display: inline-block;
				width: 120px;
				height: 36px;
				line-height: 36px;
				text-align: center;
				background: #fff;
				border: 1px solid #e6e6e6;
			}
			.adddz form div.bc input:nth-child(1),.readd form div.bc input:nth-child(1){
				background: #A10000;
				color: #FFFFFF;
			}
		</style>
	</head>
	<body>
		<!------------------------------head------------------------------>
		<%@ include file="top2.jsp"%>
		<!------------------------------idea------------------------------>
		<div class="address mt">
			<div class="wrapper clearfix">
				<a href="index.jsp" class="fl">首页</a>
				<span>/</span>
				<a href="mygxin.jsp">个人中心</a>
				<span>/</span>
				<a href="address.jsp" class="on">地址管理</a>
			</div>
		</div>
		
		<!------------------------------Bott------------------------------>
		<div class="Bott">
			<div class="wrapper clearfix">

	<%@ include file="mygZuo.jsp"%>

	<div class="you fl">
					<h2>收货地址</h2>
					<div class="add">
						<div class="addAddress">
							<a href="#2" id="addxad"><img src="img/jia.png"/></a>
							<span>添加新地址</span>
						</div>

<%--						如果界面没有Slist 则发送请求--%>
						<c:if test="${empty sessionScope.Slist && empty requestScope.msg}">
							<c:redirect url="user?method=showAddress&id=${sessionScope.user.u_id}">

							</c:redirect>
						</c:if>


<%--						遍历地址--%>
						<c:forEach items="${sessionScope.Slist}" var="s" varStatus="vs">
							<div class="dizhi">
								<p>${s.ship_name}</p>
								<p>${s.ship_num}</p>
								<p>${s.ship_address}</p>
								<p>${s.ship_da}(${s.ship_code})</p>

								<p class="addp"><a href="#"  class="update">修改</a><a href="user?method=deleteAddress&ship_id=${s.ship_id}&id=${sessionScope.user.u_id}" class="deladd">删除</a></p>
							</div>
						</c:forEach>
					</div>		
				</div>
			</div>
		</div>
		<!--编辑弹框-->
		<!--遮罩-->
		<div class="mask"></div>
		<div class="adddz">
			<form action="user?method=shipAddress&id=${sessionScope.user.u_id}" method="post">
				<input type="text" name="name" placeholder="姓名" class="on" />
				<input type="text" name="number" placeholder="手机号" />
				<div class="city">
					<select name="sheng">
						<option value="无">省份/自治区</option>
						<option value="山东">山东</option>
					</select>
					<select name="shi">
						<option value="无">城市/地区</option>
						<option value="菏泽">菏泽</option>

					</select>
					<select name="qu">
						<option value="无">区/县</option>
						<option value="单县">单县</option>
					</select>
				</div>
				<textarea name="XXaddress" rows="" cols="" placeholder="详细地址" >${ship_da}</textarea>

				<input type="text" name="code" value="${ship_code}" placeholder="邮政编码" />
				<div class="bc">
					<input type="submit" value="保存" />
					<input type="button" value="取消" />
				</div>
			</form>
		</div>

<%--		修改 --%>
		<div class="readd">
			<form action="user?method=updateAddress2&ship_id=${sessionScope.updateship.ship_id}&id=${sessionScope.user.u_id}" method="post">


				<input type="text"  class="on" value="${sessionScope.updateship.ship_name}" name="name"/>
				<input type="text" value="${sessionScope.updateship.ship_num}" name="number"/>
				<div class="city">
					<select name="sheng">
						<option value="${sessionScope.updateship.ship_address.split("-")[0]}">${sessionScope.updateship.ship_address.split("-")[0]}</option>
						<option value="山东">山东</option>

					</select>
					<select name="shi">
						<option value="${sessionScope.updateship.ship_address.split("-")[1]}">${sessionScope.updateship.ship_address.split("-")[1]}</option>
						<option value="菏泽">菏泽</option>
					</select>
					<select name="qu">
						<option value="${sessionScope.updateship.ship_address.split("-")[2]}">${sessionScope.updateship.ship_address.split("-")[2]}</option>
						<option value="单县">单县</option>
					</select>

				</div>
				<textarea name="XXaddress" rows="" cols="" placeholder="详细地址">${sessionScope.updateship.ship_da}</textarea>
				<input type="text" placeholder="邮政编码" name="code" value="${sessionScope.updateship.ship_code}"/>
				<div class="bc">
					<input type="submit" value="保存" />
					<input type="button" value="取消" onclick="window.location.href='address.jsp'"/>
				</div>
			</form>
		</div>
		<%@include file="footer.jsp"%>

		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<%--		<script src="js/user.js" type="text/javascript" charset="utf-8"></script>--%>
	</body>


<script>
		var update=document.querySelector(".update")

		update.onclick=function (){
			var url=window.location.href;
			alert(url.substring(url.indexOf("#")));
		}

</script>

<script>
	$(function(){

//	订单页面  修改地址
		$(".edit").click(function(){
			$(".mask").show();
			$(".adddz").show();
		});

		$(".bc>input").click(function(){
			if($(this).val()=="保存"){
				$(".mask").hide();
				$(".adddz").hide();
				$(".bj").hide();
				$(".xg").hide();
				$(".remima").hide();
				$(".pj").hide();
				$(".chak").hide();
			}else{
				$(".mask").hide();
				$(".adddz").hide();
				$(".bj").hide();
				$(".xg").hide();
				$(".remima").hide();
				$(".pj").hide();
				$(".chak").hide();
			}
		});



//	我的订单tab切换
		$("#wa li").click(function(){
			$(this).addClass("on").siblings().removeClass("on");
			var txt1=$(this).find("a").text();
			$(".dkuang").find("p.one").each(function(){
				var txt2=$(this).text();
				if(txt1==txt2){
					$(this).parent(".dkuang").show().siblings(".dkuang").hide();
				}
				$("#wa li").eq(0).click(function(){
					$(".dkuang").show();
				})
			});
		});

//	评价 tab切换

		$(".sx div:gt(0)").hide();
		$(".sx div").each(function(i){
			if($(this).html()==''){
				var str = $("#pro li").eq(i).find("a").text();
				var txt ='';
				txt = '<div class="noz">当前没有'+str+'。</div>';
				$(this).html(txt);
			}
		});
		$("#pro li").click(function(){
			$(this).addClass("on").siblings().removeClass("on");
			var index=$(this).index();
			$(".sx > div").eq(index).show().siblings().hide();
		});


//		评价打心

		$(".sx dl dd").find("a").click(function(){
			if($(this).text()=="评价"){
				$(".mask").show();
				$(".pj").show();
			}else if($(this).text()=="查看评价"){
				$(".mask").show();
				$(".chak").show();
			}else{
				$(".mask").hide();
				$(".pj").hide();
				$(".chak").hide();
			}

		});
//	评价打心
		$("#xin").each(function(i){
			$("#xin").eq(i).children("a").click(function(){
				var index = $(this).index();
				for(var j = 0; j<5;j++){
					if(j<=index){
						$("#xin").eq(i).find("a").eq(j).find("img").attr("src","img/hxin.png");
					}
					else{
						$("#xin").eq(i).find("a").eq(j).find("img").attr("src","img/xin.png");
					}

				}
			})
		})




//	个人信息 编辑
		$("#edit1").click(function(){
			$(".mask").show();
			$(".bj").show();
		});
		$("#edit2").click(function(){
			$(".mask").show();
			$(".xg").show();
		});
//修改头像
		$("#avatar").click(function(){
			$(".mask").show();
			$(".avatar").show();
		});

//	弹框关闭按钮
		$(".gb").click(function(){
			$(".mask").hide();
			$(".bj").hide();
			$(".xg").hide();
			$(".remima").hide();
			$(".avatar").hide();
			$(".pj").hide();
			$(".chak").hide();
		});









//	address
		$("#addxad").click(function(){
			$(".mask").show();
			$(".adddz").show();
		});
		// $("#dizhi").hover(
				// 	function(){
				// 	var txt="";
				// 	txt='<p class="addp"><a href="#"  id="readd">修改</a><a href="#" id="deladd">删除</a></p>'
				// 	$(this).append(txt);
					$(".update").click(function(){
						$(".mask").show();
						$(".readd").show();
					});
					$(".deladd").click(function(){
						$(this).parents(".dizhi").remove();
					});
				// },
				// function(){
					$(".bc>input").click(function(){
						if($(this).val()=="保存"){
							$(".mask").hide();
							$(".readd").hide();
						}else{
							$(".mask").hide();
							$(".readd").hide();
						}
					});
				// 	$(".addp").remove();
				// });

//	查看物流
		$(".vewwl").hover(function(){
			$(this).children(".wuliu").fadeIn(100);
		},function(){
			$(this).children(".wuliu").fadeOut(100);
		});

	})

</script>
</html>
