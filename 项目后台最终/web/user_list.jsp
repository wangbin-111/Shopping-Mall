<%--
  Created by IntelliJ IDEA.
  Date: 2022/10/15
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="index.jsp"%>
<c:if test="${empty requestScope.userlist&& empty msg}">
    <c:redirect url="user?method=show"></c:redirect>
</c:if>
<main class="lyear-layout-content">

    <div class="container-fluid">

        <div class="row ">

            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header"><h4>用户列表</h4></div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-vcenter">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>用户名</th>
                                    <th>密码</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>地址</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${requestScope.userlist}" var="u">
                                    <tr>
                                        <th>${u.u_id}</th>
                                        <th>${u.email}</th>
                                        <th>${u.password}</th>
                                        <th>${u.name}</th>
                                        <th>${u.gender}</th>
                                        <th>${u.address}</th>
                                        <th>
                                            <a href="user?method=init&id=${u.u_id}">修改</a>
                                            <a href="/user?method=delete&u_id=${u.u_id}">删除</a>
                                        </th>
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
