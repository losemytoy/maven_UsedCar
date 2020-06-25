<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/6/1
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息添加</title>
    <style>
        table{
            margin: 0px auto;
        }
    </style>
</head>
<body>
<jsp:include page="adminIndex.jsp" flush="true"/>
<p style="text-align: center; font-size: 40px; font-weight: bold;margin-top: 120px">订单信息添加</p>
<form action="addOrderhello.action" style="text-align: center;margin-top: 50px;">
    <table align="center" width="500" border="1" cellpadding="0" cellspacing="0" >

        <tr>
            <th scope="row">卖家账号：</th>
            <td><input type="text" name="sellerNo"/></td>
        </tr>
        <tr>
            <th scope="row" >买家账号：</th>
            <td><input type="text" name="buyerNo"/></td>
        </tr>
        <tr>
            <th scope="row" >车辆编号：</th>
            <td><input type="text" name="carNo"/></td>
        </tr>
        <tr>
            <th scope="row" >价格：</th>
            <td><input type="text" name="price"/></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="reset" name="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="添加"/>
            </td>
        </tr>
    </table>
    </br>
    <a href="OrderMes.jsp" style="font-size: 15px;">返回首页</a>
</form>
</body>
</html>