/**
 * 
 */
 $(document).ready(function() {
   
   var listService = (
	
	   function(){
	      // list
	      // param : JSON {no:2, repPage:1, repPerPageNum:5}
	      // list(JSON-넘겨줄데이터, 데이터를 성공적으로 가져왔을때의 실행함수, 실패했을때의 실행함수)
	      function listView(param, callback, error){
	         
	         var shopNo = $("#viewShopNo").text();
	         
	         $.getJSON(
	            // ajax로 호출하는 url
	            "/list/list.do?page=" + pageObject.page, + "&perPageNum=" + pageObject.perPageNum,
	            // success(성공) 상태일 때 처리되는 함수
	            // 데이터 처리가 성공해서 데이터를 가져오면 data로 넣어준다. list이므로 배열이 넘어온다.
	            function(data){
	//               alert(data);
	               // callback : 데이터를 가져오면 처리하는 함수 
	               // - 가져온 list를 HTML만듦. 지정한 곳에 넣어준다.
	               
	               if(callback){
	                  callback(data);
	               }
	            }
	         )
	         // error(실패) 상태일 때의 처러함수
	         .fail(
	            function(xhr, status, err){
	               //오류 함수가 있으면 오류 함수 실행
	               if(error){
	                  error();
	               }else{
	                  // 오류 출력 -{}, [] 구조 OK, <> - JSON데이터가 아니므로 오류
	                  alert(err);
	               }
	            }
	         ); // $.getJSON().fail()의 끝
	         
	      } // list() 의 끝
	      
	      // view() : ----------------------------------------------------
	      // view(JSON data, 성공함수, 실패함수)
	      function view(shopNo, callback, error){
//	      function view(reply, callback, error){
	         console.log("list view() ----------------------------");
	         // ajax를 이용해서 데이터 넘기기
	         $.ajax({
	            type:"patch",
	            url : "/list/view.do",
	            data : JSON.stringify(shopNo),
	            contentType : "application/json; charset=utf-8",
	            success : function(result, status, xhr){
	               if(callback) callback(result, status);
	               else alert("맛집 정보 보기 성공");
	            },
	            error : function(xhr, status, err){
	               if(error) error(err, status);
	               else alert(err);
	            }
	         });
	      }
	      
	      return{
	         // listService.view(param,callback, error)
	         list : listView,
	         view : view
	         
	      }
	   }
   
)();
   
   var shopNo = $("#viewShopNo").text();
   
   // alert(shopNo);
   
   function showList() {
      
      listService.list({shopNo : shopNo}, function(data) {
         
         // alert(data);
         
         // alert(JSON.stringify(data));
         
         var str = "";
         
         if(!data || data.length == 0) {
            
            str += "<div class='modal fade waitModal' id='wait' role='dialog'>";
            str += "<div class='modal-dialog'>";
            str += "<div class='modal-content'>";
            str += "<div class='modal-header'>";
            str += "<h4 class='modal-title'>";
            str += "<i class='fa fa-comments fa-fw'></i>";
            str += "<span id='replyModalTitle'>대기열 수정</span>";
            str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
            str += "</h4>";
            str += "</div>";
            str += "<div class='modal-body col-12'>";
            str += "<form>";
            str += "<div class='form-group' id='shopNoDiv '>";
            str += "<input name='shopNo' type='text' class='form-control ' id='shopNo' readonly='readonly' value='대기열을 불러올 수 없습니다.' >";
            str += "</div>";
            str += "</form>";
            str += "</div>";
            str += "</div>";
            str += "</div>";
            str += "</div>";
            
         } else {
            
           // alert("wating else")
            
            console.log(data);
            
            // alert("실행");
            
            str += "<div class='modal fade waitModal' id='wait' role='dialog'>";
            str += "<div class='modal-dialog'>";
            str += "<div class='modal-content'>";
            str += "<div class='modal-header'>";
            str += "<h4 class='modal-title'>";
            str += "<button type='button' class='close pull-left' data-dismiss='modal'>&times;</button>";
            str += "<i class='fa fa-comments fa-fw'></i>";
            str += "<span id='replyModalTitle'>대기열 수정</span>";
            str += "</h4>";
            str += "</div>";
            str += "<div class='modal-body col-md-12'>";
            str += "<form>";
            str += "<div class='form-group' id='shopNoDiv '>"; 
            str += "<input name='shopNo' type='hidden' class='form-control ' id='shopNo' readonly='readonly' value='" + data.shopNo + "'>";
            str += "</div>";
            str += "<div class='form-group col-12' id='nowTalbeDiv'>";  
            str += "<label for='now'>사용 중인 Table: </label> <br>";
            str += "<input name='now' type='text' class='form-control col-md-6' id='now' readonly='readonly' value='" + data.now +"' style='width: 6em; display: inline;' >";
            str += "<button type='button' id='nowPlus' class='btn btn-default col-md-3' style='float: right;' >&#43;</button>"
            str += "<button type='button' id='nowPlus' class='btn btn-default col-md-3' style='float: right;' >&#45;</button>"
            str += "</div>";
//          str += "<div class='input-group'>";
//	    	str += "<span class='input-group-addon'>사용중인 Table </span>";
//	     	str += "<input id='now' type='text' class='form-control' name='now' value='" + data.now + "' style='width: 100px;'>";
//		    str += "</div>"
            str += "<div class='form-group col-12 row' id='totalTableDiv'>";
            str += "<label for='total'>전체 Table</label >";
            str += "<input name='total' type='text' class='form-control' id='toal' readonly='readonly' value='"+ data.total + "'>";
            str += "</div>";
            str += "</form>";
            str += "</div>";
            str += "</div>";
            str += "</div>";
            str += "</div>";
         
            
         }      // end of if-else
         
         // alert(str);
         
         $("article").append(str);
         
      });      // end of function(data)
      
   }

	showWait();
   
   $("#more").click(function () {
   
      // alert(shopNo);
      
      // alert("click");
      
      // alert("실행-- wait : " + $("#wait") );
      
      $("#wait").modal();

      
   });
   
});
//
	var str = "";
	
	str += "<ul class='list-group'>"	// list.jsp

	if(!data || data.length == 0) {
		str +=  "<li class='list-group-item'> 데이터가 존재하지 않습니다. </li>"
	}
	
	else{
		
		for(var i = 0; list.length; i++) {
			
		str += "<li class='ist-group-item dataRow'>"
		str += "<div>"
		str += "'가게명:'" + data.shopName + "'/'"
		str += data.content
		str += "</div>" 
		str += "주소:" + data.address + "<br>"
		str += "전화번호:" + data.tel + "<br>"
		str += "<span class='shopNo'>" + data.shopNo + "</span>"
		str += "</li>"
			
		}
			  
		
	}		
