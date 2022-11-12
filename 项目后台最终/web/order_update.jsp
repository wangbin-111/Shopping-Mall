<%--
  Created by IntelliJ IDEA.
  Date: 2022/10/13
  Time: 11:46
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
          <div class="card-header"><h4>订单修改</h4></div>
          <div class="card-body">
            <div class="table-responsive">

              <form action="order?method=update&ship_id=${requestScope.ship_id}&order_id=${requestScope.order_id}" method="post">
                <table class="table table-bordered table-striped table-vcenter">
<%--                  <input type="text" name="id" value="" style="display: none"/>--%>
                  <tr>
                    <td>收货地址:</td>

<%--                    <c:forEach items="${requestScope.address.split(\"-\")}" var="a">--%>

                    <td><input type="text" placeholder="省" name="sheng" value="${requestScope.address.split("-")[0]}"/></td>
                      <td><input type="text" placeholder="市" name="shi" value="${requestScope.address.split("-")[1]}"/></td>
                      <td><input type="text" placeholder="区" name="qu" value="${requestScope.address.split("-")[2]}"/></td>
                    <td><input type="text" placeholder="详细地址" name="da" value="${requestScope.da}"/></td>

<%--                    </c:forEach> --%>
                  </tr>
                  <tr>
                    <td>订单状态:</td>
<%--                    <td><input type="text"  value="${requestScope.state}"/></td>--%>
                      <td><select name="state">
                          <option  value="1" <c:if test="${requestScope.state=='1'}">selected</c:if>>已发货</option>
                          <option  value="2"  <c:if test="${requestScope.state=='2'}">selected</c:if> >已收货</option>
                          <option  value="3"  <c:if test="${requestScope.state=='3'}">selected</c:if>>已评价</option>

                      </select></td>


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