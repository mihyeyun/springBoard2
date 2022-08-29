<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="/resources/css/style.css">
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
						<td><input type="text" name="writer"></td>
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
			</form>
		</section>
	</div>
</body>
</html>