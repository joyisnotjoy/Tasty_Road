<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>쌍쌍바's talk</title>
	<style>
		body{
			background-image: url("img/1323.jpg");
			background-repeat: no-repeat;
			background-size: 120%;
			-ms-overflow-style: none; 
		}
		::-webkit-scrollbar { 
			display: none; 
		}

		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 730px;
			margin: 0 auto;
			padding: 25px;
		}
		h1{
			color: white;
		}
		.container h1{
			text-align: center;
			padding: 5px 5px 5px 15px;
/* 			color: #111922; */
/* 			border-left: 3px solid #FFBB00; */
			margin-bottom: 7px;
		}
		.chating {
		    background-color: #c8e8ff;
		    width: 720px;
		    height: 670px;
		    overflow: auto;
		    padding-right: 3px;
		    padding-left: 3px;
		    margin-bottom: 7px;
		    border-radius: 5px;
		}
		.chating .me2{
			word-break:break-all;
			color: black;
			text-align: right;
			display: inline-block;
            max-width: 55%;
            background-color: #ffeb00;
            padding: 5px;
            margin-top: 1.5px;
            margin-bottom: 3px;
            border-radius: 7px;
            position: relative;
            border-width: 0.6px;
            border-style: solid;
            border-color: #ffeb00;
            
		}
		.chating .me{
			color: black;
			text-align: right;
			font-weight: bolder;
			font-size: 11px;
			padding-top: 1px;
		}
		
		.chating .me2 {
			position: relative;
			background: #ffeb00;
/* 			border: 4px solid #ffffff; */
			float: right;
		}
		.me2:after {
		    content: "";
		    position: absolute;
		    z-index: 10;
		    bottom: -4px;
		    right: 2.5px;
		    width: 7.5px;
		    height: 3px;
		    border-style: solid;
		    border-width: 0px 0.6px 0.6px 0.6px;
		    border-color: #ffeb00;
		    background: #ffeb00;
		    border-bottom-left-radius: 79px 106px;
		    border-bottom-right-radius: 22px 0px;
		    border-top-right-radius: 50px 62px;
		    border-top-left-radius: 0px 23px;
   			display: block;
		}
		.me2:before {
			content: "";
		    position: absolute;
		    z-index: 10;
		    bottom: -4px;
		    right: 2.4px;
		    width: 7.6px;
		    height: 3.3px;
		    border-style: solid;
		    border-width: 0 0.6px 0.6px 0.6px;
		    border-color: #ffeb00;
		    background: #FBEB00;
		    border-top-right-radius: 27px 54px;
		    border-bottom-right-radius: 24px 0px;
		    border-bottom-left-radius: 46px 56px;
		    border-top-left-radius: 4px 11px;
		    display: block;
		}
		.mdate {
			font-size: 3px;
			float: right;
   			padding-right: 3px;
   			color: grey;
			display: inline-block; 
   			position: relative;
   			bottom: 0;
		}
		.mdate2 {
			font-size: 3px;
			float: right;
   			padding-right: 3px;
   			color: grey;
			display: inline-block; 
   			position: relative;
   			bottom: 0;
   			margin-top: -5px;
		}
		.odate {
			font-size: 3px;
			float: left;
   			padding-left: 3px;
   			color: grey;
			display: inline-block; 
   			position: relative;
   			bottom: 0;
		}
		.chating .others{
			color: black;
			text-align: left;
			font-weight: bolder;
			font-size: 11px;
			padding-top: 1px;
		}
		.chating .others2{
			word-break:break-all;
			color: black;
			text-align: left;
			display: inline-block;
            max-width: 55%;
            margin-top: 1.5px;
            margin-bottom: 3px;
            background-color: white;
            padding: 5px;
            border-radius: 7px;
            position: relative;
            border-width: 0.6px;
            border-style: solid;
            border-color: white;
		}
		.others2 {
			position: relative;
			background: #75d2fa;
			border: 4px solid #ffffff;
			float: left;
		}
		.others2:after {
		    content: "";
		    position: absolute;
		    z-index: 10;
		    bottom: -4px;
		    left: 2.5px;
		    width: 7.5px;
		    height: 3.4px;
		    border-style: solid;
		    border-width: 0px 0.6px 0.6px 0.6px;
		    border-color: white;
		    background: white;
		    border-bottom-right-radius: 79px 106px;
		    border-bottom-left-radius: 22px 0px;
		    border-top-left-radius: 50px 62px;
		    border-top-right-radius: 0px 23px;
   			display: block;
		}
		.others2:before {
		    content: "";
		    position: absolute;
		    z-index: 10;
		    bottom: -4px;
		    left: 2.4px;
		    width: 7.6px;
		    height: 3.3px;
		    border-style: solid;
		    border-width: 0 0.6px 0.6px 0.6px;
		    border-color: white;
		    background: white;
		    border-top-left-radius: 27px 54px;
		    border-bottom-left-radius: 24px 0px;
		    border-bottom-right-radius: 46px 56px;
		    border-top-right-radius: 4px 11px;
		    display: block;
		
		}
		input{
			width: 575px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
		.clear
        {
            clear: both;
        }
		.clearBoth
        {
            clear: both;
        }
        .msgImgM{
			width: 375px;
			height: 275px;
		}
		.imgM{
			float: right;
		}
        .msgImgO{
			width: 375px;
			height: 275px;
		}
		.imgO{
			float: left;
		}
		
		input.fileUpload {
        	background: url( "/Tasty_Road/src/main/webapp/WEB-INF/images/3927-200.png" ) no-repeat;
	        border: none;
	        width: 32px;
	        height: 32px;
	        cursor: pointer;
	      }
      
      	#fileUpload{
		    width: 0.1px;
			height: 0.1px;
			opacity: 0;
			overflow: hidden;
			position: absolute;
			z-index: -1;
		}
		
		#fileUpload + label {
		    border: 1px solid #d9e1e8;
		    background-color: #fff;
		    color: #2b90d9;
		    border-radius: 2rem;
		    padding: 8px 17px 8px 17px;
		    font-weight: 500;
		    font-size: 15px;
		    box-shadow: 1px 2px 3px 0px #f2f2f2;
		    outline: none;
		    margin-right: 482px;
		}
		#fileUpload:hover + label {
		    border: 1px solid #d9e1e8;
		    background-color: #grey;
		    color: #2b90d9;
		    border-radius: 2rem;
		    padding: 8px 17px 8px 17px;
		    font-weight: 500;
		    font-size: 15px;
		    box-shadow: 1px 2px 3px 0px #f2f2f2;
		    outline: none;
		}
		#fileUpload:focus + label,
		#fileUpload + label:hover {
		    cursor: pointer;
		}
		.buttonF{
			background-color: #a2e7ff;
		    font-size: 15px;
		    color: #000;
		    border: 1px solid #beeeff;
		    border-radius: 5px;
		    padding: 5px;
		    width: 72px;
		    margin: -3px;
		    margin-left: -73px;
		}
		.buttonF:hover{
			cursor: pointer;
			background-color: #beeeff;
		}
		.buttonS{
			background-color: #a2e7ff;
		    font-size: 15px;
		    color: #000;
		    border: 1px solid #beeeff;
		    border-radius: 5px;
		    padding: 5px;
		    width: 72px;
		    margin: -3px;
		    margin-left: -2px;
		}
		.buttonS:hover{
			cursor: pointer;
			background-color: #beeeff;
		}
		.buttonW{
			background-color: #a2e7ff;
		    font-size: 15px;
		    color: #000;
		    border: 1px solid #beeeff;
		    border-radius: 5px;
		    padding: 5px;
		    width: 77px;
		    margin: -3px;
		    margin-left: 5px;
		}
		.buttonW:hover{
			cursor: pointer;
			background-color: #beeeff;
		}
		.nick{
			padding-right: 10px;
			color: white;
		}
		.msg{
			padding-right: 5px;
			color: white;
		}
		.imgT{
			font-size: 10px;
		    margin-left: -596px;
		    position: absolute;
		    color: white;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	
	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#openRoomNo").val());
		wsEvt();
	}
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			alert(data);
			if(msg != null && msg.type != ''){
				var d = JSON.parse(msg);
				var curDate = new Date();
				var curTime = curDate.getFullYear() + "-" + (curDate.getMonth() + 1) + "-" + curDate.getDate() + " " 
	            + curDate.getHours() + ":" + curDate.getMinutes();
				var url = URL.createObjectURL(new Blob([msg]));
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}
				else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
