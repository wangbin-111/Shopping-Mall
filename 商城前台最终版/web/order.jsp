<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>order</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
    <link rel="stylesheet" type="text/css" href="css/mygxin.css"/>
</head>
<body>
<!----------------------------------------order------------------>
<%@ include file="top2.jsp"%>

<div class="order cart mt">
    <!-----------------site------------------->
    <div class="site">
        <p class="wrapper clearfix">
            <span class="fl">订单确认</span>
            <img class="top" src="img/temp/cartTop02.png">
        </p>
    </div>
    <!-----------------orderCon------------------->
    <div class="orderCon wrapper clearfix">
        <div class="orderL fl">
            <!--------h3---------------->
            <h3>收件信息<a href="#" class="fr add">新增地址</a></h3>
            <!--------addres---------------->
            <div class="addres clearfix">

                <c:forEach items="${Slist}" var="s" varStatus="vs">
                    <%--     on表示选中 --%>
                    <div class="addre fl ">
                        <input type="hidden" value="${s.ship_id}" class="ship_id"/>
                        <div class="tit clearfix">
                            <p class="fl">${s.ship_name}
                                <span class="default">[默认地址]</span>
                            </p>
                            <p class="fr">
                                <a href="user?method=deleteAddress&ship_id=${s.ship_id}&id=${sessionScope.user.u_id}&href=order.jsp">删除</a>
                                <span>|</span>
                                <a href="user?method=updateAddress1&ship_id=${s.ship_id}&id=${sessionScope.user.u_id}&href=orderupdate.jsp"
                                   class="edit">编辑</a>
                            </p>
                        </div>
                        <div class="addCon">
                            <p>${s.ship_address}&nbsp;${s.ship_da}(${s.ship_code})</p>
                            <p>${s.ship_num}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <h3>支付方式</h3>
            <!--------way---------------->
            <div class="way clearfix">
                <img class="on" src="img/temp/way01.jpg" name="支付宝支付">
                <img src="img/temp/way02.jpg" name="微信支付">
                <img src="img/temp/way03.jpg" name="银联支付">
            </div>
            <h3>选择快递</h3>
            <!--------dis---------------->
            <div class="dis clearfix">
                <span class="on">顺风快递</span>
                <span>百世汇通</span>
                <span>圆通快递</span>
                <span>中通快递</span>
            </div>
        </div>
        <div class="orderR fr">
            <div class="msg">
                <h3>订单内容<a href="cart.jsp" class="fr">返回购物车</a></h3>
                <!--------ul---------------->

                <c:forEach items="${cartInfosList}" var="c">
                    <ul class="clearfix">
                            <%--                    商品id--%>
                        <input type="hidden" value="${c.goods.g_id}" class="g_id"/>
                        <input type="hidden" value="${c.c_id}" class="c_id"/>

                        <li class="fl">
                            <img src="${c.goods.g_url}" width="70px" height="90px">
                        </li>
                        <li class="fl">
                            <p>${c.goods.g_name}</p>
                            <p class="type">颜色分类：${c.c_type}</p>
                            <p class="count">数量：${c.c_count}</p>
                        </li>
                        <li class="fr price">￥${c.goods.g_price}</li>
                    </ul>
                </c:forEach>


            </div>


            <!--------tips---------------->
            <div class="tips">
                <p><span class="fl">商品金额：</span><span class="fr  money">￥139.80</span></p>
                <p><span class="fl">优惠金额：</span><span class="fr">￥0.00</span></p>
                <p><span class="fl">运费：</span><span class="fr">免运费</span></p>
            </div>
            <!--------tips count---------------->
            <div class="count tips">
                <p><span class="fl">合计：</span><span class="fr AllMoney">￥139.80</span></p>
            </div>
            <!--<input type="button" name="" value="去支付"> -->
            <a href="#" class="pay" onclick="payFun(${sessionScope.user.u_id})">去支付</a>

        </div>
    </div>
