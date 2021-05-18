/**
 * 
 */
 $(document).ready(function() {
   
   var waitService = (
	
	   function(){
	      // list
	      // param : JSON {no:2, repPage:1, repPerPageNum:5}
	      // list(JSON-넘겨줄데이터, 데이터를 성공적으로 가져왔을때의 실행함수, 실패했을때의 실행함수)
	      function waitView(param, callback, error){
	         
	         var shopNo = $("#viewShopNo").text();
	         
	         $.getJSON(
	            // ajax로 호출하는 url
	            "/waiting/wait.do?shopNo=" + shopNo,
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
	      
	      // update() : ----------------------------------------------------
	      // update(JSON data, 성공함수, 실패함수)
	      function update(reply, callback, error){
	         console.log("reply update() ----------------------------");
	         // ajax를 이용해서 데이터 넘기기
	         $.ajax({
	            type:"patch",
	            url : "/replies/update.do",
	            data : JSON.stringify(reply),
	            contentType : "application/json; charset=utf-8",
	            success : function(result, status, xhr){
	               if(callback) callback(result, status);
	               else alert("수정 성공 - 새로 고침하세요.ㄴㄴㄴ");
	            },
	            error : function(xhr, status, err){
	               if(error) error(err, status);
	               else alert(err);
	            }
	         });
	      }
	      
	      return{
	         // replyService.list(param,callback, error)
	         wait : waitView,
	         update : update
	         
	      }
	   }
   
)();
   
   var shopNo = $("#viewShopNo").text();
   
   // alert(shopNo);
   
   function showWait() {
      
      waitService.wait({shopNo : shopNo}, function(data) {
         
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
            str += "<label for='total'>전체 Table</label>";
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
//	<ul class="list-group">	// map.jsp
//
//	if(!data || data.length == 0) {
//		  <li class="list-group-item">
//		  	데이터가 존재하지 않습니다.
//		  </li>
//	}
//	
//	else{
//		
//		for(var i = 0; list.length; i++) {
//			
//			<li class="list-group-item dataRow">
//			  	<div>
//				  	가게명: ${vo.shopName } / 
//				  	 ${vo.content }
//			  	</div> 
//			  	주소: ${vo.address } <br>
//			  	전화번호: ${vo.tel } <br>
//			  	<span class="shopNo">${vo.shopNo }</span>
//	<%-- 		  	(<fmt:formatDate value="${vo.writeDate }"/>) --%>
//	<%-- 		  	<span class="badge">${vo.cnt }</span> --%>
//			  </li>
//			
//		}
//			  
//		
//	}		
//
//$("#shopList").html(str);
