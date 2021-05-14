<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>비밀번호 찾기</title>

<link href="/resources/css/style.css" rel="stylesheet"/>

</head>
<body>
<div class="main">
			<form action="findPw.do" method="post">
				<section class="login-wrap">
				<div class="form-group login-id-wrap">
					<h3>비밀번호 찾기</h3>
				</div>
				<div>
						<label>아이디</label>
						<div class="form-group login-id-wrap">
							<input placeholder="아이디 입력" type="text" class="input-id" name="id" id="id" />
						</div>
						<label>이메일</label>
						<div class="form-group login-pw-wrap">
							<input placeholder="이메일 입력" type="text" class="input-pw" name="email" id="pw"></input>
						</div>
					<div class="login-btn-wrap">
						<button type="submit" class="find-btn">비밀번호 찾기</button>
<!-- 						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button> -->
					</div>
				</div>
			</section>
			</form>
		</div>
</body>
</html>