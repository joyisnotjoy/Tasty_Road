<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting</title>

<!-- Awesome 4 icons lib : class="fa~ -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 기본적으로 사용되는 util js : reply.js 위에 써줘야 함 -->
<script type="text/javascript" src="/js/util.js"></script>

<!-- message에 해당하는 Model js포함 -->
<script type="text/javascript" src="/js/chat.js"></script>

<script type="text/javascript">
$(function(){
	$(".cancelBackBtn").click(function(){
		history.back();
	});
});
</script>
</head>
<body>
	<div class="container">
		<h1>UpdateForm</h1>
		<form action="update.do" method="post" id="updateForm">
		<input name="page" value="${param.page }" type="hidden" />
		<input name="perPageNum" value="${param.perPageNum }" type="hidden" />
			<div class="form-group">
				<label for="chatNo">No</label>
				<input name="chatNo" type="hidden" class="form-control" id="chatNo" readonly="readonly" value="${vo.chatNo }">
			</div>
			<div class="form-group">
			<!-- required : 필수 입력, placeholder : 입력 초기 안내, pattern : 정규표현식을 사용하여 유효성 검사를 할 수 있게 만들었다,
			 title : 패턴과 맞지 않을 떄 보여주는 메시지-->
				<label for="chatName">ChatName</label>
				<input name="chatName" type="text" class="form-control" id="chatName" pattern=".{4,100}" maxlength="100" required="required" 
				title="네 글자 이상 입력해주셔야 합니다." value="${vo.chatName }">
			</div>
		
			<button class="btn aBtn">수정</button>
			<button type="reset" class="btn aBtn">새로 입력</button>
			<button type="button" class="btn cancelBackBtn">취소</button>
		</form>
	</div>
</body>
</html>