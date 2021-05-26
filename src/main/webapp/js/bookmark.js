//like()

var bookmarkService = (
	function() {

		function likeView(param, callback, error) {

			var shopNo = $("#viewShopNo").text();
			var id = $(".login").text();
			$.getJSON(

				"/bm/view.do?shopNo=" + shopNo + "&id=" + id,
				function(data) {
					alert(data);
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
							alert(JSON.stringify(xhr));
							// 데이터가 없어서 나오는 오류
							if(xhr.status == 200){
								alert("데이터 없음");
								$("#like").removeClass();
								$("#like").addClass("like");
								$("#like").text("like");
							}
							else
								// 오류 출력
								alert("error : " + err);
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
				url: "/bookmark/like.do",
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
		
		
		// 좋아요 취소 처리 함수
		function deleteBookmark(liked, callback, error) {

			console.log("bookmark data - " + JSON.stringify(liked));
			//ajax 이용해서 데이터를 서버에 보낸다.
			$.ajax({
				//전송방법의 타입
				type: "post",
				// 요청 URL
				url: "/bookmark/unlike.do",
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
			likeView: likeView,
			deleteBookmark: deleteBookmark
		}
	}
)();

//즐겨찾기 완료 alert 창	
//tempView buttons
//즐겨찾기 해제 alert 창	
let liked = false;
$(function() {

	var id = $(".login").text();
	var shopNo = $("#viewShopNo").text();

//	alert(id);

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

	function checkLike() {

		bookmarkService.likeView({ shopNo: shopNo, id: id }, function(data) {

			//			alert(data);

			//			alert(JSON.stringify(data));

			if (data != null) {
				$(".like").attr("class", "liked");
			} else {
				alert("cancel bookmark");
			}
		})
	}
	
	
	// 시작과 함께 불러오기
	checkLike();
	
	
	// 즐겨 찾기 취소 이벤트 ================================================
	$(document).on("click", ".liked", function() {
		alert("즐겨찾기 취소");
		alert(JSON.stringify(like));
//		
//		bookmarkService.deleteBookmark(like, function(result, status){
//			alert("result=" + result + ",status =" + status);
//			
//			if (status == "notmodified") {
//				alert("즐겨찾기 취소 실패. 다시 시도해주세요.");
//			}else {
//				alert("취소했습니다.");
//				// 버튼의 정보 바꾸기
//				$("#like").removeClass();
//				$("#like").addClass("unliked");
//				$("#like").text("like");
//			}
	});

	
	// 즐겨 찾기 이벤트 ================================================
	$(document).on("click", ".like", function() { 	// document 로딩이 다 끝난 후 현재 Table에 대한 button click Event 처리
		alert("bookmark alert");
		var liked = {};

		// 		reply.replyNo = $("#replyNo").val();
		liked.shopNo = shopNo;
		liked.id = id;
		alert(JSON.stringify(liked));

		bookmarkService.bookmark(liked, function(result, status) {
			
			alert("result=" + result + ", status=" + status);

			if (status == "notmodified") {

				alert("failed");

			} else {

				alert("edited.");
				// 버튼의 정보 바꾸기
				$("#like").removeClass();
				$("#like").addClass("liked");
				$("#like").text("unlike");
				
			}

		});



	});	// end of click
});
//});
