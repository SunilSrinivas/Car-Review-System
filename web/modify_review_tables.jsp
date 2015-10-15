<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<jsp:useBean id="memberObject" class="com.ikramu.javaee.dbms_project.Member"
             scope="session">
    <jsp:setProperty name="memberObject" property="*"/>
</jsp:useBean>
<jsp:useBean id="carObject" class="com.ikramu.javaee.dbms_project.Car" scope="session">
    <jsp:setProperty name="carObject" property="*"/>
</jsp:useBean>
<jsp:useBean id="featureObject" class="com.ikramu.javaee.dbms_project.Feature"
             scope="session">
    <jsp:setProperty name="featureObject" property="*"/>
</jsp:useBean>

<%@ page import="com.ikramu.javaee.dbms_project.DatabaseInteraction" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>

<%
    boolean isSuccessful = false;

    DatabaseInteraction databaseInteraction = DatabaseInteraction.getInstance();
    ResultSet resultSet = databaseInteraction.executeQuery(
            "SELECT max(reviewID)+1 AS nextReviewID FROM Review");

    Connection connection = databaseInteraction.getConnection();

    try {
        resultSet.next();
        int reviewID = resultSet.getInt("nextReviewID");

        // Start Transaction
        connection.setAutoCommit(false);

        // Insert into Review table
        int rowsUpdated = databaseInteraction.executeUpdate("insert into Review" +
                " values('" + reviewID + "','" + request.getParameter("reviewDescription") + "',now())");
        if (rowsUpdated == 0)
            throw new SQLException();

        // Insert into Review_lists_Features
        ArrayList<Integer> featureIDs = featureObject.getFeatureIDsOfCar(carObject.getSelectedModel(), carObject.getSelectedMake(), carObject.getSelectedYear());

        StringBuilder updateQuery = new StringBuilder(
                "INSERT INTO Review_lists_Features VALUES ");
        for (int i = 0; i < featureIDs.size(); i++) {
            updateQuery.append("(");
            updateQuery.append("'").append(reviewID).append("'");   // reviewID
            updateQuery.append(",");
            updateQuery.append("'").append(featureIDs.get(i)).append("'");  // featureID
            updateQuery.append(",");
            updateQuery.append("'").append(request.getParameter(
                    Integer.toString(featureIDs.get(i)))).append("'");    // order
            updateQuery.append(")");
            if (i + 1 != featureIDs.size()) {
                updateQuery.append(",");
            }
        }

        rowsUpdated = databaseInteraction.executeUpdate(updateQuery.toString());
        if (rowsUpdated == 0)
            throw new SQLException();

        // Insert into Member_writes_Review
        rowsUpdated = databaseInteraction.executeUpdate("insert into Member_writes_Reviews" +
                " values('" + memberObject.getCurrentUsername() + "','" + reviewID + "')");
        if (rowsUpdated == 0)
            throw new SQLException();

        // Insert into Car_has_Reviews
        rowsUpdated = databaseInteraction.executeUpdate("insert into Car_has_Reviews" +
                " values('" + carObject.getSelectedModel() + "','" + carObject.getSelectedMake() + "'," +
                "'" + carObject.getSelectedYear() + "','" + reviewID + "')");
        if (rowsUpdated == 0)
            throw new SQLException();

        connection.commit();
        isSuccessful = true;
    } catch (SQLException e) {
        connection.rollback();
    } finally {
        connection.setAutoCommit(true);
    }

    if (isSuccessful)
        out.print("Database Modified Successfully");
    else
        out.print("Unsuccessful");
    out.flush();

    try {
        Thread.sleep(3000);
    } catch (InterruptedException ignored) {
    }
%>

<script language="javascript">
    window.history.back();
</script>