<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/10/21
  Time: 19:18
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
                    <div class="card-header"><h4>下架商品列表</h4></div>
                    <div class="card-toolbar clearfix">
                        <%--                        搜索（id/name）--%>
                        <form class="pull-right search-bar" method="post" action="oldgoods?method=keyWord&page=1" role="form" onsubmit="return flag">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <select id="k" name="searchtype" class="btn btn-default dropdown-toggle" id="search-btn"  aria-haspopup="true" aria-expanded="false">
                                        <option value="g_id">商品编号</option>
                                        <option value="g_name">商品名称</option>
                                    </select>
                                </div>
                                <div >
                                    <input id="s" type="text" class="form-control" name="keyword" placeholder="请输入名称" />
                                </div>
                            </div>
                            <input type="submit" style="visibility: hidden" value="" onclick="check()">
                        </form>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>${text}</tr>
                                    <tr>
                                        <th>商品编号</th>
                                        <th>商品名称</th>
                                        <th>商品大类型</th>
                                        <th>价格</th>
                                        <th>库存</th>
                                        <th>商品热度</th>
                                        <th>商品详情</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pager.list}" var="g">
                                        <tr id = "z${g.g_id}" value = "z${g.g_id}">
                                            <td>${g.g_id}</td>
                                            <td>${g.g_name}</td>
                                            <td>${g.g_bigtype}</td>
                                            <td>${g.g_price}</td>
                                            <td>${g.g_num}</td>
                                            <td>${g.g_hot}</td>
                                            <td><a href="oldgoods?method=searchs&g_id=${g.g_id}">商品详细</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                        </div>
                        <ul class="pagination">
                            <c:if test="${pager.page==1}">
                                <li class="disabled"><span>上一页</span></li>
                            </c:if>
                            <c:if test="${pager.page!=1}">
                                <li><a href="oldgoods?method=keyWord&page=1&keyword=${keyword}&searchtype=${searchtype}">首页</a></li>
                                <li><a href="oldgoods?method=keyWord&page=${pager.page-1}&keyword=${keyword}&searchtype=${searchtype}">上一页</a></li>
                            </c:if>
                            <c:if test="${pager.page==pager.total}">
                                <li class="disabled"><span>下一页</span></li>
                            </c:if>
                            <c:if test="${pager.page!=pager.total}">
                                <li><a href="oldgoos?method=keyWord&page=${pager.page+1}&keyword=${keyword}&searchtype=${searchtype}">下一页</a></li>
                            </c:if>
                            <li>
                                <input type="text" id="n" style="width: 40px" value="${pager.page}"/>
                                <input type="button" value="GO" onclick="gopage(1,${requestScope.pager.total})"/>
                                <select onchange="window.location.href='oldgoos?method=keyWord&page='+this.value+'&keyword=${keyword}&searchtype=${searchtype}'">
                                    <c:forEach begin="1" end="${pager.total}" step="1" varStatus="vs">
                                        <option value="${vs.index}" <c:if test="${vs.index==pager.page}">selected</c:if>>${vs.index}</option>
                                    </c:forEach>
                                </select>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    var flag=true;
    function check(){
        var s = document.getElementById("s");
        var k = document.getElementById("k");
        if(k.value==="g_id") {
            if(s.value.length==0||isNaN(s.value)){
                alert("请输入正确的商品编号或名字");
                flag = false;
            }else {
                window.location.href="oldgoos?method=keyWord&page=1&keyword="+ s.value+"&searchtype="+k.value;
            }
        }else {
            if(s.value.length==0){
                alert("请输入正确的商品编号或名字");
                flag = false;
            }else {
                window.location.href="oldgoos?method=keyWord&page=1&keyword="+ s.value+"&searchtype="+k.value;
            }
        }
    }

    function gopage(min,max,t1){
        var n = document.getElementById("n");
        if(isNaN(n.value)||n.value==null||n.value<min||n.value>max){
            alert("请输入有效范围内数字");
            return;
        }else {
            window.location.href="oldgoos?method=keyWord&searchtext="+t1+"&page="+n.value;
        }
    }


</script>