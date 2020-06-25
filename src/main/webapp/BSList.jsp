<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="entity.Order" %>
<%@ page import="Dao.OrderDao" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Or" %><%--
  Created by IntelliJ IDEA.
  User: 89412
  Date: 2019/6/2
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>订单管理</title>
</head>
<%
    List<Order> order = new OrderDao().getorderbybuy();
    if(order == null){
        order = new ArrayList<>();
    }
%>
<body>
<jsp:include page="navbar.jsp" flush="true" />
<h2 style="text-align: center;margin-top: 120px">订单信息</h2>
<form action="searchOrder1hello.action" style="text-align: center;margin-top: 50px">
    订单编号：<input type="text" name="order.orderNo" id="">
    <input type="submit" value="查询">
</form>
<table class="col-md-10" style="margin: 5% 9%" cellpadding="1" cellspacing="1" align="center">
    <tr>
        <td valign="top" align="center" border="">

            <table width="100%" border="" cellpadding="1" cellspacing="1" bgcolor="#FECE62">
                <tr align="center">
                    <td align="center">订单编号</td>
                    <td align="center">卖家账号</td>
                    <td align="center">买家账号</td>
                    <td align="center">车辆编号</td>
                    <td align="center">价格</td>
                    <td align="center">创建日期</td>
                    <td align="center">操作</td>
                </tr>
                <%
                    for (Order order1:order){
                %>
                <tr bgcolor="#FFFFFF" align="center">
                    <td align="center">
                        <p style="max-width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><%=order1.getOrderNo()%></p>
                    </td>
                    <td align="center">
                        <%=order1.getSellerNo()%>
                    </td>
                    <td align="center">
                        <%=order1.getBuyerNo()%>
                    </td>
                    <td align="center">
                        <%=order1.getCarNo()%>
                    </td>
                    <td align="center">
                        <%=order1.getPrice()%>
                    </td>
                    <td align="center">
                        <%=order1.getOrderDate()%>
                    </td>
                    <td align="center">
                        <a href="deleteOrderUserhello?orderNo=<%=order1.getOrderNo()%>">删除</a>
                    </td>
                </tr>
                <% }%>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