</div>
<!--编辑弹框-->
<!--遮罩-->
<div class="mask"></div>
<div class="adddz editAddre">



<%--    添加地址--%>
    <form action="user?method=shipAddress&id=${sessionScope.user.u_id}&href=order.jsp" method="post">
        <input type="text" name="name" placeholder="姓名" class="on"/>
        <input type="text" name="number" placeholder="手机号"/>
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
        <textarea name="XXaddress" rows="" cols="" placeholder="详细地址"></textarea>

        <input type="text" name="code" placeholder="邮政编码"/>
        <div class="bc">
            <input type="submit" value="保存"/>
            <input type="button" value="取消"/>
        </div>
    </form>
</div>
<%@ include file="footer.jsp"%>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
<script>
    // 订单页面  添加地址
    $(".add").click(function () {
        $(".mask").show();
        $(".adddz").show();
    });

    var count = document.querySelectorAll(".count");
    var price = document.querySelectorAll(".price");
    var money = document.querySelector(".money");
    var AllMoney = document.querySelector(".AllMoney");
    var type = document.querySelectorAll(".type");

    //地址
    var addres = document.querySelectorAll(".addre")

    // 支付方式
    var way = document.querySelectorAll(".way>img")
    //快递
    var dis = document.querySelectorAll(".dis>span")
    //获取地址编号
    var ship_id = document.querySelectorAll(".ship_id")
    var g_id = document.querySelectorAll(".g_id")

    var c_id = document.querySelectorAll(".c_id")

    window.onload = function () {
        var AM = 0;
        for (let i = 0; i < price.length; i++) {
            AM += parseInt(count[i].innerText.split("：")[1]) * parseInt(price[i].innerText.substring(1))
        }
        money.innerText = "￥" + AM;
        AllMoney.innerText = "￥" + AM;
    }
    //添加地址检查




    // 支付界面 产生订单
    var pay = document.querySelector(".pay")



    function payFun(a) {
        for (let i = 0; i < addres.length; i++) {
            if (addres[i].className.indexOf("on") != -1) {
                for (let j = 0; j < way.length; j++) {
                    if (way[j].className.indexOf("on") != -1) {
                        for (let k = 0; k < dis.length; k++) {
                            if (dis[k].className.indexOf("on") != -1) {
                                let Ocount = "";
                                let Otype = "";
                                let Og_id = "";
                                let Oc_id=""
                                for (let i = 0; i < g_id.length; i++) {
                                    Ocount += count[i].innerHTML.substring(count[i].innerHTML.indexOf("：") + 1) + ","
                                    Otype += type[i].innerHTML.substring(type[i].innerHTML.indexOf("：") + 1) + ","

                                    Og_id+= g_id[i].value + ","
                                    Oc_id+=c_id[i].value+","
                                }
                                let money = AllMoney.innerText.substring(1);
                                Ocount = Ocount.substring(0, Ocount.length - 1)
                                Otype = Otype.substring(0, Otype.length - 1)

                                Og_id = Og_id.substring(0, Og_id.length - 1)
                                Oc_id = Oc_id.substring(0, Oc_id.length - 1)
                                let date = new Date().getFullYear() + "年" + (new Date().getMonth() + 1) + "月" + new Date().getDate() + " " + new Date().getHours() + ":" + (new Date().getSeconds() < 10 ? "0" + new Date().getSeconds() : new Date().getSeconds())
                                pay.href = "goods?method=addOrder&u_id=" + a + "&g_id=" + Og_id + "&ship_id=" + ship_id[i].value + "&paytype=" + way[j].name + "&fastmail=" + dis[j].innerHTML + "&count=" + Ocount + "&money=" + money + "&date=" + date + "&c_id="+Oc_id+"&c_type="+Otype
                            }

                        }
                    }

                }
            }
        }
    }


</script>
</body>
</html>
