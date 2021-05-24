//like()
function like(bookmark, callback, error) {

	console.log("bookmark data - " + JSON.stringify(bookmark));
	//ajax 이용해서 데이터를 서버에 보낸다.
	$.ajax({
		//전송방법의 타입
		type: "POST",
		// 요청 URL
		url: "/bm/like.do",
		// 전송되는 데이터
		data: JSON.stringify(bookmark),
		//전송되는 데이터 타입과 엔코딩 방식
		contentType: "application/json; charset=utf-8",
		// 정상적으로 즐겨찾기 등록 성공 했을때의 처리 함수
		success: function(result, status, xhr) {
			if (callback) callback(result, status);
			else alert("즐겨찾기 등록 성공");
		},
		// 처리 도중 오류(실패)가 난 경우 처리하는 함수 속성
		error: function(xhr, status, err) {
			if (error) error(err);
			else alert("즐겨찾기 등록 오류");
		}
	});//$.ajax의 끝 
}
//즐겨찾기 완료 alert 창	
//tempView buttons
//즐겨찾기 해제 alert 창	
let liked = false;
$(function() {
	$(".like").click(function() {

		if (liked) {
			alert("즐겨찾기 해제 완료");
			liked = false;
			$(this).html('like');
		} else {
			alert("즐겨찾기 완료");
			liked = true;
			$(this).html('unlike');
		}
		// 북마크 모달창 수정 버튼 이벤트 - 수정 처리 -----------------------------------------
		var login = $(".login").text();

		$(document).on("click", ".changeBtn", function() { 	// document 로딩이 다 끝난 후 현재 Table에 대한 button click Event 처리
			var liked= {};

			// 		reply.replyNo = $("#replyNo").val();
			liked.shopNo = $("#replyshopNo").val();
			liked.content = $("#replyContent").val();

			if (login != null || login != "") {

			} else {

				like(update, function(result, status) {

					if (status == "notmodified") {

						alert("수정에 실패하였습니다, 같은 증상이 반복되면 고객센터에 문의해 주세요");

					} else {

						alert("수정되었습니다.");
					}

				})
			}
		});		
	});
});