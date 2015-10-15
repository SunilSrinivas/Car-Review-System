<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%! String table;
    final String TABLE_MEMBER = "Member";
    final String TABLE_CAR = "Car";
    final String TABLE_RATING = "Rating";
    final String TABLE_RATING_DB = "Member_gives_rating_to_Review";
    final String TABLE_REVIEW = "Review";

    String method;
    final String METHOD_INSERT = "Insert";
    final String METHOD_DELETE = "Delete";
    final String METHOD_UPDATE = "Update"; %>

<% String submitValue = request.getParameter("submit");

    if (submitValue.contains(TABLE_MEMBER)) {
        table = TABLE_MEMBER;
    } else if (submitValue.contains(TABLE_CAR)) {
        table = TABLE_CAR;
    } else if (submitValue.contains(TABLE_RATING)) {
        table = TABLE_RATING;
    } else if (submitValue.contains(TABLE_REVIEW)) {
        table = TABLE_REVIEW;
    }

    if (submitValue.contains(METHOD_INSERT)) {
        method = METHOD_INSERT;
    } else if (submitValue.contains(METHOD_DELETE)) {
        method = METHOD_DELETE;
    } else if (submitValue.contains(METHOD_UPDATE)) {
        method = METHOD_UPDATE;
    }

%>

<html>
<head>
    <title><% out.print(method + " " + table); %> | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
    <script language="javascript" src="javascript/validate.js"></script>
</head>

<body>
<h1 style="background-color:blue;">
    Car Review System </h1>

<h2><% out.print(method + " " + table); %></h2>

<form name="form" method="post" action="modify_database.jsp?table=<%
    if(table.equals(TABLE_RATING))
        out.print(TABLE_RATING_DB);
    else
        out.print(table); %>"
      onsubmit="return validate();">

    <% if (table.equals(TABLE_MEMBER)) { %>
    <label>User Name: <input type="text" name="username" value=""></label> <br><br>
    <% if (method.equals(METHOD_INSERT) || method.equals(METHOD_UPDATE)) {%>
    <label> Email:<input type="text" name="email" value=""></label> <br><br>
    <label> Age:<input type="text" name="age" value=""></label> <br><br>
    <label> Gender:<input type="text" name="gender" value=""></label> <br><br>
    <label> City:<input type="text" name="city" value=""></label> <br><br>
    <label> State:<input type="text" name="state" value=""></label> <br><br>
    <% } %>
    <% } else if (table.equals(TABLE_CAR)) { %>
    <% if (method.equals(METHOD_INSERT) || method.equals(METHOD_UPDATE)) {%>
    <label>Manufacture: <input type="text" name="manufacture" value=""></label> <br><br>
    <% } %><br>Decreasing Importance w/ Increasing Number
    <label>Model: <input type="text" name="model" value=""></label> <br><br>
    <label>Make: <input type="text" name="make" value=""></label> <br><br>
    <label>Year: <input type="text" name="year" value=""></label> <br><br>
    <% } else if (table.equals(TABLE_RATING)) { %>
    <label>User Name: <input type="text" name="username" value=""></label> <br><br>
    <label>Review ID: <input type="text" name="reviewID" value=""></label> <br><br>
    <% if (method.equals(METHOD_UPDATE)) {%>
    <label>Rating: <input type="text" name="rating" value=""></label>

    <p>1 - Extremely Helpful | 2 - Very Helpful | 3 - Helpful | 4 - Not Helpful | 5 -
        Least
        helpful | 6 - Misleading</p>
    <br><br>
    <% } %>
    <% } else if (table.equals(TABLE_REVIEW)) {%>
    <label>Review ID: <input type="text" name="reviewID" value=""></label> <br><br>
    <% if (method.equals(METHOD_UPDATE)) {%>
    <label>Review Description: <input type="text" name="reviewDescription"
                                      value=""></label> <br><br>
    <% } %>
    <%} %>

    <input type="submit" name="method" value="<%= method%>"/>
    <input type="reset" name="Reset" value="Reset"/>

</form>

</body>
</html>