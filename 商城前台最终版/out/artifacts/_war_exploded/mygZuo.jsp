<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="zuo fl">
    <h3>
        <a href="#"><img style="width: 92px ;height: 92px;border-radius: 50%" src="${sessionScope.user.headimg}"/></a>
        <p class="clearfix"><span class="fl" onclick="window.location.href='mygrxx.jsp'">[${sessionScope.user.name}]</span><span class="fr" onclick="window.location.href='user?method=deleteUserSession&id=${sessionScope.user.u_id}'">[退出登录]</span></p>
    </h3>
    <div>
        <h4>我的交易</h4>
        <ul>
            <li><a href="cart.jsp">我的购物车</a></li>
            <li><a href="myorderq.jsp">我的订单</a></li>
<%--            <li><a href="myprod.jsp">评价晒单</a></li>--%>
        </ul>
        <h4>个人中心</h4>
        <ul>
            <li  class="on"><a href="mygxin.jsp">我的中心</a></li>
            <li><a href="address.jsp">地址管理</a></li>
        </ul>
        <h4>账户管理</h4>
        <ul>
            <li><a href="mygrxx.jsp">个人信息</a></li>
            <li><a href="remima.jsp">修改密码</a></li>
        </ul>
    </div>
</div>