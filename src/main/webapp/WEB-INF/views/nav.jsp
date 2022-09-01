<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authorize access="isAnonymous()">
<nav class="navbar navbar-expand navbar-light" style="background-color: #e3f2fd;">
	<div class="container">
		<div class="navbar-header">
			<a href="/index" class="navbar-brand">Home</a>
		</div>
		<div>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="/customLogin" class="nav-link">로그인</a>
				</li>
				<li class="nav-item">
					<a href="/member/signup" class="nav-link">회원가입</a>
				</li>
				<li class="nav-item">
					<a href="/board/boardList" class="nav-link">글 목록</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
</security:authorize>
<security:authorize access="isAuthenticated()">
<nav class="navbar navbar-expand navbar-light" style="background-color: #e3f2fd;">
	<div class="container">
		<div class="navbar-header">
			<a href="/index" class="navbar-brand">Home</a>
		</div>
		<div>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="/customLogout" class="nav-link" ><security:authentication property="principal.username"/>님 로그아웃</a>
				</li>
				<li class="nav-item">
					<a href="/member/signup" class="nav-link">회원가입</a>
				</li>
				<li class="nav-item">
					<a href="/board/boardList" class="nav-link">글 목록</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
</security:authorize>