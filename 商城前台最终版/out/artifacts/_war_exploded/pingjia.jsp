<%--
  Created by IntelliJ IDEA.
  User: bin
  Date: 2022/10/20
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<style>
    .con {
        height: 800px;
        width: 100%;
        text-align: center;
    }

    .concenter {
        margin: 50px auto;
        height: 600px;
        width: 80%;
        text-align: center;
    }

    .form {
        position: relative;
        width: 600px;
        height: 500px;
        box-shadow: 1px 1px 8px 8px rgba(1, 2, 2, .2);
        margin: 0px auto;

    }

    .file {
        margin: 10px 0 20px 0;
    }

    .file input {
        margin: 10px 0 10px 0;
    }

    .pj {
        font-size: 18px;
        position: absolute;
        /*top: 750px;*/
        bottom: 0px;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100px;
        height: 60px;
        background-color: brown;
        color: white;
    }

    .pj:hover {
        background-color: darkred;
    }

    .good {
        margin-top: 50px;
        display: flex;
        flex-direction: row;
        width: 600px;
        margin-left: 50%;
        transform: translate(-50%, -50%);

    }
    .good div {
        font-size: 20px;
        margin-left: 10px;
        line-height: 50px;
    }
</style>
<body>
<%@ include file="topbar.jsp" %>

<div class="con">
    <div class="concenter">

        <div>
            <h2>您在评价的商品</h2>
            <c:forEach items="${requestScope.gooddlist}" var="good">
                <div class="good">
                    <div><img style="width: 50px" src="${good.g_url}"></div>
                    <div>商品名称：${good.g_name}</div>
                    <div>商品价格：${good.g_price}￥</div>
                </div>
            </c:forEach>
        </div>
        <form action="goods?method=addPingjia" method="post" class="form" enctype="multipart/form-data">
            <input type="hidden" name="u_id" value="${sessionScope.user.u_id}"/>
            <br>
            请选择商品星级(默认5⭐) : &nbsp;&nbsp;<select style="width: 30px;box-shadow: 1px 1px 4px 4px rgba(1,1,1,.3)"  name="grade">
                <option value="5">5</option>
                <option value="4">4</option>
                <option value="3">3</option>
                <option value="2">2</option>
                <option value="1">1</option>
            </select>&nbsp;&nbsp;⭐
            <br>

            <input type="hidden" name="o_id" value="${requestScope.o_id}"/>
            <c:forEach items="${requestScope.gooddlist}" var="good">
                <input type="hidden" name="o_id" value="${good.g_id}"/>
            </c:forEach>
            <textarea name="pingjia" placeholder="请输入你的评价" cols="40" rows="6" style="font-size: 20px;margin-top: 10px"></textarea>
            <br>
            <span style="margin-top: 30px">请输入你要上传的图片</span>
            <div class="file">
                <input type="file" name="img"/>
            </div>
            <input style="font-size: 14px;width: 70px;height: 70px" type="button" onclick="addFile()" value="添加图片">


            <input class="pj" type="submit" value="评价"/>
        </form>
    </div>

</div>


<%@ include file="footer.jsp" %>
<script>
    function addFile() {
        var file = document.querySelector(".file")

        if (file.children.length === 4) {
            alert("最多上传4张图片")
        } else {

            var xfile=document.createElement("input")
            xfile.type="file";
            xfile.name="img";
            file.appendChild(xfile)
        }
    }
</script>
</body>
</html>
