<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${root }/css/recommandPlace/style.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${root }/css/recommandPlace/script.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=cd16bfc3926d034f1176275f760bd0ff"></script>

<script type="text/javascript">
var count = 2;
	function marker(a, b, name) {
		var aa = parseFloat(a);
		var bb = parseFloat(b);
		/* alert(aa);
		alert(bb); */
		var positions = [ {
			title : name,
			latlng : new daum.maps.LatLng(aa, bb)
		}

		];
		//좌표이동
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(aa, bb),
			level : 3
		};
		var map = new daum.maps.Map(container, options);

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new daum.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

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

	function getInfo(root, code11) {
		$.ajax({
			url : root + "/recommandPlace/getInfo.do",
			type : "post",
			data : {
				code : code11
			},
			success : function(data) {
				console.log(data);
				$("#" + data.place_code).empty();
				$("#" + data.place_code).append(data.place_content);
				/* $("#" + data.place_code + " a:eq(0)").text("test");
				$("#" + data.place_code + " a:eq(0)").attr("href",
						"javascript:test()"); */
			}
		});
	}
	function getNameList(root) {
		$.ajax({
			url : root + "/recommandPlace/nameList.do",
			type : "post",
			success : function(data) {
				console.log(data);
				var namePlace = "";
				for(var i=0;i<count;i++){
					namePlace+="<span>" + data[i].place_name + "<span><br>";
				}
				$("#A").empty();
				$("#A").append(namePlace);
				count += 2;
			}
		});
	}

	function test() {
		alert("test");
	}
</script>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.555164722083724,
					126.97068821106485),
			level : 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
	</div>
	
	
	
	
	
	장소이름들
	<input type="button" value="댓글보기" onclick="getNameList('${root}')">
	<div id="A">
		
	</div>
	<input type="button" value="더보기" onclick="getNameList('${root}')">
	
	
	
	
	





	<div>
		<c:forEach var="listCourse" items="${list}" begin="0">
		<c:forEach var="place" items="${listCourse}">
			장소이름 : ${place.place_name }
			<input type="button" value="마커보이기"
				onclick="marker('${place.place_cordi1}','${place.place_cordi2}','${place.place_name}')"><br>
		</c:forEach>
		</c:forEach>
	</div>

	<div id="placeAll">
		${placeListSize}
		<c:forEach var="listCourse" items="${list}">
			<c:forEach var="place" items="${listCourse}">
			<div>
				<hr>
			</div>	
				<div id="title">
					<div id="title_a">
						<img src="${root}${place.place_photo}" width="348" height="348"
							onclick="getInfo('${root}','${place.place_code}')">
					</div>

					<div id="title_b">${place.place_name}
						<div id="${place.place_code}">
						</div>
					</div>
				</div>
			</c:forEach>
		</c:forEach>

		<a href="${root}/recommandPlace/map.do">map</a>
	

</body>
</html>