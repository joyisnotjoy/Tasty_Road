//like()

var bookmarkService = (
	function() {

		function likeView(param, callback, error) {

			var shopNo = $("#viewShopNo").text();
			var id = $("#checkId").text();
			$.getJSON(

				"/bm/like.do?shopNo=" + shopNo,
				function(data) {
					if (callback) {
						callback(data);
					}
				}
			) // end of Json
				// error (실패) 상태일 때의 처리함수
				.fail(
					function(xhr, satus, err) {
						if (error) {
							error();
						} else {
							// 오류 출력
							alert(err);
						}
					}
				); // $.getJSON().fail()의 끝

		}//end of likeView func()


		function bookmark(liked, callback, error) {

			console.log("bookmark data - " + JSON.stringify(liked));
			//ajax 이용해서 데이터를 서버에 보낸다.
			$.ajax({
				//전송방법의 타입
				type: "POST",
				// 요청 URL
				url: "/bm/like.do",
				// 전송되는 데이터
				data: JSON.stringify(liked),
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
		return {
			bookmark: bookmark,
			likeView: likeView

		}
	}
)();

//즐겨찾기 완료 alert 창	
//tempView buttons
//즐겨찾기 해제 alert 창	
let liked = false;
$(function() {

	var id = $(".login").text();

	alert(id);

	$(".like").click(function() {

		//		if (liked) {
		//			alert("즐겨찾기 해제 완료");
		//			liked = false;
		//			$(this).html('like');
		//		} else {
		//			alert("즐겨찾기 완료");
		//			liked = true;
		//			$(this).html('unlike');
		//		}
		// 북마크 모달창 수정 버튼 이벤트 - 수정 처리 -----------------------------------------
		var login = $(".login").text();

	});

	var shopNo = $("#viewShopNo").text(); 

	$(".like").click(function() { 	// document 로딩이 다 끝난 후 현재 Table에 대한 button click Event 처리
		var liked = {};

		var shopNo = $("#viewShopNo").text();

		// 		reply.replyNo = $("#replyNo").val();
		liked.shopNo = shopNo;
		liked.id = $(".login").text();
		alert(liked.id);

		bookmarkService.bookmark(liked, function(result, status) {

			if (status == "notmodified") {

				alert("수정에 실패하였습니다, 같은 증상이 반복되면 고객센터에 문의해 주세요");

			} else {

				alert("수정되었습니다.");
			}

		});

	

		$(this).html('unlike');

		

	});	// end of click

	function checkLike() {

			bookmarkService.bookmark({ shopNo: shopNo, id : id }, function(data) {

				alert(data);

				alert(JSON.stringify(data));

				alert(bookmark);

				$(".liked").click(function() {
					if (login.id != null) {
						cnt = -1
					}
					else {
						(login.id == null)
						cnt = 1
					}
				});
			})
		}
checkLike();

});