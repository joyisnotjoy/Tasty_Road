<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="#">

<title>메시지 보기</title>

<!-- Awesome 4 icons lib : class="fa~ -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 기본적으로 사용되는 util js : reply.js 위에 써줘야 함 -->
<script type="text/javascript" src="/js/util.js"></script>

<!-- chat에 해당하는 Model js포함 -->
<script type="text/javascript" src="/js/chat.js"></script>

<script type="text/javascript">
	$(function() {
		
		// 삭제 버튼 이벤트 - 다시 확인한다.
		$("#deleteRoom").click(function() {
			if (!confirm("메시지를 정말 삭제하시겠습니까?"))
				return false;
		});
		
		//채팅 처리 부분에 대한 것
		console.log("-------------------");
		console.log(" * JS chat List TEST * ");
		
		//전역 변수 선언 - $(function(){}); : 이 안에 선언된 함수에서는 공통으로 사용할 수 있다. 
		var no = ${vo.chatNo};
		var a = "${vo.id1}";
		var b = "${login.id}";
		var c = "${vo.id2}";
		var d = "${cvo.id}";
		
		console.log(" * JS chat List no : " + no + " * ");
		console.log(" * JS chat List id1 : " + a + " * ");
		console.log(" * JS chat List id2 : " + c + " * ");
		console.log(" * JS chat List login.id : " + b + " * ");
		console.log(" * JS chat List id : " + d + " * "); // 확인 xxxx
		
		var chatServiceUL = $(".chat");
		
		//글보기를 하면 바로 댓글 리스트를 호출
		showList();
		
		function showList(){
			chatService.list({no:no},
				function(data){
// 					alert(data);
// 					alert(JSON.stringify(data));
					var list = data;
// 					alert(list.length);
					
					var str ="";
					if(!list || list.length == 0){
// 						alert("데이터X");
						
						str += "<h5 align='center'>전송된 채팅이 없습니다.</h5>"
						
					}else{
// 						alert("데이터O"); 
						for(var i = 0; i < list.length; i++){
							console.log(list[i]);
							
							if(a == b){ // id1과 login.id가 같다면
								
								str +="<div class='row' id='myF'>";
									str +="<div class='col-sm-4 pull-right' id='chatMessageArea' data-chatNo='" + list[i].chatNo + "'>";
										str +="	<label>" + list[i].id + " : <br></label>";
										str +="	<pre>" + list[i].content + "<br>" + chatService.displayTime(list[i].writeDate) + "</pre>";
									str +="</div>";
								str +="</div>";
							
// 							}else{
							}else if(c == b){ //id2랑 login.id가 같으면
								
								str +="<div class='row' id='myF'>";
									str +="<div class='col-sm-4 pull-left' id='chatMessageArea' data-chatNo='" + list[i].chatNo + "'>";
										str +="<label>" + list[i].id + " : <br></label>";
										str +="<pre>" + list[i].content + "<br>" + chatService.displayTime(list[i].writeDate) + "</pre>";
									str +="</div>";
								str +="</div>";
							
							} // 둘이 세트로 묶어서 움직이네...
						}
						
// 						alert(str);
						
					}
					chatServiceUL.html(str); //댓글 리스트 데이터를 표시하는 곳
			}//function()의 끝
			);
// 			setInterval(function(){ showList(); }, 3000); 이건 왜 있지..? 왜 여기 있지..? 
		}//showList의 끝
		
		//채팅 전송
		$("#chatSendBtn").click(function(){
// 			alert("click");
			var chatRoom = {};
			
			chatRoom.chatNo = $("#chatNo").val();
			chatRoom.content = $("#chatContent").val();
			chatRoom.id1 = $("#chatSender").val();
			chatRoom.id2 = $("#chatAccepter").val();
// 			alert(chatRoom);
// 			alert(JSON.stringify(chatRoom));
			//ajax를 이용한 댓글 등록 처리
			chatService.write(chatRoom,
				//등록을 성공했을 때 등록 함수
				function(result){
					$("#chatContent").val("");
					$('#chatMessageArea').scrollTop($('#chatMessageArea')[0].scrollHeight);
					showList();
			}); //chatService.write의 끝
			
		}); //chatSendBtn 클릭 시 일어나는 이벤트
// 		$('#chatMessageArea').scrollTop($('#chatMessageArea')[0].scrollHeight);
		$(window).animate({scrollTop: $(document).height() + $(window).height()});
		
		// setInterval(function(){ showList(); }, 3000);
	});
