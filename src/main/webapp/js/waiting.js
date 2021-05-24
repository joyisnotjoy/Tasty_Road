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
	      function update(nowUpdate, callback, error){
	         console.log("nowUpdate() ----------------------------");
	         // ajax를 이용해서 데이터 넘기기
	         $.ajax({
	            type:"patch",
	            url : "/waiting/nowUpdate.do",
	            data : JSON.stringify(nowUpdate),
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
         
         //alert(data);
         
        // alert(JSON.stringify(data));
         
         var str = "";
         var waitingViewBtn = "";
         var waiting = data.wait;
         var bookmark = data.bookmark;
         
         alert(bookmark);
         
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
            
            waitingViewBtn += "<span styli='disply: inline;'>대기열</span>";
         	waitingViewBtn += "<button type='button' class='btn btn-default' id='failBtn' style='float: right;'>&#43;더보기</button>";
            
         } else {
            
            if(waiting != null && bookmark != null) {
	
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
	            str += "<input name='shopNo' type='hidden' class='form-control ' id='shopNo' readonly='readonly' value='" + waiting.shopNo + "'>";
	            str += "<input name='id' type='hidden' class='form-control ' id='id' readonly='readonly' value='" + waiting.id + "'>";
	            str += "<input name='id' type='hidden' class='form-control ' id='myId' readonly='readonly' value='" + bookmark.id + "'>";
	            str += "<input name='cnt' type='hidden' class='form-control ' id='cnt' readonly='readonly' value='" + bookmark.cnt+ "'>";
	            str += "</div>";
	            str += "<div class='form-group col-12' id='nowTalbeDiv'>";  
	            str += "<label for='now'>사용 중인 Table: </label> <br>";
	            str += "<input name='now' type='text' class='form-control col-md-6' id='now' readonly='readonly' value='" + waiting.now +"' style='width: 6em; display: inline;' >";
	            str += "<button type='button' id='nowPlus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#43;</button>"
	            str += "<button type='button' id='nowMinus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#45;</button>"
	            str += "</div>";
	            str += "<div class='form-group col-12' id='totalTableDiv'>";
	            str += "<label for='total'>전체 Table</label > <br>";
	            str += "<input name='now' type='text' class='form-control col-md-6' id='total' readonly='readonly' value='" + waiting.total +"' style='width: 6em; display: inline;' >";
	            str += "<button type='button' id='totalPlus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#43;</button>"
	            str += "<button type='button' id='totalMinus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#45;</button>"
	            str += "</div>";
	            str += "</form>";
	            str += "</div>";
	            str += "</div>";
	            str += "</div>";
	            str += "</div>";
	          
		        waitingViewBtn += "<span styli='disply: inline;'>대기열</span>";
		        waitingViewBtn += "<button type='button' class='btn btn-default' id='waitingViewBtn' style='float: right;'>&#43;더보기</button>";
	            
	
	
			} else {
				
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
	            str += "<input name='shopNo' type='hidden' class='form-control ' id='shopNo' readonly='readonly' value='" + waiting.shopNo + "'>";
	            str += "<input name='id' type='hidden' class='form-control ' id='id' readonly='readonly' value='" + waiting.id + "'>";
	            str += "</div>";
	            str += "<div class='form-group col-12' id='nowTalbeDiv'>";  
	            str += "<label for='now'>사용 중인 Table: </label> <br>";
	            str += "<input name='now' type='text' class='form-control col-md-6' id='now' readonly='readonly' value='" + waiting.now +"' style='width: 6em; display: inline;' >";
	            str += "<button type='button' id='nowPlus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#43;</button>"
	            str += "<button type='button' id='nowMinus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#45;</button>"
	            str += "</div>";
	            str += "<div class='form-group col-12' id='totalTableDiv'>";
	            str += "<label for='total'>전체 Table</label > <br>";
	            str += "<input name='now' type='text' class='form-control col-md-6' id='total' readonly='readonly' value='" + waiting.total +"' style='width: 6em; display: inline;' >";
	            str += "<button type='button' id='totalPlus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#43;</button>"
	            str += "<button type='button' id='totalMinus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#45;</button>"
	            str += "</div>";
	            str += "</form>";
	            str += "</div>";
	            str += "</div>";
	            str += "</div>";
	            str += "</div>";
	          
	         	waitingViewBtn += "<span styli='disply: inline;'>대기열</span>";
		        waitingViewBtn += "<button type='button' class='btn btn-default' id='waitingViewBtn' style='float: right;'>&#43;더보기</button>";
				
				str += "<div class='modal fade waitingDivModal' id='waitingDivModal' role='dialog'>";
	            str += "<div class='modal-dialog'>";
	            str += "<div class='modal-content'>";
	            str += "<div class='modal-header'>";
	            str += "<h4 class='modal-title'>";
	            str += "<button type='button' class='close pull-left' data-dismiss='modal'>&times;</button>";
	            str += "<i class='fa fa-comments fa-fw'></i>";
	            str += "<span id='replyModalTitle'>대기열</span>";
	            str += "</h4>";
	            str += "</div>";
	            str += "<div class='modal-body col-md-12'>";
	            str += "<form>";
	            str += "<div class='form-group' id='hiddenData'>"; 
	            str += "<input name='shopNo' type='hidden' class='form-control ' id='shopNo' readonly='readonly' value='" + waiting.shopNo + "'>";
	            str += "<input name='id' type='hidden' class='form-control ' id='id' readonly='readonly' value='" + waiting.id + "'>";
	            str += "</div>";
	            str += "<div class='form-group col-12' id='visualDiv'>";  
	            	// DIV 추가 [1 ~ 10]
		            str += "<div class='form-group col-12' id='visualDiv'>";  
		            str += "</div>";
		            // DIV 추가 끝
	            str += "</div>";
	            str += "<div class='form-group col-12' id='totalTableDiv'>";
	            str += "<label for='total'>전체 Table</label > <br>";
	            str += "<input name='now' type='text' class='form-control col-md-6' id='total' readonly='readonly' value='" + waiting.total +"' style='width: 6em; display: inline;' >";
	            str += "<button type='button' id='totalPlus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#43;</button>"
	            str += "<button type='button' id='totalMinus' class='btn btn-default changeBtn col-md-3' style='float: right;' >&#45;</button>"
	            str += "</div>";
	            str += "</form>";
	            str += "</div>";
	            str += "</div>";
	            str += "</div>";
	            str += "</div>";
				
			}	// end of if-else (waiting != null && bookmark != null)
            
           // alert("wating else")
            
         }      // end of if-else
         
         
         // alert(str);
         
         console.log("<c:out value='${login.id}'/>");
         
         var myId = "<c:out value='${login.id}'/>";
         
         alert(myId);
         
         $("#waitingView").html(waitingViewBtn);
         $("article").append(str);
         $("#waitingView").html(myId);
         
        // $(".waitModal").html(str);
         
      });      // end of function(data)
      
   }

	showWait();
   
   $("#more").click(function () {
   
      // alert(shopNo);
      
      // alert("click");
      
      // alert("실행-- wait : " + $("#wait") );
      
      $("#wait").modal();

      
   });
   
	
   
   $(document).on("click", ".changeBtn", function() {		// document 로딩이 다 끝난 후 현재 Table에 대한 button click Event 처리
	
		function modify(data, id) {		// changeBtn click시 now와 total의 데이터 변경 Ajax처리
	
			waitService.update (update, function(result, status) {
						
				if(status == "notmodified") {
					
					alert("수정에 실패하였습니다, 같은 증상이 반복되면 고객센터에 문의해 주세요");
					
				} else {
					
					alert("수정되었습니다.");
					
					form.find(id).val(data);		// id값과 data값 추가를 통해 다양한 상황에서 적용
					
				}
					
			}, function(err, status) {
			
				alert(err);
			
			});
	
		}	// end of function Update(data, id);
	
		// alert("click");
		
		var thisBtn = $(this).attr("id");
		var form = $(this).closest("form");
		var shopNo = form.find("#shopNo").val();
		var id = form.find("#id").val();
		var preNow = parseInt(form.find("#now").val());
		var now= form.find("#now").val();
		var total = form.find("#total").val();
		var preTotal = parseInt(form.find("#total").val());
		
		// alert(shopNo);
		// alert(id);
		// alert(total);
		// alert(now);
		 
		var update = {};
		update.shopNo = shopNo;
		update.id = id;
		
		// alert(nowUpdate);
		
		if(thisBtn == "nowPlus") {		// $(this)가 plus인 경우
			
			if(now == total) {
				
				// alert(preNow);
				// alert(preNow + 1);
				// alert(thisBtn);
			
				alert("전체 자리 수 보다 증가 시킬 수 없습니다.");
				
			} else {
				
				update.now = (preNow + 1);
				
				modify((preNow + 1), "#now");
				
			}
			
			
		} else if(thisBtn == "nowMinus") {		// $(this)가 Minus인 경우
			
			if(now > 0) {
				
				//alert(thisBtn);			
			
				update.now = (preNow - 1);
				
				modify((preNow - 1), "#now");
				
			} else {
				
				alert("0 밑으로는 내릴 수 없습니다.");
				
			}
			
			
		} else if(thisBtn == "totalPlus") {		// $(this)가 plus 이면서 total인 경우
			
			// alert(thisBtn);
			
			// alert(preTotal);
			
			update.total = (preTotal + 1);
			
			modify((preTotal + 1), "#total");
			
		} else if(thisBtn == "totalMinus") {		// $(this)가 minus 이면서 total인 경우
			
			// alert(thisBtn);
			
			update.total = (preTotal - 1);
			
			modify((preTotal - 1), "#total");
			
		}
		
	 
	});
	
	$(document).on("click", "#waitingViewBtn", function() {
		
		alert("click");
		
	});
   
	$(document).on("click", "#failBtn", function() {
	
		alert("대기열을 불러 올 수 업습니다. ");
	
	}) 
   
});