<%--
  Created by IntelliJ IDEA.
  Date: 2022/10/12
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <title>首页 - 向日葵小商店后台管理系统</title>
  <link rel="icon" href="avatar.ico" type="img/ico">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/materialdesignicons.min.css" rel="stylesheet">
  <link href="css/style.min.css" rel="stylesheet">
</head>
<style>
  .hycon{
    width: 80%;height: 400px;position: absolute;right: 0;top: 210px
  }
  .hy{
    color: yellowgreen;
    margin-left: 20%;
    font-size: 40px;
    font-weight: bold;
  }
  .jy{
    display: inline-block;
    width: 800px;
    color: gainsboro;
    margin-top: 50px;
    margin-left: 20%;
    font-size: 20px;
    font-weight: bold;
  }
</style>
<body>
<%
  String msg = (String) request.getAttribute("msg");
  if(msg!=null){
%>
<%--<script type="text/javascript" language="JavaScript">--%>
<%--  alert("<%=msg%>")--%>
<%--</script>--%>
<%--<c:redirect url="index"></c:redirect>--%>
<%}%>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.jsp"><img src="img/logo.jpg" title="LightYear" alt="LightYear" /></a>
      </div>

      <div class="lyear-layout-sidebar-scroll">
        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <!--左侧导航-->
            <li class="nav-item active"> <a href="index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
<%--            商品管理--%>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-palette"></i>商品管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="oldgoods?method=keyWord&page=1&keyword=null&searchtype=g_name">下架商品列表</a> </li>
                <li> <a href="goods?method=keyWord&page=1&keyword=null&searchtype=g_name&m=null">商品列表</a> </li>
                <li> <a href="goods_add.jsp">商品新增</a> </li>
              </ul>
            </li>
<%--            订单管理--%>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-format-align-justify"></i>订单管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="order?method=show">查看所有订单</a> </li>
              </ul>
            </li>
<%--            用户管理--%>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-file-outline"></i> 用户管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="user?method=show">用户列表</a> </li>
                <li> <a href="user_add.jsp">用户新增</a> </li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
    </aside>

    <!--头部信息-->
    <header class="lyear-layout-header">

      <nav class="navbar navbar-default">
        <div class="topbar">

          <div class="topbar-left">
            <div class="lyear-aside-toggler">
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
            </div>
            <span class="navbar-page-title"> 后台首页 </span>
          </div>

          <ul class="topbar-right">
            <li class="dropdown dropdown-profile">
              <a href="javascript:void(0)" data-toggle="dropdown">
                <img class="img-avatar img-avatar-48 m-r-10" src="img/users/avatar.png" alt="笔下光年" />
                <span>向日葵杂货铺 <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li style="align-content:center "> <a href="login.jsp" style="background: white;color: #65FDF0;font-size: 15px">退出登录</a> </li>
              </ul>
            </li>
            <!--切换主题配色-->
            <li class="dropdown dropdown-skin">
              <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
              <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                <li class="drop-title"><p>主题</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                </li>
                <li class="drop-title"><p>LOGO</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                    <label for="logo_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                    <label for="logo_bg_8"></label>
                  </span>
                </li>
                <li class="drop-title"><p>头部</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
                </li>
                <li class="drop-title"><p>侧边栏</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                    <label for="sidebar_bg_8"></label>
                  </span>
                </li>
              </ul>
            </li>
            <!--切换主题配色-->
          </ul>

        </div>
      </nav>

    </header>
    <!--End 头部信息-->
  </div>
</div>

<%--<div class="hycon">--%>
<%--  <div>--%>

<%--    <span class="hy">欢迎来到向日葵杂货铺后台管理界面</span>--%>
<%--  </div>--%>


<%--  <div style="margin-left: 29%;margin-top: 20px">--%>
<%--    <img style="width: 400px" src="img/users/avatar.png"/>--%>
<%--  </div>--%>
<%--  <div>--%>

<%--    <span class="jy">本店铺致力于为用户带来最好的体验，请认真对待用户的信息</span>--%>
<%--  </div>--%>

<%--</div>--%>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>

<!--图表插件-->
<script type="text/javascript" src="js/Chart.js"></script>
<script type="text/javascript">
  $(document).ready(function(e) {
    var $dashChartBarsCnt  = jQuery( '.js-chartjs-bars' )[0].getContext( '2d' ),
            $dashChartLinesCnt = jQuery( '.js-chartjs-lines' )[0].getContext( '2d' );

    var $dashChartBarsData = {
      labels: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
      datasets: [
        {
          label: '注册用户',
          borderWidth: 1,
          borderColor: 'rgba(0,0,0,0)',
          backgroundColor: 'rgba(51,202,185,0.5)',
          hoverBackgroundColor: "rgba(51,202,185,0.7)",
          hoverBorderColor: "rgba(0,0,0,0)",
          data: [2500, 1500, 1200, 3200, 4800, 3500, 1500]
        }
      ]
    };
    var $dashChartLinesData = {
      labels: ['2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014'],
      datasets: [
        {
          label: '交易资金',
          data: [20, 25, 40, 30, 45, 40, 55, 40, 48, 40, 42, 50],
          borderColor: '#358ed7',
          backgroundColor: 'rgba(53, 142, 215, 0.175)',
          borderWidth: 1,
          fill: false,
          lineTension: 0.5
        }
      ]
    };

    new Chart($dashChartBarsCnt, {
      type: 'bar',
      data: $dashChartBarsData
    });

    var myLineChart = new Chart($dashChartLinesCnt, {
      type: 'line',
      data: $dashChartLinesData,
    });
  });
</script>
</body>



<script>
  function deleteOne(e){
    var r = confirm("您确定退出系统？")
    if(r==true){
      window.location.href="login.jsp";
    }else {

    }
  }
</script>

</html>
