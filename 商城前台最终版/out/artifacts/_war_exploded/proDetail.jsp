<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>详情页</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
</head>
<style>

    .seeList > a:hover {
        box-shadow: 1px 1px 10px 1px rgba(1, 1, 1, .6);
        transform: translateY(-4px);
        transition: all 0.5s;
    }
</style>
<body>
<!------------------------------head------------------------------>
<%@ include file="topbar.jsp" %>


<!-----------------address------------------------------->
<div class="address">
    <div class="wrapper clearfix">
        <a href="index.jsp">首页</a>
        <span>/</span>
        <a href="flowerDer.jsp">装饰摆件</a>
        <span>/</span>
        <a href="proList.jsp">干花花艺</a>
        <span>/</span>
        <a href="#" class="on">${sessionScope.good.g_name}</a>
    </div>
</div>
<!-----------------------Detail------------------------------>
<div class="detCon">
    <div class="proDet wrapper">
        <div class="proCon clearfix">
            <div class="proImg fl">
                <img class="det" src="${sessionScope.good.g_url2.split(",")[0]}"/>
                <div class="smallImg clearfix">

                    <c:forEach items="${sessionScope.good.g_url2.split(\",\")}" var="c">
                        <img src="${c}"
                             data-src="${c}">
                    </c:forEach>

                </div>
            </div>
            <div class="fr intro">
                <div class="title">
                    <h4>${sessionScope.good.g_name}</h4>
                    <p>
                        【破损补寄】【${sessionScope.good.g_remark}】【无理由退换货】【包邮】</p>
                    <span>￥${sessionScope.good.g_price}</span>
                </div>
                <div class="proIntro">
                    <p>颜色分类</p>
                    <div class="smallImg clearfix categ">
                        <c:forEach items="${sessionScope.good.g_typeurl.split(\",\")}" var="t" varStatus="vs">
                            <p class="fl" id="${vs.index}"><img class="typeImg" src="${t.split(":")[0]}"
                                                                alt="${t.split(":")[1]}" data-src="${t.split(":")[0]}">
                            </p>

                        </c:forEach>

                    </div>
                    <p>数量&nbsp;&nbsp;库存<span>${sessionScope.good.g_num}</span>件</p>
                    <div class="num clearfix">
                        <img class="fl sub" src="img/temp/sub.jpg">
                        <span class="fl count" contentEditable="true">1</span>
                        <img class="fl add" src="img/temp/add.jpg">
                        <p class="please fl">请选择商品属性!</p>
                    </div>
                </div>

                <input class="g_id" type="hidden" value="${sessionScope.good.g_id}"/>
                <input class="u_id" type="hidden" value="${sessionScope.user.u_id}"/>
                <div class="btns clearfix">
                    <a class="buyGood"
                       href="goods?method=buyGood&g_id=${sessionScope.good.g_id}&id=${sessionScope.user.u_id}"><p
                            class="buy fl">立即购买</p></a>
                    <a class="addCart" href="#"><p class="cart fr">加入购物车</p></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="introMsg wrapper clearfix">
    <div class="msgL fl">
        <div class="msgTit clearfix">
            <a class="on">商品详情</a>
            <a>所有评价</a>
        </div>
        <div class="msgAll">
            <div class="msgImgs">
                <c:forEach items="${sessionScope.good.g_url2.split(\",\")}" var="c">
                    <img style="width: 947px;height: 749px;border: 1px solid rgba(0,0,0,.2)" src="${c}">
                </c:forEach>
            </div>
            <div class="eva">

                <%--						评价   --%>
                <c:forEach items="${requestScope.pjZslist}" var="pj">
                    <div class="per clearfix">
                        <img class="fl" style="width: 41px ;height: 40px;border-radius: 50% " src="${pj.headimg}">
                        <div class="perR fl">
                            <p>${pj.name.substring(0,1)}**</p>
                            <p>${pj.evaluate}</p>
                            <div class="clearfix">
                                <c:forEach items="${pj.e_url.contains(',')? pj.e_url.split(','):pj.e_url}" var="pi">
                                    <p><img style="width: 41px ;height: 40px " src="${pi}"></p>
                                </c:forEach>
<%--                                <p><img src="img/temp/eva02.jpg"></p>--%>
<%--                                <p><img src="img/temp/eva03.jpg"></p>--%>
<%--                                <p><img src="img/temp/eva04.jpg"></p>--%>
<%--                                <p><img src="img/temp/eva05.jpg"></p>--%>
                            </div>
                            <p>
                                评价星级：
                            <c:forEach  begin="1" end="${pj.grade}">
                                <span>⭐</span>
                            </c:forEach>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="msgR fr">
        <h4>为你推荐</h4>
        <div class="seeList">
            <c:forEach items="${requestScope.tuijianGood}" var="tj" end="3">
                <a style="width: 162px" href="goods?method=showInfo&g_id=${tj.g_id}">
                    <dl>
                        <dt><img style="width: 162px;height: 200px" src="${tj.g_url}"></dt>
                        <dd>【向日葵杂货铺】${tj.g_name}</dd>
                        <dd>￥${tj.g_price}<span style="color: red;margin-left: 40px">hot：${tj.g_hot}</span></dd>


                    </dl>
                </a>
            </c:forEach>

        </div>

    </div>
</div>

<%@ include file="footer.jsp" %>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    jQuery(".bottom").slide({
        titCell: ".hd ul",
        mainCell: ".bd .likeList",
        autoPage: true,
        autoPlay: false,
        effect: "leftLoop",
        autoPlay: true,
        vis: 1
    });
    //无规格不结算
    var g_id = document.querySelector(".g_id").value
    var u_id = document.querySelector(".u_id").value

    var buyGood = document.querySelector(".buyGood")
    var addCart = document.querySelector(".addCart")
    var count = document.querySelector(".count")
    //类型图
    var typeImg = document.querySelectorAll(".typeImg")


    $(".btns a").click(function () {
        if ($(".categ p").hasClass("on")) {
            if ($(this).children().hasClass("buy")) {
                for (let i = 0; i < $(".categ p").length; i++) {
                    if ($(".categ p")[i].className.indexOf("on") != -1) {
                        var type = $(".categ p")[i].childNodes[0].alt;
                        $(this).attr("href", buyGood.href = "goods?method=buyGood&g_id=" + g_id + "&id=" + u_id + "&count=" + count.innerHTML + "&c_type=" + type+"&u_name=${sessionScope.user.name}");
                    }
                }
            } else if ($(this).children().hasClass("cart")) {
                for (let i = 0; i < $(".categ p").length; i++) {
                    if ($(".categ p")[i].className.indexOf("on") != -1) {
                        var type = $(".categ p")[i].childNodes[0].alt;
                        $(this).attr("href", addCart.href = "goods?method=addCart&g_id=" + g_id + "&id=" + u_id + "&count=" + count.innerHTML + "&c_type=" + type);
                    }
                }
            }
            $(".proIntro").css("border", "none");
            $(".num .please").hide();
        } else {
            if ($(this).children().hasClass("buy")) {
                $(this).attr("href", "#");

            } else if ($(this).children().hasClass("cart")) {
                $(this).attr("href", "#");
            }
            $(".proIntro").css("border", "1px solid #c10000");
            $(".num .please").show();
        }
    })


</script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
