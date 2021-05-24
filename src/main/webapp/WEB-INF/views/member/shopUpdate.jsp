<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 등록</title>


<!-- BootStrap 라이브러리 등록 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script type="text/javascript">
// 허용되는 이미지 파일 형식들
var imageExt = ["JPG", "JPEG", "GIF", "PNG"];

$(function(){
	// 전달할 때의 데이터 찍기
// 	$("#shopUpdate").submit(function(){
// 		// alert("submit()");
// 		// alert($("#title").val());
// 		// alert($("#content").val());
// 		// C:\fakepath\flower01.jpg
// 		// alert($("#imageFile").val());
// 		// 첨부파일이 이미지 파일인지 알아내는 프로그램 작성 -> 확장자 : 파일명의 마지막 "." 이후의 글자
// 		var fileName = $("#imageFile").val();
// 		// substring(시작[, 끝]) - 부분 문자열 잘라내기
// 		// lastIndexOf(찾는 문자열) - 뒤에서 부터 찾는 문자열의 위치. 찾는 문자열이 없으면 -1이 된다.
// 		// toUpperCase() -> 모든 영문자를 대문자로 만들어 준다. <--> toLowerCase()
// 		var ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
// 		// alert(ext);
		
// 		// 이미지 확장자인지 확인하는 반복문
// 		var checkExt = false; // 지원하지 않는 확장자를 기본으로 셋팅
// 		for(i = 0; i < imageExt.length; i++){
// 			if(ext == imageExt[i]){
// 				checkExt = true; // 지원하는 확장자로 바꾼다.
// 				break;
// 			}
// 		}
// 		// 지원하지 않는 이미지 파일 선택경의 처리
// 		if(!checkExt){
// 			alert("지원하지 않는 이미지 파일입니다.");
// 			$("#imageFile").focus();
// 			return false;
// 		}
		
// 		// submit을 취소
// 		// return false;
// 	});
	
	// 이벤트 처리
	// 이미지 바꾸기 모달창의 바꾸기 버튼
	$("#changeBtn").click(function(){
		// alert("change");
		// 파일이 비어 있는지 확인
		var fileName = $("#imageFile").val();
		// alert(fileName);
		// 바꿀 파일란이 비어 있는 경우의 처리
		if(!fileName){
			alert("바꿀 이미지를 반드시 선택하셔야 합니다.");
			$("#imageFile").focus();
			return false;
		}
		// 바꿀 파일란이 비어 있지 않는 경우의 처리 - 지원하는 이미지 확인 처리
		// substring(시작[, 끝]) - 부분 문자열 잘라내기
		// lastIndexOf(찾는 문자열) - 뒤에서 부터 찾는 문자열의 위치. 찾는 문자열이 없으면 -1이 된다.
		// toUpperCase() -> 모든 영문자를 대문자로 만들어 준다. <--> toLowerCase()
		var ext = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
		// alert(ext);
		
		// 이미지 확장자인지 확인하는 반복문 - imageExt가 위에 배열로 선언이 되어져 있어야만 한다. 
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

		// 강제적으로 폼 데이터를 전송한다.
		$("#updateFileForm").submit();
	});
	
	// 취소 버튼을 클릭하면 이전 페이지로 이동
	$("#cancelBtn").click(function(){
		history.back();
	});
	
});
</script>

</head>
<body>
<div class="container">
	<h1>이미지 등록</h1>
	<!-- 파일첨부를 하는 입력에는 반드시 post방식이여야 하고 enctype 을 지정해야만 한다.
	  input tag의 type="file"로 지정한다. -->
	<form action="shopUpdate.do" method="post" enctype="multipart/form-data" id="shopUpdate" >
		<input name="id" id="id" class="form-control" value="${vo.id }" type="hidden">
		
		<div class="form-group">
			<label for="content">내용</label>
			<textarea name="content" id="content" class="form-control" rows="5"
			 >${vo.content }</textarea>
		</div>
		<button class="btn btn-defualt">올리기</button>
		<button type="button" class="btn btn-default"
					 data-toggle="modal" data-target="#myModal">파일바꾸기</button>
		<button type="reset" class="btn btn-defualt">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-defualt">취소</button>
	</form>
</div>



	  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">이미지 바꾸기</h4>
        </div>
        <div class="modal-body">
          <p>바꿀 이미지 파일을 선택하세요.</p>
          <form action="updateFile.do" method="post" enctype="multipart/form-data" 
          id="updateFileForm">
          	<!-- 페이지 정보를 숨겨서 넘긴다. -->
          	<div class="form-group">
          		<label for="id">아이디</label>
          		<input name="id" id="id" class="form-control" value="${vo.id }" 
          		 readonly="readonly"/>
          	</div>
          	<div class="form-group">
          		<label for="deleteFile">원본파일</label>
          		<input name="deleteFile" id="deleteFile" class="form-control"
          		 value="${vo.image }" readonly="readonly"/>
          	</div>
          	<div class="form-group">
          		<label for="imageFile">바꿀 파일 선택</label>
          		<input name="multipartFile" id="imageFile" class="form-control"
          		 type="file" />
          	</div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="changeBtn">바꾸기</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
</body>
</html>