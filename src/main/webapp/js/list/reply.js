

$(document).ready(function(){
	var listService = (
		
		function(){
			
			function view(param,callback,error){
				
				
				var shopNo = param.shopNo
				
				var page =  1;
				
				var perPageNum =  10;
				
				var key = param.key || ""
				
				var word = param.word || ""
				
				$.getJSON(
				// ajax로 호출하는 url
				"/tlist/tlist.do?shopNo=" + shopNo + "&page=" + page + "&perPageNum=" + perPageNum + "&key=" + key + "&word=" + word,
//				"/tlist/tlist.do?shopNo=" + shopNo + "&page=" + page + "&perPageNum=" + perPageNum ,
				// success(성공) 상태일 때 처리되는 함수
				// 데이터 처리가 성공해서 데이터를 가져오면 data로 넣어준다. list이므로 배열이 넘어온다.
				function(data){
					if(callback){
						callback(data);
					} // if 끝
				} // function(data) 끝
				) // getJSON 끝
				
				// error(실패) 상태일 때의 처리함수
				.fail(
					function(xhr,status,err){
						if(error){
							error();
						} else{
							// 오류 출력 -{}, [] 구조 OK, <> - JSON데이터가 아니므로 오류
							alert(err);
						} // else 끝
					} // function(xhr...) 끝
				); // fail 끝  ★★  ; 붙이는지
				
			} // function view 끝
			
			return{
			    // replyService.list(param,callback, error)
				view : view
			} // return 끝
			
		} // function() 끝
	
	)();  // listService 끝 ★★★★ (); 이거 붙이는지 마는지
	

	
	// showView();
	
//	$(".dataRow").click(function(){
	$(document).on('click', '.dataRow', function(){
		
		var li = $(this).closest("li");
		var shopNo = li.find("span").text();
		var replyUL = $(".chat");
		
		function showView(string){
		
			listService.view({shopNo : shopNo}, function(data){
				
//				alert(shopNo);
				 
//				alert(data);
				
//				alert(JSON.stringify(data));
	//			alert(list);
				
				var str ="";
				
				//	var str =JSON.parse(data);
				if(!data || data.length == 0){
					str += "<li class='list-group-item'> 데이터가 존재하지 않습니다. </li>";
					
				} else{
					str += "<div class='container'>";
					str += "<h1>맛집 보기</h1>";
					
					str += "<ul class='list-group'>";
					str += "<li class='list-group-item row'>";
					str += "<div class='col-md-2 title_label'>가게명</div>";
					str += "<div class='col-md-10'>" + data.shopName + "</div>";
					str += "</li>";
					str += "<li class='list-group-item row'>";
					str += "<div class='col-md-2 title_label'>사업자번호</div>";
					str += "<div class='col-md-10' id='viewShopNo'>" + data.shopNo + "</div>";
					str += "</li>";
					str += "<li class='list-group-item row'>";
					str += "<div class='col-md-2 title_label'>주소</div>";
					str += "<div class='col-md-10'>";
					str += "<pre>" + data.address + "</pre>";
					str += "</div>";
					str += "</li>";
					str += "<li class='list-group-item row'>";
					str += "<div class='col-md-2 title_label'>소개</div>";
					str += "<div class='col-md-10'>" + data.content + "</div>";
					str += "</li>";
					str += "<li class='list-group-item row'>";
					str += "<div class='col-md-2 title_label'>전화번호</div>";
					str += "<div class='col-md-10'>" + data.tel + "</div>";
					str += "</li>";
					str += "<li class='list-group-item row'>";
					str += "<div class='col-md-2 title_label'>총 자리</div>";
					str += "<div class='col-md-10'>" + data.total + "</div>";
					str += "<button id='more' class='more'>더보기</button>";
					str += "</li>";
					str += "<li class='list-group-item row'>";
					str += "<div class='col-md-2 title_label'>현재 자리</div>";
					str += "<div class='col-md-10'>" + data.now + "</div>";
					str += "</li>";
					str += "<li class='list-group-item row'>";
					str += "<div class='col-md-2 title_label'>대기열</div>";
					str += "<div class='col-md-10'>" + data.wait + "</div>";
					str += "</li>";
					str += "</ul>";
					str += "<button class='btn btn-default' id='list' class='list' style='float: left;'>리스트</button>";
					
	// 댓글 시작 부분
	str += "<div class='row' style='margin: 20px -30px;'>";
	str += "<div class='col-lg-12'>";
	str += "<div class='panel panel-default'>";
	str += "<div class='panel-heading'>";
	str += "<i class='fa fa-comments fa-fw'></i> Reply <br/>";
	str += "<button class='btn btn-primary btn-xs pull-right' id='writeReplyBtn'>New Reply</button>";
	str += "</div>";
	str += "<div class='panel-body'>";
	str += "<ul class='chat'>";
	str += "<li class='left clearfix'>";
	str += "<div>";
	str += "<div class='header'>";
	str += "<strong class='primary-font'>user00</strong> <br/>";
	str += "<small class='pull-right text-muted'>2021.04.21 14:12</small>";
	str += "</div>";
	str += "<p>Good job!</p>";
	str += "<div class='text-right'>";
	str += "<button class='btn btn-default btn-xs replyUpdateBtn'>수정</button>";
	str += "<button class='btn btn-default btn-xs replyDeleteBtn'>삭제</button>";
	str += "</div>";
	str += "</div>";
	str += "</li>";
	str += "</ul>";
	str += "</div>";
	// 댓글 panel-body 끝 , 
	// 댓글 panel 시작
	str += "<div class='panel-footer'>";
	str += "<ul class='pagination' id='reply_nav'>";
	str += "<li><a href=''>1</a></li>";
	str += "<li class='active'><a href=''>2</a></li>";
	str += "</ul>";
	str += "</div>";
	str += "</div>";
	str += "</div>";
	str += "</div>";
	str += "</div>";
	
	// Modal - 리스트 맛집 정보 삭제 시 사용되는 모달 창 
	str += "<div id='myModal' class='modal fade' role='dialog'>";
	str += "<div class='modal-dialog'>";
	str += "<div class='modal-content'>";
	str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
	str += "<h4 class='modal-title'>맛집 정보 삭제 알림창</h4>";
	str += "</div>";
	str += "<div class='modal-body'>";
	str += "<form action='delete.do' method='post' id='modal_form'>";
	str += "<input name='shopNo' readonly='readonly' value=" + data.shopNo + ">";
//	str += "<input type='hidden' name='perPageNum' value=" + pageObject.perPageNum + ">";
	str += "<input type='hidden' name='perPageNum' value=" + data.perPageNum + ">";
	str += "</form>";
	str += "</div>";
	str += "<div class='modal-footer'>";
	str += "<button type='button' class='btn btn-default' id='modal_deleteBtn'>삭제</button>";
	str += "<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>";
	str += "</div>";
	str += "</div>";
	str += "</div>";
	str += "</div>";
	// <!-- Modal - 리스트 맛집 삭제 시 사용되는 모달 창의 끝 -->
	
	// <!-- Modal - 댓글 쓰기/ 수정 시 사용되는 모달창 -->
	
	str += "<div id='replyModal' class='modal fade' role='dialog'>";
	str += "<div class='modal-dialog'>";
	str += "<div class='modal-content'>";
	str += "<div class='modal-header'>";
	str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
	str += "<h4 class='modal-title'>";
	str += "<i class='fa fa-comments fa-fw'></i> <span id='replyModalTitle'>Reply Modal</span>";
	str += "</h4>";
	str += "</div>";
	str += "<div class='modal-body'>";
	
	str += "<form>";
	str += "<div class='form-group' id='replyNoDiv'>";
	str += "<label for='replyNo'>댓글 번호:</label>";
	str += "<input name='replyNo' type='text' class='form-control' id='replyNo' readonly='readonly' >";
	str += "</div>";
	str += "<div class='form-group' id='replyshopNoDiv'>";
	str += "<label for='replyshopNo'>맛집 등록 번호:</label>";
	str += "<input name='shopNo' type='text' class='form-control' id='replyshopNo' readonly='readonly' value=" +data.shopNo + ">";
	str += "</div>";
	str += "<div class='form-group' id='replyshopNameDiv'>";
	str += "<label for='replyshopName'>맛집 이름:</label>";
	str += "<input name='shopName' type='text' class='form-control' id='replyshopName' readonly='readonly' value=" + data.shopName + ">";
	str += "</div>";
	str += "<div class='form-group' id='replyContentDiv'>";
	str += "<label for='replyContent'>내용:</label>";
	str += "<textarea name='content' class='form-control' rows='5' id='replyContent' required='required'></textarea>";
	str += "</div>";
	str += "<div class='form-group' id='replyWriterDiv'>";
	str += "<label for='replyWriter'>아이디:</label>";
	str += "<input name='writer' type='text' class='form-control' id='replyWriter' required='required' value=" + data.id + ">";
	str += "</div>";
	str += "</form>";
	str += "</div>";
	str += "<div class='modal-footer'>";
	str += "<button type='button' class='btn btn-default' id='replyModalWriteBtn'>등록</button>";
	str += "<button type='button' class='btn btn-default' id='replyModalUpdateBtn'>수정</button>";
	str += "<button type='button' class='btn btn-default' id='replyModalDeleteBtn'>삭제</button>";
	str += "<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>";
	str += "</div>";
	str += "</div>";
	str += "</div>";
	str += "</div>";
	
					
					
				} // else의 끝
				$("#showView").html(str);	
			
				
			}); // listService.view 의 끝
			
			
		} // function showView 끝 , ★★★★ ; 붙이는거
		
					function showList(){
		
		// replyService 객체는 reply.js에서 선언하고 있다.
		replyService.rList(
			
				// 서버에 넘겨 줄 데이터
				
				{shopNo:shopNo},
				
				
				// 성공했을 때의 함수. data라는 이름으로 list가 들어온다.
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
							str += "<li class='left clearfix' data-replyNo='"+ list[i].replyNo +"'>";
			    			str += "<div>";
			    			str += "<div class='header'>";
			    			str += "<strong class='primary-font replyWriterData'>"+list[i].id+"</strong>";
			    			// class="muted" - 글자색을 회색으로 만들어 주는 BS CSS
// 			    			str += "</br>"
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
					$(".chat").html(str); // 댓글 리스트 데이터를 표시
					// 댓글의 페이지 네이션 표시.
					var pageObject = data.pageObject; // 서버에서 넘어오는 데이터에서 pageObject를 꺼낸다.
					var str = ajaxPage(pageObject);
					
// 					alert(str);
					$("#reply_nav").html(str);
				} // function(data) 의 끝
		);
	} // showList()의 끝
		
		// 페이지 정보 붙이기
		//alert("맛집 정보보기")
		// alert(shopNo);
		
		showView();
		showList();
		
		$("#List").attr("class", "section places HIDDEN");
		$("#View").attr("class", "section places");
		
	});
	
	
	
	$(document).on('click', '#list', function() {
		
		$("#List").attr("class", "section places ");
		$("#View").attr("class", "section places HIDDEN");
		
	});
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★여기서부터 댓글 추가
	
	$(function(){

	// 모달 안에 삭제 버튼 이벤트
	$(document).on('click', '#modal_deleteBtn', function() {
// 		alert("modal 삭제");
		$(document).$("#modal_form").submit();
	});
	
	
	// 댓글 처리 JS 부분
	console.log("==================================");
	console.log("JS Reply List Test!!!");
	
	// 전역 변수 선언 - $(function(){~~});
	var shopNo = '${vo.shopNo}';
	console.log("JS Reply List shopNo : " + shopNo);
//	var repPage = 1;
//	var repPerPageNum = 5;

	
	// 글보기를 하면 바로 댓글 리스트 호출
//		showList();
	
	// function showList() - no, page, perPageNum : 전역변수로 선언되어 있으므로 변수명 사용
	
	
	
	// 댓글 모달창의 전역 변수
	var replyModal = $("#replyModal");
//	alert("replyModal=" + replyModal);
	
// 	// 댓글 등록 버튼 이벤트 처리 (등록 폼) : 댓글의 모달 창 정보 조정과 보이기 ------------------------
	$(document).on('click', '#writeReplyBtn', function(){
 		alert("댓글등록");
 
		// 댓글 모달 창의 제목 바꾸기
		$("#replyModalTitle").text("댓글 쓰기");

		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyModal .form-group").show();
// 		$("#replyRnoDiv").hide();
		$("#replyNoDiv, #replyRnoDiv").hide();    
			
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalUpdateBtn, #replyModalDeleteBtn").hide()
		
		// reply > Form  input 데이터 지우기 : intput 중에서 id="replyshopNo"는 제외시킨다. not("#replyshopNo")
		replyModal.find("textarea").not("#replyshopNoDiv, #replyWriter").val(""); 
		
		replyModal.modal("show");
		alert("replyModal=" + replyModal);
		
	});
	
	// 모달 댓글 등록 버튼에 대한 이벤트 처리 - 입력된 데이터를 가져와서 JSON 데이터 만들기 - 서버에 전송
	$(document).on('click', '#replyModalWriteBtn', function(){
		var reply = {};
		
// 		reply.replyNo = $("#replyNo").val();
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
//	$(".chat").on("click",".replyUpdateBtn",function(){
	$(document).on('click','.replyUpdateBtn',function(){
// 		alert("댓글 수정");
		// 모달창 제목 바꾸기
		$("#replyModalTitle").text("댓글 수정하기");
		
		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyModal .form-group").show(); 
// 		$("#replyNoDiv").hide();
		
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalWriteBtn, #replyModalDeleteBtn").hide()
		
		
		// 데이터 수집
		// 전체 데이터를 포함하고 있는 태그 : li
		var li = $(this).closest("li");
		
		// html tag 안에 속성으로 data-replyNo="2" 값을 넣어 둔것은 obj.data("replyNo")로 찾아서 쓴다.
		var replyNo= li.data("replyno");
		var content = li.find(".replyContentData").text();
		var id = li.find(".replyWriterData").text();
		
// 		alert("replyNo : " + replyNo); 
		
		// 데이터 셋팅
		$("#replyNo").val(replyNo);
		$("#replyshopNo").val(shopNo);
		$("#replyContent").val(content);
		$("#replyWriter").val(id);
		// 비밀번호는 지운다.
// 		$("#replyPw").val("");
		
		replyModal.modal("show");
	});
	
	// 모달창 수정 버튼 이벤트 - 수정 처리 -----------------------------------------------
	$(document).on('lick', '#replyModalUpdateBtn', function(){
// 		alert("수정 처리");
		// 데이터 수집
		var reply = {};
		reply.replyNo = $("#replyNo").val();
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
//	$(".chat").on("click", ".replyDeleteBtn", function(){
	$(document).on('click', '.replyDeleteBtn', function(){
// 		alert("댓글 삭제");
		// 모달창 제목 바꾸기
		$("#replyModalTitle").text("댓글 삭제하기");

		// 작업할 데이터의 입력란을 보이게 안보이게
		$("#replyModal .form-group").show();
// 		$("#replyNo, #replyshopNoDiv, #replyModal .form-group").show();
		$("#replyContentDiv, #replyWriterDiv").hide();
		
		// 작업할 버튼을 보이게 안보이게
		var footer = $("#replyModal .modal-footer");
		footer.find("button").show();
		footer.find("#replyModalWriteBtn, #replyModalUpdateBtn").hide()
		
		// 댓글 번호 가져오기
		var li = $(this).closest("li");
		var replyNo = li.data("replyno");
		
		// 댓글 번호 셋팅
		$("#replyNo").val(replyNo);
// 		alert(replyNo);
		// 댓글 비밀번호 지우기
// 		$("#replyPw").val("");
		
		// 댓글 모달 보이기
		replyModal.modal("show");
	});
	
	// 댓글 삭제 처리
	$(document).on("clcik", "#replyModalDeleteBtn", function(){
// 		alert("댓글 삭제 처리");
		// 데이터 수집
		var reply= {};
		reply.replyNo = $("#replyNo").val();
		reply.shopNo = $("#shopNo").val();
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
//	$("#reply_nav").on("click", ".reply_nav_li", function(){
	$(document).on('click', '.reply_nav_li', function(){
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

// view 


	
}); // $(documnet).ready(function() 첫줄의 끝