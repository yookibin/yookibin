<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 등록하기</title>
<script type="text/javascript" src="${root }/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="${root }/css/eventBoard/script.js"></script>
<link href="${root }/css/eventBoard/style.css" rel="stylesheet"/>
<script src="${root }/css/alertify.js-0.3.11/lib/alertify.min.js"></script>
<link rel="stylesheet" href="${root }/css/alertify.js-0.3.11/themes/alertify.core.css"/>

<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css">
<script type="text/javascript">
	function eventReset(){
		history.back(-1);
	}
</script>
</head>
<body>
<div class="totalDiv">

	<jsp:include page="/TOP.jsp"/>
	<br/><br/>
	
	<form class="form_style"  action="${root }/eventBoard/write.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<input type="hidden" name="event_code" value="${event_code}"/>
		<input type="hidden" name="group_number" value="${group_number}"/>
		<input type="hidden" name="sequence_number" value="${sequence_number}"/>
		<input type="hidden" name="sequence_level" value="${sequence_level}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<input type="hidden" name="writer" value="${nickName }"/>
	
		<div class="line3" style="height:80px;">
			<span>
				<h1>이벤트 글쓰기 </h1>
			</span>
		</div>
		
		<div class="line5">
			<p class="orangeLine"></p>
		</div>
		
		<div class="line">
			<label class="title">이벤트 기간</label>
			<c:if test="${event_code==0 }">
				<span class="content"><input type="text" size="50" name="event_period"/></span>	
			</c:if>
			<c:if test="${event_code!=0 }">
				<span class="content"><input type="text" size="50" name="event_period" value="${eventBoard.event_period }"/></span>
			</c:if>					
		</div>
		
		<div class="line">
			<label class="title">이벤트 제목</label>
			<c:if test="${event_code==0 }">
				<span class="content"><input type="text" size="50" name="event_title"/></span>
			</c:if>
			<c:if test="${event_code!=0 }">
				<span class="content"><input type="text" size="50" name="event_title" value="[당첨자 발표] ${eventBoard.event_title }"/></span>
			</c:if>
						
		</div>
		
		<div class="line" style="height:510px;">
		
			<c:if test="${event_code==0 }">
				<span>
					<textarea name="event_content" id="ir1" rows="22" style="width:645px;"></textarea>
				</span>
			</c:if>
			<c:if test="${event_code!=0 }">
				<span>
					<textarea name="event_content" id="ir1" rows="22" style="width:645px;">
글번호  아이디  닉네임			<br/>		
						<c:forEach var="winner" items="${winnerList }">
${winner.join_code}      ${winner.id }        ${winner.join_writer }<br/>
						</c:forEach>
					</textarea>
				</span>
			</c:if>
		</div>
		
		<div class="line">
			<label class="title">차감 포인트</label>
			<c:if test="${event_code==0 }">
				<span class="content"><input type="text" size="50" name="event_point"/></span>
			</c:if>
			<c:if test="${event_code!=0 }">
				<span class="content"><input type="text" size="50" name="event_point" value="${eventBoard.event_point }"/></span>
			</c:if>						
		</div>
		
		<div class="line" style="height:40px">
			<label class="title">이벤트 경품</label>
			<c:if test="${event_code==0 }">
				<span class="content"><input type="text" size="50" name="event_giveaway"/></span>
			</c:if>		
			<c:if test="${event_code!=0 }">
				<span class="content"><input type="text" size="50" name="event_giveaway" value="${eventBoard.event_giveaway }"></span>
			</c:if>				
		</div>
		
		<div class="line5">
			<p class="orangeLine"></p>
		</div>
							
		<div class="line" style="width:641px; border-width:0px; text-align:center;">
			<input type="submit" class="btn btn-warning" value="글쓰기"/>
			<input type="reset" class="btn btn-warning" onclick="eventReset()" value="취소"/>
			<input type="button" class="btn btn-warning" value="목록보기" onclick="location.href='${root}/eventBoard/list.do'"/>
		</div>
		
	</form>
		
</div>
</body>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1", //textarea ID
    sSkinURI: "${root}/SmartEditor2Skin",
    htParams : {
      bUseToolbar : true,	// 툴바 사용 여부 (true:사용/ false:사용하지 않음[default:true] )
      bUseVerticalResizer : true,	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음[default:true])
      bUseModeChanger : true	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음[default:true])
    },
    //Editor 로딩이 완료된 후 처리될 내용 ex) 수정시 입력한글 내용 삽입가능
    fOnAppLoad : function(){
       //예제 코드
       //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
    },
    fCreator: "createSEditor2"
});
</script>
</html>