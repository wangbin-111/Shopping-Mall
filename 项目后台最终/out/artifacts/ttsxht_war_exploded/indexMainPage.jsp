<%--
  Created by IntelliJ IDEA.
  User: 王斌
  Date: 2022/10/20
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="index.jsp"%>
<!--页面主要内容-->
<%
    if (request.getAttribute("userSum")==null){response.sendRedirect("index");}
%>
<main class="lyear-layout-content">

    <div class="container-fluid">

        <div class="row">
            <div class="col-sm-6 col-lg-3">
                <div class="card bg-primary">
                    <div class="card-body clearfix">
                        <div class="pull-right">
                            <p class="h6 text-white m-t-0">商品总数</p>
                            <p class="h3 text-white m-b-0">${goodsSum}</p>
                        </div>
                        <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-shopping fa-1-5x"></i></span> </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="card bg-danger">
                    <div class="card-body clearfix">
                        <div class="pull-right">
                            <p class="h6 text-white m-t-0">用户总数</p>
                            <p class="h3 text-white m-b-0">${userSum}</p>
                        </div>
                        <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="card bg-success">
                    <div class="card-body clearfix">
                        <div class="pull-right">
                            <p class="h6 text-white m-t-0">订单总量</p>
                            <p class="h3 text-white m-b-0">${ordersssSum}</p>
                        </div>
                        <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-comment-check-outline fa-1-5x"></i></span> </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="card bg-purple">
                    <div class="card-body clearfix">
                        <div class="pull-right">
                            <p class="h6 text-white m-t-0">总收入</p>
                            <p class="h3 text-white m-b-0">${priceSum}元</p>
                        </div>
                        <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-currency-cny fa-1-5x"></i></span> </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">

            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>订单情况</h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="btn btn-primary m-r-5" href="order?method=show"><i class="mdi mdi-plus"></i>查看更多订单</a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>姓名</th>
                                    <th>手机号</th>
                                    <th>下单时间</th>
                                    <th>收货地址</th>
                                    <th>状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${orderInfoList}" var="l">
                                        <td>${l.order_id}</td>
                                        <td>${l.name}</td>
                                        <td>${l.phoneNum}</td>
                                        <td>${l.date}</td>
                                        <td>${l.address}</td>
                                    <c:if test="${l.state=='1'}">
                                        <td><span class="label label-success">已发货</span></td>
                                    </c:if>
                                    <c:if test="${l.state=='2'}">
                                        <td><span class="label label-warning">已收货</span></td>
                                    </c:if>
                                    <c:if test="${l.state=='3'}">
                                        <td><span class="label label-warning">已完成</span></td>
                                    </c:if>


                                    <%--                                    <c:if test="${l.state=='已付款'}">--%>
<%--                                        <td><span class="label label-warning">已付款</span></td>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${l.state=='未付款'}">--%>
<%--                                        <td><span class="label label-danger">未付款</span></td>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${l.state=='已支付'}">--%>
<%--                                    <td><span class="label label-warning">已支付</span></td>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${l.state=='未支付'}">--%>
<%--                                        <td><span class="label label-danger">未支付</span></td>--%>
<%--                                    </c:if>--%>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</main>
<!--End 页面主要内容-->