// 						if()
						$("#chating").append("<p class='me'>" + d.userName + "</p>");	
						$("#chating").append("<span class='me2'>" + d.msg + "</span>");	
						$("#chating").append("<div class='clear'></div>");	
						$("#chating").append("<li class='mdate'>" + curTime + "</li>");	
						$("#chating").append("<div class='clear'></div>");	
						// 채팅시 스크롤 내리는 함수
				        $('#chating').scrollTop($('#chating').prop('scrollHeight'));
					}else{
						$("#chating").append("<p class='others'>" + d.userName + "</p>");	
						$("#chating").append("<span class='others2'>" + d.msg + "</span>");	
						$("#chating").append("<div class='clear'></div>");	
						$("#chating").append("<li class='odate'>" + curTime + "</li>");	
						$("#chating").append("<div class='clear'></div>");	
						// 채팅시 스크롤 내리는 함수
				        $('#chating').scrollTop($('#chating').prop('scrollHeight'));
						 
					} 
					
				}
				else if(d.type == "fileUpload"){
						if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>" + d.userName + "</p>");	
						$("#chating").append("<div class='imgM'><img class='msgImgM' src=" + 
							url + "></div><div class='clearBoth'></div>");
						$("#chating").append("<li class='mdate'>" + curTime + "</li>");	
						$("#chating").append("<div class='clear'></div>");	
				        $('#chating').scrollTop($('#chating').prop('scrollHeight'));
							
						}else{
						$("#chating").append("<p class='me'>" + d.userName + "</p>");	
						$("#chating").append("<div class='imgO'><img class='msgImgO' src=" + 
							url + "></div><div class='clearBoth'></div>");
						$("#chating").append("<li class='mdate'>" + curTime + "</li>");	
						$("#chating").append("<div class='clear'></div>");	
				        $('#chating').scrollTop($('#chating').prop('scrollHeight'));
							
						}
					}
				
				else{
					console.warn("unknown type!")
				}
