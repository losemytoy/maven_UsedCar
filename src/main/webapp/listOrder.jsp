<%@ page import="entity.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.AdminDao" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Users" %>
<%@ page import="entity.Order" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/6/1
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>订单信息</title>
    <style>

    </style>
</head>
<%
    List<Order> orderList =(List<Order>) request.getAttribute("listOrder");
%>
<body>
<jsp:include page="adminIndex.jsp" flush="true"/>
<p style="text-align: center; font-size: 40px; font-weight: bold;margin-top: 120px">订单信息查询</p>

<table class="col-md-10" style="margin: 5% 8.5%" cellpadding="1" cellspacing="1" align="center">
    <tr>
        <td valign="top" align="center" border="">
            <p align=center style="font-size: 25px;">订单信息</p>
            <a href="OrderMes.jsp" style="float: right;margin-top: -20px">返回</a>
            <table width="100%" border="" cellpadding="1" cellspacing="1" bgcolor="#FECE62">
                <tr align="center">
                    <td align="center">订单编号</td>
                    <td align="center">卖家账号</td>
                    <td align="center">卖家账号</td>
                    <td align="center">车辆编号</td>
                    <td align="center">价格</td>
                    <td align="center">创建日期</td>
                    <td align="center">操作</td>
                </tr>

                <c:forEach var="order" items="${listOrder}">
                    <tr align="center">
                        <td align="center"><p style="max-width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${order.orderNo}</p></td>
                        <td align="center">${order.sellerNo}</td>
                        <td align="center">${order.buyerNo}</td>
                        <td align="center">${order.carNo}</td>
                        <td align="center">${order.price}</td>
                        <td align="center">${order.orderDate}</td>
                        <td align="center">
                            <a href="gotoupdataOrderhello?orderNo=${order.orderNo}">修改</a>&nbsp;&nbsp;
                            <a href="deleteOrderhello?orderNo=${order.orderNo}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </br>
            </table>
        </td>
    </tr>
</table>
</body>
</html>