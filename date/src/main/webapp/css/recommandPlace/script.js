function marker(a, b, name) {
	var aa = parseFloat(a);
	var bb = parseFloat(b);
	/*
	 * alert(aa); alert(bb);
	 */
	var positions = [ {
		title : name,
		latlng : new daum.maps.LatLng(aa, bb)
	}

	];

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

function test1() {
	alert("test");
}

function getInfo(root, code) {
alert("a");
	$.ajax({
		url : "${root }/recommandPlace/getInfo.do",
		type : "post",
		data : {
			place_code : code
		}
		,success : function(data) {
			console.log(data);
		}
	});
}
