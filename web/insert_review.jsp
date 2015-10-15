<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<jsp:useBean id="reviewObject" class="com.ikramu.javaee.dbms_project.Review"
             scope="session">
    <jsp:setProperty name="reviewObject" property="*"/>
</jsp:useBean>
<jsp:useBean id="featureObject" class="com.ikramu.javaee.dbms_project.Feature"
             scope="session">
    <jsp:setProperty name="featureObject" property="*"/>
</jsp:useBean>
<jsp:useBean id="carObject" class="com.ikramu.javaee.dbms_project.Car"
             scope="session">
    <jsp:setProperty name="carObject" property="*"/>
</jsp:useBean>

<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Insert Review | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
    <script language="javascript" src="javascript/validate.js"></script>
</head>

<body>
<h1 style="background-color:blue;">
    Car Review System </h1>

<h2>Insert Review</h2>

<form name="form" method="post" action="modify_review_tables.jsp"
      onsubmit="return validate();">

    <label>Review Description: <textarea name="reviewDescription"
                                         rows="5"></textarea></label> <br><br><br><br>

    <% ArrayList<Integer> featureIDs = featureObject.getFeatureIDsOfCar(carObject.getSelectedModel(), carObject.getSelectedMake(), carObject.getSelectedYear());
    %>
    <table>
        <tr>
            <th>Features</th>
            <th>Order Of Importance</th>
        </tr>
        <% for (Integer featureID : featureIDs) { %>
        <tr>
            <td><%= featureObject.getFeatureName(featureID)%>
            </td>
            <td><input name="<%=featureID%>" type="text" value="0"></td>
        </tr>
        <% } %>
    </table>
    <br><br><br><br>

    <input type="submit" name="method" value="Insert"/>
    <input type="reset" name="Reset" value="Reset"/>
</form>

</body>
</html>