<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>最家</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/idea.css"/>
</head>
<body>
<!------------------------------head------------------------------>
<%@ include file="topbar.jsp" %>

<c:if test="${empty requestScope.shgoodsList&& empty msg}">
    <c:redirect url="goods?method=findJJ"></c:redirect>
</c:if>
<!------------------------------idea------------------------------>
<div class="address">
    <div class="wrapper clearfix">
        <a href="index.jsp" class="fl">首页</a>
        <span>/</span>
        <a href="idea.jsp" class="on">彩妆</a>
    </div>
</div>
<!------------------------------imgList1------------------------------>
<div class="imgList1">
    <div class="wrapper">
        <div class="box1">
            <a href="#" class="banner"><img style="width: 1160px;height: 400px" src="img/image/hf.jpg"/></a>
            <ul>

                <c:forEach items="${requestScope.cygoodsList}" var="o" begin="0" end="2">
                    <li><a href="goods?method=showInfo&g_id=${o.g_id}">
                        <dl>
                            <dt><img style="width: 374px;height: 374px" src="${o.g_url}"/></dt>
                            <dd>【向日葵】${o.g_name}</dd>
                            <dd>¥${o.g_price}</dd>
                        </dl>
                    </a>
                    </li>
                </c:forEach>
            </ul>
            <ul>
                <c:forEach items="${requestScope.cygoodsList}" var="o" begin="3" end="5">
                    <li><a href="goods?method=showInfo&g_id=${o.g_id}">
                        <dl>
                            <dt><img style="width: 374px;height: 374px" src="${o.g_url}"/></dt>
                            <dd>【向日葵】${o.g_name}</dd>
                            <dd>¥${o.g_price}</dd>
                        </dl>
                    </a>
                    </li>
                </c:forEach>
            </ul>
            <ul>
                <c:forEach items="${requestScope.cygoodsList}" var="o" begin="6" end="8">
                    <li><a href="goods?method=showInfo&g_id=${o.g_id}">
                        <dl>
                            <dt><img style="width: 374px;height: 374px" src="${o.g_url}"/></dt>
                            <dd>【向日葵】${o.g_name}</dd>
                            <dd>¥${o.g_price}</dd>
                        </dl>
                    </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <h2><img src="img/ih5.jpg"/></h2>
        <div class="box2">
            <a href="#" class="banner"><img src="img/image/cz.jpg"/></a>
            <ul>
                <c:forEach items="${requestScope.fggoodsList}" var="o" begin="0" end="3">
                    <li><a href="goods?method=showInfo&g_id=${o.g_id}" class="on">
                        <dl>
                            <dt><img  style="width: 268px;height: 268px" src="${o.g_url}"/></dt>
                            <dd>【向日葵】${o.g_name}</dd>
                            <dd>¥${o.g_price}</dd>
                        </dl>
                    </a>
                    </li>
                </c:forEach>

            </ul>
            <ul>
                <c:forEach items="${requestScope.fggoodsList}" var="o" begin="4" end="7">
                    <li><a href="goods?method=showInfo&g_id=${o.g_id}" class="on">
                        <dl>
                            <dt><img style="width: 268px;height: 268px" src="${o.g_url}"/></dt>
                            <dd>【向日葵】${o.g_name}</dd>
                            <dd>¥${o.g_price}</dd>
                        </dl>
                    </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <h2><img src="img/ih6.jpg"/></h2>
        <div class="box3">
            <ul>
                <c:forEach items="${requestScope.shgoodsList}" var="o" begin="0" end="3">
                    <li><a href="goods?method=showInfo&g_id=${o.g_id}" class="on">
                        <dl>
                            <dt><img style="width: 268px;height: 268px" src="${o.g_url}"/></dt>
                            <dd>【向日葵】${o.g_name}</dd>
                            <dd>¥${o.g_price}</dd>
                        </dl>
                    </a>
                    </li>
                </c:forEach>
            </ul>
            <ul>
                <c:forEach items="${requestScope.shgoodsList}" var="o" begin="4" end="7">
                    <li><a href="goods?method=showInfo&g_id=${o.g_id}" class="on">
                        <dl>
                            <dt><img style="width: 268px;height: 268px" src="${o.g_url}"/></dt>
                            <dd>【向日葵】${o.g_name}</dd>
                            <dd>¥${o.g_price}</dd>
                        </dl>
                    </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>


<%@include file="footer.jsp" %>

<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
