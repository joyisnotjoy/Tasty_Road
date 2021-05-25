<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원 추가</title>

<link href="/resources/css/new_main.css" rel="stylesheet" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script type="text/javascript">

//허용되는 이미지 파일 형식들
var imageExt = ["JPG", "JPEG", "GIF", "PNG"];

	// 다음 주소 api를 위한 코드
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[id=addr1]").val(data.zonecode);
				$("[id=addr2]").val(fullRoadAddr);

			}
		}).open();
	}
	
	$(function(){
		// 전달할 때의 데이터 찍기
		$("#shopReg").submit(function(){
			// alert("submit()");
			// alert($("#title").val());
			// alert($("#content").val());
			// C:\fakepath\flower01.jpg
			// alert($("#imageFile").val());
			// 첨부파일이 이미지 파일인지 알아내는 프로그램 작성 -> 확장자 : 파일명의 마지막 "." 이후의 글자
			var fileName = $("#imageFile").val();
			// substring(시작[, 끝]) - 부분 문자열 잘라내기
			// lastIndexOf(찾는 문자열) - 뒤에서 부터 찾는 문자열의 위치. 찾는 문자열이 없으면 -1이 된다.
			// toUpperCase() -> 모든 영문자를 대문자로 만들어 준다. <--> toLowerCase()
			var ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
			// alert(ext);
			
			// 이미지 확장자인지 확인하는 반복문
			var checkExt = false; // 지원하지 않는 확장자를 기본으로 셋팅
			for(i = 0; i < imageExt.length; i++){
				if(ext == imageExt[i]){
					checkExt = true; // 지원하는 확장자로 바꾼다.
					break;
				}
			}
			// 지원하지 않는 이미지 파일 선택경의 처리
			if(!checkExt){
				alert("지원하지 않는 이미지 파일입니다.");
				$("#imageFile").focus();
				return false;
			}
			
			// submit을 취소
			// return false;
		});
		
		
		// 취소 버튼을 클릭하면 이전 페이지로 이동
		$("#cancelBtn").click(function(){
			history.back();
		});
	

</script>


</head>
<body>

	<!-- header -->
<!-- 	<div id="header"> -->
<!-- 		<a href="https://nid.naver.com/user2/V2Join.nhn?m=agree#agreeBottom" -->
<!-- 			target="_blank" title="네이버 회원가입 페이지 보러가기"><img -->
<!-- 			src="/resources/image/NAVER_CI_Green.png" id="logo"></a> -->
<!-- 	</div> -->
		<!-- wrapper -->
		<div id="wrapper">

			<!-- content-->
			<div id="content">

	<form action="shopReg.do" id="shopReg" method="post" enctype="multipart/form-data">


				<div>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id" style="background:#eee;"> <input type="text" id="id"
						name="id" class="int" maxlength="20" pattern = "[A-za-z0-9]{5,20}" value="${vo.id }" readonly style="background:#eee;">
					</span> 
				</div>

				<div>
					<h3 class="join_title">
						<label for="name">가게명</label>
					</h3>
					<span class="box int_name"> <input type="text" id="name"
						name="shopName" class="int" maxlength="20" required="required">
					</span> 
				</div>
				
				<div>
					<h3 class="join_title">
						<label for="phoneNo">사업자등록번호</label>
					</h3>
					<span class="box int_mobile"> <input type="text" id="tel" name="shopNo"
						class="int" maxlength="16" placeholder="- 없이 숫자만 입력해주세요." required="required">
					</span> 
				</div>
				
				<div>
					<h3 class="join_title">
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile"> <input type="text" id="tel" name="tel"
						class="int" maxlength="16" placeholder="- 없이 숫자만 입력해주세요." pattern="([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})" required="required">
					</span> 
				</div>

				<div>
					<label for="address">주소</label><br>
					<span class="post int_mobile"> <input
						class="int" style="width: 40%; display: inline; background:#eee;"
						placeholder="우편번호" name="zonecode" id="addr1" type="text"
						readonly="readonly" > 
					<button type="button" class="btn btn-default"
						onclick="execPostCode();" style="padding: 14px 12px; margin-left: 170px; margin-top: -52px; border-radius: 1px;">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
					</span>
				</div>
				<div>
					<span class="postbox int_mobile"><input class="int" placeholder="도로명 주소"
						name="address" id="addr2" type="text" readonly="readonly"  style="background:#eee;" /> </span>
				</div>
				<div>
					<span class="postboxtext int_mobile"> <input class="int" placeholder="상세주소" name="address"
						id="addr3" type="text" /> </span>
				</div>
				
				
				<div class="form-group">
					<label for="content">내용</label>
					<textarea name="content" id="content" class="form-control" rows="5" ></textarea>
				</div>
				
				<div class="form-group">
					<label for="imageFile">대표 이미지 (JPG, JPEG, GIF, PNG - 이미지 지원)</label>
					<input name="multipartFile" id="imageFile" type="file" class="form-control" />
				</div>


				<div class="btn_area">
					<button id="btnJoin">
						<span>등록하기</span>
					</button>
				</div>
	</form>

			</div>
			<!-- content-->

		</div>
		<!-- wrapper -->
</body>
</html>