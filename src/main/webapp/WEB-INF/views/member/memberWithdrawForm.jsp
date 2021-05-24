<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원 탈퇴</title>

<link href="/resources/css/style.css" rel="stylesheet"/>

</head>
<body>
<div class="main">
			<form action="memberWithdraw.do" method="post">
				<section class="login-wrap">
				<div class="form-group login-id-wrap">
					<h3>회원 탈퇴</h3>
				</div>
				<div>
						<label>아이디</label>
						<div class="form-group login-pw-wrap">
							<input type="text" class="input-pw" name="id" value=${vo.id } id="pw"></input>
						</div>
						<label>비밀번호</label>
						<div class="form-group login-id-wrap">
							<input type="text" class="input-id" name="pw" id="id" />
						</div>
					<div class="login-btn-wrap">
						<button type="submit" class="find-btn">회원 탈퇴</button>
					</div>
				</div>
			</section>
			</form>
		</div>
</body>
</html>