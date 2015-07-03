<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>여행 계획</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cd16bfc3926d034f1176275f760bd0ff&libraries=services"></script>
<script type="text/javascript" src="/RailPlanWeb/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="/TravelPlanWeb/resources/css/Map.css" rel="stylesheet">
<link href="/TravelPlanWeb/resources/css/TravelPlanWeb.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function(){
		stateList();
		cpPrList();
		
		if($("#sessionId").val() != ""){
			loginSuccess();
		};
		
		$("#cpWrite").on("click", function(){
			if($("#sessionType").val() == "cp"){
				location.href = "cp_write.jsp";
			}
			if($("#sessionType").val() != "cp"){
				alert("업체 회원만 등록할 수 있습니다.");
			}
		});
		
		$("#logout").on("click", function(){
			$.ajax({
				url:"/TravelPlanWeb/TravelPlanWeb/logout"
				,type:"post"
			});
			alert("로그아웃 되었습니다.");
			location.reload();
		});
		
		$("#A").change(function(){
			$.ajax({
				url:"/TravelPlanWeb/TravelPlanWeb/state"
				,type:"post"
				,data:{
					stateAttr:$("#A").val()
				}
				,success:stateListSuccessA
				,error:error
			});
		});
		
		$("#B").change(function(){
			$.ajax({
				url:"/TravelPlanWeb/TravelPlanWeb/state"
				,type:"post"
				,data:{
					stateAttr:$("#B").val()
				}
				,success:stateListSuccessB
				,error:error
			});
		});
		
		$("#searchBtn").on("click", function(){
			var a = $("#A").val()
			var b = $("#B").val()
			var c = $("#C").val()
			var d = $("#D").val()
			
			if(c == "기차역 없음"){
				document.getElementById("keyword").value = a + " " + b + " " + d;	
			}
			if(c != "기차역 없음"){
				document.getElementById("keyword").value = a + " " + b + " " + c + " " + d;
			}
		});
		
		$("#getInfo").on("click", function(){
			if($("#sessionType").val() == "user"){
				location.href = "update_user.jsp";
			}
			if($("#sessionType").val() == "cp"){
				location.href = "update_cp.jsp";
			}
			if($("#sessionType").val() == ""){
				error();
			}
		});
		
		$("#trans").change(function(){
			pasteHTML();
		});
		
		$("#update").change(function(){
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			cpUpdate();
		});
	});
	
	var stateList = function(){
		$.ajax({
			url:"/TravelPlanWeb/TravelPlanWeb/state"
			,type:"post"
			,data:{
				stateAttr:'state'
			}
			,success:stateListSuccess
			,error:error
		});
	};
	
	var cpPrList = function(){
		$.ajax({
			url:"/TravelPlanWeb/TravelPlanWeb/cpPr/getAll"
			,type:"post"
			,success:cpPrListSuccess
			,error:error
		})	
	}
	
	var cpPrGetInfo = function(num){
		
		$.ajax({
			url:"/TravelPlanWeb/TravelPlanWeb/cpPr/getInfo"
			,type:"post"
			,data:{
				cpPrNum:num
			}
			,success:cpPrGetInfoSuccess
			,error:error
		});
		
		$("#cpPrNum").attr("value", num);
	}
	
	var cpUpdate = function(){
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		
		$.ajax({
			url:"/TravelPlanWeb/TravelPlanWeb/cpPr/update"
			,type:"post"
			,data:{
				cpPrNum:$("#cpPrNum").val(),
				cpId:$("#sessionId").val(),
				cpName:$("#cpName").val(),
				cpAddress:$("#cpAddress").val(),
				cpImage:$("#cpImage").val(),
				cpTel:$("#cpTel").val(),
				cpUrl:$("#cpUrl").val(),
				cpCategory:$("#cpCategory").val(),
				cpContents:$("#ir1").val()
			}
		});
		
		location.href = "travelInfo.jsp";
	};
	
	var cpDelete = function(num){
		
		$.ajax({
			url:"/TravelPlanWeb/TravelPlanWeb/cpPr/delete"
			,type:"post"
			,data:{
				cpPrNum:num
			}
		});
		
		location.href = "travelInfo.jsp";
	}
	
	var stateListSuccess = function(data){
		
		var stateName = "";
		
		for(var i=0; i<data.length; i++){
			stateName += '<option>' + data[i] + '</option>';
		}
		
		$("#A").empty();
		$("#A").append(stateName);
		$("#A").change();
	};
	
	var cpPrListSuccess = function(data){
		
		var cpPr = "";
		
		for(var i=0; i<data.length; i++){
			cpPr += "<div id='companyPR'>"
					+ "<p class='title'>" + data[i].cpName + "</p>"
					+ "<img src='" + data[i].cpImage + "' onclick='cpPrGetInfo(" + data[i].cpPrNum + ");'>"
					+ "<p>위치 : " + data[i].cpAddress + "</p>"
					+ "<p>연락처 : " + data[i].cpTel + "</p>"
					+ "</div>"
		}
		
		$("#companyPRlist").empty();
		$("#companyPRlist").append(cpPr);
	};
	
	var cpPrGetInfoSuccess = function(data){
		
		var read = "";
		
		if($("#sessionId").val() == data.cpId){
			read =  ""
					+ "<div id='container6'>"
					+ "<div class='companyPRinfo'>"
						+ "<p style='margin-top:20px;'>업체명 <input type='text' id='cpName' value='"+ data.cpName + "'></p>"
						+ "<p>주　소 <input type='text' id='cpAddress' value='"+ data.cpAddress + "'></p>"
						+ "<p>사　진 <input type='text' id='cpImage' value='"+ data.cpImage +"'></p>"
					+ "</div>"
					+ "<div class='companyPRinfo'>"
						+ "<p style='margin-top:20px;'>전화번호 <input type='text' id='cpTel' value='"+ data.cpTel + "'></p>"
						+ "<p>홈페이지 <input type='text' id='cpUrl' value='"+ data.cpUrl + "'></p>"
						+ "<p>분　　류 <select id='cpCategory'>"
		                          	+ "<option>숙박</option>"
		                          	+ "<option>음식집</option>"
		                          	+ "<option>쇼핑</option>"
		                          	+ "<option>축제</option>"
		                          	+ "<option>해수욕장</option>"
		                          	+ "<option>관광지</option>"
		                          	+ "<option>기타</option></select>"
	                    + "</p>"
                    + "</div>"
                    + "<div class='companyPRcontent'>"
                    	+ "<textarea name='ir1' id='ir1' rows='18' cols='117'></textarea>"
                    + "</div>"
                    + "</div>"
                    + "<div class='more2'>"
                    	+ "<img src='/TravelPlanWeb/resources/img/companyPRdelete_btn.png' onclick='cpDelete(" + data.cpPrNum + ");'>"
                    	+ "<img src='/TravelPlanWeb/resources/img/companyPRupdate_btn.png' onclick=$('#update').change()>"
                    	+ "<a href='travelInfo.jsp'>"
							+ "<img src='/TravelPlanWeb/resources/img/cancle.png'>"
						+ "</a>"
					+ "</div>";
		}
		
		if($("#sessionId").val() != data.cpId){
			read =  ""
					+ "<div id='container6'>"
					+ "<div class='companyPRinfo'>"
						+ "<p style='margin-top:20px;'>업체명 <input type='text' id='cpName' value='"+ data.cpName + "' readonly></p>"
						+ "<p>주　소 <input type='text' id='cpAddress' value='"+ data.cpAddress + "' readonly></p>"
						+ "<p>분　류 <input type='text' id='cpCategory' readonly></p>"
					+ "</div>"
					+ "<div class='companyPRinfo'>"
						+ "<p style='margin-top:20px;'>전화번호 <input type='text' id='cpTel' value='"+ data.cpTel + "' readonly></p>"
						+ "<p>홈페이지 <input type='text' id='cpUrl' value='"+ data.cpUrl + "' readonly></p>"
                    + "</div>"
                    + "<div class='companyPRcontent2'><div>" + data.cpContents + "</div></div>"
                    + "</div>"
                    + "<div class='more2'>"
                    	+ "<a href='travelInfo.jsp'>"
							+ "<img src='/TravelPlanWeb/resources/img/cancle.png'>"
						+ "</a>"
					+ "</div>";
		}
		
		$("#main3").empty();
		$("#main4").empty();
		$("#container5").empty();
		$("#border4").css('height' , '0px');
		$("#main3").append(read);
		$("#cpCategory").val(data.cpCategory);
		
		if($("#sessionId").val() == data.cpId){
			$("#contents").attr("value", data.cpContents);
			$("#trans").change();
		}
	};
	
	var stateListSuccessA = function(data){
		
		var stateName = "";
		
		for(var i=0; i<data.length; i++){
			stateName += '<option>' + data[i] + '</option>';
		}
		
		$("#B").empty();
		$("#B").append(stateName);
		$("#B").change();
	};
	
	var stateListSuccessB = function(data){
		
		var stateName = "";
		
		if(data == ""){
			stateName = '<option>기차역 없음</option>';
			
			$("#C").empty();
			$("#C").append(stateName);
		}
		
		else{
			for(var i=0; i<data.length; i++){
				stateName += '<option>' + data[i] + '</option>';
			}
			$("#C").empty();
			$("#C").append(stateName);
		}
	};
	
	var loginSuccess = function(){
		var loginMessage = "";
		
		if($("#sessionType").val() == "user"){
			loginMessage ="<li>${sessionScope.sessionId}님 환영합니다.</li>"
						+ "<li><a href='#' id='logout'>로그아웃</a></li>"
						+ "<li><a href='#' id='getInfo'>회원정보</a></li>"
						+ "<li><input type='text'></li>"

			$("#header > #lnb").empty();
			$("#header > #lnb").append(loginMessage);
		}
		
		if($("#sessionType").val() == "cp"){
			loginMessage ="<li>${sessionScope.sessionId}님 환영합니다.</li>"
						+ "<li><a href='#' id='logout'>로그아웃</a></li>"
						+ "<li><a href='#' id='getInfo'>업체정보</a></li>"
						+ "<li><input type='text'></li>"

			$("#header > #lnb").empty();
			$("#header > #lnb").append(loginMessage);
		}
	};
	
	var oEditors = [];
	
	function pasteHTML() {
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
		    elPlaceHolder: "ir1",
			sSkinURI: "/TravelPlanWeb/resources/editor/SmartEditor2Skin.html",
			htParams : {bUseToolbar : true,
				fOnBeforeUnload : function(){
				}
			},
			fOnAppLoad : function(){
				oEditors.getById["ir1"].exec("PASTE_HTML", [$("#contents").val()]);
			},
			fCreator: "createSEditor2"
		});
	};
	
	var error = function() {
		alert("수행 중 에러가 발생했습니다.");
	};
		
