<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 리스트</title>
<style type="text/css">
tr {
	color: #777;
}

.noRead {
	color: #4d0026;
}

.dataRow:hover {
	cursor: pointer;
	background: #eee;
}
</style>

<script type="text/javascript">
	$(function() {

		// 이벤트 처리
		// 메시지 보기로 이동
		$(".dataRow")
				.click(
						function() {
							// alert("data 보기 클릭");
							// $(this) : 자기 자신(이벤트가 일어 난 곳 - 현재는 tr).클래스가 no인 객체를 찾아라.태그안에 있는 글자가져오기
							var no = $(this).find(".no").text();
							location = "view.do?no="
									+ no
									+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
						});
	});
</script>

</head>
<body>
	<div class="container">
		<h1>채팅 리스트</h1>
		<form class="nSearch">
			<input type="hidden" name="page" value="1" /> <input type="hidden"
				name="perPageNum" value="${pageObject.perPageNum }" />
			<div class="input-group">
				<span class="input-group-addon menuSelect"> <select
					name="key">
						<option>Select</option>
						<option value="w" ${(pageObject.key == "w")?"selected":"" }>Member</option>
				</select>
				</span> <input type="text" class="form-control" placeholder="Search"
					name="word" value="${pageObject.word }">
				<div class="input-group-btn">
					<button class="btn btn-default menuSelect" type="submit">
						<i class="glyphicon glyphicon-search "></i>
					</button>
				</div>
			</div>
		</form>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>방이름</th>
				<th>보낸사람</th>
				<th>받는사람</th>
<!-- 				<th>받은날짜</th> -->
			</tr>
			
			<!-- sender = id1, accepter = id2 -->
			<c:set var="id" value="${login.id }" />
			<c:forEach items="${list }" var="vo">
				<c:choose>
					<c:when test="${vo.id2 == login.id}">
<%-- 						<tr class='dataRow ${(empty vo.acceptDate)?"unRead":"" }'> --%>
						<tr class='dataRow'> 
							<td class="no">${vo.chatNo }</td>
							<td>${vo.chatName }</td>
							<td>${vo.id1 }</td>
<%-- 							<td><fmt:formatDate value="${vo.sendDate }" pattern="yyyy-MM-dd hh:mm:ss" /></td> --%>
							<td>${vo.id2 }</td>
<%-- 							<td>${(empty vo.acceptDate)?vo.unRead:vo.sendDate }</td> --%>
						</tr>
					</c:when>

					<c:when test="${vo.id1 == login.id}">
<%-- 						<tr class='dataRow ${(empty vo.acceptDate)?"unRead":"" }'> --%>
						<tr class='dataRow'>
							<td class="no">${vo.chatNo }</td>
							<td>${vo.chatName }</td>
							<td>${vo.id1 }</td>
<%-- 							<td><fmt:formatDate value="${vo.sendDate }" pattern="yyyy-MM-dd hh:mm:ss" /></td> --%>
							<td>${vo.id2 }</td>
<%-- 							<td>${(empty vo.acceptDate)?vo.unRead:vo.sendDate }</td> --%>
						</tr>
					</c:when>
				</c:choose>

			</c:forEach>
			<tr>
				<td colspan="5">
					<pageObject:pageNav listURI="list.do" pageObject="${pageObject }" />
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<a href="writeForm.do?perPageNum=${pageObject.perPageNum }" class="btn btn-default">채팅</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>