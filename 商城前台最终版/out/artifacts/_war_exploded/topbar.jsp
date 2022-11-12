<%--
  Created by IntelliJ IDEA.
  User: bin
  Date: 2022/10/14
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="shortcut icon"  href="favicon.ico" type="image/x-icon" />

<div class="head">
    <div class="wrapper clearfix">
        <div class="clearfix" id="top">
            <h1 class="fl"><a href="index.jsp"><img style="height: 93px;width: 270px;margin: -30px 0 0 0" src="img/sb/sb.jpg"/></a></h1>
            <div class="fr clearfix" id="top1">
                <p class="fl">
                    <%--   判断是否登录--%>
                    <c:if test="${empty sessionScope.user}">
                        <a href="login.jsp" id="login">登录</a>
                        <a href="reg.jsp" id="reg">注册</a>
                    </c:if>
                    <%--    如果用户已登录--%>
                    <c:if test="${!empty sessionScope.user}">
                        <a href="mygxin.jsp">
                                ${sessionScope.user.email}
                        </a>
                    </c:if>
                </p>
                <%-- 首页右上角 热门搜索--%>
                <form action="show?method=keyWord&page=1" method="post" class="fl">
                    <input type="text"  name="searchtext" placeholder="热门搜索：麻辣王子" />
                    <input type="submit"  value=""/>
                </form>
                <div class="btn fl clearfix">
                            <%--个人中心--%>
                    <a href="mygxin.jsp"><img src="img/grzx.png"/></a>
                       <%-- 二维码--%>
                    <a href="#" class="er1"><img src="img/ewm.png"/></a>
                        <%--购物车--%>
                    <a href="cart.jsp"><img src="img/gwc.png"/></a>
                    <%--   --%>
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
                                <dt><img src="img/image/m2/4.jpg"/></dt>
                                <dd>人间挚爱</dd>
                            </dl>
                        </a>
                        <a href="flowerDer.jsp">
                            <dl>
                                <dt><img src="img/image/12su/12su00.jpg"/></dt>
                                <dd>高科技产品</dd>
                            </dl>
                        </a>
                        <a href="decoration.jsp">
                            <dl>
                                <dt><img src="img/image/衣服2/11.jpg"/></dt>
                                <dd>服饰</dd>
                            </dl>
                        </a>
                        <a href="perfume.jsp">
                            <dl>
                                <dt><img src="img/nav6.jpg"/></dt>
                                <dd>香薰</dd>
                            </dl>
                        </a>
                        <a href="idea.jsp">
                            <dl>
                                <dt><img src="img/nav7.jpg"/></dt>
                                <dd>彩妆</dd>
                            </dl>
                        </a>
                    </div>
                </div>
            </li>
            <li>
                <a href="flowerDer.jsp">电子商品</a>
                <div class="sList2">
                    <div class="clearfix">
<%--                        <a href="proList.jsp">干花花艺</a>--%>
<%--                        <a href="vase_proList.jsp">花瓶花器</a>--%>
                    </div>
                </div>
            </li>
            <li>
                <a href="decoration.jsp">服饰</a>
                <div class="sList2">
<%--                    <div class="clearfix">--%>
<%--                        <a href="zbproList.jsp">桌布罩件</a>--%>
<%--                        <a href="bzproList.jsp">抱枕靠垫</a>--%>
<%--                    </div>--%>
                </div>
            </li>
            <li><a href="paint.jsp">零食饮料</a></li>
            <li><a href="perfume.jsp">蜡艺香薰</a></li>
            <li><a href="idea.jsp">彩妆</a></li>
        </ul>
    </div>
</div>