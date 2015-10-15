<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ page import="com.ikramu.javaee.dbms_project.DatabaseInteraction" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<html>
<head>
    <title>Mischievous Members | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Mischievous Members</h2>

<%
    ResultSet resultSet = DatabaseInteraction.getInstance().executeQuery("SELECT DISTINCT username " +
            "FROM Member_gives_rating_to_Review WHERE username NOT IN (SELECT DISTINCT username " +
            "FROM Member_gives_rating_to_Review WHERE rating <> 6)");
%>

<table border="1">
    <tr>
        <th>User Name</th>
    </tr>

    <% try {
        while (resultSet.next()) { %>
    <tr>
        <td><%= resultSet.getString("username")%>
        </td>
    </tr>
    <% }
    } catch (SQLException ignored) {
    }%>
</table>

</body>
</html>