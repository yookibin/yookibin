<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<form action="${root}/placesearch/choiceOk.do" method="GET" onsubmit="return writeForm(this)">

	
	<img src="${root}/resources/img/seoul.jpg" width="580" height="494" border="0" alt="" usemap="#Map">
	
	<map name="Map">
	<!--강남쪽 -->
	<area shape="rect" coords="478,250,531,284" href="${root}/placesearch/choiceOk.do?area=강동구" target="_blank">	
	<area shape="rect" coords="427,312,498,351" href="${root}/placesearch/choiceOk.do?area=송파구" target="_blank">
	
	<area shape="rect" coords="357,319,408,365" href="${root}/placesearch/choiceOk.do?area=강남구" target="_blank">
	<area shape="rect" coords="306,344,356,399" href="${root}/placesearch/choiceOk.do?area=서초구" target="_blank">
	
	<area shape="rect" coords="220,326,273,346" href="${root}/placesearch/choiceOk.do?area=동작구" target="_blank">
	<area shape="rect" coords="226,378,278,416" href="${root}/placesearch/choiceOk.do?area=관악구" target="_blank">
	
	<area shape="rect" coords="183,297,223,324" href="${root}/placesearch/choiceOk.do?area=영등포구" target="_blank">
	<area shape="rect" coords="170,376,211,405" href="${root}/placesearch/choiceOk.do?area=금천구" target="_blank">
	<area shape="rect" coords="113,304,167,331" href="${root}/placesearch/choiceOk.do?area=양천구" target="_blank">
	
	<area shape="rect" coords="103,344,150,377" href="${root}/placesearch/choiceOk.do?area=구로구" target="_blank">
	<area shape="rect" coords="60,233,135,273" href="${root}/placesearch/choiceOk.do?area=강서구" target="_blank">
	
	<!--강북쪽 -->
	<area shape="rect" coords="400,98,440,143" href="${root}/placesearch/choiceOk.do?area=노원구" target="_blank">
	<area shape="rect" coords="418,184,467,218" href="${root}/placesearch/choiceOk.do?area=중랑구" target="_blank">
	<area shape="rect" coords="413,266,450,294" href="${root}/placesearch/choiceOk.do?area=광진구" target="_blank">
	
	<area shape="rect" coords="340,78,391,100" href="${root}/placesearch/choiceOk.do?area=도봉구" target="_blank">
	<area shape="rect" coords="314,114,362,146" href="${root}/placesearch/choiceOk.do?area=강북구" target="_blank">
	<area shape="rect" coords="319,174,371,209" href="${root}/placesearch/choiceOk.do?area=성북구" target="_blank">
	<area shape="rect" coords="364,207,421,232" href="${root}/placesearch/choiceOk.do?area=동대문구" target="_blank">
	<area shape="rect" coords="351,251,402,285" href="${root}/placesearch/choiceOk.do?area=성동구" target="_blank">

	<area shape="rect" coords="270,203,320,230" href="${root}/placesearch/choiceOk.do?area=종로구" target="_blank">
	<area shape="rect" coords="290,240,341,260" href="${root}/placesearch/choiceOk.do?area=중구" target="_blank">
	<area shape="rect" coords="269,281,327,320" href="${root}/placesearch/choiceOk.do?area=용산구" target="_blank">

	<area shape="rect" coords="208,139,258,175" href="${root}/placesearch/choiceOk.do?area=은평구" target="_blank">
	<area shape="rect" coords="214,215,268,240" href="${root}/placesearch/choiceOk.do?area=서대문구" target="_blank">
	<area shape="rect" coords="180,239,235,267" href="${root}/placesearch/choiceOk.do?area=마포구" target="_blank">	
	</map>
	
	
	
</form>	
</body>
</html>