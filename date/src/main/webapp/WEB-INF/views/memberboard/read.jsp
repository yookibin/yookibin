<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<script type="text/javascript" src="${root }/css/board/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<script type="text/javascript">
	function deleteFun(root, board_num, pageNumber, memberLevel){
		var url=root + "/memberboard/delete.do?board_num="+board_num+"&pageNumber="+pageNumber+"&memberLevel="+memberLevel;
		//alert(url);
		location.href=url;
	}
	
	function updateFun(root, board_num, pageNumber){
		var url=root + "/memberboard/update.do?board_num="+board_num+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
/* 	$(document).ready(function(){
	    $("#replyView").click(function(){
	        $("#commentList").toggle();
	        $(".replyWrite").toggle();
	    });
	});
	 */
</script>

<script>
	// 댓글 더보기 기능. 가져오기 
	var commentCount=("${memberReplyList.size()}"); // 일단 댓글 개수를 가져온다.
	 alert(commentCount);
	
	$(document).ready(function () {
		
		if (commentCount > 5) {	// 댓글개수가 5개보다 크면
			$("#moreComment").show();	
			 for (i=6;i<=commentCount; i++){$("#commentList>.replyDiv:nth-child("+i+")").hide()};	// 5이상 댓글들을 숨긴다.
		};
	});
	
	var moreCount=0	// 더보기 눌렀을때 카운트를 증가시키기위한 가져올 댓글 번호를 뿌려주기 위한 변수. 
	
	function moreComment(){
		moreCount++;
		for (i=1;i<=5; i++){$("#commentList>.replyDiv:nth-child("+(moreCount*5+i)+")").show()};	// 숨긴 댓글들을 5개씩 보여주기 .
		if (((moreCount+1)*5) > commentCount){$("#moreComment").hide()};	// (moreCount+1)*5 한 것보다 commentCount값이 작다면 더이상 보여줄게 없다는 것이므로 버튼 숨김.
	}
</script>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 읽기</title>
	<link rel="stylesheet" type="text/css" href="${root }/css/board/style.css">
	<link type="text/css" rel="stylesheet" href="${root}/css/reviewBoard/style.css" />
</head>
<body>




<jsp:include page="/youAndITop.jsp"/><br/>
	<div style="width:1200px; height:1200px; margin-left:auto; margin-right:auto;" >
		<div id="wrapbody">
			<div id="wrap">
				<div class="section_1">
					<div class="col-lg-12">
						<div class="line5">
							
							<div class="centers" >
								<span id="readTitle">${memberBoard.board_title }</span>
							</div>
							
							<div class="centers">
								
								<span style="widows:30%">${memberBoard.board_writer }ㅣ</span>
								
								<span><fmt:formatDate value="${memberBoard.board_date }" type="date"/>ㅣ</span>
								<span>조회수</span>
								<span>${memberBoard.board_count }</span>
							</div>
						</div>	
						<div class="line2">
								<span>${memberBoard.board_content }</span>
						</div>
					</div>
				</div>
			
		
				<div class="section_2">
					<div class="date_detail_tab2">
			        	<div class="date_tab">
							<ul>
								<li class="tab2"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
		
		<div class="replyDivp">
			<c:if test="${nickName!=null}">
				<div style="float: left">
					<textarea class="writeReply" cols="100" rows="3"></textarea> 
					<input type="button" value="댓글달기" class="button gray medium" onclick="writeReply('${root}','${memberBoard.board_num}', '${nickName}')" />
				</div>
			</c:if>
	
			<c:if test="${nickName==null}">
				<div style="float: left">
					<textarea cols="100" rows="3" disabled="disabled">로그인 후 댓글작성이 가능합니다.</textarea> 
					<input type="button" value="댓글달기" class="button gray medium" />
				</div>
			</c:if>
		</div>
		
		<div id="container">
   <div id="content"  style="margin-left: 16%;">
      <div id="entry19Trackback" style="display:block">
         <div class="trackback">
            <h3>
               <span id="TrackbackCopyHolder19" style="vertical-align: -4px; margin-left: 1px"></span>
            </h3>
         </div>
      </div>
      
      <div class="commentList">
      
     	<div class="replyDivs" style="display:none;">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span>
				<a href=""></a>&nbsp;
				<a href=""></a>
			</span>
		</div>
      
      <c:forEach var="memberReplyList" items="${memberReplyList}">
         <div class="replyDiv" id="${memberReplyList.reply_num}">
            <div id="entry19Comment" style="display:block;">
                  <div class="comment">
                     <ol>
                        <li id="comment294493">
                           <div class="rp_general">
                              <div class="name">${memberReplyList.reply_writer}</div>
								<div class="date">
									<span>
										<fmt:formatDate value="${memberReplyList.reply_time }" type="date" pattern="yyyy/MM/dd hh:mm"/>
									</span>
									
									<c:if test="${nickName==memberReplyList.reply_writer }">
										<a href="javascript:updateReply('${memberReplyList.reply_num}','${root}')">수정</a>
										<a href="javascript:deleteReply('${memberReplyList.reply_num}','${root}')">삭제</a>
									</c:if>
								</div>
							
								<div class="reply">
									${memberReplyList.reply_content}
								</div>
                        </div>
                     </li>
                  </div>
               </div>
            </div>
      </c:forEach>
      </div>
   </div> 
      <button id="moreComment" onclick="moreComment()" style="display:none">댓글 더 보기 </button>
   </div>
		
		<%-- <div id="container">
		<div id="content" >
			<div id="entry19Trackback">
				<div class="trackback">
					<h3>
						<span id="TrackbackCopyHolder19" style="vertical-align: -4px; margin-left: 1px"></span>
					</h3>
				</div>
			</div>
		<div class="commentList">	
			<c:forEach var="memberReplyList" items="${memberReplyList}">
					<div class="replyDiv" id="${memberReplyList.reply_num}">
						<div class="comment">
								<ol>
									<li id="comment294493">
										<!-- <div class="rp_general"> -->
										<div class="entry19Comment" >
											<div class="name">${memberReplyList.reply_writer}</div>
											<div class="date">
												<span>
													<fmt:formatDate value="${memberReplyList.reply_time }" type="date" pattern="yyyy/MM/dd hh:mm"/>
												</span>
												
												<c:if test="${nickName==memberReplyList.reply_writer }">
													<a href="javascript:updateReply('${memberReplyList.reply_num}','${root}')">수정</a>
													<a href="javascript:deleteReply('${memberReplyList.reply_num}','${root}')">삭제</a>
												</c:if>
											</div>
										
											<div class="reply">
												${memberReplyList.reply_content}
											</div>
										<!-- </div> -->
										</div>
									</li>
								</ol>
							</div>
						</div>
			</c:forEach>
			<button id="moreComment" onclick="moreComment()" style="display:none">댓글 더 보기 </button>
			</div>
			</div> 
			
		</div>
	</div> --%>

</body>
</html>