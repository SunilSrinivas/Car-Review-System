<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ page import="com.ikramu.javaee.dbms_project.DatabaseInteraction" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<html>
<head>
    <title>Unrated Reviews | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Unrated Reviews</h2>

<%
    ResultSet resultSet = DatabaseInteraction.getInstance().executeQuery(
            "SELECT * FROM Review WHERE reviewID NOT IN\n" +
                    "(SELECT reviewID FROM Member_gives_rating_to_Review)");
%>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Description</th>
        <th>Insertion Time</th>
    </tr>

    <% try {
        while (resultSet.next()) { %>
    <tr>
        <td><%= resultSet.getString("reviewID")%>
        </td>
        <td><%= resultSet.getString("reviewDescription")%>
        </td>
        <td><%= resultSet.getString("insert_time")%>
        </td>
    </tr>
    <% }
    } catch (SQLException ignored) {
    }%>
</table>

</body>
</html>