<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
	
	<p>
    Welcome to Spring Boot JSP Security setup Yoohoo.
    </p>
    
    <hr>
    
    <!-- display user name and role -->
    
    <p>
    	User: <security:authentication property="principal.username"/>
    	<br><br>
    	Role(s): <security:authentication property="principal.authorities"/>
    	
    </p>
    
    <!-- the tag "security:authorize" to show the content by role -->
    
    <security:authorize access="hasRole('MANAGER')">
    
	    <!-- Add a link to point to /leaders ... this is for the managers -->
	    
	    <p>
	    	<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
	    	(Only for Manager peeps)
	    </p>
    
    </security:authorize>
    
    <security:authorize access="hasRole('ADMIN')">
    
	    <!-- Add a link to point to /systems ... this is for the admins -->
	    
	    <p>
	    	<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
	    	(Only for Admin peeps)
	    </p>
    
    </security:authorize>
    
    <hr>
    
    <!-- Add a logout button -->
    <form:form action="${pageContext.request.contextPath}/logout"
    		   method="POST">
    		   
    	<input type="submit" value="Logout" />
    	
    </form:form>
</body>
</html>