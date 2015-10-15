<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<jsp:useBean id="memberObject" class="com.ikramu.javaee.dbms_project.Member"
             scope="session">
    <jsp:setProperty name="memberObject" property="*"/>
</jsp:useBean>

<html>
<head>
    <title>Authenticating | Car Review System</title>
</head>
<body>
<h1 style="background-color:blue;"> Car Review System </h1>

<h2>Logging In...</h2>

<%
    if (memberObject.authenticateMember(request.getParameter("username"), request.getParameter("email"))) {
        memberObject.setCurrentUsername(request.getParameter("username"));
%>
<jsp:forward page="car_select.jsp"/>
<% } else { %>
<script>
    window.alert("Invalid user!");
    window.history.back();
</script>
<% } %>

</body>
</html>