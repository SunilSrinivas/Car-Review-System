<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<jsp:useBean id="carObject" class="com.ikramu.javaee.dbms_project.Car" scope="session">
    <jsp:setProperty name="carObject" property="*"/>
</jsp:useBean>

<html>
<head>
    <title>Saving selected Car | Car Review System</title>
</head>
<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Saving selected Car</h2>

<% carObject.setSelectedModel(request.getParameter("model"));
    carObject.setSelectedMake(request.getParameter("make"));
    carObject.setSelectedYear(request.getParameter("year")); %>

<jsp:forward page="reviews.jsp?index=0"/>

</body>
</html>