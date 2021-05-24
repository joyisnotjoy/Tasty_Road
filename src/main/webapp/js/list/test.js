

$(document).ready(function(){
	var listService = (
		function(){
			function view(parm,callback,error){
				
				var shopNo = param.shopNo
				
				var page = param.rePage || 1;
				
				var perPageNum = param.repPerPageNum || 10;
				
				var key = param.key || ""
				
				var word = param.word || ""
				
				$.getJSON(
				// ajax로 호출하는 url
				"/tlist/tlist.do?shopNo=" + shopNo + "&page=" + page + "&perPageNum=" + perPageNum + "&key=" + key + "&word=" + word,
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
//	) // listService 끝 ★★★★ (); 이거 붙이는지 마는지
	)();

	var shopNo = $(this).find(".shopNo").text();
	function showView(){
		
		listService.view({shopNo:shopNo}, function(data){
			
			alert(data);
			alert(JSON.stringify(data));
			var list = data.list;
			alert(list);
			
			
			//	var str =JSON.parse(data);
			var str ="";
			if(!list || list.length == 0){
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
				
			} // else의 끝
			
		}); // listService.view 의 끝
		
		$("showView").append(str);
		
	}; // function showView 끝 , ★★★★ ; 붙이는거
	
	showView();
	
	
}); // $(documnet).ready(function() 첫줄의 끝