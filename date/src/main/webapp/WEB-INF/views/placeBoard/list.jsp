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
<body>
	<jsp:include page="/youAndITop.jsp"/><br/>	
	<div style="width:1200px; height:auto; margin-left:auto; margin-right:auto;">
	
	<div id="wrapbody" align="center" style="height:300px;">
		<div class="date_n_finder" >
			<div class="date_n_top">
				<h3 class="tit_date_n"><span><img src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_datearea.png" alt="데이트 장소 찾기" /></span></h3>
			</div>
	
			<!-- 지역, 테마, 가격대, 쿠폰 선택박스 -->
			<div id="finderbox" style="height:200px;">
				<div class="finder_inner">
					<dl class="finder_list_2014" id='locationlist'>
						<dt><strong><img src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_area.png" width="60" height="14" alt="지역" /></strong></dt>
						<dd>
							<form action="${root}/placeBoard/boardList.do" onsubmit="return placeListForm(this)">
								<ul class="opt_rap">
									<li>
										<input type="radio" name="place_location" value="강남">강남
									</li>
									<li>
										<input type="radio" name="place_location" value="송파">송파
									</li>
									<li>
										<input type="radio" name="place_location" value="종로">종로 
									</li>
									<li>
										<input type="radio" name="place_location" value="사당">사당 
									</li>
									<li>
										<input type="radio" name="place_location" value="삼성">삼성 
									</li>
									<li>
										<input type="radio" name="place_location" value="서래마을">서래마을  
									</li>
									<li>
										<input type="radio" name="place_location" value="신림">신림 
									</li>
									<li>
										<input type="radio" name="place_location" value="신사">신사 
									</li>
									<li>
										<input type="radio" name="place_location" value="신천">신천 
									</li>
									<li>
										<input type="radio" name="place_location" value="영등포">영등포 
									</li>
									<li>
										<input type="radio" name="place_location" value="천호">천호 
									</li>
									<li>
										<input type="submit" class="btn btn-danger" value="검색하기"> 
									</li>
								</ul>
							</form>
						</dd>			
					 </dl>
		
				<dl id='themelist' class="finder_list_2014">
					<dt><strong><img src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_thema.png" width="60" height="14" alt="테마" /></strong></dt>
						<dd>
							<ul class="opt_rap">
								<li>
									<input type="radio" name="place_location" value="강남">카페	
								</li>
								<li>
									<input type="radio" name="place_location" value="송파">영화
								</li>
								<li>
									<input type="radio" name="place_location" value="종로">공원 
								</li>
								<li>
									<input type="radio" name="place_location" value="사당">쇼핑
								</li>
								<li>
									<input type="radio" name="place_location" value="삼성">테마파크 
								</li>
								<li>
									<input type="radio" name="place_location" value="서래마을">축제	 
								</li>
								<li>
									<input type="radio" name="place_location" value="신림">문화
								</li>
								<li>
									<input type="radio" name="place_location" value="신사">자연명소
								</li>
								<li>
									<input type="submit" class="btn btn-danger" value="검색하기"> 
								</li>
							</ul>
						</dd>
					</dl>
	
					<dl id="price" class="finder_list_2014">
						<dt><strong><img src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_money.png" width="60" height="14" alt="가격대" /></strong></dt>
						<dd>
							<ul class="opt_rap">
									<li>
									<input type="radio" name="place_location" value="강남">1만원이하	
								</li>
								<li>
									<input type="radio" name="place_location" value="송파">1만원대
								</li>
								<li>
									<input type="radio" name="place_location" value="종로">2만원대
								</li>
								<li>
									<input type="radio" name="place_location" value="사당">3만원대
								</li>
								<li>
									<input type="radio" name="place_location" value="삼성">4만원대
								</li>
								<li>
									<input type="radio" name="place_location" value="서래마을">5만원대 
								</li>
								<li>
									<input type="radio" name="place_location" value="신림">6만원이상
								</li>
								<li>
									<input type="submit" class="btn btn-danger" value="검색하기"> 
								</li>
							</ul>
						</dd>
					</dl>
				</div>
	        </div>
	    </div>
	</div>
	
	
	
	
	
	
	
	
	
	
		<%-- <div class="panel panel-danger" style="text-align:center; width:500px; height:200px; margin-left:auto; margin-right:auto;">
  			<div class="panel-heading" style="width:500px; height:80px">
   			 	<p class="panel-body">지역으로 장소 찾기</p>
			</div>
			<div class="panel-body">
				<form action="${root}/placeBoard/boardList.do" onsubmit="return placeListForm(this)">
					<input type="radio" name="place_location" value="강남">강남 &nbsp;
					<input type="radio" name="place_location" value="송파">송파 &nbsp;
					<input type="radio" name="place_location" value="종로">종로 &nbsp;
					<input type="radio" name="place_location" value="사당">사당 &nbsp;
					<input type="radio" name="place_location" value="삼성">삼성 &nbsp;
					<input type="radio" name="place_location" value="서래마을">서래마을 &nbsp;
					<input type="radio" name="place_location" value="신림">신림 &nbsp;
					<input type="radio" name="place_location" value="신사">신사 <br/>
					<input type="radio" name="place_location" value="신천">신천 &nbsp;
					<input type="radio" name="place_location" value="압구정">압구정 &nbsp;
					<input type="radio" name="place_location" value="여의도">여의도 &nbsp;
					<input type="radio" name="place_location" value="영등포">영등포 &nbsp;
					<input type="radio" name="place_location" value="천호">천호 &nbsp;
					<input type="radio" name="place_location" value="상암">상암 &nbsp;
					<input type="radio" name="place_location" value="기타">기타 &nbsp;<br/><br/>
					<input type="submit" class="btn btn-danger" value="검색하기">
				</form>
			</div>
		</div>
	 --%>
		<div style="width:1080px; height:680px; margin-left:auto; margin-right:auto; ">
			<div class="line1">
				<p class="orangeLine" align="center"></p>
			</div>
			<a>신규순</a>&nbsp;||&nbsp;<a>조회순</a>
			
			<div class="line1">
				<p class="orangeLine"></p>
			</div>
			
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
				<c:set var="pageBlock" value="${5}"/>
				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1 )}"/>
				
				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
				<c:set var="startPage" value="${rs*pageBlock+1 }"/>
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
				
				<c:if test="${endPage> pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				
				<c:if test="${startPage>pageBlock }">
					<a href="${root }/placeBoard/boardList.do?pageNumber=${startPage-pageBlock}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="${root }/placeBoard/boardList.do?pageNumber=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<a href="${root }/placeBoard/boardList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
				</c:if>
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