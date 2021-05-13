/**
 * 
 */
 //like()
 function like(bookmark, callback, error){
	console.log("bookmark like() --------------------------");
	console.log("bookmark data - " + JSON.stringify(bookmark));
	//ajax 이용해서 데이터를 서버에 보낸다.
	$.ajax({
		//전송방법의 타입
		type:"post",
		// 요청 URL
		url: "/bookmark/like.do",
		// 전송되는 데이터
		data : JSON.stringify(bookmark),
		//전송되는 데이터 타입과 엔코딩 방식
		contentType:"application/json; charset=utf-8",
		// 정상적으로 즐겨찾기 등록 성공 했을때의 처리 함수
		success: function(result, status, xhr){
			if(callback) callback(result, status);
			else alert("즐겨찾기 등록 성공");
		},
		// 처리 도중 오류(실패)가 난 경우 처리하는 함수 속성
		error : function(xhr, status, err){
			if(error) error(err);
			else alert("즐겨찾기 등록 오류");
		}
	});//$.ajax의 끝
	}