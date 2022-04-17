<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>List Customers</title>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"/>
		<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<c:url var="addLink" value="customer/showFormAdd"/>
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light .bg-light">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">Home Page</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/list">List Customer</a></li>
						<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
						     <li class="nav-item"><a class="nav-link" href="${addLink}">Add Customer</a></li>
						</security:authorize>
					</ul>
					
					<security:authorize access="hasAnyRole('EMPLOYEE', 'MANAGER', 'ADMIN')">
						<span>
							User: <security:authentication property="principal.username"/>
							Role(s): <security:authentication property="principal.authorities"/>
							&nbsp;
							<a href="${pageContext.request.contextPath}/showMyLoginPage?logout">Logout</a>
						</span>
						<form:form action="${pageContext.request.contextPath}/logout" method="POST">
							<input type="submit" value="Logout">
						</form:form>
					</security:authorize>
					
					<span>
						<security:authorize access="hasAnyRole('EMPLOYEE', 'MANAGER', 'ADMIN')">
							<style>
		                    	span a{ display: none; }
		                     </style>
						</security:authorize>
						
						<a style="float: right" href="${pageContext.request.contextPath}/register/showRegistrationForm">Sign up</a>
		                <a style="float: right" href="${pageContext.request.contextPath}/showLoginPage">Sign in</a>                              
					</span>
				</nav>
			</div>
		</div>
	</body>
</html>
</body>
</html>