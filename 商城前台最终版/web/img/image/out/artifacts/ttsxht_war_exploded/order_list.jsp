<%--
  Created by IntelliJ IDEA.
  Date: 2022/10/13
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="index.jsp"%>
<!--页面主要内容-->
<main class="lyear-layout-content">

    <div class="container-fluid">

        <div class="row">

            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header"><h4>商品列表</h4></div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-vcenter">
                                <thead>
                                <tr>
                                    <th>订单编号</th>
                                    <th>用户名</th>
                                    <th>手机号</th>
                                    <th>下单时间</th>
                                    <th>收货地址</th>
                                    <th>商品名称</th>
                                    <th>商品规格</th>
                                    <th>商品数量</th>
                                    <th>总价</th>
                                    <th>快递类别</th>
                                    <th>支付方式</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                <c:forEach var="l" items="${niubi}">
                                <tr>
                                    <th>${l.order_id}</th>
                                    <th>${l.ship_name}</th>
                                    <th>${l.ship_num}</th>
                                    <th>${l.date}</th>
                                    <th>${l.ship_address}</th>
                                    <th>${l.g_name}</th>
                                    <th>${l.type}</th>
                                    <th> ${l.count}</th>
                                    <th>${l.allmoney}</th>
                                    <th>${l.fastmail}</th>
                                    <th>${l.paytype}</th>

<%--                                    <th>${l.state}</th>--%>
                                    <c:if test="${l.state=='1'}">
                                        <th>已发货</th>
                                    </c:if>
                                    <c:if test="${l.state=='2'}">
                                        <th>已收货</th>
                                    </c:if>
                                    <c:if test="${l.state=='3'}">
                                        <th style="color: green">已评价</th>
                                    </c:if>
                                    <th><a href="order?method=init&order_id=${l.order_id}">修改</a></th>

                                </tr>
                                </c:forEach>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</main>
<!--End 页面主要内容-->

