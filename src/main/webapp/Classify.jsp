<%@ page import="entity.Car" %>
<%@ page import="Dao.CarDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/5/25
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>车型选择</title>
    <link rel="stylesheet" href="css/showCar.css">

</head>
<body>
<%
    List<Car> cars= new CarDao().getAllCar();
    if(cars == null){
        cars = new ArrayList<>();
    }
%>

<jsp:include page="navbar.jsp" flush="true"/>
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
    <%
        int i =0 ;
        for (Car car:cars){
            i++;
    %>
    <tr align="center">
        <td><img src="<%=car.getImg_url()%>"></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center"><%=car.getCarNo()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center"><%=car.getCartype()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center"><%=car.getDispose()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center"><%=car.getBuyData()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center"><%=car.getMileage()%></td>
        <td onmouseover="this.style.backgroundColor='white';" onmouseout="this.style.backgroundColor='#cccccc';" align="center"><%=car.getPrice()%></td>
        <td><a href="carMesAction?carNo=<%=car.getCarNo()%>">查看</a></td>
    </tr>
    <%
        }%>
    </br>
</table>

</body>
</html>

