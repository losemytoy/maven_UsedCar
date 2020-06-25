<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.CarDao" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/6/2
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/showCar.css" />
    <title>车辆信息</title>
    <style>
        img{
            height: 180px;
            width: 280px;
        }

    </style>
</head>

<%
    List<Car> carList =(List<Car>) request.getAttribute("listCar");
%>
<body>
<jsp:include page="adminIndex.jsp" flush="true"/>
<p style="text-align: center; font-size: 40px; font-weight: bold;margin-top: 120px">车辆信息查询</p>
<form action="searchCar1hello.action" style="text-align: center;margin-top: 70px">
    车型：<input type="text" name="car.cartype" id="">
    <input type="submit" value="查询">
</form>
<table id="tab" class="showcar" cellpadding="1" cellspacing="1" align="center" style="margin-top: 100px">
    <tr align="center" class="title">
        <td align="center">车辆图片</td>
        <td align="center">车辆编号</td>
        <td align="center">车型</td>
        <td align="center">配置</td>
        <td align="center">购买日期</td>
        <td align="center">行驶里程</td>
        <td align="center">标价</td>
    </tr>

    <c:forEach var="carMes" items="${listCar}" >
        <tr align="center">
            <td><img src="${carMes.img_url}"></td>
            <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center">${carMes.carNo}</td>
            <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center">${carMes.cartype}</td>
            <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center">${carMes.condition}</td>
            <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center">${carMes.buyData}</td>
            <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center">${carMes.mileage}</td>
            <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center">${carMes.price}</td>
        </tr>
    </c:forEach>

    </br>
</table>
</body>
</html>
