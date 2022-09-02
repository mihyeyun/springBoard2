<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script>
function checkForm() {
	let form = document.regForm;
	let id = form.userid.value;    //아이디 입력값
	let pwd1 = form.userpw.value;    //비밀번호 입력값
	let pwd2 = form.userpw_confirm.value; 
	let name = form.username.value;
	
	let regExpId = /^[a-zA-Z0-9]*$/ //영문자, 숫자만(^-시작, *-반복)
	let regExpPwd1 = /[a-zA-Z0-9]/  //영문자, 숫자
	let regExpPwd2 = /[~!@#$%^&*()_+/]/  //특수문자
	let regExpPwd3 = /[ㄱ-ㅎㅏ-ㅣ가-힣]/  //한글
		
			if(id.length < 4 || id.length > 12 || !regExpId.test(id)){
				alert("아이디는 영문자, 숫자 포함 4-12자 이하로 입력해주세요 ");
				form.memberId.focus();
				form.memberId.select();
				return false;
			}if(pwd1.length < 8 || pwd1.length > 12 ||
						!regExpPwd1.test(pwd1) || !regExpPwd2.test(pwd1) ||
						regExpPwd3.test(pwd1)){
					alert("비밀번호는 영문자, 숫자, 특수문자 포함 8-12자 이하로 입력해주세요 ");
					form.passwd.focus();
					form.passwd.select();
					return false;
			}if(pwd1 != pwd2){
					alert("비밀번호를 동일하게 입력해주세요");
					form.passwd_confirm.focus();
					form.passwd_confirm.select();
					return false;
			}if(name == ""){
					alert("이름을 입력해주세요");
					form.name.focus();
					return false;
			}
			
}
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<section id="signup">
			<h2>회원 가입</h2>
			<form action="/member/signup" method="post" name="regForm" onsubmit="return checkForm()">
				<table class="tbl_signup">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userid" placeholder="ID" ></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userpw" placeholder="PASSWORD" ></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="userpw_confirm" placeholder="PASSWORD_CONFIRM" ></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="username" ></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록"> 
							<input type="reset" value="취소"> 
						</td>
					</tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</section>
	</div>
</body>
</html>