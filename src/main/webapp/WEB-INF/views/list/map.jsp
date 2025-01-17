<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html>
<html class="index">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=1024" />
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/202105061405381/app_A.css">
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/202105061405381/app_B.css">
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/202105061405381/app_C.css">
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/202105061405381/app_D.css">
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/202105061405381/canvas_roadview.css">

<link rel="stylesheet"
	href="https://t1.daumcdn.net/kakaomapweb/subway/linemap/canvas/prod/css/subway.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="icon" type="image/x-icon" href="/favicon.ico" />
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/reply.js"></script>
<script type="text/javascript" src="/js/list/reply.js"></script>
<script type="text/javascript" src="/js/list/list.js"></script>
<script type="text/javascript" src="/js/waiting.js"></script>
<script type="text/javascript">

$(function(){
	// 처리 후 나타나는 메시지 : 글쓰기나 글삭제 처리된 후 리스트로 돌아 오면 보여준다.
	// - sitemesh - default_decorator.jsp에서 해결
	
	// 게시판 글보기 페이지로 이동 함수
	$(".dataRow").click(function(){
		var li = $(this).closest("li");
		var shopNo = li.find("span").text();
		// 페이지 정보 붙이기
		var query = ${(empty pageObject)?"''":"'&page=" += pageObject.page
				+= "&perPageNum=" += pageObject.perPageNum += "'"};
		// 검색 정보 붙이기
		query += ${(empty pageObject.word)?"''":"'&key=" += pageObject.key
				+= "&word=" += pageObject.word += "'"};
		location = "view.do?shopNo=" + shopNo + query;
	});
});
</script>
<title>될 지도 안될 지도</title>
</head>
<body class="MAP">

	<div class="IE6MIN">
		<div id="header" class="Header" role="banner">
			<h1 class="Title"></h1>
			<form>
		<input name="page" value="1" type="hidden" />
		<input name="perPageNum" value="${pageObject.perPageNum }" type="hidden" />
	  <div class="input-group">
	  	<span class="input-group-addon">
	  		<select name="key">
	  			<option value="n" ${(pageObject.key == "n")?"selected":"" }>가게명</option>
	  			<option value="c" ${(pageObject.key == "c")?"selected":"" }>내용</option>
	  			<option value="a" ${(pageObject.key == "a")?"selected":"" }>주소</option>
	  			<option value="nc" ${(pageObject.key == "nc")?"selected":"" }>가게명/내용</option>
	  			<option value="na" ${(pageObject.key == "na")?"selected":"" }>가게명/주소</option>
	  			<option value="ca" ${(pageObject.key == "ca")?"selected":"" }>내용/주소</option>
	  			<option value="nca" ${(pageObject.key == "nca")?"selected":"" }>모두</option>
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
		</div>
	</div>

	<!--  3줄 메뉴 표시 -->
	<div class="dimmed_snb">
		<div class="snb_map" role="navigation">
			<h2 class="img_snb tit_snb">
				될 지도 안될 지도 <span class="screen_out">더보기 메뉴</span>
			</h2>
			<a data-log="notice" href="http://kakaomap.tistory.com"
				target="_blank" class="link_snb link_notice"><span
				class="img_snb"></span>공지사항</a> <a data-log="event"
				href="http://kakaomap.tistory.com/category/알립니다/이벤트" target="_blank"
				class="link_snb link_event"><span class="img_snb"></span>이벤트</a>

			<div class="wrap_get HIDDEN" id="migrationMenus">
				<ul class="list_get">
					<li id="unmigrationMenu" class="HIDDEN"><a href="/user/signup"
						target="_blank" class="link_getdaum">다음지도 즐겨찾기 가져오기</a></li>
					<li id="placeMigrationMenu" class="HIDDEN"><a
						href="/p/place/migration" target="_blank" class="link_getplace">카카오플레이스
							데이터 가져오기</a></li>
				</ul>
			</div>
			<ul class="list_service" id="mapMenus">
				<li><a class="xc item_service" href="#none"
					data-channel="SIDEBAR_NEWPLACE">신규장소 등록</a></li>
				<li><a class="xb" href="#none" data-channel="SIDEBAR_MODIFYMAP">지도정보
						수정</a></li>
				<li><a data-log="cs"
					href="https://cs.kakao.com/helps?locale=ko&service=101"
					target="_blank">고객센터</a></li>
				<li class="options"><a href="#none" target="_blank">설정<span
						class="img_snb ico_arr">열기/닫기</span></a>
					<ul class="list_option">
						<li><a href="http://www.kakao.com/ko/terms" target="_blank">서비스
								이용약관</a></li>
						<li><a href="http://www.kakao.com/ko/location"
							target="_blank">위치기반 서비스 이용약관</a></li>
						<li><a href="http://www.kakao.com/ko/privacy" target="_blank">개인정보
								처리방침</a></li>
						<li><a href="http://kakaomap.tistory.com/68" target="_blank">법적공지
								및 정보 제공처</a></li>
						<li><a href="http://www.kakao.com/ko/operation"
							target="_blank">운영정책</a></li>
						<li><a class="xd" data-log="setting|unregister" href="#none"
							target="_blank">서비스 탈퇴</a></li>
					</ul></li>
			</ul>
			<ul class="list_info">
				<li><a data-log="openapi" href="https://apis.map.kakao.com"
					target="_blank">지도 오픈 API</a></li>
				<li><a data-log="searchregister"
					href="https://register.search.daum.net/index.daum" target="_blank">지도
						검색등록</a></li>
				<li><a data-log="localbiz"
					href="http://local.biz.daum.net/rainbow_core/ols/index.local"
					target="_blank">광고신청</a></li>
			</ul>
			<button type="button" class="img_snb btn_close">더보기 메뉴 닫기</button>
		</div>
	</div>
	<!--  3줄 더보기 버튼 띁 -->

	<!-- List 들어갈 곳 -->
	<div id="info" class="Info">
		<div id="info.header" class="header">
			<div id="info.header.main" class="main">
				<div role="navigation">
					<h2 class="screen_out">검색 메뉴</h2>
					<ul class="menu">
						<li id="search.tab1" class="keyword keyword-ACTIVE"><a
							href="/list/map.do" class="mainmenutab" title="검색">List</a></li>
						<li id="search.tab2" class="carRoute carRoute-INACTIVE"><a
							href="/chat/list.do" class="mainmenutab" title="길찾기">Talk</a></li>
						<li id="search.tab2" class="carRoute carRoute-INACTIVE"><a href="/room">오픈 채팅</a></li>
						<c:if test="${empty login }">
							<li id="search.tab5"
								class="favorite favorite-INACTIVE emptyLogin"><a
								href="/member/loginForm.do" class="mainmenutab" title="즐겨찾기">로그인</a></li>
						</c:if>
						<c:if test="${!empty login }">
							<li id="search.tab5" class="favorite favorite-INACTIVE login"><a
								href="#" class="mainmenutab" title="즐겨찾기">${login.id }</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div id="info.body" class="body">

			<div id="info.search" class="keywordSearch ">

				<div id="List" class="section places" style="overflow: scroll; width: 600px; height: 800px;">
					<div class="sectiontitle">
						<h5 class="placetit">장소</h5>
						<span class="cntwrap"><em id="info.search.place.cnt"
							class="cnt"></em></span>
						<ol id="info.search.place.sort" class="Sort"></ol>
					</div>
					<ul id="shopList" class="placelist">
						<c:if test="${empty list }">
