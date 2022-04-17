<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container d-flex align-items-center justify-content-center">
		<div class="w-50 m-5 border border-primary p-3">
			<h3 class="text-center">Login</h3>
			
			<div class="text-center"> 
				<c:if test="${param.error != null }">
					<i class="text-danger">Sorry! You entered invalid user name/ password!</i>
				</c:if>
				
				<c:if test="${param.logout != null }">
					<i class="text-success mt-2">You have been logged out!</i>
				</c:if>
			</div>
			
			<form:form action="${pageContext.request.contextPath }/authenticateTheUser" class="mt-2">
				<div class="form-group">
				   <label for="exampleInputEmail1">User Name</label>
				   <input type="text" class="form-control"  placeholder="Username" name="username">
				 </div>
				 
				 <div class="form-group">
				   <label for="exampleInputPassword1">Password</label>
				   <input type="password" class="form-control" placeholder="Password" name="password">
				</div>
				<button type="submit" class="btn btn-primary">LOGIN</button>
			</form:form>
			
		</div>
	</div>
</body>
</html>