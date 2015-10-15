<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<html>
<head>
    <title>Welcome | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<h1 style="background-color:blue;">
    Car Review System </h1>

<h2>All About Cars</h2>

<form action="admin.jsp">
    <input type="submit" name="admin" value="Admin"/>
</form>

<br/><br/>

<form name="form" method="post" action="login.jsp">
    <label>User Name: <input type="text" name="username" value=""></label> <br><br>
    <label>Email: <input type="text" name="email" value=""></label> <br><br>

    <input type="submit" name="submit" value="Login"/>
    <input type="reset" name="Reset" value="Reset"/>
</form>

</body>
</html>