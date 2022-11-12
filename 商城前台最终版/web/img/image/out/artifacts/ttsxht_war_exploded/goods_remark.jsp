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
                    <div class="card-header"><h4>商品详情</h4></div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-vcenter">
                                <thead>
                                <tr>
                                    <th class="w-10">商品编号:</th>
                                    <td>${g.g_id}</td>
                                </tr>
                                <tr>
                                    <th>商品主图:</th>
                                    <td><img src="${g.g_url}"></td>
                                </tr>
                                <tr>
                                    <th>商品名称:</th>
                                    <td>${g.g_name}</td>
                                </tr>
                                <tr>
                                    <th>商品大类型:</th>
                                    <td>${g.g_bigtype}</td>
                                </tr>
                                <tr>
                                    <th>商品小类型:</th>
                                    <td>${g.g_smalltype}</td>
                                </tr>
                                <tr>
                                    <th>商品介绍:</th>
                                    <td>${g.g_remark}</td>
                                </tr>
                                <tr>
                                    <th>商品可选购买样式图:</th>
                                    <c:forTokens items="${g.g_typeurl}" delims="," var="s">
                                        <td><img src="${s.split(":")[0]}"><br/>${s.split(":")[1]}</td>
                                    </c:forTokens>
                                </tr>
                                <tr>
                                    <th>价格:</th>
                                    <td>${g.g_price}</td>
                                </tr>
                                <tr>
                                    <th>库存:</th>
                                    <td>${g.g_num}</td>
                                </tr>
                                <tr>
                                    <th>日期:</th>
                                    <td>${g.g_date}</td>
                                </tr>
                               <c:if test="${style == 'goods'}">
                                   <tr>
                                       <th>操作:</th>
                                       <td>
                                           <a href="goods?method=init&g_id=${g.g_id}">修改</a>
                                       </td>
                                   </tr>
                               </c:if>

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