$("#shopList").html(str);






// ---------------------------------------------------- view
 	var str = "";
	str += "<html>"
	str += "<body>"
	str += "<div class='container'>"
	str += "<h1>맛집 보기</h1>"
	
	str += "<ul class='list-group'>"
	str += "<li class='list-group-item row'>"
	str += "<div class='col-md-2 title_label'>가게명</div>"
	str += "<div class='col-md-10'>" + data.shopName + "</div>"
	str += "</li>"
	str += "<li class='list-group-item row'>"
	str += "<div class='col-md-2 title_label'>사업자번호</div>"
	str += "<div class='col-md-10' id='viewShopNo'>" + data.shopNo + "</div>"
	str += "</li>"
	str += "<li class='list-group-item row'>"
	str += "<div class='col-md-2 title_label'>주소</div>"
	str += "<div class='col-md-10'>"
	str += "<pre>" + data.address + "</pre>"
	str += "</div>"
	str += "</li>"
	str += "<li class='list-group-item row'>"
	str += "<div class='col-md-2 title_label'>소개</div>"
	str += "<div class='col-md-10'>" + data.content + "</div>"
	str += "</li>"
	str += "<li class='list-group-item row'>"
	str += "<div class='col-md-2 title_label'>전화번호</div>"
	str += "<div class='col-md-10'>" + data.tel + "</div>"
	str += "</li>"
	str += "<li class='list-group-item row'>"
	str += "<div class='col-md-2 title_label'>총 자리</div>"
	str += "<div class='col-md-10'>" + data.total + "</div>"
	str += "<button id='more' class='more'>더보기</button>"
	str += "</li>"
	str += "<li class='list-group-item row'>"
	str += "<div class='col-md-2 title_label'>현재 자리</div>"
	str += "<div class='col-md-10'>" + data.now + "</div>"
	str += "</li>"
	str += "<li class='list-group-item row'>"
	str += "<div class='col-md-2 title_label'>대기열</div>"
	str += "<div class='col-md-10'>" + data.wait + "</div>"
	str += "</li>"
	str += "</ul>"
