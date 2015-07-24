<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="${root}/css/reviewBoard/style.css" />
<script type="text/javascript"
	src="${root}/css/reviewBoard/replyWrite.js"></script>
<script type="text/javascript"
	src="${root}/css/reviewBoard/replyDelete.js"></script>
<script type="text/javascript"
	src="${root}/css/reviewBoard/replyUpdate.js"></script>
<script type="text/javascript"
	src="${root}/css/reviewBoard/focusScript.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${root }/css/sweetalert-master/dist/sweetalert.css" />
<title>Insert title here</title>
<script>
	var commentCount = ("${reviewList.size()}");
	//alert(commentCount);

	$(document).ready(function() {
		if (commentCount > 5) {
			$("#moreComment").show();
			for (i = 6; i <= commentCount; i++) {
				$(".commentList>.replyDiv:nth-child(" + i + ")").hide()
			}
			;
		}
		;
	});

	var moreCount = 0

	function moreComment() {
		$("#apple").css("height","600px");
		
		
		moreCount++;
		for (i = 1; i <= 5; i++) {
			$(".commentList>.replyDiv:nth-child(" + (moreCount * 5 + i) + ")")
					.show()
		}
		;
		if (((moreCount + 1) * 5) > commentCount) {
			$("#moreComment").hide()
		}
		;
	}
	
	
	function savePlace(root, id, place) {
		if (id != '') {
			swal({
				title : "Save",
				text : "정말로 저장할까요?",
				type : "success",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "예",
				cancelButtonText : "아니요",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					swal("GOOD!", "저장되었습니다.", "success");
					$.ajax({
						url : root + "/placesearch/saveCourse.do",
						type : "post",
						data : {
							id : id,
							place : place
						},
						success : function(data) {
							console.log(data);
						}
					});
				} else {
					swal("BAD", "저장이 취소 되었습니다.", "error");
				}
			});
		}else{
			swal({ 
				  title: "BAD!",
				  text: "로그인이 필요합니다.",
				  type: "error" 
				  }
				);
		}
	}
