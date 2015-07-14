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
	function deleteFun(root, board_num, pageNumber){
		var url=root + "/memberboard/delete.do?board_num="+board_num+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	function updateFun(root, board_num, pageNumber){
		var url=root + "/memberboard/update.do?board_num="+board_num+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	$(document).ready(function(){
	    $("#replyView").click(function(){
	        $("#replyAll").toggle();
	        $(".replyWrite").toggle();
	    });
	});
	

</script>

<script>
	// 댓글 더보기 기능. 가져오기 
	var commentCount=("${memberReplyList.size()}"); // 일단 댓글 개수를 가져온다.
	 alert(commentCount);
	
	$(document).ready(function () {
		
		if (commentCount > 5) {	// 댓글개수가 5개보다 크면
			$("#moreComment").show();	
			 for (i=6;i<=commentCount; i++){$("#replyAll>.replyDiv:nth-child("+i+")").hide()};	// 5이상 댓글들을 숨긴다.
		};
	});
	
	var moreCount=0	// 더보기 눌렀을때 카운트를 증가시키기위한 가져올 댓글 번호를 뿌려주기 위한 변수. 
	
	function moreComment(){
		moreCount++;
		for (i=1;i<=5; i++){$("#replyAll>.replyDiv:nth-child("+(moreCount*5+i)+")").show()};	// 숨긴 댓글들을 5개씩 보여주기 .
		if (((moreCount+1)*5) > commentCount){$("#moreComment").hide()};	// (moreCount+1)*5 한 것보다 commentCount값이 작다면 더이상 보여줄게 없다는 것이므로 버튼 숨김.
	}
</script>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 읽기</title>
	<link rel="stylesheet" type="text/css" href="${root }/css/board/style.css">
</head>
<body>
	<div class="line1">
		<div class="centers">
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
		<div style="text-align:center;">	
			<span id="board_recom">${memberBoard.board_recom}</span>
			<input type="button"  value="추천" id="recom_button" onclick="recommend('${root }', '${memberBoard.board_num}', '${memberBoard.board_recom}', '${pageNumber}', '${nickName}', '${id }')"/><br/>
		
			<c:if test="${memberBoard.board_writer==nickName}">
				<input type="button" value="글수정" onclick="updateFun('${root}','${memberBoard.board_num }', '${pageNumber}')" />
				<input type="button" value="글삭제" onclick="deleteFun('${root}','${memberBoard.board_num }', '${pageNumber}')"/>
			</c:if>
			
			<span>
				<input type="button" id="replyView" value="댓글보기"/><br/>
				<input type="text" name="reply_content" class="replyWrite" id="reply" style="display:none;"/>
				<input type="button" value="댓글작성" class="replyWrite" onclick="writeReply('${root}','${memberBoard.board_num}', '${nickName}')" style="display:none;"/>
			</span>
			
		
			
			<input style="margin-left:60%" type="button" align="middle" value="글목록" onclick="location.href='${root}/memberboard/list.do?pageNumber=${pageNumber}'"/>
			<%-- <input type="button" value="글목록" onclick="location.href='${root}/memberboard/list.do'"/> --%>
			
		</div>
		<div id="replyAll" style="display:none;">
			
			
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
			
	
			<c:forEach var="memberReplyList" items="${memberReplyList}" begin="${startRow }" step="1">
			
				<div class="replyDiv" id="${memberReplyList.reply_num}" style="display:block;">
					<span>${memberReplyList.reply_num}</span>
					<span>${memberReplyList.reply_content}</span>
					<span>${memberReplyList.reply_writer}</span>
					<span>${memberReplyList.reply_time}</span>
					<%-- <fmt:formatDate value="${memberReplyList.reply_time }" type="date"/> --%>
					<c:if test="${nickName==memberReplyList.reply_writer }">
						<a href="javascript:updateReply('${memberReplyList.reply_num}','${root}')">수정</a>
						<a href="javascript:deleteReply('${memberReplyList.reply_num}','${root}')">삭제</a>
					</c:if>
				</div>
			</c:forEach>
			
			
			<input type="button" id="moreComment" onclick="moreComment()" style="display:none;" value="댓글 더 보기"/>
		</div>

</body>
</html>