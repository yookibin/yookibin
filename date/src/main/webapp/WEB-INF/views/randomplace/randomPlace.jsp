<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=4b1c3ff87f73232dda30873bb5e65f33&libraries=services"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=4b1c3ff87f73232dda30873bb5e65f33"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<style type="text/css">
#randomPlace{
	width:1100px;
	height:1200px;
	margin-left:auto;
	margin-right:auto;
	text-align: center;
}
#re1 {
	width: 350px;
	height: 50px;
	border-radius:1em/1em;
	background-color: #F05F40;
	color: white;
}

#re2 {
	width: 350px;
	height: 50px;
	border-radius:1em/1em;
	background-color: #F05F40;
	color: white;
}

#randomPlaceResult {
	display: none;
}

#button{
	display:none;
	margin-top: 5px;
}

#question{
	display:none;
	color:#F05F40;
	margin:0 0 0 200px;
	width: 700px;
	height: 300px;
	border-radius:1em/1em;
	border: 3px solid #F05F40;
	line-height:250px;
	font-size: 20px;
}

#map{
	border-radius:1em/1em;
	margin: 0 0 0 200px;
	width: 700px;
	height: 400px;
}
#placeMapReset{
	border-radius:1em/1em;
	margin: 15px 0 15px 0;
	width: 700px;
	height: 50px;
	background-color: #F05F40;
	color: white;
}

#fristPlace{
	float:left;
	width: 50%;
	height: 450px;
}

#secondPlace{
	float:left;
	width: 50%;
	height: 450px;
}

.placeImgTitle{
	margin: 15px 0px 15px 0px;
	font-size: 18px;
}

#startButton{
	margin: 20% 0% 0% 0%;
	width: 450px;
	height: 200px;
	font-size: 30px;
	
	color:#F05F40;
	border-radius:1em/1em;
	border: 3px solid #F05F40;
}

.placeContent{
	font: 10px;
}
</style>
<script type="text/javascript">
	var root=null;
	var reAqustion=null;
	var place=null;
	var weather=null;
	
function randomPlaceStart(thisroot,aquestion){
	$("#randomPlaceResult").slideUp();
	$("#start").slideUp();
	root=thisroot;
	reAqustion=aquestion;
	var num="A"+Math.floor(Math.random()*aquestion+1);
	var url=root+"/randomplace/randomPlace.do";
	$.ajax({
		url:url,
		data:{
			number:num
		},
		type:"get",
		success:function(data){
	//		$("#start").css("display","none");
		 	$("#question").text(data[0].question);
			$("#re1").val(" 예   :)");
			$("#re2").val("아니오 :(");
			$("#button").slideDown(500);
			$("#question").slideDown(500);
			$("#re1").attr("onclick","javascript:randomPlace('"+data[0].next_Question+"','"+data[0].question_Yes+"','"+data[1]+"')");
			$("#re2").attr("onclick","javascript:randomPlace('"+data[0].next_Question+"','"+data[0].question_No+"','"+data[1]+"')");
			//	$("#randomPlaceMain input:eq(0)").attr("onclick","javascript:randomPlaceTest("+data+",\'"+thisroot+"\')");
		}
	});
}

function randomPlace(next_Question,questionAnswer,next_QuestionCount){
	
	$("#question").slideUp(300);
	
	var next_QuestionNumber=next_Question+Math.floor(Math.random()*next_QuestionCount+1);
	var url=root+"/randomplace/randomPlace.do";
	$.ajax({
		url:url,
		type:"get",
		data:{
			number:next_QuestionNumber
		},
		success:function(data){
			$("#question").slideDown(300);
			$("#question").text(data[0].question);
		//	alert(data[0].next_Question);
			var test=data[0].next_Question.trim();
			if(data[0].next_Question.trim()=="D"){
				weather=questionAnswer;
			//	alert(weather);
				$("#re1").val("예:D");
				$("#re2").val("아니오:D");				
				$("#re1").attr("onclick","javascript:randomPlaceEnd('"+data[0].question_Yes+"')");
				$("#re2").attr("onclick","javascript:randomPlaceEnd('"+data[0].question_No+"')");
			}else{
				place=questionAnswer;
			//	alert(place);
				$("#re1").val("예Place");
				$("#re2").val("아니오Place");
				$("#re1").attr("onclick","javascript:randomPlace('"+data[0].next_Question+"','"+data[0].question_Yes+"','"+data[1]+"')");
				$("#re2").attr("onclick","javascript:randomPlace('"+data[0].next_Question+"','"+data[0].question_No+"','"+data[1]+"')");				
			}
		},
		error:function(){
			alert("앙됨");
		}
	});
}