<!-- 							데이터 없는 경우의 표시 -->
<!-- 							데이터가 존재하지 않는 경우 -->
							<li class="list-group-item">데이터가 존재하지 않습니다.</li>
						</c:if>

						<c:if test="${!empty list }">
<!-- 							데이터가 있는 경우의 표시 -->
							<c:forEach items="${list }" var="vo">
								<li class="list-group-item dataRow">
									<div>가게명: ${vo.shopName } / ${vo.content }</div> 주소:
									${vo.address } <br> 전화번호: ${vo.tel } <br> <span
									class="shopNo" id="shopNo">${vo.shopNo }</span> 		  	
<%-- 									(<fmt:formatDate value="${vo.writeDate }"/>) --%>
<%-- 											  	<span class="badge">${vo.cnt }</span> --%>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- list 들어갈 곳 끝 -->

	<!-- 지도에 들어가는 부분 -->
	<div id="view" class="View">
		<div id="map" style="width: 100%; height: 100%;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6e016ddb84caddc8c080816b4d9e06d"></script>
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(37.739297, 127.044853), // 지도의 중심좌표
				level : 4
			// 기본 확대 레벨
			};

			var map = new kakao.maps.Map(container, options); // 지도 생성

			// 마커를 표시할 위치입니다 
			var position = new kakao.maps.LatLng(37.739297, 127.044853);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : position,
				clickable : true
			// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
			});

			// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
			// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
			// marker.setClickable(true);

			// 마커를 지도에 표시합니다.
			marker.setMap(map);

			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:10px;">이젠 컴퓨또로링 학원 <br><a href="/sample/EZEN.do" style="color:blue" target="_blank">QR코드 찍기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new kakao.maps.LatLng(37.739297, 127.044853); //인포윈도우 표시 위치입니다

			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
				infowindow.open(map, marker);
			});
		</script>
	</div>
	<!--  지도에 들어가는 부분 끝 -->

</body>
</html>
