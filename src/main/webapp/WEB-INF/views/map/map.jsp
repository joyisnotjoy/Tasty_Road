<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
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

<link rel="icon" type="image/x-icon" href="/favicon.ico" />
<title>카카오맵</title>
</head>
<body class="MAP">

	<div class="IE6MIN">
		<div id="header" class="Header" role="banner">
			<h1 class="Title">
				<a id="local" class="local"
					href="?nil_profile=title&amp;nil_src=local">kakaomap</a>
			</h1>
		</div>
	</div>

	<!--  3줄 메뉴 표시 -->
	<div class="dimmed_snb">
		<div class="snb_map" role="navigation">
			<h2 class="img_snb tit_snb">
				kakaomap <span class="screen_out">더보기 메뉴</span>
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
							href="#" class="mainmenutab" title="검색">검색</a></li>
						<li id="search.tab2" class="carRoute carRoute-INACTIVE"><a
							href="#" class="mainmenutab" title="길찾기">길찾기</a></li>
						<li id="search.tab3" class="transitRoute transitRoute-INACTIVE">
							<a href="#" class="mainmenutab" title="버스">버스</a>
						</li>
						<li id="search.tab4" class="subwayRoute subwayRoute-INACTIVE">
							<a href="#" class="mainmenutab" title="지하철">지하철</a>
						</li>
						<li id="search.tab5" class="favorite favorite-INACTIVE"><a
							href="#" class="mainmenutab" title="즐겨찾기">MY</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="info.body" class="body">
			<div id="info.main" class="Main INFOLEFT">
				<div id="info.main.home" class="home">
					<div id="info.location" class="theme">
						<div class="reportError">
							<h3 class="screen_out">현재위치</h3>
							<span id="info.location.approxAddr" class="approxAddr">&nbsp;</span>
							<div id="info.location.weather" class="infoAir HIDDEN">
								<strong class="screen_out">날씨정보</strong> <span class="txt_air"></span>
								<span class="temper"></span> <span class="txt_change"></span> <span
									class="txt_bar"></span> <span class="txt_dust">미세<span
									data-id="dust_state" class="txt_state"></span></span> <span
									class="txt_dust">초미세<span data-id="micro_dust_state"
									class="txt_state"></span></span>
							</div>
							<a id="info.location.reportError" href="iptargeting/form"
								class="reportbug">오류신고</a>
						</div>
					</div>
					<div id="info.main.famous" class="famous"></div>
					<div id="info.main.around" class="infoAround">
						<h3 class="tit_around">주변 탐색</h3>
						<ul class="list_around"></ul>
					</div>
					<div id="info.main.favorite" class="regfav"></div>
					<div id="info.main.newplace" class="newplace">
						<div class="newPlace">
							<h6 class="tit_newplace">새로운 장소</h6>
							<p class="desc_newplace">
								새로운 수정된 장소를 알고 계세요?<br>장소 제보는 지도 품질 향상에 큰 도움이 됩니다.
							</p>
							<a href="#none" class="xc link_newplace link_suggest"
								data-pos="left" data-channel="SEARCH_MIDDLE_NEWPLACE">신규 장소
								등록</a> <a href="#none" class="xb link_newplace link_modify"
								data-pos="left" data-channel="SEARCH_MIDDLE_MODIFYMAP">지도 정보
								수정</a>
						</div>
					</div>
				</div>

				<div id="info.main.header" class="mainHeader HIDDEN">
					<ul id="info.main.options" class="sub"></ul>
					<a href="#none" id="info.main.header.clear" class="clear"
						title="모두 지우기">모두 지우기</a>
					<div id="info.main.header.activeOption" class="screen_out"></div>
				</div>

				<div id="info.related.keyword" class="relatedKeyword HIDDEN">
					<span class="ico">관련검색어</span>
					<div class="frameKeywords">
						<p class="wrapKeywords"></p>
					</div>
					<div class="more closed HIDDEN">
						<a href="#">더보기</a><span class="ico"></span>
					</div>
					<div class="more opened HIDDEN">
						<a href="#">접기</a><span class="ico"></span>
					</div>
				</div>
				<div id="info.searchHeader" class="searchHeader HIDDEN">
					<div id="info.search.boundsTitle" class="HIDDEN">
						<p class="desc_search">
							현재 지도 내 <em id="info.search.boundsTitle.text"></em> 검색결과
						</p>
					</div>
					<div id="info.search.correction" class="correction HIDDEN">
						<div class="correctionTop">
							<p class="desc_search">
								<em id="info.search.correction.orig"></em>에서 <em
									id="info.search.correction.new"></em>으로 검색한 결과
							</p>
						</div>
						<p class="correctionBottom">
							<a href="#" id="info.search.correction.goorig"
								class="link_search">입력한 '<span
								id="info.search.correction.orig2"></span>'(으)로 재검색 <span
								class="ico_arr"></span></a>
						<p id="info.search.correction.error" class="desc_error HIDDEN"></p>
						</p>
					</div>
					<div id="info.searchHeader.message" class="message HIDDEN"></div>
					<div id="info.searchHeader.banner" class="keywordBanner HIDDEN">
						<a href="#" class="banner"></a>
					</div>
					<div id="info.searchHeader.postCodeMessage"
						class="postCodeMessage HIDDEN">
						<a href="#none" class="link_search">우편번호 검색<span
							class="ico_arr"></span></a>
					</div>
					<div id="info.searchHeader.spellcheck" class="spellcheck HIDDEN">
						<div id="info.searchHeader.spellcheck.titleresult"
							class="desc_search HIDDEN">
							<em id="info.searchHeader.spellcheck.title"></em> 검색결과
						</div>
						<p>
							<a href="#" class="link_search"
								id="info.searchHeader.spellcheck.candidate">'<span
								id="info.searchHeader.spellcheck.text"></span>'(으)로 재검색 <span
								class="ico_arr"></span></a>
						</p>
					</div>
				</div>
				<div id="info.noPlace" class="noPlace HIDDEN">
					<div class="inner_noPlace">
						<h3 class="noKeyword">
							<em id="info.noPlace.keyword" class="txt_keyword"></em> 검색 결과가
							없어요.
						</h3>
						<p class="noResultDesc">
							검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해 보세요.
						</p>
						<a
							href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=%EC%98%A4%ED%8D%84"
							class="noKeywordLink" id="info.noPlace.daum.link" target="_blank">Daum
							검색 결과 보기</a>
						<div id="info.noPlace.register" class="register">
							새로운 수정된 장소를 알고 계세요?<br>장소 제보는 지도 품질 향상에 큰 도움이 됩니다. <a
								id="info.noPlace.register.btn" class="registerBtn" href="#"
								target="_blank">신규 장소 등록</a>
						</div>
					</div>
				</div>
				<div id="info.search.noW3w" class="noPlace noPlace_type2 HIDDEN">
					<div class="inner_noPlace">
						<h3 class="noKeyword">검색 결과가 없어요.</h3>
					</div>
				</div>



				<div id="info.search" class="keywordSearch HIDDEN">



					<div id="info.search.theme" class="section themeSearch HIDDEN">
						<div class="sectiontitle">
							<h5 class="themetit">테마</h5>
							<span class="cntwrap"><em class="cnt"
								id="info.search.theme.cnt"></em></span>
						</div>
						<ul id="info.search.themeList" class="themeList">
						</ul>
					</div>

					<div id="info.search.buses" class="section buses">
						<div class="sectiontitle sectionBus">
							<h5 class="busestit">버스번호</h5>
							<span class="cntwrap"><em id="info.search.buses.cnt"
								class="cnt"></em></span> <span id="info.search.buses.busstop"
								class="busstop HIDDEN"> 버스 정류장<em
								id="info.search.buses.busstop.cnt" class="cnt"></em>
							</span>
							<div id="info.search.buses.regions" class="regionsbox"></div>
						</div>
						<ul id="info.search.buses.list"></ul>
						<a id="info.search.buses.more" class="more" href="#">버스 더보기</a>
					</div>

					<div id="info.search.busstops" class="section busstops">
						<div class="sectiontitle sectionBus">
							<h3 class="busstoptitle">버스 정류장</h3>
							<span class="cntwrap"><em id="info.search.busstops.cnt"
								class="cnt"></em></span>
							<div id="info.search.busstops.regions" class="regionsbox"></div>
						</div>
						<ul id="info.search.busstops.list"></ul>
						<a id="info.search.busstops.more" class="more" href="#">버스 정류장
							더보기<span class="ico_road_arrow"></span>
						</a>
					</div>

					<div id="info.search.address" class="section addresses">


						<div class="sectiontitle">
							<h3 class="addrtitle">주소</h3>
							<span class="cntwrap"><em id="info.search.address.cnt"
								class="cnt"></em></span>
						</div>
						<div id="info.search.address.retry" class="retry HIDDEN">
							<div class="content">
								<span class="ico"></span> <span class="txt">찾으시는 주소가 없어
									유사한 주소를 제공합니다.</span>
							</div>
						</div>
						<ul id="info.search.address.list"></ul>
						<a id="info.search.address.more" class="more" href="#">주소 더보기<span
							class="ico_road_arrow"></span></a>
					</div>

					<div id="info.search.place" class="section places">
						<div class="sectiontitle">
							<h5 class="placetit">장소</h5>
							<span class="cntwrap"><em id="info.search.place.cnt"
								class="cnt"></em></span>
							<ol id="info.search.place.sort" class="Sort"></ol>
						</div>
						<div id="info.search.place.breadcrumb" class="breadcrumb"></div>
						<ul id="info.search.place.list" class="placelist"></ul>
						<a id="info.search.place.more" class="more" href="#">장소 더보기</a>
					</div>
					<div id="info.search.page" class="pages HIDDEN">
						<div class="pageWrap">
							<button type="button" id="info.search.page.prev"
								class="prev disabled">이전</button>
							<a id="info.search.page.no1" class="INACTIVE" href="#">1</a> <a
								id="info.search.page.no2" class="INACTIVE" href="#">2</a> <a
								id="info.search.page.no3" class="INACTIVE" href="#">3</a> <a
								id="info.search.page.no4" class="INACTIVE" href="#">4</a> <a
								id="info.search.page.no5" class="INACTIVE" href="#">5</a>
							<button type="button" id="info.search.page.next" class="next">다음</button>
						</div>
					</div>

				</div>

				<div id="info.addNewPlace" class="info_addplace HIDDEN">
					<strong class="tit_addplace">새로운 수정된 장소를 알고 계세요?<br>장소
						제보는 지도 품질 향상에 큰 도움이 됩니다.
					</strong> <a id="info.addNewPlace.btn" href="#"
						class="ico_place link_addplace">신규 장소 등록</a>
				</div>

				<div id="info.noSuchPlace" class="noPlace noSuchPlace HIDDEN">
					<p>
						<strong>'해당위치'</strong>에 대한 검색 결과가 없습니다.
					</p>
				</div>

				<div id="info.noPlaceInBounds" class="noPlace noInBounds HIDDEN">
					<div class="inner_noPlace">
						<h3 class="noKeyword">
							<em id="info.noPlaceInBounds.keyword" class="txt_keyword"></em>
							검색 결과가 없어요.
						</h3>
						<p class="noResultDesc">
							검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해 보세요.
						</p>
						<a
							href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=%EC%98%A4%ED%8D%84"
							class="noKeywordLink" id="info.noPlaceInBounds.daum.link"
							target="_blank">Daum 검색 결과 보기</a>
						<div id="info.noPlaceInBounds.register" class="register">
							새로운 수정된 장소를 알고 계세요?<br>장소 제보는 지도 품질 향상에 큰 도움이 됩니다. <a
								id="info.noPlaceInBounds.register.btn" class="registerBtn"
								href="#" target="_blank">신규 장소 등록</a>
						</div>
					</div>
				</div>

				<div id="info.noThemePlace" class="noThemePlace HIDDEN">
					<p id="info.noThemePlace.category" class="reviewcategories HIDDEN">
						<a id="info.noThemePlace.category.n1" href="#">전체</a> <a
							id="info.noThemePlace.category.n2" href="#">음식</a> <a
							id="info.noThemePlace.category.n3" href="#">여행</a> <a
							id="info.noThemePlace.category.n4" href="#">기타</a>
					</p>
					<p class="l1">
						<strong>'주변 <span id="info.noThemePlace.title"></span>'
						</strong>에 대한 검색 결과가 없습니다.
					</p>
					<p class="l2">지도를 축소하여 다시 테마 지도를 이용해 주세요.</p>
				</div>



			</div>
			<div id="info.route" class="RouteSearch HIDDEN">

				<h2 class="screen_out">길찾기 검색</h2>
				<div id="info.route.searchBox"
					class="RouteSearchBox HIDDEN WHITEOUT">
					<div id="info.route.searchBox.list"></div>
					<a href="#none" id="info.route.searchBox.toggleVia"
						class="btn_roadsearch toggleVia">경유지 추가</a> <a href="#none"
						id="info.route.searchBox.change"
						class="btn_roadsearch routechange" title="출발/도착 순서 바꾸기">출발/도착
						순서 바꾸기</a> <a href="#none" id="info.route.searchBox.clearVia"
						class="btn_roadsearch clearVia" title="모두 지우기">모두 지우기</a>
				</div>

				<div id="info.flagsearch.method" class="routeMethod"></div>


				<div id="info.route.home" class="routeHistory routedesc"></div>
				<div id="info.route.intro" class="Howto">
					<strong class="tit_intro">오늘은<br>어디로 안내할까요?
					</strong>
					<p class="desc_intro">
						매일매일 업데이트되는 최신정보로<br>가장 빠른 경로를 알려드려요.
					</p>
				</div>

				<div id="info.flagsearch" class="HIDDEN Flagsearch">
					<div class="search">
						<div id="info.flagsearch.divided" class="flagDivided">
							<div id="info.flagsearch.correction" class="correction HIDDEN">
								<p class="correctionTop">
									'<strong id="info.flagsearch.correction.orig"></strong>'에서 '<strong
										id="info.flagsearch.correction.new"></strong>'으로 검색한 결과
								</p>
								<p class="correctionBottom">
									<a href="#" id="info.flagsearch.correction.goorig">입력한 '<span
										id="info.flagsearch.correction.orig2"></span>'(으)로 재검색 ‣
									</a>
								</p>
							</div>

							<div id="info.flagsearch.spellcheck" class="spellcheck HIDDEN">
								<div class="spellcheckTitle HIDDEN"
									id="info.flagsearch.spellcheck.titleText">
									'<strong id="info.flagsearch.spellcheck.title"></strong>' 검색결과
								</div>
								<p>
									<a href="#" class="candidate"
										id="info.flagsearch.spellcheck.candidate">'<span
										id="info.flagsearch.spellcheck.text"></span>'(으)로 검색하시겠습니까?
									</a>
								</p>
							</div>

							<div id="info.flagsearch.message" class="message"></div>

						</div>
						<div id="info.flagsearch.options" class="filterwrap">
							<div class="filter" data-mypage="true">
								<a href="#" class="ACTIVE" id="info.flagsearch.filter.all">전체</a>
								<a href="#" class="INACTIVE" id="info.flagsearch.filter.place">장소</a>
								<a href="#" class="INACTIVE" id="info.flagsearch.filter.address">주소</a>
								<a href="#" class="INACTIVE" id="info.flagsearch.filter.busstop">버스</a>
							</div>
						</div>
						<div id="info.flagsearch.address" class="section addresses">
							<div class="sectiontitle">
								<h3 class="addrtitle">주소</h3>
								<span class="cntwrap"><em
									id="info.flagsearch.address.cnt" class="cnt"></em></span>
							</div>
							<ul id="info.flagsearch.address.list"></ul>
							<a id="info.flagsearch.address.more" class="more" href="#">주소
								더보기<span class="ico_road_arrow"></span>
							</a>
						</div>

						<div id="info.flagsearch.place" class="section places">
							<h5 class="sectiontitle">
								<span class="placetitle">장소</span> <span class="cntwrap"><em
									id="info.flagsearch.place.cnt" class="cnt"></em></span>
							</h5>
							<ul id="info.flagsearch.place.list"></ul>
							<a id="info.flagsearch.place.more" class="more" href="#">장소
								더보기</a>
						</div>

						<div id="info.flagsearch.busstop"
							class="section busstopList HIDDEN">
							<div class="sectiontitle">
								<h3 class="busstoptitle">버스정류장</h3>
								<span class="cntwrap"><em
									id="info.flagsearch.busstop.cnt" class="cnt"></em></span>
							</div>
							<ul id="info.flagsearch.busstop.list"></ul>
							<a id="info.flagsearch.busstop.more" class="more" href="#">버스정류장
								더보기<span class="ico_road_arrow"></span>
							</a>
						</div>

						<div id="info.flagsearch.page" class="pages HIDDEN">
							<div class="pageWrap">
								<button type="button" id="info.flagsearch.page.prev"
									class="prev disabled">이전</button>
								<a id="info.flagsearch.page.no1" class="INACTIVE" href="#">1</a>
								<a id="info.flagsearch.page.no2" class="INACTIVE" href="#">2</a>
								<a id="info.flagsearch.page.no3" class="INACTIVE" href="#">3</a>
								<a id="info.flagsearch.page.no4" class="INACTIVE" href="#">4</a>
								<a id="info.flagsearch.page.no5" class="INACTIVE" href="#">5</a>
								<button type="button" id="info.flagsearch.page.next"
									class="next">다음</button>
							</div>
						</div>

						<div id="info.noFlagPlace" class="noPlace HIDDEN">
							<div class="inner_noPlace">
								<h3 class="noKeyword">
									<em id="info.noFlagPlace.keyword" class="txt_keyword"></em> 검색
									결과가 없어요.
								</h3>
								<p class="noResultDesc">
									검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해
									보세요.
								</p>
								<a
									href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=%EC%98%A4%ED%8D%84"
									class="noKeywordLink" id="info.noPlace.daum.link"
									target="_blank">Daum 검색 결과 보기</a>
								<div id="info.noFlagPlace.register" class="register">
									새로운 수정된 장소를 알고 계세요?<br>장소 제보는 지도 품질 향상에 큰 도움이 됩니다. <a
										id="info.noFlagPlace.register.btn" class="registerBtn"
										href="#" target="_blank">신규 장소 등록</a>
								</div>
							</div>
						</div>
						<div id="info.noW3w" class="noPlace noPlace_type2 ">
							<div class="inner_noPlace">
								<h3 class="noKeyword">w3w를 지원하지 않는 기능이에요.</h3>
							</div>
						</div>

						<div id="info.flagsearch.addNewPlace" class="info_addplace HIDDEN">
							<strong class="tit_addplace">새로운 수정된 장소를 알고 계세요?<br>장소
								제보는 지도 품질 향상에 큰 도움이 됩니다.
							</strong> <a id="info.flagsearch.addNewPlace.btn" href="#"
								class="ico_place link_addplace">신규 장소 등록</a>
						</div>
					</div>

					<div id="info.carRoute" class="HIDDEN"></div>
					<div id="info.walkRoute" class="walkroute HIDDEN"></div>
					<div id="info.bikeRoute" class="bikeroute HIDDEN"></div>
				</div>
			</div>

			<div id="info.bus" class="BusSearch WHITEOUT HIDDEN">
				<a href="#none" id="info.bus.removeAll" class="removeAll"
					title="모두 지우기">모두 지우기</a>
				<ul id="search.busMethodtype" class="BusMethodType">
					<li id="search.busMethodtype.number" class="busNum NUMBER-ACTIVE">
						<a href="#none">번호</a>
					</li>
					<li id="search.busMethodtype.stop" class="busStop BUSSTOP-INACTIVE">
						<a href="#none">정류장</a>
					</li>
					<li id="search.busMethodtype.region"
						class="busRegion REGION-INACTIVE"><a href="#none">지역</a></li>
				</ul>

				<div id="info.bus.searchBox.number" class="number">
					<form id="info.bus.searchBoxNumber" class="BusSearchBox WHITEOUT">
						<div class="box_search">
							<h3 class="screen_out">
								<label for="info.route.searchBox.number.name">버스번호</label>
							</h3>
							<input id="info.route.searchBox.number.name" class="q"
								type="text" autocomplete="off" placeholder="버스번호를 입력하세요">
							<button id="info.bus.searchBox.number.submit" class="go"
								type="submit"></button>
							<blockquote id="info.route.searchBox.number.nameSuggest"></blockquote>
						</div>
					</form>
				</div>
				<div id="info.bus.searchBox.stop" class="stop HIDDEN">
					<form id="info.bus.searchBoxStop" class="BusSearchBox WHITEOUT">
						<div class="box_search">
							<h3 class="screen_out">
								<label for="info.route.searchBox.stop.name">버스정류장</label>
							</h3>
							<input id="info.route.searchBox.stop.name" class="q" type="text"
								autocomplete="off" placeholder="버스정류장을 입력하세요">
							<button id="info.bus.searchBox.stop.submit" class="go"
								type="submit"></button>
							<blockquote id="info.route.searchBox.stop.nameSuggest"></blockquote>
						</div>
					</form>
				</div>

				<div id="info.bus.region" class="region BusSearchBox HIDDEN">
					<div class="hb">
						<div id="info.bus.region.local.button" class="rb">
							<h3 class="screen_out">지역</h3>
							<span class="screen_out">선택상자</span> <em class="screen_out">선택내용
								:</em> <span id="info.bus.region.local" class="method melt">경기</span>
							<em class="screen_out">선택옵션</em>
							<ul id="search.busLocal" class="BusLocal HIDDEN"></ul>
						</div>
					</div>
					<div class="hb sub">
						<div id="info.bus.region.subLocal.button" class="rb">
							<strong class="screen_out">세부지역 선택상자</strong> <em
								class="screen_out">선택내용 :</em> <span
								id="info.bus.region.subLocal" class="method method-INACTIVE">가평군</span>
							<em class="screen_out">선택옵션</em>
						</div>
					</div>
				</div>

				<div id="info.busIntro" class="Howto">
					<strong class="tit_intro">지금, 딱!<br>내가 탈 버스가 어디있는지
					</strong>
					<p class="desc_intro">
						노선 정보는 물론, 실시간으로<br>버스 도착정보와 위치를 확인하세요.
					</p>
					<a href="http://kakaomap.tistory.com/219" class="link_intro"
						target="_blank">서비스 제공지역 안내</a>
				</div>

				<div id="info.bus.search" class="BusResult">
					<div id="info.bus.message" class="busMessage">
						<div id="info.bus.guide" class="guide"></div>
					</div>
					<div id="info.bus.title" class="busTitle">
						<h3 class="title">검색결과</h3>
						<span id="info.bus.count" class="cntwrap"></span>
						<div id="info.bus.filter" class="filter"></div>
					</div>
					<ul id="info.bus.list" class="list"></ul>
					<div id="info.bus.page" class="pages HIDDEN">
						<div class="pageWrap">
							<button type="button" id="info.bus.page.prev"
								class="prev disabled">이전</button>
							<a id="info.bus.page.no1" class="INACTIVE" href="#">1</a> <a
								id="info.bus.page.no2" class="INACTIVE" href="#">2</a> <a
								id="info.bus.page.no3" class="INACTIVE" href="#">3</a> <a
								id="info.bus.page.no4" class="INACTIVE" href="#">4</a> <a
								id="info.bus.page.no5" class="INACTIVE" href="#">5</a>
							<button type="button" id="info.bus.page.next" class="next">다음</button>
						</div>
					</div>
					<div id="info.noBus" class="info_nobus HIDDEN"></div>
				</div>

			</div>
			<div id="info.subway" class="SubwayRouteSearch HIDDEN WHITEOUT">
				<h2 class="screen_out">지하철 검색</h2>
				<div class="SubwayRegion WHITEOUT">
					<ul id="info.subway.region">
					</ul>
					<a href="#none" id="info.subway.remove" class="remove"
						title="모두 지우기">모두 지우기</a>
				</div>

				<div id="info.subway.searchBox"
					class="SubwayRouteSearchBox HIDDEN WHITEOUT">
					<div class="origindestBox">
						<div id="info.subway.searchBox.originBox" class="box">
							<form id="info.subway.searchBox.originForm" class="form">
								<input id="info.subway.searchBox.origin" class="q" type="text"
									value="" /> <label for="info.subway.searchBox.origin"><span
									class="holderText op">출발역</span></label> <input class="submit"
									type="submit" value="" /> <a href="#"
									id="info.subway.searchBox.originDelete"
									class="delete dl HIDDEN" title="출발역지우기">출발역지우기</a>
							</form>
							<blockquote id="info.subway.searchBox.originSuggest"
								class="SubwayOriginSuggest"></blockquote>
						</div>
						<a href="#" class="to" id="info.subway.searchBox.to"
							title="출발/도착 순서 바꾸기">출발/도착 순서 바꾸기</a>
						<div id="info.subway.searchBox.destBox" class="box dest">
							<form id="info.subway.searchBox.destForm" class="form">
								<input id="info.subway.searchBox.dest" class="q" type="text"
									value="" /> <label for="info.subway.searchBox.dest"><span
									class="holderText dp">도착역</span></label> <input class="submit"
									type="submit" value="" /> <a href="#"
									id="info.subway.searchBox.destDelete" class="delete dr HIDDEN"
									title="도착역지우기">도착역지우기</a>
							</form>
							<blockquote id="info.subway.searchBox.destSuggest"
								class="SubwayDestSuggest"></blockquote>
						</div>
					</div>
					<div class="options">
						<a href="#" id="info.subway.searchBox.optionBox" class="optionBox"
							title="옵션설정"> <span class="text">출발시간</span> <span
							class="arrow"></span>
						</a> <a href="#" id="info.subway.searchBox.dayBox"
							class="optionBox day" title="요일설정"> <span class="text">평일</span>
							<span class="arrow"></span>
						</a> <a href="#" id="info.subway.searchBox.hourBox"
							class="optionBox hour" title="시간설정"> <span class="text">시</span>
							<span class="arrow"></span>
						</a> <a href="#" id="info.subway.searchBox.minuteBox"
							class="optionBox minute" title="시간설정"> <span class="text">분</span>
							<span class="arrow"></span>
						</a>
						<ul id="info.subway.searchBox.listBox" class="listBox"></ul>
					</div>
					<div class="submitBox">
						<span id="info.subway.searchBox.submit" class="go">검색</span>
					</div>
					<div class="resultBox HIDDEN" id='info.subway.searchBox.resultBox'>
						<strong class="tit_result">총 2건의 검색결과</strong> <a href="#none"
							class="endCheck"><span class="icon"></span>막차보기</a>
					</div>
				</div>
				<div id="info.subway.history"></div>
				<div id="info.subway.intro" class="Howto">
					<strong class="tit_intro">호선도 중요하지만,<br>시간이 더 중요하니까
					</strong>
					<p class="desc_intro">
						언제 출발해야 하는지부터<br>몇분에 도착할지까지, 한 눈에 확인하세요.
					</p>
				</div>
				<div id="info.subwayInfo" class="subwayInfo HIDDEN">
					<div class="SubwayRouteResultView">
						<h3 class="screen_out">지하철 경로</h3>
						<p class="firstTrainInfo HIDDEN">
							<span class="infoImg"><a href="#" class="infoClose">닫기</a></span>
						</p>
						<ul class="list"></ul>
					</div>
				</div>
			</div>
			<div id="info.my" class="FavoriteListView HIDDEN">
				<h2 class="screen_out">MY</h2>
				<div data-id="tab" class="FavoriteMethodType HIDDEN">
					<ul>
						<li id="my.subtab.favorite" class="ACTIVE"><a href="#none">즐겨찾기</a></li>
						<li id="my.subtab.static" class="INACTIVE"><a href="#none">집∙회사</a></li>
						<li id="my.subtab.review" class="INACTIVE"><a href="#none">평가</a></li>
					</ul>
				</div>

				<div class="favorite_interlock HIDDEN">
					<div id="my.favorite" class="favorite_result">
						<h3 class="screen_out">즐겨찾기</h3>
						<div class="favorite_directory">
							<div data-id="header"></div>
							<div data-id="list" class="FavoriteBodyList">
								<div data-id="banner" class="FavoriteBookmarkLink HIDDEN">
									<a href="#none" class="link_bookmark">다음지도 즐겨찾기를 카카오맵으로 <em>가져오기</em></a>
									<button data-id="bannerClose" type="button"
										class="ico_mypage bt_close">닫기</button>
								</div>
								<ul class="list_detail"></ul>
								<div id="info.my.favorite.page" data-id="pagination"
									class="pages HIDDEN">
									<div class="pageWrap">
										<button type="button" id="info.my.favorite.page.prev"
											class="prev disabled">이전</button>
										<a id="info.my.favorite.page.no1" class="INACTIVE" href="#">1</a>
										<a id="info.my.favorite.page.no2" class="INACTIVE" href="#">2</a>
										<a id="info.my.favorite.page.no3" class="INACTIVE" href="#">3</a>
										<a id="info.my.favorite.page.no4" class="INACTIVE" href="#">4</a>
										<a id="info.my.favorite.page.no5" class="INACTIVE" href="#">5</a>
										<button type="button" id="info.my.favorite.page.next"
											class="next">다음</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div id="my.static" class="favorite_homecorp HIDDEN">
						<h3 class="screen_out">집회사</h3>
						<ul data-id="staticList"></ul>
					</div>

					<div id="my.review" class="favorite_evaluation">
						<h3 class="screen_out">평가</h3>
						<div data-id="reviewHeader">
							<div data-id="reviewEmptyPage" class="FavoriteEmptyPage HIDDEN">
								<p class="desc_empty">작성한 평가가 없습니다.</p>
							</div>
							<div data-id="reviewFilters" class="info_result"></div>
						</div>
						<div data-id="reviewList" class="FavoriteBodyList">
							<ul></ul>
						</div>
						<div id="my.review.page" class="pages HIDDEN">
							<div class="pageWrap">
								<button type="button" id="my.review.page.prev"
									class="prev disabled">이전</button>
								<a id="my.review.page.no1" class="ACTIVE" href="#">1</a> <a
									id="my.review.page.no2" class="INACTIVE" href="#">2</a> <a
									id="my.review.page.no3" class="INACTIVE" href="#">3</a> <a
									id="my.review.page.no4" class="INACTIVE" href="#">4</a> <a
									id="my.review.page.no5" class="INACTIVE" href="#">5</a>
								<button type="button" id="my.review.page.next" class="next">다음</button>
							</div>
						</div>
					</div>
				</div>
				<div id="info.my.intro" class="Howto JOIN HIDDEN">
					<strong class="tit_intro">자주 가는 장소는<br>등록해서 사용해요
					</strong>
					<p class="desc_intro">
						집이나 회사 등 자주 가는 장소는 즐겨찾기로 등록하여<br>언제 어디서나 쉽고 빠르게 확인하세요.
					</p>
					<a href="#none" class="link_my"> 로그인</a>
				</div>
			</div>

			<div id="info.issue" class="section" style="display: none">
				<div id="info.issue.place">
					<h5>
						폭우 피해지도 <span id="info.issue.place.issueCnt"></span>건
					</h5>
					<ul id="info.issue.place.list"></ul>
					<a id="info.issue.place.more" class="more" href="#">장소 더보기(<strong
						id="info.issue.place.more.count">0</strong>)
					</a>
				</div>
			</div>

			<div id="info.thememap" class="thememap section HIDDEN">
				<div id="info.thememap.theme" class="themeMapView">
					<div class="sectiontitle">
						<h5 class="themetit">테마</h5>
						<span class="cntwrap">(<em id="info.thememap.theme.cnt"
							class="cnt">0</em>건)
						</span>
						<ol id="info.thememap.theme.sort" class="Sort">
							<li class="first"><a href="#" class="recent ACTIVE">최신순</a></li>
							<li><a href="#" class="rank INACTIVE">인기순</a></li>
						</ol>
					</div>
					<ul id="info.thememap.theme.recommend" class="themeRecommend"></ul>
					<ul id="info.thememap.theme.list" class="themeList"></ul>
				</div>
				<div id="info.thememap.placeview" class="themeMapPlaceView HIDDEN">
					<div class="title">
						<a href="#" class="share">공유하기</a> <span></span>
					</div>
					<div class="sectiontitle">
						<h5 class="placetit">장소</h5>
						<span class="cntwrap">(<em id="info.thememap.place.cnt"
							class="cnt">0</em>건)
						</span> <a href="#" class="themeMore">전체 테마 보기</a>
					</div>
					<ul id="info.thememap.place.list" class="themePlaceList"></ul>
					<div class="sectiontitle bottomtitle">
						<h5 class="themeplacetit">추천 테마지도</h5>
						<span class="cntwrap">(<em
							id="info.thememap.placetheme.cnt" class="cnt">0</em>건)
						</span> <a href="#" class="themeMore">전체 테마 보기</a>
					</div>
					<ul id="info.thememap.recommend.list" class="themeRecommendList"></ul>
				</div>
			</div>
		</div>
		<div id="info.ads" class="bnr_ad HIDDEN">
			<span class="bar_top"></span> <a id="info.ad1"
				href="https://kakaomap.tistory.com/338" target="_blank"
				class="link_bnr HIDDEN" tag="ad95"> <img width="390"
				src="https://t1.daumcdn.net/section/oc/d1b5b958909b45e6b7871759111a7549"
				class="img_bnr" alt="" />
			</a>
			<div id="info.adButtons" class="localadSelect HIDDEN">
				<a id="info.adButton1" class="ad-INACTIVE" href="#"></a>
			</div>
			<span class="bar_bottom"></span>
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