// 			else{
// 				alert(files);
// 					//파일 업로드한 경우 업로드한 파일을 채팅방에 뿌려준다.
// 					var url = URL.createObjectURL(new Blob([msg]));
// 					var curDate1 = new Date();
// 					var curTime1 = curDate1.getFullYear() + "-" + (curDate1.getMonth() + 1) + "-" + curDate1.getDate() + " " 
// 		           		+ curDate1.getHours() + ":" + curDate1.getMinutes();
// 					if(fileSend.sessionId == $("#sessionId").val()){
// 					$("#chating").append("<p class='me'>" + fileSend.userName + "</p>");	
// 						$("#chating").append("<div class='imgM'><img class='msgImgM' src=" + 
// 							url + "></div><div class='clearBoth'></div>");
// 						$("#chating").append("<li class='mdate'>" + curTime1 + "</li>");	
// 						$("#chating").append("<div class='clear'></div>");	
// 				        $('#chating').scrollTop($('#chating').prop('scrollHeight'));
// 					}else{
// 					$("#chating").append("<p class='others'>" + fileSend.userName + "</p>");	
// 						$("#chating").append("<div class='imgO'><img class='msgImgO' src=" + 
// 							url + "></div><div class='clearBoth'></div>");
// 						$("#chating").append("<li class='odate'>" + curTime1 + "</li>");	
// 						$("#chating").append("<div class='clear'></div>");	
// 				        $('#chating').scrollTop($('#chating').prop('scrollHeight'));
						
// 					}
			}
			   
		} //onMessage 끝
		

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}
	// 정보를 받아 메세지 입력
	function send() {
		var option ={
			type: "message",
			openRoomNo: $("#openRoomNo").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
			
		}
		// 공백 입력을 막기전 chatting 객체 생성
		var chatting = $("#chatting").val();
		
		// 공백 입력 및 입력하지않은 내용 입력 방지
		if(chatting.replace(/\s| /gi,"").length == 0) {
			
			alert("내용을 입력해야 합니다.");
			
			$("#chatting").focus();
			
			return false;
			
			
		}
		
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	

	}
	function fileSend(){
		var file = document.querySelector("#fileUpload").files[0];
		var fileReader = new FileReader();
		fileReader.onload = function() {
			var param = {
				type: "fileUpload",
				file: file,
				openRoomNo: $("#openRoomNo").val(),
				sessionId : $("#sessionId").val(),
				msg : $("#chatting").val(),
				userName : $("#userName").val()
			}
			ws.send(JSON.stringify(param)); //파일 보내기전 메시지를 보내서 파일을 보냄을 명시한다.

		    arrayBuffer = this.result;
			ws.send(arrayBuffer); //파일 소켓 전송
		};
		fileReader.readAsArrayBuffer(file);
	}
</script>
<body>
	<div id="container" class="container">
		<h1>${openRoomName } TALK</h1>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="openRoomNo" value="${openRoomNo }">
		
		<div id="chating" class="chating">
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th class="nick">닉네임</th>
					<th><input type="text" name="userName" id="userName" class="inputN"></th>
					<th><button onclick="chatName()" id="startBtn" class="buttonW">등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th class="msg">CHAT</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요." style="width: 590px;"></th>
					<th><button onclick="send()" id="sendBtn" class="buttonS">보내기</button>
					<br/></th>
				</tr>
				<tr>
					<th class="file"><br/></th>
					<th><br/><input type="file" id="fileUpload">
					<label for='fileUpload'>이미지 선택</label></th>
					<th class="imgT">이미지 업로드는 5MB까지 허용합니다</th>
					<th><br/><button onclick="fileSend()" id="sendFileBtn" class="buttonF">업로드</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>