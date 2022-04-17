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
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home-page">Home Page</a></li>
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
							<%--<a href="${pageContext.request.contextPath}/showMyLoginPage?logout">Logout</a> --%>
						</span>
						<form:form action="${pageContext.request.contextPath}/logout" method="POST">
							<input type="submit" value="Logout">
						</form:form>
					</security:authorize>
				</nav>
			</div>
			
			<div class="col-md-12">
				<table class="table table-striped">
					<tr>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Email</th>
						<th scope="col">Action</th>
					</tr>
					
					<c:forEach var="tempCustomer" items="${customers }">
						<c:url var="loadUpdateLink" value="customer/showFormForUpdate">
							<c:param name="customerId" value="${tempCustomer.id }"/>
						</c:url>
						
						<c:url var="deleteLink" value="customer/delete">
							<c:param name="customerId" value="${tempCustomer.id }"/>
						</c:url>
						<tr>
							<td>${tempCustomer.firstName }</td>
							<td>${tempCustomer.lastName }</td>
							<td>${tempCustomer.email }</td>
							<td>
								<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
									<a class="btn btn-primary" href="${loadUpdateLink }">UPDATE</a> 
								</security:authorize>
								
								<security:authorize access="hasAnyRole('ADMIN')">
									<a class="btn btn-danger" href="${deleteLink}"
									onclick= "if(!(confirm('Are you sure you want delete this student?'))) return false;">DELETE</a>
								</security:authorize>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>