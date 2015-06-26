<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

		try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}

	</script>

	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=711e7ce0606b25dbb33647492ceec4a"></script>
</head>
<body>
	<div class="mapBox" id="map"></div> 

<script type="text/javascript">
	var oPoint = new nhn.api.map.LatLng(35.8446585, 128.5592607); //LatLng 값이 y, x 좌표
	nhn.api.map.setDefaultPoint('LatLng');
	oMap = new nhn.api.map.Map('map' ,{ //표시될 div의 id 입니다.
				point : oPoint,
				zoom : 11, //기본 지도 줌 크기
				enableWheelZoom : true,
				enableDragPan : true,
				enableDblClickZoom : false,
				mapMode : 0,
				activateTrafficMap : false,
				activateBicycleMap : false,
				minMaxLevel : [ 1, 14 ],
				size : new nhn.api.map.Size(690, 338) //표시될 지도 크기
			});
//아래는 위에서 지정한 좌표에 마커를 표시하는 소스 입니다.
	var oSize = new nhn.api.map.Size(28, 37);
	var oOffset = new nhn.api.map.Size(14, 37);
	var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
    //icon 이미지를 바꿔서 사용할 수 있습니다.
	var oMarker = new nhn.api.map.Marker(oIcon, { title : '타이틀' }); 
	oMarker.setPoint(oPoint);
	oMap.addOverlay(oMarker);
//아래는 사이드에 줌 컨트롤을 추가하는 소스 입니다.
	var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
	mapZoom.setPosition({left:20, bottom:40}); // - 줌 컨트롤 위치 지정
	oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
</script>
	



</body>
</html>