</script>
</head>
<body>
<body>
	<div class="container hTag">
		<c:set var="id" value="${login.id }" />
		<c:choose>
			<c:when test="${vo.id2 == login.id}">
				<h1 style="text-align: center;">[ ${vo.id1 } ] 님과 대화중입니다.</h1>
			</c:when>
			<c:when test="${vo.id1 == login.id}">
				<h1 style="text-align: center;">[ ${vo.id2 } ] 님과 대화중입니다.</h1>
			</c:when>
		</c:choose>

		<!-- 채팅 메뉴 -->
		<div class="col-12 row justify-content-center align-items-center my-5"></div>
		<div class="col-12 form-group" style="margin-top: 40px; clear: both;">
			<div class="col-10 form-control" style="margin: 20px auto; text-align: center; color: white; background-color: #e37d68; border: 1px solid #e37d68; padding: 10px 10px; border-radius: 8px;">
				${vo.chatName }
				<input name="chatNo" id="chatNo" type="hidden" value="${vo.chatNo }" />
				<c:if test="${vo.id1 == login.id}">
					<a style="float: right;"
						href="update.do?no=${vo.chatNo }&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
						class="button">수정</a>
				</c:if>
			</div>
		</div>

		<div class="form-group"></div>

		<!-- 채팅 보여주는 곳 : function 부분 -->
		<div class="col-12 form-group ">
			<div class="col-12 form-control chatView" style="margin: 0 auto; border: 1px solid #e37d68; height: 400px; border-radius: 10px; overflow: auto;" id="chatArea">
				<div id="chatMessageArea" style="margin-top: 10px; margin-left: 10px;" class="chat">
				
					<div class="row">
						<div class='col-sm-3 pull-right' id='chatMessageArea' data-chatNo=10>
							<label>test : <br></label>
							<pre>test<br> 2021.05.13</pre>
						</div>
					</div>
					
					<div class="row">
						<div class='col-sm-3 pull-right' id='chatMessageArea' data-chatNo=10>
							<label>test : <br></label>
							<pre>test<br> 2021.05.13</pre>
						</div>
					</div>
					
					<div class="row">
						<div class='col-sm-3 pull-right' id='chatMessageArea' data-chatNo=10>
							<label>test : <br></label>
							<pre>test<br> 2021.05.13</pre>
						</div>
					</div>
					
					<div class="row">
						<div class='col-sm-3 pull-right' id='chatMessageArea' data-chatNo=10>
							<label>test : <br></label>
							<pre>test<br> 2021.05.13</pre>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>

		<!-- 채팅 창 -->
		<div class="col-12 form-group">
			<form action="write.do" method="post" id="chatRoom">
				<input name="chatNo" id="chatNo" type="hidden" value="${vo.chatNo }" />
				<input name="chatNo" id="chatNo" type="hidden" value="${cvo.chatNo }" />
				<input name="id1" id="chatSender" type="hidden" value="${login.id}" />
				<input name="id2" id="chatAccepter" type="hidden" value="${vo.id2 }" />
				<div class="chatContent row">
					<label for="chatContent"></label>
					<textarea style="border: 1px solid #e37d68; height: 85px; float: left; width: 80%" placeholder="메시지를 입력해주세요." id="chatContent" name="content"></textarea>
				</div>
				<span style="margin-top: -85px; float: right; width: 18%; height: 85px; text-align: center; background-color: #e37d68; border-radius: 5px;">
					<br>
					<button type="button" class="btn btn-xl chatSendBtn" style="background-color: #e37d68;" id="chatSendBtn">전송</button>
				</span>
			</form>
		</div>
		<div class="col-2" style="float: left">
			<button type="button" class="btn btn-default goList" id="goList" onclick="location='list.do'">리스트</button>
<%-- 			<c:if test="${vo.id1 == login.id}"> --%>
			<a href="delete.do?no=${vo.chatNo }" class="btn btn-default deleteRoom" id="deleteRoom">나가기</a>
<%-- 			<a href="delete.do?no=${vo.chatNo }&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}" class="btn btn-default deleteRoom" id="deleteRoom">나가기</a> --%>
<%-- 			</c:if> --%>
		</div>
	</div>
</body>
</html>