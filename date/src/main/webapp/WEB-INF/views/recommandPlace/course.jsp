<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link href="${root}/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${root}/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Social Buttons CSS -->
<link href="${root}/css/bootstrap/bower_components/bootstrap-social/bootstrap-social.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${root}/css/bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${root}/css/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<style>
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
	color:red;
}

.distanceInfo:after {
	content: none;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.allAll {
	width: 1100px;
	height: 1200px;
	margin-left: auto;
	margin-right: auto;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 400px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 20%;
	margin: 10px 0 30px 0;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

.map_button {
	width: 100%;
	height: 50px;
	text-align:right;
}

.courseImg {
	width: 91.5%;
	height: 600px;
	padding: 0 0 0 8.5%;
	color:white;
}

</style>
<link rel="stylesheet" type="text/css"
	href="${root }/css/recommandPlace/style.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${root }/css/recommandPlace/script.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=cd16bfc3926d034f1176275f760bd0ff&libraries=services"></script>
<script type="text/javascript">
	function saveCourse(root, place_code1, place_code2, id) {
		alert(root)
		alert(place_code1 + "," + place_code2);
		$.ajax({
					url : root + "/recommandPlace/saveCourse.do",
					type : "post",
					data : {
						place_code1 : place_code1,
						place_code2 : place_code2,
						id: id
					},
					success : function(data) {
						console.log(data);
						if(data == 1){
							alert("저장되었습니다.");
						}
					}
				});
	}
	
	function moveMypage(root,id){
		window.location.href=root+"/recommandPlace/moveMypage.do?id="+id;
	}
</script>
</head>
<body onload="showCourse('${placeDtoList[0].place_cordi1}','${placeDtoList[0].place_cordi2}','${placeDtoList[0].place_name}','${placeDtoList[1].place_cordi1}','${placeDtoList[1].place_cordi2}','${placeDtoList[1].place_name}')">
<jsp:include page="/youAndITop.jsp"/>	
	<div class="allAll">
		<div class="courseImg">
			<c:forEach var="place" items="${placeDtoList}">
				<div id="title" style="width:400px;">
					<img src="${root}${place.place_photo}" width="350" height="263"
						alt="Klematis">
					<div>
						<h4>${place.place_name}</h4>
						<br> 장소설명 : ${place.place_content}<br>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="map_button">
			<input type="button" class="btn btn-primary btn-lg btn-block" value="지도위치보기"
				onclick="showCourse('${placeDtoList[0].place_cordi1}','${placeDtoList[0].place_cordi2}','${placeDtoList[0].place_name}','${placeDtoList[1].place_cordi1}','${placeDtoList[1].place_cordi2}','${placeDtoList[1].place_name}')">
		</div>
		<div class="map_wrap">
			<div id="map"
				style="width: 80%; height: 100%; margin: 0 0 0 20%; position: relative; overflow: hidden;">
			</div>
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<p>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="" id="keyword" size="15">
						<button type="submit">검색하기</button>
						</p>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>

		</div>
		<c:if test="${like==null}">
			<div class="map_button">
				<input type="button" class="btn btn-primary btn-lg" value="장소저장하기"
					onclick="saveCourse('${root}','${placeDtoList[0].place_code}','${placeDtoList[1].place_code}','${id}')">
				<input type="button" class="btn btn-primary btn-lg" value="마이페이지이동"
					onclick="moveMypage('${root}','${id}')">
			</div>
		</c:if>
		<c:if test="${like=='recom'}">
			<div class="map_button">
				<input type="button" class="btn btn-primary btn-lg" value="마이페이지이동"
					onclick="moveMypage('${root}','${id}')">
			</div>
		</c:if>
		<c:if test="${like=='random'}">
			<div class="map_button">
				<input type="button" class="btn btn-primary btn-lg" value="마이페이지이동"
					onclick="moveMypage('${root}','${id}')">
			</div>
		</c:if>
		<script>
			// 마커를 담을 배열입니다
			var markers = [];

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
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

				if (!keyword.replace(/^\s+|\s+$/g, '')) {
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
					var placePosition = new daum.maps.LatLng(
							places[i].latitude, places[i].longitude), marker = addMarker(
							placePosition, i), itemEl = getListItem(i,
							places[i], marker); // 검색 결과 항목 Element를 생성합니다

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					// LatLngBounds 객체에 좌표를 추가합니다
					bounds.extend(placePosition);

					// 마커와 검색결과 항목에 mouseover 했을때
					// 해당 장소에 인포윈도우에 장소명을 표시합니다
					// mouseout 했을 때는 인포윈도우를 닫습니다
					(function(marker, title) {
						daum.maps.event.addListener(marker, 'mouseover',
								function() {
									displayInfowindow(marker, title);
								});

						daum.maps.event.addListener(marker, 'mouseout',
								function() {
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
						+ '   <h5>' + places.title + '</h5>';

				if (places.newAddress) {
					itemStr += '    <span>' + places.newAddress + '</span>'
							+ '   <span class="jibun gray">' + places.address
							+ '</span>';
				} else {
					itemStr += '    <span>' + places.address + '</span>';
				}

				itemStr += '  <span class="tel">' + places.phone + '</span>'
						+ '</div>';

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
				var content = '<div style="padding:5px;z-index:1;">' + title
						+ '</div>';

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


		<!-- ------------------------------------------------------------------------------------------ -->

		<script>
			var code1_1 = "";
			var code1_2 = "";
			var code2_1 = "";
			var code2_2 = "";
			var name1 = "";
			var name2 = "";

			function showCourse(courseLocate1_1, courseLocate1_2, placeName1,
					courseLocate2_1, courseLocate2_2, placeName2) {
				/* alert(courseLocate1_1);
				alert(courseLocate1_2);
				alert(placeName1);
				alert(courseLocate2_1);
				alert(courseLocate2_2);
				alert(placeName2); */
				code1_1 = parseFloat(courseLocate1_1);
				code1_2 = parseFloat(courseLocate1_2);
				code2_1 = parseFloat(courseLocate2_1);
				code2_2 = parseFloat(courseLocate2_2);
				name1 = placeName1;
				name2 = placeName2;
				checked();
				viewCheck();
				setBounds();
			}

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(37.397540056003514,
						127.10580077363134), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			function checked() {
				// 마커를 표시할 위치와 title 객체 배열입니다 
				var positions = [ {
					title : name1,
					latlng : new daum.maps.LatLng(code1_1, code1_2)
				}, {
					title : name2,
					latlng : new daum.maps.LatLng(code2_1, code2_2)
				} ];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

				for (var i = 0; i < positions.length; i++) {

					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new daum.maps.Size(24, 35);

					// 마커 이미지를 생성합니다    
					var markerImage = new daum.maps.MarkerImage(imageSrc,
							imageSize);

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					// 마커 이미지 
					});
				}
			}
			var bounds;
			function viewCheck() {
				// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
				var points = [ new daum.maps.LatLng(code1_1, code1_2),
						new daum.maps.LatLng(code2_1, code2_2), ];

				// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
				bounds = new daum.maps.LatLngBounds();

				var i, marker;
				for (i = 0; i < points.length; i++) {
					// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
					/* marker =     new daum.maps.Marker({ position : points[i] });
					marker.setMap(map); */

					// LatLngBounds 객체에 좌표를 추가합니다
					bounds.extend(points[i]);
				}
			}
			function setBounds() {
				// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
				// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
				map.setBounds(bounds);
			}
		</script>


		<script>
			var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
			var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
			var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
			var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
			var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {

				// 마우스로 클릭한 위치입니다 
				var clickPosition = mouseEvent.latLng;

				// 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
				if (!drawingFlag) {

					// 상태를 true로, 선이 그리고있는 상태로 변경합니다
					drawingFlag = true;

					// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
					deleteClickLine();

					// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
					deleteDistnce();

					// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
					deleteCircleDot();

					// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
					clickLine = new daum.maps.Polyline({
						map : map, // 선을 표시할 지도입니다 
						path : [ clickPosition ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#db4040', // 선의 색깔입니다
						strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다
					});

					// 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
					moveLine = new daum.maps.Polyline({
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#db4040', // 선의 색깔입니다
						strokeOpacity : 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다    
					});

					// 클릭한 지점에 대한 정보를 지도에 표시합니다
					displayCircleDot(clickPosition, 0);

				} else { // 선이 그려지고 있는 상태이면

					// 그려지고 있는 선의 좌표 배열을 얻어옵니다
					var path = clickLine.getPath();

					// 좌표 배열에 클릭한 위치를 추가합니다
					path.push(clickPosition);

					// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
					clickLine.setPath(path);

					var distance = Math.round(clickLine.getLength());
					displayCircleDot(clickPosition, distance);
				}
			});

			// 지도에 마우스무브 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
			daum.maps.event
					.addListener(
							map,
							'mousemove',
							function(mouseEvent) {

								// 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
								if (drawingFlag) {

									// 마우스 커서의 현재 위치를 얻어옵니다 
									var mousePosition = mouseEvent.latLng;

									// 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
									var path = clickLine.getPath();

									// 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
									var movepath = [ path[path.length - 1],
											mousePosition ];
									moveLine.setPath(movepath);
									moveLine.setMap(map);

									var distance = Math.round(clickLine
											.getLength()
											+ moveLine.getLength()), // 선의 총 거리를 계산합니다
									content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">'
											+ distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

									// 거리정보를 지도에 표시합니다
									showDistance(content, mousePosition);
								}
							});

			// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
			daum.maps.event
					.addListener(
							map,
							'rightclick',
							function(mouseEvent) {

								// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
								if (drawingFlag) {

									// 마우스무브로 그려진 선은 지도에서 제거합니다
									moveLine.setMap(null);
									moveLine = null;

									// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
									var path = clickLine.getPath();

									// 선을 구성하는 좌표의 개수가 2개 이상이면
									if (path.length > 1) {

										// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
										if (dots[dots.length - 1].distance) {
											dots[dots.length - 1].distance
													.setMap(null);
											dots[dots.length - 1].distance = null;
										}

										var distance = Math.round(clickLine
												.getLength()), // 선의 총 거리를 계산합니다
										content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

										// 그려진 선의 거리정보를 지도에 표시합니다
										showDistance(content,
												path[path.length - 1]);

									} else {

										// 선을 구성하는 좌표의 개수가 1개 이하이면 
										// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
										deleteClickLine();
										deleteCircleDot();
										deleteDistnce();

									}

									// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
									drawingFlag = false;
								}
							});

			// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
			function deleteClickLine() {
				if (clickLine) {
					clickLine.setMap(null);
					clickLine = null;
				}
			}

			// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
			// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
			function showDistance(content, position) {

				if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

					// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
					distanceOverlay.setPosition(position);
					distanceOverlay.setContent(content);

				} else { // 커스텀 오버레이가 생성되지 않은 상태이면

					// 커스텀 오버레이를 생성하고 지도에 표시합니다
					distanceOverlay = new daum.maps.CustomOverlay({
						map : map, // 커스텀오버레이를 표시할 지도입니다
						content : content, // 커스텀오버레이에 표시할 내용입니다
						position : position, // 커스텀오버레이를 표시할 위치입니다.
						xAnchor : 0,
						yAnchor : 0,
						zIndex : 3
					});
				}
			}

			// 그려지고 있는 선의 총거리 정보와 
			// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
			function deleteDistnce() {
				if (distanceOverlay) {
					distanceOverlay.setMap(null);
					distanceOverlay = null;
				}
			}

			// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
			function displayCircleDot(position, distance) {

				// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
				var circleOverlay = new daum.maps.CustomOverlay({
					content : '<span class="dot"></span>',
					position : position,
					zIndex : 1
				});

				// 지도에 표시합니다
				circleOverlay.setMap(map);

				if (distance > 0) {
					// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
					var distanceOverlay = new daum.maps.CustomOverlay(
							{
								content : '<div class="dotOverlay">거리 <span class="number">'
										+ distance + '</span>m</div>',
								position : position,
								yAnchor : 1,
								zIndex : 2
							});

					// 지도에 표시합니다
					distanceOverlay.setMap(map);
				}

				// 배열에 추가합니다
				dots.push({
					circle : circleOverlay,
					distance : distanceOverlay
				});
			}

			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
			function deleteCircleDot() {
				var i;

				for (i = 0; i < dots.length; i++) {
					if (dots[i].circle) {
						dots[i].circle.setMap(null);
					}

					if (dots[i].distance) {
						dots[i].distance.setMap(null);
					}
				}

				dots = [];
			}

			// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
			// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
			// HTML Content를 만들어 리턴하는 함수입니다
			function getTimeHTML(distance) {

				// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
				var walkkTime = distance / 67 | 0;
				var walkHour = '', walkMin = '';

				// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
				if (walkkTime > 60) {
					walkHour = '<span class="number">'
							+ Math.floor(walkkTime / 60) + '</span>시간 '
				}
				walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

				// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
				var bycicleTime = distance / 227 | 0;
				var bycicleHour = '', bycicleMin = '';

				// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
				if (bycicleTime > 60) {
					bycicleHour = '<span class="number">'
							+ Math.floor(bycicleTime / 60) + '</span>시간 '
				}
				bycicleMin = '<span class="number">' + bycicleTime % 60
						+ '</span>분'

				// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
				var content = '<ul class="dotOverlay distanceInfo">';
				content += '    <li>';
				content += '        <span class="label">총거리</span><span class="number">'
						+ distance + '</span>m';
				content += '    </li>';
				content += '    <li>';
				content += '        <span class="label">도보</span>' + walkHour
						+ walkMin;
				content += '    </li>';
				content += '    <li>';
				content += '        <span class="label">자전거</span>'
						+ bycicleHour + bycicleMin;
				content += '    </li>';
				content += '</ul>'

				return content;
			}
		</script>


	</div>
</body>
</html>














