<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<section id="list">
			<h2>글 상세 보기</h2>
			<form action="/board/updateBoard" method="post">
			<input type="hidden" name="bno" value="${board.bno}">
				<table class="tbl_view">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" value="${board.title}"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" value="${board.writer}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="content" cols="50" rows="10"><c:out value="${board.content}" /></textarea>
						</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td class="time"><fmt:formatDate value="${board.regDate}"
							pattern="yyyy-MM-dd hh:mm:ss" /></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td><input type="text" name="cnt" value="${board.cnt}"></td>
					</tr>
					<tr>
						<td colspan="2">
						<security:authentication property="principal" var="pinfo"/>
						<security:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq board.writer}">
							<input type="submit" value="수정" onclick="return confirm('해당 게시글을 수정하시겠습니까?')"> 
							<a href="/board/deleteBoard?bno=<c:out value="${board.bno}" />"
								onclick="return confirm('해당 게시글을 삭제하시겠습니까?')">
								<input type="button" value="삭제">
							</a> 
						</c:if>
						</security:authorize>
							<a href="/board/boardList"><input type="button" value="목록"></a> 
						</td>
					</tr>
				</table>
			</form>
		</section>
	</div>
</body>
</html>