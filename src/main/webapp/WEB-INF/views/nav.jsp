<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand navbar-light" style="background-color: #e3f2fd;">
	<div class="container">
		<div class="navbar-header">
			<a href="/index" class="navbar-brand">Home</a>
		</div>
		<div>
			<security:authorize access="isAnonymous()">
			<ul class="navbar-nav">
			
				<li class="nav-item">
					<a href="/customLogin" class="nav-link">로그인</a>
				</li>
				<li class="nav-item">
					<a href="/member/signup" class="nav-link">회원가입</a>
				</li>
				<li class="nav-item">
					<a href="/board/boardList" class="nav-link">게시판</a>
				</li>
			</ul>
			</security:authorize>
			
			<security:authentication property="principal" var="pinfo"/>
			<security:authorize access="isAuthenticated()">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="/customLogout" class="nav-link" ><security:authentication property="principal.username"/>님 로그아웃</a>
				</li>
				<li class="nav-item">
					<a href='/member/memberView?userid=<c:out value="${pinfo.username}" />' class="nav-link">나의 정보</a>
				</li>
				<li class="nav-item">
					<a href="/member/memberList" class="nav-link">회원목록</a>
				</li>
				<li class="nav-item">
					<a href="/board/boardList" class="nav-link">게시판</a>
				</li>
			</ul>
			</security:authorize>
		</div>
	</div>
</nav>
