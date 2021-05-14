<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 보기</title>
<!-- Awesome 4 icons lib : class="fa~ -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- util JS 포함 - 반드시 reply.js 위에 선언을 해주셔야만 합니다. -->
<script type="text/javascript" src="/js/util.js"></script>

<!-- reply Model JS 포함 -->
<script type="text/javascript" src="/js/reply.js"></script>
<script type="text/javascript" src="/js/bookmark.js"></script>
<script type="text/javascript" src="/js/waiting.js"></script>

<style type="text/css">
.title_label{
	border: 1px dotted #ddd;
}
ul.chat{
	list-style: none;
}

ul.chat > li{
	margin-bottom: 15px;
}
</style>

<script type="text/javascript">
// alert("aaa" + 10);

$(function(){
	// 처리 후 나타나는 메시지 : 글쓰기나 글삭제 처리된 후 리스트로 돌아 오면 보여준다.
	// - sitemesh - default_decorator.jsp에서 해결
	// F5, ctrl + F5, ctrl + r 새로고침 막기
	/*
	$(document).keydown(function (e) {
	     
	            if (e.which === 116) {
	                if (typeof event == "object") {
	                    event.keyCode = 0;
	                }
	                return false;
	            } else if (e.which === 82 && e.ctrlKey) {
	                return false;
	            }
	});
	*/

	// 모달 안에 삭제 버튼 이벤트
	$("#modal_deleteBtn").click(function(){
// 		alert("modal 삭제");
		$("#modal_form").submit();
	});
	
	
	// 댓글 처리 JS 부분
	console.log("==================================");
	console.log("JS Reply List Test!!!");
	
	// 전역 변수 선언 - $(function(){~~});
	var shopNo = '${vo.shopNo}';
	console.log("JS Reply List shopNo : " + shopNo);
	var repPage = 1;
	var repPerPageNum = 5;
	var replyUL = $(".chat");
	
	// 글보기를 하면 바로 댓글 리스트 호출
	showList();
	
	// function showList() - no, page, perPageNum : 전역변수로 선언되어 있으므로 변수명 사용
	function showList(){
		// replyService 객체는 reply.js에서 선언하고 있다.
		replyService.rList(
				// 서버에 넘겨 줄 데이터
				{shopNo:shopNo, repPage:repPage, repPerPageNum:repPerPageNum},
				// 성공했을 때의 함수. data라는 이름으로 list가 들어온다.
// 				function(list){
				function(data){
					// list 데이터 확인
					// data 데이터 확인 -> JSON 데이터 : [object Object]
					//   - data.list / data.pageObject
					// 문자열로 만들어서 데이터 표시 - 눈으로 확인
// 					alert(data);
// 					alert(JSON.stringify(data));
					var list = data.rList;
// 					return; // 데이터만 확인하고 처리는 하지 않도록 하기 위해서

// 					alert(list);
					var str = "";
					// li 태그 만들기-----------------
					// 데이터가 없을 때의 처리
					if(!list || list.length == 0){
// 						alert("데이터 없음");
						str += "<li>데이터가 존재하지 않습니다.</li>"
					}else{ // 데이터가 있을 때의 처리
// 						alert("데이터 있음");
						for(var i = 0; i < list.length; i++){
							console.log(list[i]);
							// tag 만들기 - 데이터 한개당 li tag 하나가 생긴다.
							str += "<li class='left clearfix' data-rno='"+ list[i].replyNo +"'>";
			    			str += "<div>";
			    			str += "<div class='header'>";
			    			str += "<strong class='primary-font replyWriterData'>"+list[i].id+"</strong>";
			    			// class="muted" - 글자색을 회색으로 만들어 주는 BS CSS
			    			str += "<small class='pull-right text-muted'>"
			    				+ replyService.displyTime(list[i].writeDate)
			    				+ "</small>";
			    			str += "</div>";
			    			str += "<p><pre style='background:none;' class='replyContentData'>"
			    				+ list[i].content + "</pre></p>";
			    			str += "<div class='text-right'>";
			    			str += "<button class='btn btn-default btn-xs replyUpdateBtn'>수정</button>";
			    			str += "<button class='btn btn-default btn-xs replyDeleteBtn'>삭제</button>";
			    			str += "</div>";
			    			str += "</div>";
			    			str += "</li>";
			    		}
					}
					replyUL.html(str); // 댓글 리스트 데이터를 표시
					// 댓글의 페이지 네이션 표시.
					var pageObject = data.pageObject; // 서버에서 넘어오는 데이터에서 pageObject를 꺼낸다.
					var str = ajaxPage(pageObject);
// 					alert(str);
					$("#reply_nav").html(str);
				} // function(data) 의 끝
		);
	} // showList()의 끝
	
	
	// 댓글 모달창의 전역 변수
	var replyModal = $("#replyModal");
	
// 	// 댓글 등록 버튼 이벤트 처리 (등록 폼) : 댓글의 모달 창 정보 조정과 보이기 ------------------------
	$("#writeReplyBtn").click(function(){
// 		alert("댓글등록");

		// 댓글 모달 창의 제목 바꾸기
		$("#replyModalTitle").text("Reply Write");

		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyNoDiv, #replyModal .form-group").show();
// 		$("#replyRnoDiv").hide();
		
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalUpdateBtn, #replyModalDeleteBtn").hide()
		
		// reply > Form  input 데이터 지우기 : intput 중에서 id="replyshopNo"는 제외시킨다. not("#replyshopNo")
		replyModal.find("input, textarea").not("#replyshopNo, #replyWriter").val(""); 
		
		replyModal.modal("show");
	});
	
	// 모달 댓글 등록 버튼에 대한 이벤트 처리 - 입력된 데이터를 가져와서 JSON 데이터 만들기 - 서버에 전송
	$("#replyModalWriteBtn").click(function(){
		var reply = {};
		reply.shopNo = $("#replyshopNo").val();
		reply.content = $("#replyContent").val();
		reply.id = $("#replyWriter").val();
// 		alert(reply);
// 		alert(JSON.stringify(reply));

		// ajax를 이용한 댓글 등록 처리
		replyService.write(reply,
			// 성공했을 때의 처리 함수
			function(result){
// 				alert(result);
				replyModal.modal("hide");
				showList();
			}
		);
	});
	
	
	// 댓글 수정 폼 : 모달 창 열기 (replyModal) ----------------------------------------------
	// 댓글번호, 내용, 작성자, 비밀번호
	$(".chat").on("click",".replyUpdateBtn",function(){
// 		alert("댓글 수정");
		// 모달창 제목 바꾸기
		$("#replyModalTitle").text("Reply Update");
		
		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyNoDiv, #replyModal .form-group").show(); 
// 		$("#replyNoDiv").hide();
		
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalWriteBtn, #replyModalDeleteBtn").hide()
		
		
		// 데이터 수집
		// 전체 데이터를 포함하고 있는 태그 : li
		var li = $(this).closest("li");
		
		// html tag 안에 속성으로 data-rno="2" 값을 넣어 둔것은 obj.data("rno")로 찾아서 쓴다.
		var shopNo = li.data(".replyshopNoData");
		var content = li.find(".replyContentData").text();
		var id = li.find(".replyWriterData").text();
		
		// 데이터 셋팅
		$("#replyshopNo").val(shopNo);
		$("#replyContent").val(content);
		$("#replyWriter").val(id);
		// 비밀번호는 지운다.
// 		$("#replyPw").val("");
		
		replyModal.modal("show");
	});
	
	// 모달창 수정 버튼 이벤트 - 수정 처리 -----------------------------------------------
	$("#replyModalUpdateBtn").click(function(){
		alert("수정 처리");
		// 데이터 수집
		var reply = {};
		reply.shopNo = $("#replyshopNo").val();
		reply.content = $("#replyContent").val();
		reply.id = $("#replyWriter").val();
// 		reply.pw = $("#replyPw").val();
		
		// 수집한 데이터 확인
// 		alert(JSON.stringify(reply));
		
		// reply.js 안에 있는 replyService.update를 호출해서 실행
		replyService.update(reply,
			function(result, status){
// 				alert("성공 : " + status);
				// 성공 메시지 출력
				if(status=="notmodified")
					alert("수정이 되지 않았습니다. 정보를 확인해 주세요.");
				else{
					alert(result);
					// 리스트를 다시 표시한다.
					showList();
				}
			},
			function(err, status){
// 				alert("실패 : " + status);
				// 실패 메시지 출력
				alert(err);
				
			}
		); // replyService.update()의 끝
		
		// 모달 창은 숨겨 둔다.
		replyModal.modal("hide");
		
	});
	
	
	// 댓글 삭제 폼 : 모달 (replyModal) ----------------------------------------------
	$(".chat").on("click", ".replyDeleteBtn", function(){
// 		alert("댓글 삭제");
		// 모달창 제목 바꾸기
		$("#replyModalTitle").text("Reply Delete, 댓글 삭제 창");

		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyNo, #replyshopNoDiv, #replyModal .form-group").show();
		$("#replyContentDiv, #replyWriterDiv").hide();
		
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalWriteBtn, #replyModalUpdateBtn").hide()
		
		// 댓글 번호 가져오기
		var li = $(this).closest("li");
		var replyNo = li.data("replyNo");
		
		// 댓글 번호 셋팅
		$("#replyNo").val(replyNo);
		
		// 댓글 비밀번호 지우기
// 		$("#replyPw").val("");
		
		// 댓글 모달 보이기
		replyModal.modal("show");
	});
	
	// 댓글 삭제 처리
	$("#replyModalDeleteBtn").click(function(){
// 		alert("댓글 삭제 처리");
		// 데이터 수집
		var reply= {};
		reply.replyNo = $("#replyNo").val();
		reply.id = $("#replyWriter").val();
		
		// reply.js 안에 있는 replyService.delete(reply JSON, 성공함수, 오류함수)
		replyService.delete(reply,
				function(result, status){
					//status - 비밀번호가 틀려서 삭제가 되지 않으면 "notmodified"
// 					alert("result : " + result + "\nstatus : " + status);
					if(status=="success"){
						alert(result);
						// 성공적으로 삭제를 한 경우 다시 리스트를 가져와서 표시해준다.
						showList();
					}else{
						alert("댓글 삭제에 실패하셨습니다. 정보를 확인해 주세요.");
					}
				},
				function(err){
					alert(err);
				}
		);
		replyModal.modal("hide");
		
	});
	
	// 댓글의 페이지 번호 클릭 이벤트 - 태그가 나중에 나온다. 그래서 on()
	// $(원래 있었던 객체 선택).on(이벤트, 새로 만들어진 태그, 실행함수) -> 이벤트의 전달
	$("#reply_nav").on("click", ".reply_nav_li",
		function(){
// 			alert("댓글 페이지네이션 클릭");
			// this => li / move 클래스 li-a에 작성해 놨다.
			if($(this).find("a").hasClass("move")){
				repPage = $(this).data("page");
// 				alert(repPage + " 페이지로 이동시킨다.");
				showList();
			} else {
				alert("이동시키지 않는다.");
			}
			return false;
		}
	);
	
}); // $(function(){~}) 의 끝.
</script>

