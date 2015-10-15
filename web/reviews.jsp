<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<jsp:useBean id="memberObject" class="com.ikramu.javaee.dbms_project.Member"
             scope="session">
    <jsp:setProperty name="memberObject" property="*"/>
</jsp:useBean>
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

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<html>
<head>
    <title>Reviews | Car Review System</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<% ArrayList<Integer> reviewIDs = reviewObject.getReviewIDs(
        carObject.getSelectedModel(), carObject.getSelectedMake(), carObject.getSelectedYear());
    if (reviewIDs.isEmpty()) { %>
<h2>No Reviews</h2>
<% } else {
    int index = Integer.parseInt(request.getParameter("index"));

    int currentReviewID = reviewIDs.get(index);
    reviewObject.setCurrentReviewID(currentReviewID);%>

<h2>Review</h2>

<%if (index < reviewIDs.size() - 1) {%>
<form method="post" action="reviews.jsp?index=<%= ++index%>">
    <input type="submit" value="Next Review"/>
</form>
<%}%>

<p><% out.print(reviewObject.getReviewDescription(currentReviewID)); %></p>

<table border="1">
    <caption>Features</caption>
    <tr>
        <th>Feature Name</th>
        <th>Order Of Importance<br>Decreasing Importance w/ Increasing Number</th>
    </tr>
    <%
        HashMap<Integer, Integer> features = reviewObject.getFeaturesForReview(currentReviewID); %>
    <% int i = 0;
        for (Map.Entry<Integer, Integer> entry : features.entrySet()) { %>
    <tr>
        <td><% out.print(featureObject.getFeatureName(entry.getKey())); %></td>
        <td><input id="order<%= i++%>" type="text" value="<%= entry.getValue() %>"/>
        </td>
    </tr>
    <% } %>
</table>

<form method="post">
    <input id="update" type="button" value="Update Preference Feature List"
           onclick="function update() {
                   var size = <%= i%>;

                   var action = 'update_preference_feature_list.jsp?';
                   for(var j=0;j<size;){
                   action+='order'+j+'='+document.getElementById('order'+j).value;
                   j++;
                   if(j<size){
                   action+='&'
                   }
                   }

                   var updateForm = document.getElementById('update').form;
                   updateForm.action = action;
                   updateForm.submit();
                   }
                   update()">
</form>

<hr/>

<h4>Rating</h4>

<p>1 - Extremely Helpful | 2 - Very Helpful | 3 - Helpful | 4 - Not Helpful | 5 - Least
    helpful | 6 - Misleading</p>

<form method="post"
      action="modify_database.jsp?table=Member_gives_rating_to_Review&method=Insert&username=<%=
    memberObject.getCurrentUsername()%>&reviewID=<%= reviewObject.getCurrentReviewID()%>">
    <label><input type="range" min="1" max="6" name="rating" value="1"
                  onchange="document.getElementById('rating_output').value = this.value;"/>
    </label>
    <output for="rating" id="rating_output">1</output>
    <br/><br/>

    <input type="submit" name="submit" value="Insert Rating"/>
</form>
<% } %>

<hr/>
<br/>

<form method="post" action="insert_review.jsp">
    <input type="submit" name="submit" value="Insert Review">
</form>

</body>
</html>