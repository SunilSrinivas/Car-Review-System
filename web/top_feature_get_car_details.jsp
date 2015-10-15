<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<html>
<head>
    <title>Enter Car | Top Feature | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="javascript/validate.js" language="javascript"></script>
</head>

<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Enter Car | Top Feature</h2>

<form action="top_feature.jsp">
    <label>Model: <input type="text" name="model" value=""></label> <br><br>
    <label>Make: <input type="text" name="make" value=""></label> <br><br>
    <label>Year: <input type="text" name="year" value=""></label> <br><br>

    <input type="submit" value="Get Top Feature">
</form>

</body>
</html>