</head>
<body>
<div class="container">
<h1>맛집 보기</h1>
<!-- 데이터 표시하는 부분 -->
<ul class="list-group">
  <li class="list-group-item row">
  	<div class="col-md-2 title_label">가게명</div>
  	<div class="col-md-10">${vo.shopName }</div>
  </li>
  <li class="list-group-item row">
  	<div class="col-md-2 title_label">사업자번호</div>
  	<div class="col-md-10" id="viewshopNo">${vo.shopNo }</div>
  </li>
  <li class="list-group-item row">
  	<div class="col-md-2 title_label">주소</div>
  	<div class="col-md-10"><pre>${vo.address }</pre></div>
  </li>
  <li class="list-group-item row">
  	<div class="col-md-2 title_label">소개</div>
  	<div class="col-md-10">${vo.content }</div>
  </li>
  <li class="list-group-item row">
  	<div class="col-md-2 title_label">전화번호</div>
  	<div class="col-md-10">${vo.tel }</div>
  </li>
<!--   <li class="list-group-item row"> -->
<!--   	<div class="col-md-2 title_label">이미지</div> -->
<%--   	<div class="col-md-10"><pre>${vo.content }</pre></div> --%>
<!--   </li> -->
  <li class="list-group-item row">
  	<div class="col-md-2 title_label">총 자리</div>
  	<div class="col-md-10">${vo.total }</div>
	<button id="more" class="more">더보기</button>
  </li>
  <li class="list-group-item row">
  	<div class="col-md-2 title_label">현재 자리</div>
  	<div class="col-md-10">${vo.now }</div>
  </li>
  <li class="list-group-item row">
  	<div class="col-md-2 title_label">남은 자리</div>
  	<div class="col-md-10">${vo.wait }</div>
  </li>
