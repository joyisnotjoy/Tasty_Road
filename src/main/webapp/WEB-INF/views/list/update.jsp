<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 수정</title>

<!-- bootstrap 라이브러리 등록 - CDN 방식 : sitemesh에서 decorator.jsp에서 한꺼번에 해결-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	$(".cancelBackBtn").click(function(){
		history.back();
	});
});
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</head>
<body>
<div class="container">
<h1>맛집 수정 폼</h1>
  <form action="update.do" method="post">
  	<input name="page" type="hidden" value="${param.page }" />
  	<input name="perPageNum" type="hidden" value="${param.perPageNum }" />
  	<input name="key" type="hidden" value="${param.key }" />
  	<input name="word" type="hidden" value="${param.word }" />
    <div class="form-group">
      <label for="shopNo">사업자번호:</label>
      <input name="shopNo" type="text" class="form-control" id="shopNo"
      value="${vo.shopNo }" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="shopName">가게명:</label>
      <!-- required : 필수 입력, placeholder : 입력의 초기 안내,
      	   pattern : 정규표현식으로 유효성 검사, title : 패턴이 맞이 않을 때 메시지 -->
      <input name="shopName" type="text" class="form-control" id="shopName"
      pattern=".{1,30}" maxlength="100" required="required" 
      title="1자이상 30자 이하 입력" placeholder="1자이상 30자 이하 입력"
      value="${vo.shopName }">
    </div>
	<div class="form-group">
	  <label for="content">소개:</label>
	  <textarea name="content" class="form-control" rows="5"
	  placeholder="내용은 4자이상 700자 이하 입력" 
	  id="content">${vo.content }</textarea>
	</div>
	<div class="form-group">
	  <label for="address">주소:</label>
	  <input type="text" id="sample6_postcode" placeholder="우편번호" name="address">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" name="address"><br>
		<input type="text" id="sample6_address" placeholder="주소" name="address"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="address">
<%-- 	   <input value="${vo.address }"> --%>
    </div>
	<div class="form-group">
	  <label for="tel">번호:</label>
	   <input name="tel" type="text" class="form-control" id="tel"
      pattern=".{4,100}" maxlength="100" required="required" 
      title="4자이상 100자 이하 입력" placeholder="4자이상 100자 이하 입력"
      value="${vo.tel }">
    </div>
	
<!--     <div class="form-group"> -->
<!--       <label for="writer">작성자:</label> -->
<!--       <input name="writer" type="text" class="form-control" id="writer" -->
<!--       required="required" pattern="[A-Za-z가-힣][0-9A-Za-z가-힣]{1,9}" -->
<!--       placeholder="이름은 2자부터 10자까지" -->
<!--       title="이름은 2자부터 10자까지 첫글자를 숫자가 올 수 없다." -->
<%--       value="${vo.writer }" > --%>
<!--     </div> -->
<!--     <div class="form-group"> -->
<!--       <label for="pw">비밀번호:본인 확인용</label> -->
<!--       <input name="pw" type="password" class="form-control" id="pw"  -->
<!--       pattern="[^가-힣ㄱ-ㅎ]{4,20}" required="required" -->
<!--       title="4-20자. 한글은 입력할 수 없습니다."> -->
<!--     </div> -->
    <button>수정</button>
    <button type="reset">새로입력</button>
    <button type="button" class="cancelBackBtn">취소</button>
  </form>

</div>
</body>
</html>