</script>
</head>
<body>
	<div style="width:1100px; height: auto; margin-left: auto; margin-right: auto;">
		<jsp:include page="/TOP.jsp"/><br/>
		
		<div id="wrapbody">
			<div id="wrap">
				<div class="section_1">
					<div class="date_info_top"></div>
					<div class="date_detail_info">
						<div class="detail_thum">
							<p>
								<img src="${root }${placeBoard.place_photo}" width="255"
									height="170" alt="" />
							</p>

							<ul>
								<li><button type="button"
										onclick="savePlace('${root}','${id}','${placeBoard.place_code}')"
										style="margin-bottom: 21px;"></button></li>
							</ul>
						</div>
						<div class="detail_info">
							<div class="place_info">
								<div class="date_title">
									<dl>
										<dt>${placeBoard.place_name}</dt>
										<dd></dd>
									</dl>
								</div>

								<div class="detail_content">
									<ul class="place_detail">
										<li><b>주소</b> <span>${placeBoard.place_location}</span></li>
										<li><b>전화번호</b> <span>${placeBoard.place_phone}</span></li>
										<li><b>운영시간</b> <span>${placeBoard.place_runtime}</span>
										</li>

										<li><b>예산(2인)</b> <span class="red">${placeBoard.place_price}원</span>
										</li>
									</ul>

									<ul class="place_grade">
										<li><c:if test="${placeBoard.place_star==0}">
												<img src="${root}/resources/star/00.png" width="120"
													height="25" style="margin: 0px 0px 0px 52px;" />
											</c:if> <c:if
												test="${placeBoard.place_star>0 && placeBoard.place_star<=0.5}">
												<img src="${root}/resources/star/05.png" width="113"
													height="22" />
											</c:if> <c:if
												test="${placeBoard.place_star>0.5 && placeBoard.place_star<=1}">
												<img src="${root}/resources/star/10.png" width="113"
													height="22" />
											</c:if> <c:if
												test="${placeBoard.place_star>1 && placeBoard.place_star<=1.5}">
												<img src="${root}/resources/star/15.png" width="113"
													height="22">
											</c:if> <c:if
												test="${placeBoard.place_star>1.5 && placeBoard.place_star<=2}">
												<img src="${root}/resources/star/20.png" width="113"
													height="22" />
											</c:if> <c:if
												test="${placeBoard.place_star>2 && placeBoard.place_star<=2.5}">
												<img src="${root}/resources/star/25.png" width="113"
													height="22" />
											</c:if> <c:if
												test="${placeBoard.place_star>2.5 && placeBoard.place_star<=3}">
												<img src="${root}/resources/star/30.png" width="113"
													height="22" />
											</c:if> <c:if
												test="${placeBoard.place_star>3 && placeBoard.place_star<=3.5}">
												<img src="${root}/resources/star/35.png" width="113"
													height="22" />
											</c:if> <c:if
												test="${placeBoard.place_star>3.5 && placeBoard.place_star<=4}">
												<img src="${root}/resources/star/40.png" width="113"
													height="22" />
											</c:if> <c:if
												test="${placeBoard.place_star>4 && placeBoard.place_star<=4.5}">
												<img src="${root}/resources/star/45.png" width="113"
													height="22" />
											</c:if> <c:if
												test="${placeBoard.place_star>4.5 && placeBoard.place_star<=5}">
												<img src="${root}/resources/star/50.png" width="113"
													height="22" />
											</c:if></li>

										<li class="grade"><span>${placeBoard.place_star}</span></li>
										<li><input type="button" value="평가하기"
											class="button gray bigrounded" onclick="focusScript()" /></li>
									</ul>
								</div>

								<div class="place_account2" style="font-weight: bold">
									<p class="account1">${placeBoard.place_content}</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="section_2">
					<div class="date_detail_tab">
						<div class="date_tab">
							<ul>
								<li class="tab2"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div></div>
		<br />
		<div class="replyDivp">
			<c:if test="${nickName!=null}">
				<div style="float: left">
					<span style="color: #f00; font-weight: bold">평점</span>&nbsp; <select
						id="starReply" style="font-weight: bold; height: 20px">
						<option style="font-weight: bold; height: 20px">선택하세요</option>
						<option value="10">1</option>
						<option value="20">2</option>
						<option value="30">3</option>
						<option value="40">4</option>
						<option value="50">5</option>
					</select>
					<textarea id="writeReply" cols="87" rows="3"></textarea>
					<input type="button" value="댓글달기" class="button gray medium"
						onclick="writeToServer('${root}','${placeBoard.place_code}','${nickName}','${id}')" />
				</div>
			</c:if>

			<c:if test="${nickName==null}">
				<div style="float: left">
					<span style="color: #f00; font-weight: bold">평점</span>&nbsp; <select
						id="starReply" style="font-weight: bold; height: 20px">
						<option style="font-weight: bold; height: 20px">선택하세요</option>
						<option value="10">1</option>
						<option value="20">2</option>
						<option value="30">3</option>
						<option value="40">4</option>
						<option value="50">5</option>
					</select>
					<textarea cols="87" rows="3" disabled="disabled">로그인 후 댓글작성 및 평가가 가능합니다.</textarea>
					<input type="button" value="댓글달기" class="button gray medium" />
					
				</div>
			</c:if>
		</div>

		<div id="container">
			<div id="content" style="margin-left: 16%;">
				<div id="entry19Trackback" style="display: block">
					<div class="trackback">
						<h3>
							<span id="TrackbackCopyHolder19"
								style="vertical-align: -4px; margin-left: 1px"></span>
						</h3>
					</div>
				</div>

				<div class="commentList">
					<c:forEach var="reviewList" items="${reviewList}">
						<div class="replyDiv" id="${reviewList.review_code}">
							<div id="entry19Comment" style="display: block;">
								<div class="comment">
									<ol>
										<li id="comment294493">
											<div class="rp_general">
												<div class="name">${reviewList.review_id}</div>
												<div class="date">
													<span> <fmt:formatDate
															value="${reviewList.review_date}" />
													</span>

													<c:if test="${nickName==reviewList.review_id}">
														<span> <a
															href="javascript:modifyReply('${reviewList.review_code}','${root}')">수정</a>
															<a
															href="javascript:deleteToServer('${reviewList.review_code}','${root}')">삭제</a>
														</span>
													</c:if>
												</div>

												<div class="reply">${reviewList.review_content}</div>
											</div>
											<div id="${reviewList.review_code}_content"
												style="display: none;">
												<textarea rows="3" cols="80" id="writeReply">${reviewList.review_content}</textarea>
												<input type="button" value="수정하기" class="button2 gray small"
													onclick="updateToServer('${root}','${reviewList.review_code}')" />
												<input type="button" value="수정취소" class="button2 gray small"
													onclick="updateCencelServer('${reviewList.review_code}')" />
											</div>
										</li>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div><br/>
			<button id="moreComment" onclick="moreComment()" style="display: none;">댓글 더 보기</button>
			<div id="apple" style="width:800px; height:150px;">
			</div><br/><br/><br/>		
			<jsp:include page="/Bottom.jsp" />
		</div>
	</div>
</body>
</html>
