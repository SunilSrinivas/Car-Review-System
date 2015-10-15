<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ page import="com.ikramu.javaee.dbms_project.DatabaseInteraction" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<html>
<head>
    <title>Members who help each other | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Members who help each other</h2>

<%
    ResultSet resultSet = DatabaseInteraction.getInstance().executeQuery("SELECT u1.username AS username, u2.username AS helpername FROM Member_gives_rating_to_Review u1, Member_gives_rating_to_Review u2 WHERE u1.username<>u2.username AND u1.reviewID IN (SELECT reviewID FROM Member_writes_Reviews u3 WHERE u3.username=u2.username) AND u2.reviewID IN (SELECT reviewID FROM Member_writes_Reviews u3 WHERE u3.username=u1.username) AND u1.rating =1 AND u2.rating = 1");
%>

<table border="1">
    <tr>
        <th>User Name</th>
        <th>Helper Name</th>
    </tr>

    <% try {
        while (resultSet.next()) { %>
    <tr>
        <td><%= resultSet.getString("username")%>
        </td>
        <td><%= resultSet.getString("helpername")%>
        </td>
    </tr>
    <% }
    } catch (SQLException ignored) {
    }%>
</table>

</body>
</html>