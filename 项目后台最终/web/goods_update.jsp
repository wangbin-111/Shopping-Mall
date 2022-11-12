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
                    <div class="card-header"><h4>商品修改</h4></div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form action="goods?method=update&id=${g.g_id}" method="post" enctype="multipart/form-data">
                                <table class="table table-bordered table-striped table-vcenter">
                                    <tr>
                                        <td >商品编号:</td>
                                        <td><input type="text" name="id" value="${g.g_id}" readonly/></td>
                                    </tr>
                                    <tr>
                                        <td >商品名称:</td>
                                        <td><input type="text" name="name" value="${g.g_name}"/></td>
                                    </tr>
                                    <tr>
                                        <td>商品主图</td>
                                        <td>
                                            <input type="file" name="g_url" onchange="changepic(this,'s')"/>
                                            <img src="${g.g_url}" id="s">
                                            <input type="hidden" name="url" value="${g.g_url}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>商品大类型:</td>
                                        <td>
                                            <select name="g_bigtype">
                                                <option value="电子商品"> 电子商品</option>
                                                <option value="服装"> 服装</option>
                                                <option value="零食饮料"> 零食饮料</option>
                                                <option value="香薰"> 香薰</option>
                                                <option value="美妆"> 美妆</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>商品小类型:</td>
                                        <td>
                                            <select name="g_smalltype">
                                                <option value="手机"> 手机</option>
                                                <option value="笔记本"> 笔记本</option>
                                                <option value="随声"> 随声</option>
                                                <option value="男装"> 男装</option>
                                                <option value="女装"> 女装</option>
                                                <option value="速食"> 速食</option>
                                                <option value="辣条"> 辣条</option>
                                                <option value="饮品"> 饮品</option>
                                                <option value="零食"> 零食</option>
                                                <option value="香"> 香</option>
                                                <option value="熏"> 熏</option>
                                                <option value="彩妆"> 彩妆</option>
                                                <option value="护肤"> 护肤</option>
                                                <option value="香水"> 香水</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>商品价格:</td>
                                        <td><input id="price" type="text" name="g_price" value="${g.g_price}" onkeyup="checkNum(this.value)"/><span style="color:red;" id="err"></span></td>
                                    </tr>
                                    <tr>
                                        <td>库存:</td>
                                        <td><input id="num" type="text" name="inventory" value="${g.g_num}" onkeyup="checkNum(this.value)"/></td>
                                    </tr>
                                    <tr>
                                        <td>商品简介:</td>
                                        <td><input type="text" name="remark" value="${g.g_remark}"/></td>
                                    </tr>
                                    <tr>
                                        <td>商品附图(四张):</td>
                                        <c:forTokens items="${g.g_url2}" delims="," var="s" varStatus="vs">
                                            <tr><td></td><td><input  type="file" name="g_url2"  onchange="changepic(this,'h${vs.index}')" />
                                                            <img src="${s}" id="h${vs.index}"/>
                                                            <input type="hidden" name="${vs.index}" value="${s}"/>
                                                            </td>
                                            </tr>
                                        </c:forTokens>
                                    </tr>
                                    <c:set var="ik" value="0" scope="page"> </c:set>
                                    <tr>
                                        <td>商品类型图:</td>
                                        <c:forTokens items="${g.g_typeurl}" delims="," var="s" varStatus="vs">
                                           <tr><td></td><td><input type="file" name="g_typeurl" onchange="changepic(this,'o${vs.index}')"  />
                                                            <img id="o${vs.index}" src="${s.split(":")[0]}">
                                                             <input type="hidden" name="${vs.index}" value="${s.split(":")[0]}"/><br/>
                                                    <input type="text" name="g_typeurltext" value="${s.split(":")[1]}" ><input type="button" value="-" onclick="removeTr(this)"></td>
                                           </tr>
                                    </c:forTokens>
                                    </tr>
                                    <tbody id="bd">
                                    </tbody>
                                    <td><input type="button" value="+" style="font-size: 30px" onclick="add()"></td>
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
<script>
    var m = 1;
    function add() {

        var z = m++;
        var bd = $("#bd");
        var str = "<tr><td></td><td><input type=\"file\" name=\"g_typeurl\" onchange=\"changepic(this,'z')\"><img id=z src=\"\"> <input type=\"hidden\" name='z' value=''><input type=\"text\" name=\"g_typeurltext\" placeholder=\"名称\"><input type=\"button\" value=\"-\"  onclick=\"removeTr(this)\"></td></tr>";
        bd.append(str);
    }
    function removeTr(o){
        $(o).parent().parent().remove();
    }

    function changepic(obj,index){
       var name = obj.files[0];
       var ends = name.name.substring(name.name.lastIndexOf("."));
        if(ends==".jpg"||ends==".png"||ends==".gif") {
            var newsrc = getObjectURL(name);
            document.getElementById(index).src=newsrc;

        }else if(name.size>4*1024*1024) {
            alert("图片不能超过4M");
            obj.value="";
            return false;
        }else {
            alert("文件格式只能为.jpg,.png,.gif");
            obj.value="";
            return false;
       }
    }

    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }

    function checkNum(v){
        if(isNaN(v)){
            $("#err").html('价格和库存只能输入数字！');
        }else{
            $("#err").html('');
        }
    }
    function checkFile(d){
       var s= document.getElementById(d);
       alert(s.va)
    }
</script>