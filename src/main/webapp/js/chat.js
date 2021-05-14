/**
 * 채팅
 */
//// 브라우저의 console tab에 출력 - alert() 사용하셔도 됨
console.log("chat Module . . . . . . . ");
var chatService = (
	function() {
		function list(param, callback, error) {
			var no = param.no;
			//			var page = param.page || 1;
			//			var perPageNum = param.perPageNum || 10;

			$.getJSON(
				"/chatRoom/list.do?no=" + no,
				function(data) {
					if (callback) {
						callback(data);
					}
				}
			)
				// error(실패) 상태일 때의 처러함수
				.fail(
					function(xhr, status, err) {
						if (error) {
							error();
						} else {
							alert(err);
						}
					}
				);  // $.getJSON().fail()의 끝
		} // list() 의 끝
		// write()
		function write(chatRoom, callback, error) {
			console.log("chatRoom write() -------------------- ");
			$.ajax({
				type: "post",
				url: "/chatRoom/write.do",
				data: JSON.stringify(chatRoom),
//				async:false,
				contentType: "application/json; charset=uyf-8",
				success: function(result, status, xhr) {
					if (callback) callback(result);
					else alert("채팅 전송 성공");
				},
				error: function(xht, status, err) {
					if (error) error(err);
					else alert("전송 실패");
				}
			}); //$.ajax 의 끝

		}

		function update(chat, callback, error) {
			console.log("chat update() -------------------- ");
			//ajax를 이용해서 데이터 넘기기
			$.ajax({
				type: "post",
				url: "/chat/update.do",
				data: JSON.stringify(chat),
				contentType: "application/json; charset=uyf-8",
				success: function(result, status, xhr) {
					if (callback) callback(result);
					else alert("수정 성공");
				},
				error: function(xht, status, err) {
					if (error) error(err);
					else alert("수정 실패");
				}
			}); //$.ajax 의 끝
		}

		return {
			list: list,
			write: write,
			update: update,
			displayTime: displayTime
		}
	}
)();
console.log(chatService);