<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="utf-8" />
    <title>最家</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/myorder.css" />
</head>
<style>
    .afen{
        text-align: center;
    }
    .afen>a{
        margin-left: 5px;
    }
    .shuzi{
        display: inline-block;
            width: 30px;
            line-height: 20px;
            background-color: darkgray;
            text-align: center;

        }
</style>
<body>
<!------------------------------head------------------------------>
<%@ include file="top2.jsp"%>
<!------------------------------idea------------------------------>
<div class="address mt">
    <div class="wrapper clearfix">
        <a href="#" class="fl">首页</a>
        <span>/</span>
        <a href="mygxin.jsp">个人中心</a>
        <span>/</span>
        <a href="myorderq.jsp" class="on">我的订单</a>
    </div>
</div>
<!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <%@ include file="mygZuo.jsp"%>
        <div class="you fl">
            <div class="my clearfix">
                <h2 class="fl">我的订单</h2>
                <a href="#" class="fl">请谨防钓鱼链接或诈骗电话，了解更多&gt;</a>
            </div>
            <c:if test="${empty requestScope.orderList && empty msg}">
                <c:redirect url="goods?method=showOrder&u_id=${sessionScope.user.u_id}&page=1">
                </c:redirect>
            </c:if>
            <div class="dlist clearfix">
                <ul class="fl clearfix" id="wa">
                    <li><a href="goods?method=showOrder&page=1&u_id=${sessionScope.user.u_id}">全部有效订单</a></li>
                    <li><a href="goods?method=showDai">待收货</a></li>
                    <li><a href="goods?method=showYi">已收货</a></li>
                </ul>
<%--                <form action="#" method="get" class="fr clearfix">--%>
<%--                    <input type="text" name=""  value="" placeholder="请输入商品名称、订单号" />--%>
<%--                    <input type="button" name=""  value="" />--%>
<%--                </form>--%>
            </div>

            <c:forEach items="${requestScope.orderList}" var="o" varStatus="vs">
                <div class="dkuang">
                                    <p style="display: inline-block;width: 700px" class="one">${o.orders.state}</p>
                                        <a href="#" style="color: #ff0000"  class="deleteDD" onclick="DeleteDD(${vs.index},${requestScope.page},${o.orders.order_id},${sessionScope.user.u_id})">删除此记录</a>
                                    <div class="word clearfix">
                                        <ul class="fl clearfix">
                                            <li>${o.orders.date}</li>
                                            <li>${sessionScope.user.name}</li>
                                            <li>订单号:${o.orders.ordernum}</li>
                                            <li>${o.orders.paytype}</li>
                                        </ul>
                                        <p class="fr">订单金额：<span>${o.orders.allmoney}</span>元</p>
                                    </div>
                                    <c:forEach items="${o.goods}" var="og" varStatus="oo">
                                        <div class="shohou clearfix">
                                            <a href="#" class="fl"><img style="width: 69px;height: 85px" src="${og.g_url}"/></a>
                                            <p class="fl"><a href="#">${og.g_name} 类型：${o.type.get(oo.index)}</a><a href="#">¥${og.g_price}×${o.count.get(oo.index)}</a></p>
                                            <p class="fr">
                                                <a class="changeState" href="javascript:;"  onclick="change(${o.orders.order_id},${o.orders.state})">${o.orders.state}</a>
                                                <a class="detail" href="javascript:;"  onclick="show(${o.orders.order_id})">订单详情</a>
                                            </p>
                                        </div>
                                    </c:forEach>
                                </div>
                 </c:forEach>

            <div class="afen">
                <c:if test="${requestScope.page.equals('1')}" >
                    <a href="javascript:;"><img src="img/zuo.jpg"/></a>
                </c:if>
                <c:if test="${!requestScope.page.equals('1')}" >
                    <a href="goods?method=showOrder&u_id=${sessionScope.user.u_id}&page=${requestScope.page-1}"><img src="img/zuo.jpg"/></a>
                </c:if>

                <c:forEach begin="1" end="${requestScope.allpage}" var="e">
                    <a class="shuzi" href="goods?method=showOrder&u_id=${sessionScope.user.u_id}&page=${e}">${e}</a>
                </c:forEach>
                <c:if test="${requestScope.page==requestScope.allpage}" >
                    <a href="javascript:;"><img src="img/you.jpg"/></a>
                </c:if>
                <c:if test="${requestScope.page!=requestScope.allpage}" >
                    <a href="goods?method=showOrder&u_id=${sessionScope.user.u_id}&page=${requestScope.page+1}"><img src="img/you.jpg"/></a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!--返回顶部-->
<%@include file="footer.jsp"%>

<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/user.js" type="text/javascript" charset="utf-8"></script>

<script>
<%--    按钮--%>
    var changeState=document.querySelectorAll(".changeState")
    var one=document.querySelectorAll(".one")

    //按钮内容
window.onload=function (){
    for (let i = 0; i < changeState.length; i++) {
        if(changeState[i].innerHTML==="1"){
            changeState[i].innerHTML="确认收货"
            one[i].innerHTML="待收货"
        }else if(changeState[i].innerHTML==="2"){
            changeState[i].innerHTML="去评价"
            one[i].innerHTML="已收货"
        }else if(changeState[i].innerHTML==="3"){
            changeState[i].innerHTML="已评价"
            one[i].innerHTML="已评价"
        }
    }


}

    var detail=document.querySelectorAll(".detail")
//删除订单信息
    var deleteDD=document.querySelectorAll(".deleteDD")
    for (let i = 0; i < changeState.length; i++) {
        function change(a,state){

            if(state=="1"){
            if(confirm("您是否确认收货?")){
                  window.location.href="goods?method=updateState&o_id="+a+"&page=1"
             }
            }else if(state=="2"){
                window.location.href="goods?method=pingjia&o_id="+a
            }
        }
    }

//查看订单详情
    for (let i = 0; i < changeState.length; i++) {
        function show(a){
             window.location.href="goods?method=showDetail&o_id="+a
        }
    }
//    删除单个订单


    function DeleteDD(index,p,s_id,u_id) {
        if(confirm("是否删除此订单记录")){

                deleteDD[index].href="goods?method=deleteDD&page="+p+"&order_id="+s_id+"&u_id="+u_id

        }else{
            deleteDD[index].href="javascript:;"

        }
    }



</script>
</body>
</html>
