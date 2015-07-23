<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root }/css/placeBoard/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<link type="text/css" rel="stylesheet" href="${root}/css/placeBoard/style.css"/>
<link type="text/css" rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"/>
</head>
<body onload="placeListForm()">
	<div style="width:1200px; height:auto; margin-left:auto; margin-right:auto;">
	<jsp:include page="/TOP.jsp"/><br/>	
	
	<div id="wrapbody" align="center" style="height:300px;">
		<div class="date_n_finder" >
			<div class="date_n_top">
				<h3 class="tit_date_n"><span><img src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_datearea.png" alt="데이트 장소 찾기" /></span></h3>
			</div>
	
			<!-- 지역, 테마, 가격대, 쿠폰 선택박스 -->
			<form action="${root}/placeBoard/boardList.do">
			<div id="finderbox" style="height:163px;">
				<div class="finder_inner">
					<dl class="finder_list_2014" id='locationlist'>
						<dt><strong><img src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_area.png" width="60" height="14" alt="지역" /></strong></dt>
						<dd>
							<ul class="opt_rap">
								<li>
									<input type="radio" name="place_gu" value="전체"> 전체
								</li>
								<li>
									<input type="radio" name="place_gu" value="강남구"> 강남구
								</li>
								<li>
									<input type="radio" name="place_gu" value="송파구"> 송파구
								</li>
								<li>
									<input type="radio" name="place_gu" value="종로구"> 종로구
								</li>
								<li>
									<input type="radio" name="place_gu" value="강동구"> 강동구 
								</li>
								<li>
									<input type="radio" name="place_gu" value="관악구"> 관악구 
								</li>
								<li>
									<input type="radio" name="place_gu" value="용산구"> 용산구  
								</li>
								<li>
									<input type="radio" name="place_gu" value="중구"> 중구
								</li>
								<li>
									<input type="radio" name="place_gu" value="동대문구"> 동대문구
								</li>
							
							</ul>
						</dd>			
					 </dl>
		
				<dl id='themelist' class="finder_list_2014">
					<dt><strong><img src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_thema.png" width="60" height="14" alt="테마" /></strong></dt>
						<dd>
							<ul class="opt_rap">
								<li>
									<input type="radio" name="place_thema" value="전체"> 전체
								</li>
								<li>
									<input type="radio" name="place_thema" value="카페"> 카페	
								</li>
								<li>
									<input type="radio" name="place_thema" value="영화"> 영화
								</li>
								<li>
									<input type="radio" name="place_thema" value="park"> 공원 
								</li>
								<li>
									<input type="radio" name="place_thema" value="쇼핑"> 쇼핑
								</li>
								<li>
									<input type="radio" name="place_thema" value="테마파크"> 테마파크  
								</li>
								<li>
									<input type="radio" name="place_thema" value="축제"> 축제	 
								</li>
								<li>
									<input type="radio" name="place_thema" value="문화"> 문화
								</li>
								<li>
									<input type="radio" name="place_thema" value="자연명소"> 자연명소
								</li>
							</ul>
						</dd>
					</dl>
	
					<dl id="price" class="finder_list_2014">
						<dt><strong><img src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_money.png" width="60" height="14" alt="가격대" /></strong></dt>
						<dd>
							<ul class="opt_rap">
								<li>
									<input type="radio" name="place_balance" value="전체"> 전체
								</li>
								<li>
									<input type="radio" name="place_balance" value="1만원"> 1만원대
								</li>
								<li>

									<input type="radio" name="place_balance" value="2만원"> 2만원대
								</li>
								<li>
									<input type="radio" name="place_balance" value="3만원"> 3만원대
								</li>
								<li>
									<input type="radio" name="place_balance" value="3만원"> 4만원대
								</li>
								<li>
									<input type="radio" name="place_balance" value="5만원"> 5만원대 
								</li>
								<li>
									<input type="radio" name="place_balance" value="6만원"> 6만원대
								</li>
							</ul>
						</dd>
					</dl>
				</div>
	        </div><br/>
			<input type="submit" class="btn btn-danger" value="검색하기"> 
	    </div>
	</div>


	<div style="width:1080px; height:680px; margin-left:auto; margin-right:auto; ">
		<div class="line1" style="padding-bottom:15px;">
			<p class="orangeLine" align="center"></p>
		</div><br/>
		<%-- a href="${root }/placeBoard/newBoardList.do?place_gu=${place_gu}&place_thema=${place_thema}&place_balance=${place_balance}">인인기순으로 보기!/a>>
			<div class="line1">
			<p class="orangeLine"></p>
		</div>
		 --%>

		<c:forEach var="placeBoard" items="${boardList}">
			<div style="float:left; width:270px; height:auto;" >
				<figure class="figurefx default">
		   			<img src="${root}${placeBoard.place_photo}" width="250" height="180"> 
		   			<figcaption> 
		   				<div>
		   					<c:if test="${placeBoard.place_star==0}"><img src="${root}/resources/star/00.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>	
		   					<c:if test="${placeBoard.place_star>0 && placeBoard.place_star<=0.5}"><img src="${root}/resources/star/05.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>0.5 && placeBoard.place_star<=1}"><img src="${root}/resources/star/10.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>1 && placeBoard.place_star<=1.5}"><img src="${root}/resources/star/15.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>1.5 && placeBoard.place_star<=2}"><img src="${root}/resources/star/20.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>2 && placeBoard.place_star<=2.5}"><img src="${root}/resources/star/25.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>2.5 && placeBoard.place_star<=3}"><img src="${root}/resources/star/30.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>3 && placeBoard.place_star<=3.5}"><img src="${root}/resources/star/35.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>3.5 && placeBoard.place_star<=4}"><img src="${root}/resources/star/40.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>4 && placeBoard.place_star<=4.5}"><img src="${root}/resources/star/45.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					<c:if test="${placeBoard.place_star>4.5 && placeBoard.place_star<=5}"><img src="${root}/resources/star/50.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>
		   					${placeBoard.place_star}점
		   				</div>
		   				<a href="${root}/placeBoard/reviewBoard.do?place_code=${placeBoard.place_code}">상세보기</a>
		   			</figcaption>
				</figure>
				<div align="center">${placeBoard.place_name}</div>
			</div>
		</c:forEach>
	</div>
	
	<div style="width:1080px; text-align:center; margin-left:auto; margin-right:auto;">
		<c:if test="${count>0}">
			<c:set var="pageBlock" value="${4}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1 )}"/>
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
			
			<c:if test="${endPage> pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<ul class="pagination">
			<c:if test="${startPage>pageBlock }">
				<li><a style="background-color:#F05F40" href="${root }/placeBoard/boardList.do?pageNumber=${startPage-pageBlock}&place_gu=${place_gu}&place_thema=${place_thema}&place_balance=${place_balance}">이전</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li><a href="${root }/placeBoard/boardList.do?pageNumber=${i}&place_gu=${place_gu}&place_thema=${place_thema}&place_balance=${place_balance}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a style="background-color:#F05F40" href="${root }/placeBoard/boardList.do?pageNumber=${startPage+pageBlock}&place_gu=${place_gu}&place_thema=${place_thema}&place_balance=${place_balance}">다음</a></li>
			</c:if>
			</ul>
		</c:if>
	</div>
		<div style="width:1080px; height:680px; margin-left:auto; margin-right:auto; ">
			<div class="line1">
				<p class="orangeLine" align="center"></p>
			</div>
		</div>
	</div>
</body>
</html>
