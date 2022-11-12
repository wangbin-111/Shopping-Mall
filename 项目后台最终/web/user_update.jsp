<%--
  Created by IntelliJ IDEA.
  Date: 2022/10/15
  Time: 15:28
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
                    <div class="card-header"><h4>用户修改</h4></div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form action="user?method=update" method="post">
                                <table class="table table-bordered table-striped table-vcenter">
                                    <input type="hidden" name="u_id" value="${u.u_id}"/>
                                    <tr>
                                        <td>密码:</td>
                                        <td><input type="text" name="password" value="${u.password}"/></td>
                                    </tr>
                                    <tr>
                                        <td>姓名:</td>
                                        <td><input type="text" name="name" value="${u.name}"/></td>
                                    </tr>
                                    <tr>
                                        <td>性别:</td>
                                        <td>
                                            男<input type="radio" value="男" name="gender" ${u.gender=="男"?"checked":""}/>&nbsp;
                                            女<input type="radio" value="女" name="gender" ${u.gender=="女"?"checked":""}/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>生日:</td>
                                        <td><input type="text" name="birthday" value="${u.birthday}"/></td>
                                    </tr>
                                    <tr>
                                        <td>详细地址:</td>
                                        <td><input type="text" name="address" value="${u.address}"/></td>
                                    </tr>
                                    <tr>
                                        <td>邮箱:</td>
                                        <td><input type="text" name="email" value="${u.email}"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="submit" value="提交"/></td>
                                        <td><input type="reset" value="重置"/></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</main>
<!--End 页面主要内容-->

