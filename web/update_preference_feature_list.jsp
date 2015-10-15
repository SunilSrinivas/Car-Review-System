<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<jsp:useBean id="carObject" class="com.ikramu.javaee.dbms_project.Car" scope="session">
    <jsp:setProperty name="carObject" property="*"/>
</jsp:useBean>
<jsp:useBean id="reviewObject" class="com.ikramu.javaee.dbms_project.Review"
             scope="session">
    <jsp:setProperty name="reviewObject" property="*"/>
</jsp:useBean>
<jsp:useBean id="featureObject" class="com.ikramu.javaee.dbms_project.Feature"
             scope="session">
    <jsp:setProperty name="featureObject" property="*"/>
</jsp:useBean>

<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.ikramu.javaee.dbms_project.DatabaseInteraction" %>

<html>
<head>
    <title>Updating Preference Feature List | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2> Updating Preference Feature List </h2>

<% int currentReviewID = reviewObject.getCurrentReviewID();
    HashMap<Integer, Integer> features = reviewObject.getFeaturesForReview(currentReviewID);
    ArrayList<Integer> featureIDs = new ArrayList<Integer>();
    for (Map.Entry entry : features.entrySet()) {
        featureIDs.add((Integer) entry.getKey());
    }
    Enumeration<String> paramNames = request.getParameterNames();
    int i = 0;
    while (paramNames.hasMoreElements()) {
        String paramName = paramNames.nextElement();
        String query = "update Review_lists_Features set order_of_importance=" +
                request.getParameter(paramName) +
                " where reviewID=" + currentReviewID + " and featureID=" + featureIDs.get(i++);
        DatabaseInteraction.getInstance().executeUpdate(query);
    }
%>

<jsp:forward page="reviews.jsp?index=0"/>

</body>
</html>