<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>오픈 채팅룸</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		body{
			background-image: url("img/1323.jpg");
			background-repeat: no-repeat;
			background-size: 120%;
			-ms-overflow-style: none; 
			 
		}
		::-webkit-scrollbar {  
			display: none; 
		}
		.container{
			width: 730px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: center;
			padding: 5px 5px 5px 15px;
			color: white;
			font-weight: bold;
			margin-bottom: 20px;
		}
		.roomContainer{
			background-color: #F6F6F6;
			width: 730px;
			height: 500px;
			overflow: auto;
			border-radius: 8px;
			opacity: 0.9;
		}
		.roomList{
			border: none;
		}
		.roomList th{
			border: 1px solid #a2e7ff;
			background-color: #beeeff;
			border-radius: 7px;
			color: black;
		}
		.roomList td{
			border: 1px solid #a2e7ff;
			background-color: #fff;
			border-radius: 7px;
			text-align: center;
			color: black;
		}
		.roomList .num{
			width: 115px;
			text-align: center;
		}
		.roomList .room{
			width: 486px;
		}
		.roomList .go{
			width: 115px;
			text-align: center;
		}
		.buttonT{
			background-color:  #a2e7ff;
			font-size: 14px;
			color: #000;
			border: 1px solid #beeeff;
			border-radius: 5px;
			padding: 3px;
			width: 109px;
			margin: 3px;
		}
		.buttonT:hover{
			cursor: pointer;
			background-color: #beeeff;
		}
		.buttonC{
			background-color: #a2e7ff;
		    font-size: 15px;
		    color: #000;
		    border: 1px solid #beeeff;
		    border-radius: 5px;
		    padding: 5px;
		    width: 80px;
		    margin: -3px;
		}
		.buttonC:hover{
			cursor: pointer;
			background-color: #beeeff;
		}
		.inputTable th{
			padding: 5px;
			width: 54px;
			color:white;
		}
		.inputTable input{
			width: 560px;
			height: 25px;
		}
		.btnA{ 
		    text-decoration: none;
		    font-size: 12px;
		    color: black;
		    text-align: center;
		    padding: 8px 16px 8px 16px;
		    margin-left: 650px;
		    display: inline-block;
		    border-radius: 6px;
		    transition: all 0.1s;
		    margin-bottom: 3px;
   		}
   		.btnA.blue{
		    background-color: #a2e7ff;
   		}
   		.btnA.blue:active{
     		border-bottom:2px solid #165195;
   		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	window.onload = function(){
		getRoom();
		createRoom();
	}

	function getRoom(){
		commonAjax('/getRoom', "", 'post', function(result){
			createChatingRoom(result);
		});
	}
	
	function createRoom(){
		$("#createRoom").click(function(){
			var msg = {	openRoomName : $('#openRoomName').val()	};

			commonAjax('/createRoom', msg, 'post', function(result){
				createChatingRoom(result);
			});

			$("#openRoomName").val("");
		});
	}

	function goRoom(number, name){
		location.href="/moveChating?openRoomName="+name+"&"+"openRoomNo="+number;
	}

	function createChatingRoom(res){
		if(res != null){
			var tag = "<tr><th class='num'></th><th class='room'>목 록</th><th class='go'></th></tr>";
			console.log(res);
			res.forEach(function(d, idx){
				var rN = d.openRoomName.trim();
				var openRoomNo = d.openRoomNo;
				tag += "<tr>"+
							"<td class='num'>"+(idx+1)+"</td>"+
							"<td class='room'>"+ rN +"</td>"+
							"<td class='go'><button type='button' class='buttonT' onclick='goRoom(\""+openRoomNo+"\", \""+rN+"\")'>입장</button></td>" +
						"</tr>";	
			});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, callback, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				callback(res);
			},
			error : function(err){
				console.log('error');
				callback(err);
			}
		});
	}
</script>
<body>
	<div class="container">
		<h1>비회원 오픈 채팅방</h1>
		<a href="/list/map.do" class="btnA blue">돌아가기</a>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th>주 제</th>
					<th><input type="text" name="openRoomName" id="openRoomName"></th>
					<th><button id="createRoom" class="buttonC">생성</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>