<!--   <li class="list-group-item row"> -->
<!--   	<div class="col-md-2 title_label">조회수</div> -->
<%--   	<div class="col-md-10">${vo.cnt }</div> --%>
<!--   </li> -->
<!--   <li class="list-group-item row"> -->
<!--   	<div class="col-md-2 title_label">즐겨찾기</div> -->
<%--   	<div class="col-md-10">${vo.status }</div> --%>
<!--   </li> -->
</ul>
<a href="update.do?shopNo=${vo.shopNo }&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}"
class="btn btn-default">수정</a>
<a class="btn btn-default" onclick="return false;"
data-toggle="modal" data-target="#myModal" >삭제</a>
<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}"
class="btn btn-default">리스트</a>

<!-- 댓글의 시작 -->
<div class="row" style="margin: 20px -30px;">
	<div class="col-lg-12">
		<div class="panel panel-default">
		    <div class="panel-heading">
		    	<i class="fa fa-comments fa-fw"></i>
		    	Reply
		    	<button class="btn btn-primary btn-xs pull-right"
		    	id="writeReplyBtn">New Reply</button>
		    </div>
		    <div class="panel-body">
		    	<ul class="chat">
		    		<!-- 데이터가 있는 만큼 반복 처리 li태그 만드어 내기 -->
		    		<!-- rno를 표시하지 않고 태그안에 속성으로 숨겨 놓음 data-rno="12" -->
		    		<li class="left clearfix" data-rno="12">
		    			<div>
		    				<div class="header">
		    					<strong class="primary-font">user00</strong>
		    					<small class="pull-right text-muted">2021.04.21 14:12</small>
		    				</div>
		    				<p>Good job!</p>
		    				<div class="text-right">
		    					<button class="btn btn-default btn-xs replyUpdateBtn">수정</button>
		    					<button class="btn btn-default btn-xs replyDeleteBtn">삭제</button>
		    				</div>
		    			</div>
		    		</li>
		    	</ul>
		    </div>
			<!-- 댓글 panel-body 의 끝 -->
			<div class="panel-footer">
				<ul class="pagination" id="reply_nav">
				  <li><a href="">1</a></li>
				  <li class="active"><a href="">2</a></li>
				</ul>
			</div>
		</div>
		<!-- 댓글 panel 의 끝 -->
	</div>
	
