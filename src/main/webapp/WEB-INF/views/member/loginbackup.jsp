<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

</head>
<body>
<div class="container">
<h1>로그인 폼[/member]</h1>
<form action="login.do" method="post">
	<div class="form-group">
		<label for="id">아이디</label>
		<input name="id" id="id" class="form-control"
		pattern="[A-Za-z][A-Za-z0-9]{3,19}" required="required"
		title="맨앞자는 영문자로 시작해야 합니다. 4~20 자 길이로 입력하셔야 합니다."/>
	</div>
	<div class="form-group">
		<label for="pw">비밀번호</label>
		<input name="pw" id="pw" type="password" class="form-control" 
		pattern=".{4,20}" required="required"/>
	</div>
	<button>로그인</button>
	<button type="button" onclick="location.href='readme.do'">회원가입</button>
</form>
</div>
</body>
</html>