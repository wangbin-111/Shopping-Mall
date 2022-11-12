<%--
  Created by IntelliJ IDEA.
  User: bin
  Date: 2022/10/12
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="utf-8" />
    <title>最家</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css" />
</head>
<style>
    .three dl:hover{
        color: #fff;
        transform: translateY(-10px);
        transition:all .3s;
    }
    .three dl{
        transition:all .3s;

    }
    .news .flower dl dd{
        margin: 0;
    }
    .news .flower a:hover{
        background-color: white;
        /*transform: translateY(-10px);*/
    }
    .news .flower dl:hover{
        box-shadow: 0 0 10px #757575;
    }

</style>
<body>
<!------------------------------head------------------------------>
<%@ include file="topbar.jsp"%>

<c:if test="${empty list &&empty msg}">
    <c:redirect url="show?method=list"></c:redirect>
</c:if>
<!-------------------------banner--------------------------->
<div class="block_home_slider">
    <div id="home_slider" class="flexslider">
        <ul class="slides">
            <c:forEach items="${requestScope.listBar}" var="s">
                <li>
                    <div class="slide">
                        <img src="${s.g_url}" style="height: 527px"/>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<!------------------------------thImg------------------------------>
<div class="thImg">
    <div class="clearfix">
        <a href="flowerDer.jsp"><img style="width: 260px;height: 350px" src="img/image/dzcpp.jpg"/></a>
        <a href="paint.jsp"><img style="width: 260px;height: 350px" src="img/image/ls.jpg"/></a>
        <a href="idea.jsp"><img style="width: 260px;height: 350px" src="img/image/titlecz.jpg"/></a>
    </div>
</div>

<!------------------------------news------------------------------>
<div class="news">
    <div class="wrapper">
<%--        薪水特色--%>
    <h1 style="margin: 30px 0 20px 40px">彩妆</h1>

    <div class="flower clearfix tran three">
        <c:forEach items="${requestScope.listmz}" var="s" begin="0" end="2" step="1">
            <a href="goods?method=showInfo&g_id=${s.g_id}" class="clearfix">
                <dl>
                    <dt>
                        <span class="abl"></span>
                        <img style="width: 250px" src="${s.g_url}"/>
                        <span class="abr"></span>
                    </dt>
                </dl>
                </a>
        </c:forEach>
    </div>

    <div style="height: 30px"></div>
    <div class="flower clearfix tran three">
        <c:forEach items="${requestScope.listmz}" var="s" begin="3" end="5" step="1">
            <a href="goods?method=showInfo&g_id=${s.g_id}" class="clearfix">
                <dl>
                    <dt>
                        <span class="abl"></span>
                        <img style="width: 250px" src="${s.g_url}"/>
                        <span class="abr"></span>
                    </dt>
                </dl>
            </a>
        </c:forEach>
    </div>
    <%--摆件花艺--%>
    <h1 style="margin: 30px 0 20px 40px">香薰</h1>

    <div class="flower clearfix tran">
        <c:forEach items="${requestScope.listxx}" begin="0" end="3" step="1" var="s">
            <a href="goods?method=showInfo&g_id=${s.g_id}" class="clearfix">
                <dl>
                    <dt>
                        <span class="abl"></span>
                        <img style="width: 220px" src="${s.g_url}"/>
                        <span class="abr"></span>
                    </dt>
                    <dd>${s.g_smalltype}${s.g_bigtype}${s.g_name}</dd>
                    <dd><span>¥ ${s.g_price}</span></dd>
                </dl>
            </a>
        </c:forEach>
    </div>
    <div class="flower clearfix tran">
        <c:forEach items="${requestScope.listxx}" begin="4" end="7" step="1" var="s">
            <a href="goods?method=showInfo&g_id=${s.g_id}" class="clearfix">
                <dl>
                    <dt>
                        <span class="abl"></span>
                        <img  style="width: 220px" src="${s.g_url}"/>
                        <span class="abr"></span>
                    </dt>
                    <dd>${s.g_smalltype}${s.g_bigtype}${s.g_name}</dd>
                    <dd><span>¥ ${s.g_price}</span></dd>
                </dl>
            </a>
        </c:forEach>
    </div>
    </div>
</div>

<!------------------------------ad------------------------------>
<a href="#" class="ad"><img src="img/image/dzsmalltitle.jpg"/></a>

<!------------------------------people------------------------------>
<div class="people">
    <div class="wrapper">
        <h1 style="margin: 0 0 20px 40px">电子产品</h1>
        <div class="pList clearfix tran">
            <c:forEach items="${requestScope.listds}" begin="0" end="3" step="1" var="s">
                <a href="goods?method=showInfo&g_id=${s.g_id}">
                    <dl>
                        <dt>
                            <span class="abl"></span>
                            <img  style="width: 220px" src="${s.g_url}"/>
                            <span class="abr"></span>
                        </dt>
                        <dd>${s.g_smalltype}${s.g_bigtype}${s.g_name}</dd>
                        <dd><span>¥ ${s.g_price}</span></dd>
                    </dl>
                </a>
            </c:forEach>
        </div>
        <div class="pList clearfix tran">
            <c:forEach items="${requestScope.listds}" begin="4" end="7" step="1" var="s">
                <a href="goods?method=showInfo&g_id=${s.g_id}" >
                    <dl>
                        <dt>
                            <span class="abl"></span>
                            <img  style="width: 220px" src="${s.g_url}"/>
                            <span class="abr"></span>
                        </dt>
                        <dd>${s.g_smalltype}${s.g_bigtype}${s.g_name}</dd>
                        <dd><span>¥ ${s.g_price}</span></dd>
                    </dl>
                </a>
            </c:forEach>
        </div>
        <div class="pList clearfix tran">
            <c:forEach items="${requestScope.listds}" begin="8" end="11" step="1" var="s">
                <a href="goods?method=showInfo&g_id=${s.g_id}">
                    <dl>
                        <dt>
                            <span class="abl"></span>
                            <img  style="width: 220px" src="${s.g_url}"/>
                            <span class="abr"></span>
                        </dt>
                        <dd>${s.g_smalltype}${s.g_bigtype}${s.g_name}</dd>
                        <dd><span>¥ ${s.g_price}</span></dd>
                    </dl>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>

<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function() {
        $('#home_slider').flexslider({
            animation: 'slide',
            controlNav: true,
            directionNav: true,
            animationLoop: true,
            slideshow: true,
            slideshowSpeed:2000,
            useCSS: false
        });

    });
</script>


</body>
</html>

