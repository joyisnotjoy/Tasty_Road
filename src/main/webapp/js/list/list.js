/**
 * 
 */
 $(document).ready(function() {
   
   
   var listService = (
   function(){
      // list
      // param : JSON {no:2, repPage:1, repPerPageNum:5}
      // list(JSON-넘겨줄데이터, 데이터를 성공적으로 가져왔을때의 실행함수, 실패했을때의 실행함수)
      function list(param, callback, error){
			// param.repPage || 1 -> param.repPage의 값이 없으면 1을 사용
			var page = param.repPage || 1;
			// param.repPerPageNum || 5 -> param.repPerPageNum의 값이 없으면 5을 사용
			var perPageNum = param.repPerPageNum || 10;
			
			// Ajax를 이용한 데이터 가져오기 -> Ajax 해야합니다. 형식에 맞으면 Ajax를 한다.
			// Ajax 함수 : $.getJSON() - $.ajax()를 통해서 JSON 데이터를 받아오게 만든함수
			//            $(selector).load(url[, success]) - 아이디 중복체크 시 사용
			$.getJSON(
				// ajax로 호출하는 url
				"/tlist/tlist.do?page=" + page + "&perPageNum=" + perPageNum,
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
			
		} // list() 의 끝
      
      // view() : 교재 add() -------------------------------------------
	   function view(param, callback, error){
		
			var shopNo = param.shopNo
			// param.repPage || 1 -> param.repPage의 값이 없으면 1을 사용
			var page = param.repPage || 1;
			// param.repPerPageNum || 5 -> param.repPerPageNum의 값이 없으면 5을 사용
			var perPageNum = param.repPerPageNum || 10;
			
			// Ajax를 이용한 데이터 가져오기 -> Ajax 해야합니다. 형식에 맞으면 Ajax를 한다.
			// Ajax 함수 : $.getJSON() - $.ajax()를 통해서 JSON 데이터를 받아오게 만든함수
			//            $(selector).load(url[, success]) - 아이디 중복체크 시 사용
			$.getJSON(
				// ajax로 호출하는 url
				"/list/list.do?shopNo=" + shopNo + "&page=" + page + "&perPageNum=" + perPageNum,
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
         list : list,
         view : view,
//         write : write,
//         update : update
         
      }
   }
   
)();
   
  
   
   // alert(shopNo);
   
	      // list
	      // param : JSON {no:2, repPage:1, repPerPageNum:5}
	      // list(JSON-넘겨줄데이터, 데이터를 성공적으로 가져왔을때의 실행함수, 실패했을때의 실행함수)
//	      function listView(param, callback, error){
//	         
//	        var shopNo = param.shopNo;
//	         
//	         $.getJSON(
//	            // ajax로 호출하는 url
//	            "/list/list.do?page=" + pageObject.page, + "&perPageNum=" + pageObject.perPageNum,
//	            // success(성공) 상태일 때 처리되는 함수
//	            // 데이터 처리가 성공해서 데이터를 가져오면 data로 넣어준다. list이므로 배열이 넘어온다.
//	            function(data){
//	//               alert(data);
//	               // callback : 데이터를 가져오면 처리하는 함수 
//	               // - 가져온 list를 HTML만듦. 지정한 곳에 넣어준다.
//	               
//	               if(callback){
//	                  callback(data);
//	               }
//	            }
//	         )
//	         // error(실패) 상태일 때의 처러함수
//	         .fail(
//	            function(xhr, status, err){
//	               //오류 함수가 있으면 오류 함수 실행
//	               if(error){
//	                  error();
//	               }else{
//	                  // 오류 출력 -{}, [] 구조 OK, <> - JSON데이터가 아니므로 오류
//	                  alert(err);
//	               }
//	            }
//	         ); // $.getJSON().fail()의 끝
//	         
//	      } // list() 의 끝
	      
	      // view() : ----------------------------------------------------
	      // view(JSON data, 성공함수, 실패함수)
//	      function list(shopNo, callback, error){
////	      function view(reply, callback, error){
//	         console.log("list view() ----------------------------");
//	         // ajax를 이용해서 데이터 넘기기
//	         $.ajax({
//	            type:"patch",
//	            url : "/list/view.do",
//	            data : JSON.stringify(shopNo),
//	            contentType : "application/json; charset=utf-8",
//	            success : function(result, status, xhr){
//	               if(callback) callback(result, status);
//	               else alert("맛집 정보 보기 성공");
//	            },
//	            error : function(xhr, status, err){
//	               if(error) error(err, status);
//	               else alert(err);
//	            }
//	         });
//	      }
//	      
//	      return{
//	         // listService.view(param,callback, error)
//	         list : listView,
//	         view : view
//	         
//	      }
//   
//   var shopNo = $("#viewShopNo").text();
//   
   // alert(shopNo);
   
//   alert("aadf");
   	var page = 1;
	var perPageNum = 5;
   function showList() {
      
      listService.list({page:page, perPageNum:perPageNum}, function(data) {
         
          alert(data);
         
          alert(JSON.stringify(data));
          var list = data.list;
          alert(list);
	var str = "";	// list.jsp
	// 검색
	str += "<form>"
	str += "<input name='page' value='1' type='hidden' />"
//	str += "<input name='perPageNum' value='" + pageObject.perPageNum + "' type='hidden' />"
	str += "<div class='input-group'>"
	str += "<span class='input-group-addon'>"
	str += "<select name='key'>"
	str += "<option value='n' ${(pageObject.key == 'n')?'selected':'' }>가게명</option>"
	str += "<option value='c' ${(pageObject.key == 'c')?'selected':'' }>내용</option>"
	str += "<option value='a' ${(pageObject.key == 'a')?'selected':'' }>주소</option>"
	str += "<option value='nc' ${(pageObject.key == 'nc')?'selected':'' }>가게명/내용</option>"
	str += "<option value='na' ${(pageObject.key == 'na')?'selected':'' }>가게명/주소</option>"
	str += "<option value='ca' ${(pageObject.key == 'ca')?'selected':'' }>내용/주소</option>"
	str += "<option value='nca' ${(pageObject.key == 'nca')?'selected':'' }>모두</option>"
	str += "</select>"
	str += "</span>"
	str += "<input type='text' class='form-control' placeholder='Search'  name='word' value='${pageObject.word }'>"
	str += "<div class='input-group-btn'>"
	str += "<button class='btn btn-default' type='submit'>"
	str += "<i class='glyphicon glyphicon-search'></i>"
	str += "</button>"
	str += "</div>"
	str += "</div>"
	str += "</form>"

	if(!list || list.length == 0) {
		str +=  "<li class='list-group-item'> 데이터가 존재하지 않습니다. </li>";
		
	}else{
		
		for(var i = 0; i < list.length; i++) {
			console.log(list[i]);
			str += "<li class='ist-group-item dataRow'>";
			str += "<div>";
			str += "'가게명:'" + list[i].shopName + "/'";
			str += list[i].content;
			str += "</div>" ;
			str += "주소:" + list[i].address + "<br>";
			str += "전화번호:" + list[i].tel + "<br>";
			str += "<span class='shopNo'>" + list[i].shopNo + "</span>";
			str += "</li>";
			
		}
		var pageObject = data.pageObject;
//		var str = ajaxPage(pageObject);
		
		}
         
        // alert(str);
         
		$("#shopList").append(str);
       
      });      // end of function(data)
      
   }
   
//	showList();
	
//



// ---------------------------------------------------- view
 	
	
	
});