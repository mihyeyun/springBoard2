<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="message.user.login.title" /></title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="./nav.jsp" />
	<div id="container">
		<section id="login">
			<div class="title">
				<h2><spring:message code="message.user.login.title" /></h2>
			</div>
			<p class="lang">
				<a href="customLogin?lang=en">
					<spring:message code="message.user.login.language.en" />
				</a>
				<a href="customLogin?lang=ko">
					<spring:message code="message.user.login.language.kr" />
				</a>
			</p>
			<h3 class="error"><c:out value="${error}" /></h3>
			<form action="/login" method="post">
				<table class="tbl_login">
					<tr>
						<td><spring:message code="message.user.login.id" /></td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td><spring:message code="message.user.login.password" /></td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value='<spring:message code="message.user.login.loginBtn" />'>
						</td>
					</tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</section>
	</div>
</body>
</html>