</script>
</head>
<body>
	<div id="header" class="wrap">
		<h1>
			<a href="index.jsp">
				<img src="/TravelPlanWeb/resources/img/logo.png" width="187" height="65" />
			</a>
		</h1>
		<ul id="lnb">
			<li><a href="login.jsp">로그인</a></li>
			<li><a href="create_before.jsp">회원가입</a></li>
			<li><input type="text"></li>
		</ul>
		<ul id="gnb">
			<li><a href="#" class="gnb1">나만의 여행</a></li>
			<li><a href="#" class="gnb2">추천 여행</a></li>
			<li><a href="travelInfo.jsp" class="gnb3">여행 정보</a></li>
			<li><a href="community.jsp" class="gnb4">여행 후기</a></li>
			<li><a href="#" class="gnb5">고객 센터</a></li>
		</ul>
	</div>
	
	<div id="main">
		<div id="border1"></div>
		
		<div class="location">
			<ul>
				<li>
					<a href="index.jsp">HOME  </a>
					<span> > </span>
				</li>
				<li style="color:gray;">  여행정보</li>
			</ul>
		</div>
		
		<div id="border2"></div>
	</div>
	
	<div id="container" class="wrap">
		<p>여행정보</p>
	</div>
	
	<div id="border3"></div>
	
	<div id="main3">
		<div class="map">
			<div class="map_wrap">
			<div id="map" style="width: 700px; height: 350px; position: relative; overflow: hidden;"></div>
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<p>
							<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="서울 광진구 숙박" id="keyword" size="15"> 
		                	<button type="submit">검색하기</button> 
		            	</p>
					</div><hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
			</div>
		</div>
		<div id="map_category">
			<p>지　역<select id="A">
							<option>--- 지역 선택1 ---</option>
                          </select>
                </p>
				<p>지　역<select id="B">
							<option>--- 지역 선택2 ---</option>
                          </select>
                </p>
                 <p>기차역<select id="C">
                          	<option>--- 기차역 선택 ---</option>
                          </select>
                </p>
                <p>정　보<select id="D">
                          	<option>숙박</option>
                          	<option>음식집</option>
                          	<option>쇼핑</option>
                          	<option>축제</option>
                          	<option>해수욕장</option>
                          	<option>관광지</option>
                          	<option>데이트 코스</option>
						</select><br>　
						<button id="searchBtn">검색하기</button>
				</p>
			</div>
		</div>
	</div>
	
	<div id="container5" class="wrap">
		<p>업체정보</p>
		<img src='/RailPlanWeb/resources/img/companyPRadd_btn.png' id="cpWrite">
	</div>
	
	<div id="border4"></div>
	
	<div id="main4">
		<div id="companyPRlist">
		</div>
	</div>
	
	<div id="footer">
		<div id="ppp">
			<p id="address">
				<b>여행계획(주)</b> 대표이사 사장 김진수 <b>|</b> 경기도 구리시 수택동</p>
			<p id="number">
				예약 1588-0000 <b>/</b> 02-0000-0000 <b>|</b> 여행계획 1588-0000 <b>/</b>
				02-0000-0000<br /> 사업자등록번호 000-00-00000 <b>|</b> 통신판매업 신고번호 제
				16-2822 <b>|</b> 개인정보관리책임자 여행마케팅 상무 아무개
			</p>
			<p id="asiana">Copyrightⓒ. All Rights Reserved.</p>
			<div id="bottom_logo">
				<img src="/TravelPlanWeb/resources/img/bottom_logo.png"/>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="sessionId" value='${sessionScope.sessionId}'>
	<input type="hidden" id="sessionType" value='${sessionScope.sessionType}'>
	<input type="hidden" id="contents">
	<input type="hidden" id="cpPrNum">
	<select id="trans" style="display:none;"></select>
	<select id="update" style="display:none;"></select>
</body>

<!-- ---------------------- 다음 지도 api ---------------------- --> 
<script>
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.trim()) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(status, data, pagination) {
		if (status === daum.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data.places);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === daum.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === daum.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new daum.maps.LatLng(places[i].latitude,
					places[i].longitude), marker = addMarker(placePosition, i), itemEl = getListItem(
					i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				daum.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				daum.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout = function() {
					infowindow.close();
				};
			})(marker, places[i].title);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.title + '</h5>';

		if (places.newAddress) {
			itemStr += '    <span>' + places.newAddress + '</span>'
					+ '   <span class="jibun gray">' + places.address
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new daum.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new daum.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}
</script>
<!-- ---------------------- 다음 지도 api ---------------------- -->

</html>
