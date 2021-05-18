<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리스트</title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function(){
	
	// 처리 후 나타나는 메시지 : 글쓰기나 글삭제 처리된 후 리스트로 돌아 오면 보여준다.
	// - sitemesh - default_decorator.jsp에서 해결
	
	// 맛집 글보기 페이지로 이동 함수
	$(".dataRow").click(function(){
		var shopNo = $(this).find(".shopNo").text();
		// 페이지 정보 붙이기
		var query = ${(empty pageObject)?"''":"'&page=" += pageObject.page
				+= "&perPageNum=" += pageObject.perPageNum += "'"};
		// 검색 정보 붙이기
		query += ${(empty pageObject.word)?"''":"'&key=" += pageObject.key
				+= "&word=" += pageObject.word += "'"};
// 		location = "view.do?no=" + no + "&inc=1" + query;
		location = "view.do?shopNo=" + shopNo + query;
	});
});
</script>

</head>
<body>
<div class="container">
	<!-- 제목 -->
	<h1 class="row">
		맵 리스트
	</h1>
	
	<!-- 검색 -->
	<form>
		<input name="page" value="1" type="hidden" />
		<input name="perPageNum" value="${pageObject.perPageNum }" type="hidden" />
	  <div class="input-group">
	  	<span class="input-group-addon">
	  		<select name="key">
	  			<option value="n" ${(pageObject.key == "n")?"selected":"" }>가게명</option>
	  			<option value="c" ${(pageObject.key == "c")?"selected":"" }>내용</option>
	  			<option value="r" ${(pageObject.key == "r")?"selected":"" }>댓글</option>
	  			<option value="nc" ${(pageObject.key == "nc")?"selected":"" }>가게명/내용</option>
	  			<option value="nr" ${(pageObject.key == "nr")?"selected":"" }>가게명/댓글</option>
	  			<option value="cr" ${(pageObject.key == "cr")?"selected":"" }>내용/댓글</option>
	  			<option value="ncr" ${(pageObject.key == "ncr")?"selected":"" }>모두</option>
	  		</select>
	  	</span>
	    <input type="text" class="form-control" placeholder="Search"
	    name="word" value="${pageObject.word }">
	    <div class="input-group-btn">
	      <button class="btn btn-default" type="submit">
	        <i class="glyphicon glyphicon-search"></i>
	      </button>
	    </div>
	  </div>
	</form>
	
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
			  	가게명: ${vo.shopName } / 
			  	 ${vo.content }
		  	</div> 
		  	주소: ${vo.address } <br>
		  	전화번호: ${vo.tel } <br>
		  	<span class="shopNo">${vo.shopNo }</span>
<%-- 		  	(<fmt:formatDate value="${vo.writeDate }"/>) --%>
<%-- 		  	<span class="badge">${vo.cnt }</span> --%>
		  </li>
	  	</c:forEach>
	</c:if>
	</ul>
	
	<!-- a tag, js : location,  주소입력 : get방식으로 넘어 간다. post방식 꼭 지정을 해야한다. -->
	<a href = "write.do?perPageNum=${pageObject.perPageNum }"></a>
	 
	<!-- 이동되는 페이지 표시 - 페이지네이션 -->
	<div>
		<pageObject:pageNav listURI="list.do" pageObject="${pageObject }" 
		query="&key=${pageObject.key }&word=${pageObject.word }"/>
	</div>
</div>
</body>
</html>