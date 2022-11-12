<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>个人信息</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mygrxx.css" />
	</head>
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
				<%--页面引入--%>

				<%@ include file="mygZuo.jsp"%>

				<div class="you fl">
					<h2>个人信息<h3 style="color: red">${requestScope.msg1}</h3></h2>
					<div class="gxin">
						<div class="tx"><a href="#"><img style="width: 92px ;height: 92px;border-radius: 50%" src="${sessionScope.user.headimg}"/><p id="avatar">修改头像</p></a></div>
						<div class="xx">
							<h3 class="clearfix"><strong class="fl">基础资料</strong><a href="#" class="fr" id="edit1">编辑</a></h3>
							<div>姓名：${sessionScope.user.name}</div>
							<div>生日：${sessionScope.user.birthday}</div>
							<div>性别：${sessionScope.user.gender}</div>
							<h3>高级设置</h3>
							<!--<div><span class="fl">银行卡</span><a href="#" class="fr">管理</a></div>-->
							<div><span class="fl">账号地区：${sessionScope.user.address}</span><a href="#" class="fr" id="edit2">修改</a></div>
						</div>
					</div>			
				</div>
			</div>
		</div>
		<!--遮罩-->
		<div class="mask"></div>
		<!--编辑弹框-->
		<div class="bj">
			<div class="clearfix"><a href="#" class="fr gb"><img src="img/icon4.png"/></a></div>
			<h3>编辑基础资料</h3>
			<form action="user?method=updateUserInfo&id=${sessionScope.user.u_id}" method="post">
				<p><label>姓名：</label><input type="text" name="name"  value="${sessionScope.user.name}" /></p>
				<p><label>生日：</label><input type="text" name="birthday" value="${sessionScope.user.birthday}" /></p>
				<p>
					<label>性别：</label>
					<span><input type="radio" value="男"  name="gender"/>男</span>
					<span><input type="radio" value="女"   name="gender"/>女</span>
				</p>
				<div class="bc">
					<input type="submit" value="保存"  />
					<input type="button" value="取消" />
				</div>
			</form>
		</div>
		<!--高级设置修改-->
<%--		更改地区    --%>
		<div class="xg">
			<div class="clearfix"><a href="#" class="fr gb"><img src="img/icon4.png"/></a></div>
			<h3>切换账号地区</h3>
			<form action="user?method=updateContry&id=${sessionScope.user.u_id}" method="post">
				<p><label>地区：</label>
				<select name="contry">
					<option value="China">China</option>
					<option value="U.S.A">U.S.A</option>
					<option value="Other">Other</option>
				</select>
				<div class="bc">
					<input type="submit" value="保存" />
					<input type="button" value="取消" />
				</div>
			</form>
		</div>


		<!--修改头像-->
		<div class="avatar">
			<div class="clearfix"><a href="#" class="fr gb"><img src="img/icon4.png"/></a></div>
			<h3>修改头像</h3>
			${sessionScope.user.headimg}
			<form action="user?method=uploadHeadImg&id=${sessionScope.user.u_id}" method="post" enctype="multipart/form-data">
				<h4>请上传图片</h4>
<%--				<input type="button" value="上传头像" />--%>
				<input style="background-color: rgba(0,0,0,.2)"  type="file" name="headimg" />
				<p>jpg或png，大小不超过2M</p>
				<input type="submit" value="提交" />
			</form>
		</div>
		
		<!--返回顶部-->
		<%@include file="footer.jsp"%>

		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/user.js" type="text/javascript" charset="utf-8"></script>


<%--	测试
--%>

	<script>
<%--		&lt;%&ndash;if(${requestScope.msg1!=''}){&ndash;%&gt;--%>
<%--			alert(${requestScope.msg1})--%>
<%--		// }--%>
		var i=document.getElementsByName("contry")[0]

		i.onchange=function (){
			alert(i.value)
		}



	</script>

	</body>
</html>