//	str += "<a href='update.do?shopNo=" + data.shopNo + "&page=" + pageObject.page + "&perPageNum=" + pageObject.perPageNum + "&key=" + pageObject.key + "&word=" + pageObject.word + '
//	str += "class='btn btn-default'>수정</a> 
//	str += "<a class='btn btn-default' onclick='return false;' data-toggle='modal' data-target='#myModal'>삭제</a>"
//	str += "<a href='list.do?page=" + pageObject.page + "&perPageNum=" + pageObject.perPageNum + "&key=" + pageObject.key + "&word=" + pageObject.word + ' 
//	str += "class='btn btn-default'>리스트</a>"
	
	// 댓글 부분
	str += "<div class='row' style='margin: 20px -30px;'>"
	str += "<div class='col-lg-12'>"
	str += "<div class='panel panel-default'>"
	str += "<div class='panel-heading'>"
	str += "	<i class='fa fa-comments fa-fw'></i> Reply <br/>"
	str += "<button class='btn btn-primary btn-xs pull-right' id='writeReplyBtn'>New Reply</button>"
	str += "</div>"
	str += "<div class='panel-body'>"
	str += "<ul class='chat'>"
	str += "<li class='left clearfix'>"
	str += "<div>"
	str += "<div class='header'>"
	str += "<strong class='primary-font'>user00</strong> <br/>"
	str += "<small class='pull-right text-muted'>2021.04.21 14:12</small>"
	str += "</div>"
	str += "<p>Good job!</p>"
	str += "<div class='text-right'>"
	str += "<button class='btn btn-default btn-xs replyUpdateBtn'>수정</button>"
	str += "<button class='btn btn-default btn-xs replyDeleteBtn'>삭제</button>"
	str += "</div>"
	str += "</div>"
	str += "</li>"
	str += "</ul>"
	str += "</div>"
	// 댓글 panel-body 끝 , 
	// 댓글 panel 시작
	str += "<div class='panel-footer'>"
	str += "<ul class='pagination' id='reply_nav'>"
	str += "<li><a href=''>1</a></li>"
	str += "<li class='active'><a href=''>2</a></li>"
	str += "</ul>"
	str += "</div>"
	str += "</div>"
	str += "</div>"
	str += "</div>"
	str += "</div>"
	
	// Modal - 리스트 맛집 정보 삭제 시 사용되는 모달 창 
	str += "<div id='myModal' class='modal fade' role='dialog'>"
	str += "<div class='modal-dialog'>"
	str += "<div class='modal-content'>"
	str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
	str += "<h4 class='modal-title'>맛집 정보 삭제 알림창</h4>"
	str += "</div>"
	str += "<div class='modal-body'>"
	str += "<form action='delete.do' method='post' id='modal_form'>"
	str += "<input name='shopNo' readonly='readonly' value=" + data.shopNo + ">"
	str += "<input type='hidden' name='perPageNum' value=" + pageObject.perPageNum + ">"
	str += "</form>"
	str += "</div>"
	str += "<div class='modal-footer'>"
	str += "<button type='button' class='btn btn-default' id='modal_deleteBtn'>삭제</button>"
	str += "<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>"
	str += "</div>"
	str += "</div>"
	str += "</div>"
	str += "</div>"
	//<!-- Modal - 댓글 쓰기/ 수정 시 사용되는 모달창 -->
	
	str += "<div id='replyModal' class='modal fade' role='dialog'>"
	str += "<div class='modal-dialog'>"
	str += "<div class='modal-content'>"
	str += "<div class='modal-header'>"
	str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
	str += "<h4 class='modal-title'>"
	str += "<i class='fa fa-comments fa-fw'></i> <span id='replyModalTitle'>Reply Modal</span>"
	str += "</h4>"
	str += "</div>"
	str += "<div class='modal-body'>"
	
	str += "<form>"
	str += "<div class='form-group' id='replyNoDiv'>"
	str += "<label for='replyNo'>댓글 번호:</label>"
	str += "<input name='replyNo' type='text' class='form-control' id='replyNo' readonly='readonly' >"
	str += "</div>"
	str += "<div class='form-group' id='replyshopNoDiv'>"
	str += "<label for='replyshopNo'>맛집 등록 번호:</label>"
	str += "<input name='shopNo' type='text' class='form-control' id='replyshopNo' readonly='readonly' value=" +data.shopNo + ">"
	str += "</div>"
	str += "<div class='form-group' id='replyshopNameDiv'>"
	str += "<label for='replyshopName'>맛집 이름:</label>"
	str += "<input name='shopName' type='text' class='form-control' id='replyshopName' readonly='readonly' value=" + data.shopName + ">"
	str += "</div>"
	str += "<div class='form-group' id='replyContentDiv'>"
	str += "<label for='replyContent'>내용:</label>"
	str += "<textarea name='content' class='form-control' rows='5' id='replyContent' required='required'></textarea>"
	str += "</div>"
	str += "<div class='form-group' id='replyWriterDiv'>"
	str += "<label for='replyWriter'>아이디:</label>"
	str += "<input name='writer' type='text' class='form-control' id='replyWriter' required='required' value=" + login.id + ">"
	str += "</div>"
	str += "</form>"
	str += "</div>"
	str += "<div class='modal-footer'>"
	str += "<button type='button' class='btn btn-default' id='replyModalWriteBtn'>등록</button>"
	str += "<button type='button' class='btn btn-default' id='replyModalUpdateBtn'>수정</button>"
	str += "<button type='button' class='btn btn-default' id='replyModalDeleteBtn'>삭제</button>"
	str += "<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>"
	str += "</div>"
	str += "</div>"
	str += "</div>"
	str += "</div>"
	str += "</body>"
	str += "</html>"
	
	
