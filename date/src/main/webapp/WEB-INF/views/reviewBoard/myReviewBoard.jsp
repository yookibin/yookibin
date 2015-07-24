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
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script type="text/javascript">
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
</script>
<title>Insert title here</title>
</head>
<body>
	<%--    
   <c:forEach var="reviewList" items="${myReviwBoard}">
   ${reviewBoard.review_code}
   
   <div class="place_account2" style="font-weight: bold">
      <p class="account1">${reviewBoard.review_content}</p>
   </div>
   
   ${reviewBoard.review_id }
   ${reviewBoard.review_date}
   
   
   </c:forEach>
 --%>
	<div
		style="width: 1100px; height: auto; margin-left: auto; margin-right: auto;">
		<jsp:include page="/TOP.jsp"/><br/>
		<div id="container" style="width:400px; margin-top:70px;">
			<div id="content" style="margin-left: 16%;">
				<div>
					<span style="font-family: Malgun Gothic;"><h1>내가 쓴 댓글</h1></span>
				</div>
				<div class="commentList">
					<c:forEach var="reviewList" items="${myReviwBoard}">
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
			</div>
		</div>
	</div>
</body>
</html>