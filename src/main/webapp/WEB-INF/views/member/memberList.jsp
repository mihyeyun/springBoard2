<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<section id="list">
		<div class="title">
			<h2>회원 목록</h2>
		</div>
			<table class="tbl_list">
				<thead>
					<tr>
						<th>아이디</th>
						<!-- <th>비밀번호</th>	 -->				
						<th>이름</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${memberList}" var="member">
					<tr>
						<td><a href='/member/memberView?userid=<c:out value="${member.userid}" />'><c:out value="${member.userid}" /></a></td>
						<%-- <td><c:out value="${member.userpw}" /></td> --%>
						<td><c:out value="${member.username}" /></td>
						<td><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
</body>
</html>