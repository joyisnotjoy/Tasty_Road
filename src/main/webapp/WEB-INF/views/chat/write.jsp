<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 보내기</title>

<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		// alert("취소 버튼");
		history.back();
	});
});
</script>
</head>
<body>
<div class="container">
	<h1>메시지 보내기</h1>
	<form action="write.do" method="post">
		<input name="perPageNum" type="hidden" value="${param.perPageNum }">
		<div class="form-group">
			<label for="id1">보낸 사람 아이디</label>
			<input name="id1" id="id1" class="form-control" value="${login.id }" readonly="readonly"/>
		</div>
		<div class="form-group">
			<label for="id2">받는 사람 아이디</label>
			<input name="id2" id="id2" class="form-control" />
		</div>
		<div class="form-group">
			<label for="chatName">방 이름</label>
			<input name="chatName" id="chatName" class="form-control" />
		</div>
<!-- 		<div class="form-group"> -->
<!-- 			<label for="content">내용</label> -->
<!-- 			<textarea name="content" id="content" class="form-control" -->
<!-- 			 rows="5" ></textarea> -->
<!-- 		</div> -->
		<button class="btn btn-default">전송</button>
		<button type="reset" class="btn btn-default">새로입력</button>
		<button type="button" class="btn btn-default" id="cancelBtn">취소</button>
	</form>
</div>
</body>
</html>