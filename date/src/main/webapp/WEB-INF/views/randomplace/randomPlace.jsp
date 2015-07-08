<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#re1{
		display: none;
	}
	#re2{
		display: none;
	}
	#randomPlaceResult{
		display: none;
	}
</style>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=APIKEY&libraries=services"></script> -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=4b1c3ff87f73232dda30873bb5e65f33"></script>
<script type="text/javascript">
	var root=null;
	var reAqustion=null;
	var place=null;
	var weather=null;
function randomPlaceStart(thisroot,aquestion){
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
			$("#randomPlaceResult").css("display","none");
			$("#start").css("display","none");
			$("#re1").css("display","block");
			$("#re2").css("display","block");
		 	$("#qu").text(data[0].question);
			$("#re1").val("예");
			$("#re1").attr("onclick","javascript:randomPlace('"+data[0].next_Question+"','"+data[0].question_Yes+"','"+data[1]+"')");
			$("#re2").val("아니오");
			$("#re2").attr("onclick","javascript:randomPlace('"+data[0].next_Question+"','"+data[0].question_No+"','"+data[1]+"')");
			//	$("#randomPlaceMain input:eq(0)").attr("onclick","javascript:randomPlaceTest("+data+",\'"+thisroot+"\')");
		}
	});
}

function randomPlace(next_Question,questionAnswer,next_QuestionCount){
	var next_QuestionNumber=next_Question+Math.floor(Math.random()*next_QuestionCount+1);
	var url=root+"/randomplace/randomPlace.do";
	$.ajax({
		url:url,
		type:"get",
		data:{
			number:next_QuestionNumber
		},
		success:function(data){
			$("#qu").text(data[0].question);
			alert(data[0].next_Question);
			var test=data[0].next_Question.trim();
			if(data[0].next_Question.trim()=="D"){
				weather=questionAnswer;
				alert(weather);
				$("#re1").val("예:D");
				$("#re2").val("아니오:D");				
				$("#re1").attr("onclick","javascript:randomPlaceEnd('"+data[0].question_Yes+"')");
				$("#re2").attr("onclick","javascript:randomPlaceEnd('"+data[0].question_No+"')");
			}else{
				place=questionAnswer;
				alert(place);
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
	alert(root+","+place+","+weather+","+questionAnswer);
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
			$("#randomPlaceResult").css("display","block");
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
				marker = new daum.maps.Marker({ position : points[i] });
				marker.setMap(map);
				
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(points[i]);
			}
			// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
			// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
			map.setBounds(bounds);
			
			$("#fristPlace > img").attr("src",data[0].place_photo);
			$("#fristPlace > div").val(data[0].place_content);
			
			$("#secondPlace > img").attr("src",data[1].place_photo);
			$("#secondPlace > div").val(data[1].place_content);
			
			$("#qu").text("끝");
			$("#re1").val("선택");
			$("#re1").attr("onclick","javascript:randomPlaceStart(\'"+root+"\','"+reAqustion+"')");
			$("#re2").val("다시");
			$("#re2").attr("onclick","javascript:randomPlaceStart(\'"+root+"\','"+reAqustion+"')");
		},
		error:function(){
			alert("마지막안됭");
		}
	});
}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="randomPlaceResult">
		<div id="map" style="width:500px;height:400px;"></div>
		<div id="fristPlace">
			<img width="250px" height="400px">
			<div></div>
		</div>
		<div id="secondPlace">
			<img width="250px" height="400px">
			<div></div>
		</div>
	</div>
	<div id="randomPlaceMain">
		<input id="start" type="button" value="시작" onclick="randomPlaceStart('${root}',${aquestion})"/>
		<span id="qu"></span>
		<input id="re1" type="button"/>
		<input id="re2" type="button"/>
	</div>
</body>
</html>