function randomPlaceEnd(questionAnswer){
	$("#question").slideUp(500);
	$("#button").slideUp(500);
//	alert(root+","+place+","+weather+","+questionAnswer);
	var url=root+"/randomplace/randomPlaceEnd.do";
	$.ajax({
		url:url,
		type:"get",
		data:{
			place:place,
			weather:weather,
			time:questionAnswer
		},
		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
		success:function(data){
			$("#randomPlaceResult").slideDown(2500);
			$("#button").slideDown(500);
		//	$("#randomPlaceResult").css("display","block");
			var mapContainer=document.getElementById('map');
			var	mapOptions={
					center: new daum.maps.LatLng(34.450701, 126.570667),
					level: 3
				};
			var map=new daum.maps.Map(mapContainer, mapOptions);
			var points = [ 
		 		new daum.maps.LatLng(data[0].place_cordi1, data[0].place_cordi2),
				new daum.maps.LatLng(data[1].place_cordi1, data[1].place_cordi2)
			];


			    // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
			   	var bounds = new daum.maps.LatLngBounds();    

			    var i, marker;
			    
			    for (i = 0; i < points.length; i++) {
			    	// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
			    	marker = new daum.maps.Marker({
			    		position : points[i],
			    		title : data[i].place_name
			    	});
			    	marker.setMap(map);
			    	// LatLngBounds 객체에 좌표를 추가합니다
			    	bounds.extend(points[i]);
			    }
			// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
			// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
			map.setBounds(bounds);

			// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
			
			$("#fristPlace > img").attr("src",root+data[0].place_photo);
			$("#fristPlace > .placeContent").text(data[0].place_content);
			$("#fristPlace > .placeImgTitle").text(data[0].place_name);
			
			$("#secondPlace > img").attr("src",root+data[1].place_photo);
			$("#secondPlace > .placeContent").text(data[1].place_content);
			$("#secondPlace > .placeImgTitle").text(data[1].place_name);
			
			$("#placeMapReset").attr("onclick","javascript:placeMapReset('"+data[0].place_cordi1+"','"+data[0].place_cordi2+"','"+data[1].place_cordi1+"','"+data[1].place_cordi2+"','"+data[0].place_name+"','"+data[1].place_name+"')");
			
			$("#re1").attr("onclick","javascript:searchPlaces()");
			
			$("#re1").val("선택");
			//$("#re1").attr("onclick","javascript:randomPlaceStart(\'"+root+"\','"+reAqustion+"')");
			$("#re2").val("다시");
			$("#re2").attr("onclick","javascript:randomPlaceStart(\'"+root+"\','"+reAqustion+"')");
		},
		error:function(){
			alert("마지막안됭");
		}
	});
	
}
function placeMapReset(place_cordi1,place_cordi2,place_cordi3,place_cordi4,place_name1,place_name2){
	var place_name=[place_name1,place_name2];
	var mapContainer=document.getElementById('map');
	var	mapOptions={
			center: new daum.maps.LatLng(34.450701, 126.570667),
			level: 3
		};
	var map=new daum.maps.Map(mapContainer, mapOptions);
	var points = [ 
		new daum.maps.LatLng(place_cordi1, place_cordi2),
		new daum.maps.LatLng(place_cordi3, place_cordi4)
	];
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new daum.maps.LatLngBounds();    
	var i, marker;    
	for (i = 0; i < points.length; i++) {
    	// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    	marker = new daum.maps.Marker({
    		position : points[i],
    		title : place_name[i]
    	});
    	marker.setMap(map);
    	// LatLngBounds 객체에 좌표를 추가합니다
    	bounds.extend(points[i]);
    }
	// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	map.setBounds(bounds);
}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="randomPlace">
		<div id="randomPlaceResult">
			<div id="fristPlace">
				<div class=placeImgTitle></div>
				<img width="250px" height="250px" id="img1">
				<div class=placeContent></div>
			</div>
			<div id="secondPlace">
				<div class=placeImgTitle></div>
				<img width="250px" height="250px" id="img2">
				<div class=placeContent></div>
			</div>
			<input id="placeMapReset" type="button" value="처음위치" class="btn btn-default">
			<div id="map"></div>
		</div>
		<div id="randomPlaceMain">
			<div id="start">
				<input type="button" value="시작" id="startButton" class="btn btn-default"
					onclick="randomPlaceStart('${root}',${aquestion})"> 
			</div>
			<div id="question"></div> 
			<div id="button">
				<input id="re1" type="button" class="btn btn-default"/> 
				<input id="re2" type="button" class="btn btn-default"/>
			</div>		
		</div>
	</div>
</body>
</html>