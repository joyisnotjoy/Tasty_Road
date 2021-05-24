    

 $(document).ready(function() {
	   var listService = (
   		function(){
	  	 function view(param, callback, error){
		
			var shopNo = param.shopNo
			// param.repPage || 1 -> param.repPage의 값이 없으면 1을 사용
			var page = param.repPage || 1;
			// param.repPerPageNum || 5 -> param.repPerPageNum의 값이 없으면 5을 사용
			var perPageNum = param.repPerPageNum || 10;
			
			var key = param.key || ""; 
			
			var word = param.word || "";
			
			// Ajax를 이용한 데이터 가져오기 -> Ajax 해야합니다. 형식에 맞으면 Ajax를 한다.
			// Ajax 함수 : $.getJSON() - $.ajax()를 통해서 JSON 데이터를 받아오게 만든함수
			//            $(selector).load(url[, success]) - 아이디 중복체크 시 사용
			$.getJSON(
				// ajax로 호출하는 url
//				"/tlist/tlist.do?shopNo=" + shopNo ,
				"/tlist/tlist.do?shopNo=" + shopNo + "&page=" + page + "&perPageNum=" + perPageNum + "&key=" + key + "&word=" + word,
				// success(성공) 상태일 때 처리되는 함수
				// 데이터 처리가 성공해서 데이터를 가져오면 data로 넣어준다. list이므로 배열이 넘어온다.
				function(data){
//					alert(data);
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
			
		} // view() 의 끝

      
      return{
         // replyService.list(param,callback, error)
         view : view
//         write : write,
//         update : update
         
      }
   }
   
)();

//	showList();
  var shopNo = $(this).find(".shopNo").text();
//  var page = param.page
//  var perPageNum = param.perPageNum
  function showView() {
      
      listService.view({shopNo:shopNo}, function(data){
         
          alert(data);
         
          alert(JSON.stringify(data));
          var list = data.list;
          alert(list);

	var str =JSON.parse(data);
	var str = "";
	
	if(!list || list.length == 0) {
		str +=  "<li class='list-group-item'> 데이터가 존재하지 않습니다. </li>";
		
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
	str += "</div>";
//	str += "<a href='update.do?shopNo=" + data.shopNo + "&page=" + pageObeject.page + "&perPageNum=" + pageObject.perPageNum + "&key=" + pageObject.key + "&word=" + pageObject.word + "class='btn btn-default'>수정</a>"; 
//	str += "<a class='btn btn-default' onclick='return false;' data-toggle='modal' data-target='#myModal'>삭제</a>";
//	str += "<a href='list.do?page=" + pageObject.page +"&perPageNum=" + pageObject.perPageNum + "&key=" + pageObject.key + "&word=" + pageObject.word + " class='btn btn-default'>리스트</a>";

		}
//		var pageObject = data.pageObject;
//		var str = ajaxPage(pageObject);
		
		});
         
        // alert(str);
	$("#showView").append(str);
         
      }; 
	
	showView(); // 함수 실행시키는 (콜)하는 거
	
     // end of function(data)
// view.jsp 부분


});