</div>
<!-- 댓글의 끝 -->

</div>
<!-- container 끝 -->

<!-- Modal - 맛집 정보 삭제 시 사용되는 모달 창 -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">맛집 정보 삭제 알림창</h4>
      </div>
      <div class="modal-body">
        <form action="delete.do" method="post" id="modal_form">
        	<input name="shopNo" readonly="readonly" value="정말 삭제 하시겠습니까?">
        	<input type="hidden" name="perPageNum"
        	value="${pageObject.perPageNum }">
<!--         	<div class="form-group"> -->
<!--         		<label>비밀번호 : </label> -->
<!--         		<input name="pw" type="password" class="form-control" id="pw"  -->
<!-- 			      pattern="[^가-힣ㄱ-ㅎ]{4,20}" required="required" -->
<!-- 			      title="4-20자. 한글은 입력할 수 없습니다." /> -->
<!--         	</div> -->
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="modal_deleteBtn">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>

  </div>
</div>
<!-- Modal - 게시판 글삭제 시 사용되는 모달 창의 끝 -->

<!-- Modal - 댓글 쓰기/ 수정 시 사용되는 모달창 -->
<div id="replyModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">
        	<i class="fa fa-comments fa-fw"></i>
        	 <span id="replyModalTitle">Reply Modal</span>
        </h4>
      </div>
      <div class="modal-body">
		  <form>
<!-- 			<div class="form-group" id="replyRnoDiv"> -->
<!-- 			  <label for="replyRno">댓글번호:</label> -->
<!-- 			  <input name="rno" type="text" class="form-control" id="replyRno" -->
<!-- 			  readonly="readonly"> -->
<!-- 			</div>		     -->
			<div class="form-group" id="replyNoDiv">
			  <label for="replyNo">댓글 번호:</label>
			  <input name="replyNo" type="text" class="form-control" id="replyNo"
			  readonly="readonly" value="${vo.replyNo }">
			</div>
			<div class="form-group" id="replyshopNoDiv">
			  <label for="replyshopNo">맛집 등록 번호:</label>
			  <input name="shopNo" type="text" class="form-control" id="replyshopNo"
			  readonly="readonly" value="${vo.shopNo }">
			</div>		    
		    <div class="form-group" id="replyContentDiv">
		      <label for="replyContent">내용:</label>
		      <textarea name="content" class="form-control" rows="5" id="replyContent"
		      required="required"></textarea>
		    </div>
			<div class="form-group" id="replyWriterDiv">
			  <label for="replyWriter">아이디:</label>
			  <input name="writer" type="text" class="form-control" id="replyWriter"
			  required="required" pattern="[A-Za-z가-힣][A-Za-z가-힣0-9]{1,9}" value="${login.id }">
			</div>		    
<!-- 			<div class="form-group" id="replyPwDiv"> -->
<!-- 			  <label for="replyPw">비밀번호:</label> -->
<!-- 			  <input name="pw" type="text" class="form-control" id="replyPw" -->
<!-- 			  required="required" pattern=".{4,20}"> -->
<!-- 			</div>		     -->
		  </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="replyModalWriteBtn">등록</button>
        <button type="button" class="btn btn-default" id="replyModalUpdateBtn">수정</button>
        <button type="button" class="btn btn-default" id="replyModalDeleteBtn">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>

  </div>
</div>
<!-- Modal - 댓글 쓰기/ 수정 시 사용되는 모달창의 끝 -->
<div class="modal"></div>

</body>
</html>