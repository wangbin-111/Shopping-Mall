<%--
  Created by IntelliJ IDEA.
  Date: 2022/10/13
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="index.jsp"%>
<style>
  table{
    border: 1px solid darkgray;
  }
</style>
<!--页面主要内容-->

<main class="lyear-layout-content">
  <script>
    if(${!empty msg}){
      alert(${msg})
    }
  </script>
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-header"><h4>商品新增</h4></div>
          <div class="card-body">
            <div class="table-responsive">
              <form action="goods?method=upload" method="post" enctype="multipart/form-data">
                <table class="table table-bordered table-striped table-vcenter" col="5">
                  <tr>
                    <td>商品名称:</td>
                    <td ><input type="text" name="name" /></td>
                  </tr>
                  <tr>
                    <td>商品主图</td>
                    <td><input type="file" name="g_url" onchange="changepic(this,'s')" accept="image/gif,image/jpg,image/png,image/jepg"/><img src="" id="s"/> </td>
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
                    <td><input type="text" id="g_price" name="g_price" onkeyup="checkNum(this.value)"/><span style="color:red;" id="err"></span></td>
                  </tr>
                  <tr>
                    <td>库存:</td>
                    <td><input type="text" id="inventory" name="inventory" onkeyup="checkNum(this.value)"/></td>
                  </tr>
                  <tr>
                    <td>商品简介:</td>
                    <td><input type="text" name="remark"/></td>
                  </tr>
                  <tr>
                    <td>商品附图(四张):</td>
                      <c:forEach begin="0" end="3" var="s" step="1" varStatus="vs">
                        <tr><td></td><td><input type="file" name="g_url2" onchange="changepic(this,'h${vs.index}')" accept="image/gif,image/jpg,image/png,image/jepg"/><img src="" id="h${vs.index}"/></td></tr>
                      </c:forEach>
                  </tr>
                  <tr class="url2">
                    <td>商品类型图:</td>
                    <c:set var="ik" value="0" scope="page"> </c:set>
                    <td><input type="file" name="g_typeurl" onchange="changepic(this,'o')"/><img src="" id="o"/> <input type="text" name="g_typeurltext" placeholder="名称"> </td>
                    <td><input type="button" value="+" style="font-size: 30px" onclick="add(${ik})"/></td>
                  </tr>
                  <tbody id="bd">

                  </tbody>
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
  function add(id) {
      var bd = $("#bd");
      var z = m++;
      var str = "<tr class=\"url2\"><td></td><td><input type=\"file\" name=\"g_url2\" onchange=\"changepic(this,'z')\"><img src=\"\" id='z'> <input type=\"text\" name=\"g_typeurltext\" placeholder=\"名称\"></td><td><input type=\"button\" value=\"-\" style=\"font-size: 30px\" onclick=\"removeTr(this)\"></td></tr>";
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
</script>