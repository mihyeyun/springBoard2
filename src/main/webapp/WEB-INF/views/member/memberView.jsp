<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<section id="memberView">
			<h2>회원 정보</h2>
			<form action="/member/update" method="post" name="regForm">
				<table class="tbl_signup">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userid" value="${member.userid}" ></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userpw" value="${member.userpw}" ></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="userpw_confirm" value="${member.userpw}" ></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="username" value="${member.username}" ></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정"> 
							<a href='/member/delete?userid=<c:out value="${member.userid}" />'
								onclick="return confirm('정말로 탈퇴하시겠습니까?')">
								<input type="button" value="탈퇴">
							</a>
							<a href="/member/memberList"><input type="button" value="목록"></a>						
						</td>
					</tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</section>
	</div>
</body>
</html>