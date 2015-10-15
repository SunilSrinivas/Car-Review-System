<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<jsp:useBean id="carObject" class="com.ikramu.javaee.dbms_project.Car" scope="session">
    <jsp:setProperty name="carObject" property="*"/>
</jsp:useBean>

<%@page import="java.util.ArrayList" %>

<html>
<head>
    <title>Select a Car | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Select a Car</h2>

<% ArrayList<String[]> carList = carObject.getAllCars(); %>
<% for (String[] carDetails : carList) { %>
<p>
    <a href="save_selected_car.jsp?model=<% out.print(carDetails[0]);
        %>&make=<% out.print(carDetails[1]);
        %>&year=<% out.print(carDetails[2]); %>">
        <% out.println(carDetails[0] + " | " + carDetails[1] + " | " + carDetails[2]); %>
    </a>
</p>
<% } %>

</body>
</html>