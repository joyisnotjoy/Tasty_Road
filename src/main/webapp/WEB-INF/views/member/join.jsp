<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>
	

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		// alert("취소 버튼");
		history.back();
	});
	
	
	// 아이디 중복 체크 메시지 선언
	var id_length_error="아이디는 3자 이상이여야 합니다.";
	// 아이디 중복 체크하는 이벤트
	$("#id").keyup(function(){
		// 결과 디자인 - warning : 잘 안됨. success : 잘됨.
		$("#checkId").removeClass("alert-warning alert-success")
// 		alert("keyup event");
		var id = $("#id").val();
		// 아이디가 입력이 안 되어있거나 길이가 3 미만인 경우 처리
		if(!id || id.length < 3){
			$("#checkId").text(id_length_error).addClass("alert-warning");
			return false;
		}
		// 아이디가 3자 이상인 경우 처리 - 서버에 가서 DB에 정보가 있는지 확인한 후 중복 메시지를 가져와서 div에 넣는다.
		$("#checkId").load("/ajax/checkId.do?id=" + id, 
			function(result){
				// 넣은 글자가 "가능한" 을 포함하고 있으면 CSS를 성공으로 바꾼다.
				if(result.indexOf("가능한") >= 0)
					$("#checkId").addClass("alert-success");
				else
					$("#checkId").addClass("alert-warning");
		});
	});
});

// 다음 주소 api를 위한 코드
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[id=addr1]").val(data.zonecode);
           $("[id=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

</script>


</head>
<body>
<div class="container">
	<h1>일반 회원가입</h1>
	<form action="join.do" id="join" method="post">
		<div class="form-group">
			<label for="id">아이디</label>
			<input name="id" id="id" class="form-control" required="required"
			placeholder="아이디 입력 - 3자 이상" autocomplete="off"  maxlength="20" pattern="[A-Za-z][A-Za-z0-9]{2,19}"
			title="영문자로 시작해서 영문자 숫자를 3~20 크기로 입력하셔야 합니다." />
			<div id="checkId" class="alert alert-warning" >아이디는 3자 이상이여야 합니다.</div>
		</div>
		<div class="form-group">
			<label for="pw">비밀 번호</label>
			<input name="pw" id="pw" class="form-control" required="required"
			 type="password" placeholder="비밀번호 입력 - 4자 이상" maxlength="20"/>
		</div>
		<div class="form-group">
			<label for="pw">비밀 번호 확인</label>
			<input name="pw2" id="pw2" class="form-control" required="required"
			 type="password" placeholder="비밀번호 확인 입력 - 4자 이상" maxlength="20"/>
		</div>
		<div id="checkPw" class="alert alert-warning">비밀번호와 비밀번호 확인은 4자 이상이여야 합니다.</div>
		<div class="form-group">
			<label for="name">이름</label>
			<input name="name" id="name" class="form-control" required="required"
			placeholder="이름 입력 - 2자 이상" maxlength="10"/>
		</div>
		<div class="form-group">
			<h4>성별</h4>
			<label for="gender_man" class="radio-inline">
				<input name="gender" id="gender_man" type="radio" checked="checked" value="남자" /> 남자
			</label>
			<label for="gender_woman" class="radio-inline">
				<input name="gender" id="gender_woman" type="radio" value="여자" />
				여자
			</label>
		</div>
		<div class="form-group">
			<label for="birth">생일</label>
			<input name="birth" id="birth" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="tel">연락처</label>
			<div class="form-inline">
			<input name="tel" id="tel1" class="form-control" size="3" maxlength="3"/>
			 - <input name="tel" id="tel2" class="form-control" size="4" maxlength="4"/>
			 - <input name="tel" id="tel3" class="form-control" size="4" maxlength="4"/>
			</div>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input name="email" id="email" class="form-control" required="required"
			placeholder="email 입력 - id@site" maxlength="50"/>
		</div>
		
		<div class="form-group">          
		<label for="address">주소</label><br>         
		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="zonecode" id="addr1" type="text" readonly="readonly" >
		    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
		</div>
		<div class="form-group">
		    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="address" id="addr2" type="text" readonly="readonly" />
		</div>
		<div class="form-group">
		    <input class="form-control" placeholder="상세주소" name="address" id="addr3" type="text"  />
		</div>
		
		
		<button class="btn btn-default">전송</button>
		<button type="button" class="btn btn-default" id="cancelBtn">취소</button>
	</form>
</div>
</body>
</html>