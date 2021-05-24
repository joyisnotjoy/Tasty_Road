<%@page import="com.tasty.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>

<script type="text/javascript">
$(function(){
	// 허용되는 이미지 파일 형식들
	var imageExt = ["JPG", "JPEG", "GIF", "PNG"];

	
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
});
</script>
</head>
<body>
<div class="container">
<h1>내 정보 보기</h1>
<table class="table">
	<tbody>
		<tr>
			<th>가게명</th>
			<td class="id">${vo.shopName }</td>
		</tr>
		<tr>
			<th>사업자 등록 번호</th>
			<td class="id">${vo.shopNo}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td class="id">${vo.address }</td>
		</tr>
		<tr>
			<th>가게 정보</th>
			<td class="id">${vo.content}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td class="id">${vo.tel}</td>
		</tr>
		<tr>
			<th>가게 소개</th>
			<td class="id">${vo.content}</td>
		</tr>
		<tr>
			<th>대표 이미지</th>
			<td class="id"><img src="${vo.image }" /></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<a href="../member/shopUpdate.do?id=${vo.id }" class="btn btn-default">가게 정보 수정</a>
				<a href="../member/memberWithdrawForm.do" class="btn btn-default">회원 탈퇴</a>
				<c:if test="${login.gradeNo == 9 }">
		<!-- 관리자 메뉴 -->
		<a href="../member/memberList.do" class="btn btn-default">회원리스트</a>
	</c:if>
			</td>
		</tr>
	</tfoot>
</table>
</div>
</body>
</html>