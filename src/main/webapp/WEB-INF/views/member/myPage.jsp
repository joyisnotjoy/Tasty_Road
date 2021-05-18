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

</script>
</head>
<body>
<div class="container">
<h1>내 정보 보기</h1>
<table class="table">
	<tbody>
		<tr>
			<th>아이디</th>
			<td class="id">${vo.id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td class="id">${vo.name }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td class="id"><fmt:formatDate value="${vo.birth }"/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td class="id">${vo.gender }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td class="id">${vo.tel }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td class="id">${vo.email }</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td class="id"><fmt:formatDate value="${vo.regDate }"/></td>
		</tr>
		<tr>
			<th>상태</th>
			<td class="id">${vo.status }</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>등급명</th> -->
<%-- 			<td class="id">${vo.gradeName }</td> --%>
<!-- 		</tr> -->
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<a href="../member/memberUpdateForm.do" class="btn btn-default">내 정보 수정</a>
				<a href="../member/logout.do" class="btn btn-default">로그아웃</a>
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