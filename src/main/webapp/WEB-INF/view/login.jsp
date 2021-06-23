<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Custom Login Page</title>
</head>
<body>

<h3>My Custom Login Page</h3>

	<form:form action="${pageContext.request.contextPath}/authenticateTheUser"
			   method="POST">
			   
	     <p>
	     	 User name: <input type="text" name="username" />
	     </p>
	     
	     <p>
	     	 Password: <input type="password" name="password" />
	     </p>
	     
	     <input type="submit" value="Login" />
	     
    </form:form>
</body>

</html>