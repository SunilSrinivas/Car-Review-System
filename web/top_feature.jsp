<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ page import="com.ikramu.javaee.dbms_project.DatabaseInteraction" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<html>
<head>
    <title>Top Feature | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Top Feature</h2>

<%
    ResultSet resultSet = DatabaseInteraction.getInstance().executeQuery("SELECT * FROM Feature " +
            "WHERE featureID IN (SELECT featureID FROM (SELECT featureID, count(featureID) AS cnt " +
            "FROM Review_lists_Features WHERE reviewID IN (SELECT reviewID FROM Car_has_Reviews " +
            "WHERE model = '" + request.getParameter("model") + "' AND make = '" +
            request.getParameter("make") + "' AND YEAR = '" + request.getParameter("year") + "') " +
            "GROUP BY featureID) A HAVING max(cnt));");
%>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
    </tr>

    <% try {
        while (resultSet.next()) { %>
    <tr>
        <td><%= resultSet.getString("featureID")%>
        </td>
        <td><%= resultSet.getString("featureName")%>
        </td>
        <td><%= resultSet.getString("featureDescription")%>
        </td>
    </tr>
    <% }
    } catch (SQLException ignored) {
    }%>
</table>

</body>
</html>