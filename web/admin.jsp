<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<html>
<head>
    <title>Admin | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Welcome Admin</h2>

<form action="admin_process.jsp">
    <input type="submit" name="submit" value="Insert Member"/>
    <input type="submit" name="submit" value="Insert Car"/> <br/><br/>

    <input type="submit" name="submit" value="Delete Member"/>
    <input type="submit" name="submit" value="Delete Car"/>
    <input type="submit" name="submit" value="Delete Review"/>
    <input type="submit" name="submit" value="Delete Rating"/><br/><br/>

    <input type="submit" name="submit" value="Update Member"/>
    <input type="submit" name="submit" value="Update Car"/>
    <input type="submit" name="submit" value="Update Review"/>
    <input type="submit" name="submit" value="Update Rating"/> <br/><br/>
</form>

<br>

<form action="todays_reviews.jsp">
    <input type="submit" name="submit" value="List Today's Reviews"/> <br/><br/>
</form>
<form action="unrated_reviews.jsp">
    <input type="submit" name="submit" value="Unrated Reviews"/> <br/><br/>
</form>
<form action="helpful_reviews.jsp">
    <input type="submit" name="submit"
           value="Reviews that at least 5 people consider as very helpful or extremely helpful"/>
    <br/><br/>
</form>
<form action="top_feature_get_car_details.jsp">
    <input type="submit" name="submit" value="Top Feature"/>
    <br/><br/>
</form>
<form action="mischievous_members.jsp">
    <input type="submit" name="submit" value="Mischievous Members"/>
    <br/><br/>
</form>
<form action="extremely_helpful_members.jsp">
    <input type="submit" name="submit" value="Members who help each other"/>
    <br/><br/>
</form>

</body>
</html>