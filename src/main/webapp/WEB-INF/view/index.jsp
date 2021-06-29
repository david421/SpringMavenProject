<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Security here</title>
</head>
<body>
	<h2>Spring Security</h2>
	<hr>
    Welcome to Spring Boot JSP Security setup Yoohoo.
    
    <!-- Add a logout button -->
    <form:form action="${pageContext.request.contextPath}/logout"
    		   method="POST">
    		   
    	<input type="submit" value="Logout" />
    	
    </form:form>
</body>
</html>