<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script>
	function checkForm(){
		let form = document.newWrite;
		
		let title = form.title.value;
		let writer = form.writer.value;
		let content = form.content.value;
		
		if(title == ""){
			alert('제목을 입력해주세요.');
			form.title.focus();
			return false;
		}else if(writer == ""){
			alert('작성자를 입력해주세요.');
			form.writer.focus();
			return false;
		}else if(content == ""){
			alert('내용을 입력해주세요.');
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<section id="list">
			<h2>글쓰기</h2>
			<form action="/board/insertBoard" method="post" name="newWrite" onsubmit="return checkForm()">
				<table class="tbl_reg">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" placeholder="Title" ></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" readonly="readonly"
								value='<security:authentication property="principal.username"/>'></td>			
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="content" cols="50" rows="10" placeholder="Content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록"> 
							<a href="/board/boardList"><input type="button" value="목록"></a> 
						</td>
					</tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />				
			</form>
		</section>
	</div>
</body>
</html>