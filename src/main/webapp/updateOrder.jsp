
<%@ page import="entity.Order" %><%--
  Created by IntelliJ IDEA.
  User: 89412
  Date: 2019/6/8
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单信息修改</title>
    <style>
        table{
            margin: 0px auto;
        }
    </style>
</head>
<%
    Order order = (Order) request.getAttribute("updataOrder");
%>
<body>
<jsp:include page="adminIndex.jsp" flush="true" />
<p style="text-align: center; font-size: 40px; font-weight: bold;margin-top: 120px">订单信息修改</p>
<form action="updataOrderhello.action" style="text-align: center;margin-top: 50px">
    <table align="center" width="500" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th width="32" scope="row">订单编号:</th>
            <td width="120">
                <input type="text" value="<%=order.getOrderNo()%>" name="orderNo"/>
            </td>
        </tr>
        <tr>
            <th scope="row">卖家账号：</th>
            <td><input type="text" value="<%=order.getSellerNo()%>" name="sellerNo"/></td>
        </tr>
        <tr>
            <th scope="row" >买家账号：</th>
            <td><input type="text" value="<%=order.getBuyerNo()%>" name="buyerNo"/></td>
        </tr>
        <tr>
            <th scope="row" >车辆编号：</th>
            <td><input type="text" value="<%=order.getCarNo()%>" name="carNo"/></td>
        </tr>
        <tr>
            <th scope="row" >价格：</th>
            <td><input type="text" value="<%=order.getPrice()%>" name="price"/></td>
        </tr>
        <tr>
            <th scope="row" >创建日期：</th>
            <td><input type="text" value="<%=order.getOrderDate()%>" name="orderDate"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="reset" name="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="修改"/>
            </td>
        </tr>
    </table>
    </br>
    <a href="UsersMes.jsp" style="font-size: 15px;">返回首页</a>
</form>
</body>
</html>
