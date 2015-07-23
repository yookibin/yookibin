<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

 function area(root,gugun){
   location.href=root+"/placesearch/choiceOk.do?area="+gugun;
 }    
 
</script>

</head>
<body>
<div style="width:1200px; margin:auto auto auto auto;">
<jsp:include page="/TOP.jsp"/>
<form action="${root}/placesearch/choiceOk.do" method="GET" onsubmit="return writeForm(this)">

   
   <img src="${root}/resources/img/seoul.jpg" width="580" height="494" border="0" alt="" usemap="#Map" style="margin-left:30%">
   
   <map name="Map">
   <!--강남쪽 -->
   <area shape="rect" coords="478,250,531,284" onclick="javascript:area('${root}','강동구')" target="_blank">   
   <area shape="rect" coords="427,312,498,351" onclick="javascript:area('${root}','송파구')" target="_blank">
   
   <area shape="rect" coords="357,319,408,365" onclick="javascript:area('${root}','강남구')" target="_blank">
   <area shape="rect" coords="306,344,356,399" onclick="javascript:area('${root}','서초구')" target="_blank">
   
   <area shape="rect" coords="220,326,273,346" onclick="javascript:area('${root}','동작구')" target="_blank">
   <area shape="rect" coords="226,378,278,416" onclick="javascript:area('${root}','관악구')" target="_blank">
   
   <area shape="rect" coords="183,297,223,324" onclick="javascript:area('${root}','영등포구')" target="_blank">
   <area shape="rect" coords="170,376,211,405" onclick="javascript:area('${root}','금천구')" target="_blank">
   <area shape="rect" coords="113,304,167,331" onclick="javascript:area('${root}','양천구')" target="_blank">
   
   <area shape="rect" coords="103,344,150,377" onclick="javascript:area('${root}','구로구')" target="_blank">
   <area shape="rect" coords="60,233,135,273" onclick="javascript:area('${root}','강서구')" target="_blank">
   
   <!--강북쪽 -->
   <area shape="rect" coords="400,98,440,143" onclick="javascript:area('${root}','노원구')" target="_blank">
   <area shape="rect" coords="418,184,467,218" onclick="javascript:area('${root}','중랑구')" target="_blank">
   <area shape="rect" coords="413,266,450,294" onclick="javascript:area('${root}','광진구')" target="_blank">
   
   <area shape="rect" coords="340,78,391,100" onclick="javascript:area('${root}','도봉구')" target="_blank">
   <area shape="rect" coords="314,114,362,146" onclick="javascript:area('${root}','강북구')" target="_blank">
   <area shape="rect" coords="319,174,371,209" onclick="javascript:area('${root}','성북구')" target="_blank">
   <area shape="rect" coords="364,207,421,232" onclick="javascript:area('${root}','동대문구')" target="_blank">
   <area shape="rect" coords="351,251,402,285" onclick="javascript:area('${root}','성동구')" target="_blank">

   <area shape="rect" coords="270,203,320,230" onclick="javascript:area('${root}','종로구')"target="_blank">
   <area shape="rect" coords="290,240,341,260" onclick="javascript:area('${root}','중구')" target="_blank">
   <area shape="rect" coords="269,281,327,320" onclick="javascript:area('${root}','용산구')" target="_blank">

   <area shape="rect" coords="208,139,258,175" onclick="javascript:area('${root}','은평구')" target="_blank">
   <area shape="rect" coords="214,215,268,240" onclick="javascript:area('${root}','서대문구')" target="_blank">
   <area shape="rect" coords="180,239,235,267" onclick="javascript:area('${root}','마포구')" target="_blank">   
   </map>
   
   
   
</form> 
<jsp:include page="/Bottom.jsp"/>
</div>  
</body>
</html>