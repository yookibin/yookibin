<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<link href="${root }/css/eventBoard/style.css" rel="stylesheet"/>
<script type="text/javascript">
	function joinOkFun(root, afterPoint, point){
		//alert(root);
		if(afterPoint<0){
			alert("포인트가 부족합니다.");
			
			var url=root+"/eventBoard/list.do";
			opener.document.location.href=url;
			self.close();
			
		}else{
			//alert("현재창을 닫고 다시 enter.jsp로 돌아가서 submit하고싶다.");
		
			var url=root+"/eventBoard/enter.do?afterPoint="+afterPoint;			
			//opener.document.location.href=url;	
			$(opener.document).find("#enterForm").attr("action",url).submit();
			self.close();
			
			//opener.location.reload();
			//opener.document.enterForm.action='url';
			//$(opener.document).find("#Form").attr("action","index.do").submit();
		}
	}
	
</script>
</head>
<body>
	<div class="line4">
		<span>
			<h1>포인트 현황 </h1>
		</span>
	</div>
	
	<div class="line">
		<p class="orangeLine"></p>
	</div>
			
	<div class="line4">
		<label class="title2">${nickName }님의 현재 잔여 포인트</label>
		<span class="content2">
			<input type="text" size="30" name="point" value="${point }"/>
		</span>
	</div>
	<br/>
	
	<div class="line4">
		<label class="title2">차감 포인트</label>
		<span class="content2">
			<input type="text" size="30" name="event_point" value="${event_point }"/>
		</span>
	</div>
	<br/>
		
	<div class="line">
		<p class="orangeLine"></p>
	</div>
	
	<c:set var="afterPoint" value="${point-event_point }"/>
	
	<c:if test="${afterPoint>=0 }">
		<div class="line4">
			<label class="title2">이벤트 응모 후 <br/>${nickName }님의 잔여 포인트</label>
			<span class="content2">
				<input type="text" size="30" name="afterPoint" value="${afterPoint }"/>
			</span>
		</div>
		<br/>
	</c:if>
	<c:if test="${afterPoint<0 }">
		<div class="line4">
			<label class="title">포인트가 부족합니다.</label>
		</div>
		<br/>
	</c:if>
	
	<div class="line">
		<p class="orangeLine"></p>
	</div>
	
 	<div class="line4" style="text-align:center;">
		<input type="button" value="응모하기" onclick="joinOkFun('${root }','${afterPoint }','${point }')"/>
		<%-- <input type="button" value="목록보기" onclick="location.href='${root}/eventBoard/list.do'"/> --%>
	</div>
 <!-- 	</form>  -->

</body>
</html>