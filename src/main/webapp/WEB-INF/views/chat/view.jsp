<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<title>Chatting Room</title>

<!-- 기본적으로 사용되는 util js : chat.js 위에 써줘야 함 -->
<script type="text/javascript" src="/js/util.js"></script>

<!-- chat에 해당하는 Model js포함 -->
<script type="text/javascript" src="/js/chat.js"></script>

<style type="text/css">
h5{
	text-align: center;
	position:relative;
	top:-200px;
}

.chat{
    overflow-x: hidden;
    display:flex;
    flex-direction: column-reverse;
    overflow-y:auto;
    height:400px;
}

.chatSendBtn{
	border: none;
	color: #c0b6c8;
	padding: 15px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	background-color: #ecf1f8;
}

pre{
    padding:10px;
    overflow: auto;
    white-space: pre-wrap;
} 

.rightChatView{
	background-color: #c0b6c8;
}

.leftChatView{
	background-color: #d9d3de;
}

.goList {
	background-color: #ecf1f8; /* Green */
	border: none;
	color: white;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 2px 1px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.goList {
	background-color: white;
	color: black;
	border: 2px solid #ecf1f8;
}

.goList:hover {
	background-color: #ecf1f8;
	color: white;
}

.deleteRoom {
	background-color: #f0c1c3; /* Green */
	border: none;
	color: white;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 2px 1px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.deleteRoom {
	background-color: white;
	color: black;
	border: 2px solid #f0c1c3;
}

.deleteRoom:hover {
	background-color: #f0c1c3;
	color: white;
}
</style>

<script type="text/javascript">
$(function() {
      // 삭제 버튼 이벤트 - 다시 확인한다.
      $("#deleteRoom").click(function() {
          if (!confirm("채팅 방에서 나가시겠습니까?"))
          	return false;
      });

      //채팅 처리 부분에 대한 것
      console.log("-------------------");
      console.log(" * JS chat List TEST * ");

      //전역 변수 선언 - $(function(){}); : 이 안에 선언된 함수에서는 공통으로 사용할 수 있다. 
      var no = ${vo.chatNo};
      var id1 = "${vo.id1}";
      var loginId = "${login.id}";
      var id2 = "${vo.id2}";

      console.log(" * JS chat List no : " + no + " * ");
      console.log(" * JS chat List id1 : " + id1 + " * ");
      console.log(" * JS chat List id2 : " + id2 + " * ");
      console.log(" * JS chat List login.id : " + loginId + " * ");

      var chatServiceUL = $(".chat");

      //글보기를 하면 바로 댓글 리스트를 호출
      showList();

      function showList() {
//     	  alert(chatService);
         chatService.list({no : no},
            function(data) {
            //alert(data);
            //alert(JSON.stringify(data));
               var list = data;
               var str = "";
               if (!list || list.length == 0) {
            	   str += "<h5 id='h5'>맛길 따라, 먹길 따라<br>함께하는 맛집 탐방</h5>"
               } else {
                  for (var i = 0; i < list.length; i++) {
                     console.log(list[i]);
                     if (list[i].id == loginId) {
                        str += "<div>";
                        str += "<div class='row'>";
                        str += "<div class='col-sm-4 pull-right' id='chatMessageArea' data-chatNo='" + list[i].chatNo + "'>";
                        str += "<label id='user'><i class='fas fa-user-circle'> " + list[i].id + " : <br></label></i>";
                           str += "<pre class='rightChatView'>" + list[i].content + "<br>" + chatService.displyTime(list[i].writeDate) + "</pre>";
                           str += "</div>";
                           str += "</div>";
                           str += "</div>";

                     } else {
                        str += "<div>";
                        str += "<div class='row'>";
                        str += "<div class='col-sm-4 pull-left' id='chatMessageArea' data-chatNo='" + list[i].chatNo + "'>";
                        str += "<label id='user'><i class='far fa-user-circle'> " + list[i].id + " : <br></label></i> ";
                           str += "<pre class='leftChatView'>" + list[i].content + "<br>" + chatService.displyTime(list[i].writeDate) + "</pre>";
                           str += "</div>";
                           str += "</div>";
                           str += "</div>";
                           }
                        }
                     }
                     chatServiceUL.html(str); //댓글 리스트 데이터를 표시하는 곳
                  }//function()의 끝
            
               );
            }//showList의 끝

      //채팅 전송
      $("#chatSendBtn").click(function() {
         //          alert("click");
         var chatRoom = {};

         chatRoom.chatNo = $("#chatNo").val();
         chatRoom.content = $("#chatContent").val();
         chatRoom.id1 = $("#chatSender").val();
         chatRoom.id2 = $("#chatAccepter").val();
         //          alert(chatRoom);
         //          alert(JSON.stringify(chatRoom));
         //ajax를 이용한 댓글 등록 처리
         chatService.write(chatRoom,
         //등록을 성공했을 때 등록 함수
         function(result) {
            $("#chatContent").val(""); //내용 전송 후 채팅 창에 있는 내용 비우기
            showList();
         }); //chatService.write의 끝
      }); //chatSendBtn 클릭 시 일어나는 이벤트

      setInterval(function() {
         showList();
      }, 2000);

   });
</script>


</head>
<!-- <body> -->
<body id="bg">
   
   <div class="container hTag">
      <c:set var="id" value="${login.id }" />
      <c:choose>
         <c:when test="${vo.id2 == login.id}">
            <h1 class="radial" style="text-align: center;"><i class='far fa-comments' style='font-size:36px'> ${vo.id1 } 님과 대화중입니다.</i></h1>
         </c:when>
         <c:when test="${vo.id1 == login.id}">
            <h1 class="radial" style="text-align: center;"><i class='far fa-comments' style='font-size:36px'> ${vo.id2 } 님과 대화중입니다.</i></h1>
         </c:when>
      </c:choose>

      <!-- 채팅 메뉴 -->
      <div class="col-12 row justify-content-center align-items-center my-5"></div>
      <div class="col-12 form-group" style="margin-top: 40px; clear: both;">
         <div class="col-10 form-control" style="margin: 20px auto; text-align: center; color: #34558b; background-color: #ecf1f8; border: 1px solid #dae4f1; padding: 10px 10px; border-radius: 8px;">
            ${vo.chatName }
            <input name="chatNo" id="chatNo" type="hidden" value="${vo.chatNo }" />
            <c:if test="${vo.id1 == login.id}">
               <a style="float: right;"
                  href="updateForm.do?no=${vo.chatNo}&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
                  class="button">수정</a>
            </c:if>
         </div>
      </div>

      <div class="form-group"></div>

      <!-- 채팅 보여주는 곳 : function 부분 -->
      <div class="col-12 form-group" id="updateContent">
         <div class="col-12 form-control chat" style="margin: 0 auto; border: 1px solid #dae4f1; height: 400px; border-radius: 10px; overflow: auto; overflow-x: hidden;" id="chatArea">
            <div id="chatMessageArea" style="margin-top: 10px; margin-left: 10px;">
            
               <div class="row">
                  <div class='col-sm-3 pull-right' id='myF' data-chatNo=10>
                     <label>test : <br></label>
                     <pre>test<br> 2021.05.13</pre>
                  </div>
               </div>
               
               <div class="row" >
                  <div class='col-sm-3 pull-right' id='myF' data-chatNo=10>
                     <label>test : <br></label>
                     <pre>test<br> 2021.05.13</pre>
                  </div>
               </div>
               
               <div class="row">
                  <div class='col-sm-3 pull-right' id='myF' data-chatNo=10>
                     <label>test : <br></label>
                     <pre>test<br> 2021.05.13</pre>
                  </div>
               </div>
               
               <div class="row">
                  <div class='col-sm-3 pull-right' id='myF' data-chatNo=10>
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
               <textarea cols="5" wrap="hard" style="border: 1px solid #dae4f1; height: 85px; float: left; width: 80%" placeholder="메시지를 입력해주세요." id="chatContent" 
               name="content"></textarea>
            </div>
            <span style="margin-top: -85px; float: right; width: 20%; height: 85px; text-align: center; background-color: #ecf1f8; border-radius: 5px;">
               <br>
               <button type="button" class="btn chatSendBtn" id="chatSendBtn">전송</button>
            </span>
         </form>
      </div>
      <div class="col-2" style="float: left">
         <button type="button" class="btn btn-default goList" id="goList" onclick="location='list.do'">리스트</button>
         <a href="delete.do?no=${vo.chatNo }" class="btn btn-default deleteRoom" id="deleteRoom">나가기</a>
      </div>
   </div>
</body>
</html>