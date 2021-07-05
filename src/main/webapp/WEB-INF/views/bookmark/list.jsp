<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 리스트</title>

<!-- bootstrap 라이브러리 등록 - CDN 방식 : sitemesh에서 decorator.jsp에서 한꺼번에 해결-->
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>

</head>
<body>
<div class="container">
	<!-- 제목 -->
	<h1 class="row">
		즐겨찾기 리스트
	</h1>
	
	<ul class="list-group">
	<c:if test="${empty list }">
	<!-- 데이터 없는 경우의 표시 -->
	  <!-- 데이터가 존재하지 않는 경우 -->
	  <li class="list-group-item">
	  	데이터가 존재하지 않습니다.
	  </li>
	</c:if>
	
	<c:if test="${!empty list }">
		<!-- 데이터가 있는 경우의 표시 -->
		<c:forEach items="${list }" var="vo">
		  <li class="list-group-item dataRow">
		  	<div>
			  	<span class="shopName">${vo.shopName }</span>
		  	</div> 
		  	(<fmt:formatDate value="${vo.writeDate }"/>)
		  </li>
	  	</c:forEach>
	</c:if>
	</ul>
</div>
</body>
</html>