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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${root}/css/placeBoard/style.css"/>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style type="text/css">
#randomPlace{
	width:1100px;
	margin-left:auto;
	margin-right:auto;
	text-align: center;
}
#re1 {
	width: 350px;
	height: 50px;
	border-radius:1em/1em;
	background-color: #8A4924;
	color: white;
}

#re2 {
	width: 350px;
	height: 50px;
	border-radius:1em/1em;
	background-color: #8A4924;
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
	color:#8A4924;
	margin:0 0 0 200px;
	width: 700px;
	height: 300px;
	border-radius:1em/1em;
	border: 3px solid #8A4924;
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
	background-color: #8A4924;
	color: white;
}
.place{
	width: 50%;
	float:left;
	height: 450px;
}
.placeImgTitle{
	margin: 15px 0px 15px 0px;
	font-size: 18px;
}

#startButton{
	margin: 10% 0% 0% 0%;
	width: 450px;
	height: 200px;
	font-size: 30px;
	color:#8A4924;
	border-radius:1em/1em;
	border: 3px solid #8A4924;
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
	var place_code=[];
	var id=null;
function randomPlaceStart(thisroot,aquestion,sessionId){
	place_code=[];
	id=sessionId
	location.href='#';
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
				$("#re1").attr("onclick","javascript:randomPlaceEnd('"+data[0].question_Yes+"')");
				$("#re2").attr("onclick","javascript:randomPlaceEnd('"+data[0].question_No+"')");
			}else{
				place=questionAnswer;
			//	alert(place);
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
			map=new daum.maps.Map(mapContainer, mapOptions);
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
			//희준이별점부분ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
			var placeList = "";
						for (var i = 0; i < data.length;i++) {
							placeList += "<div class='place'>"
								+ "<div class=placeImgTitle>"+data[i].place_name+"</div>"
								+ "<figure class='figurefx default'>"
								+ "<img src='"+root+data[i].place_photo+"' width='348' height='250' class='placeImg'>"
								+ "<figcaption>"
				   				+ "<div>";
			   				if(data[i].place_star <= 0 && data[i].place_star < 0.5){
			   					placeList +="<img src='/date/resources/star/00.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 0.5 && data[i].place_star < 1){
			   					placeList +="<img src='/date/resources/star/05.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 1 && data[i].place_star < 1.5){
			   					placeList +="<img src='/date/resources/star/10.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 1.5 && data[i].place_star < 2){
			   					placeList +="<img src='/date/resources/star/15.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 2 && data[i].place_star < 2.5){
			   					placeList +="<img src='/date/resources/star/20.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 2.5 && data[i].place_star < 3){
			   					placeList +="<img src='/date/resources/star/25.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 3 && data[i].place_star < 3.5){
			   					placeList +="<img src='/date/resources/star/30.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 3.5 && data[i].place_star < 4){
			   					placeList +="<img src='/date/resources/star/35.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 4 && data[i].place_star < 4.5){
			   					placeList +="<img src='/date/resources/star/40.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";}
			   				if(data[i].place_star <= 4.5 && data[i].place_star < 5){
			   					placeList +="<img src='/date/resources/star/45.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";} 
			   				if(data[i].place_star == 5){
			   					placeList +="<img src='/date/resources/star/50.png' width='120' height='25' style='margin:0px 0px 0px 107px;'/>";} 
				   			placeList +="</div>"
				   				+"<input type='button' value='상세보기' onclick='placeContentOpen("+i+")'/>"
				   				+"</figcaption>"
				   				+"</figure>"
								+"<div class=placeContent>장소설명 : "
								+data[i].place_content + "<br/></div>"
								+"</div>";
							place_code+=data[i].place_code+",";
						}
						$("#place").empty();
						$("#place").append(placeList);
			//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
			
			$("#placeMapReset").attr("onclick","javascript:placeMapReset('"+data[0].place_cordi1+"','"+data[0].place_cordi2+"','"+data[1].place_cordi1+"','"+data[1].place_cordi2+"','"+data[0].place_name+"','"+data[1].place_name+"')");
			
			$("#re1").attr("onclick","javascript:searchPlaces()");
			
			$("#re1").val("선택");
			$("#re1").attr("onclick","javascript:saveCourses('"+data[0].place_code+"','"+data[1].place_code+"','"+id+"')");
			$("#re2").val("다시");
			$("#re2").attr("onclick","javascript:randomPlaceStart(\'"+root+"\','"+reAqustion+"','"+id+"')");
		},
		error:function(){
			alert("마지막안됭");
		}
	});
}
function placeContentOpen(i){
	var replace_code=place_code.split(",");
	window.open("/date/placeBoard/reviewBoard.do?place_code="+replace_code[i]);
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

function saveCourses(place1,place2,id){
	location.href=root+"/randomplace/randomPlaceSaveCourse.do?place1="+place1+"&place2="+place2+"&id="+id;
}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="randomPlace">
		<jsp:include page="/TOP.jsp"/>
		<div id="randomPlaceResult">
			<div id="place"></div>
			<input id="placeMapReset" type="button" value="처음위치" class="btn btn-default">
			<div id="map"></div>
		</div>
		<div id="randomPlaceMain">
			<div id="start">
				<input type="button" value="시작" id="startButton" class="btn btn-default"
					onclick="randomPlaceStart('${root}',${aquestion},'${id}')"> 
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