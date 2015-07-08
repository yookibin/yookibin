<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 글쓰기</title>
	<script type="text/javascript" src="${root}/css/board/script.js"></script>
	<link rel="stylesheet" type="text/css" href="${root}/css/board/style.css"/>
	
	<!-- 에디터 -->
	<script type="text/javascript" src="${root }/smarteditor/js/HuskyEZCreator.js"></script>
	
</head>
<body>
	${nickName}
	<form class="form_style"  action="${root }/memberboard/writeOk.do"  method="post" onsubmit="return doPost()" enctype="multipart/form-data">	
		<%-- <input type="hidden" name="boardNumber" value="${boardNumber}"/> --%>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<input type="hidden" name="board_writer" value="${nickName}"/>
			
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/board/list.do">글목록</a>
		</div>
			
		
		
		<div class="line">
			<label class="title">제목</label>
				<span class="content"><input type="text" size="50" name="board_title"/></span>
		</div>
		
		
		<div class="line" style="height:400px;">
			<span class="content" style="height:230px; width:700px;">
				<textarea name="board_content" id="content" rows="22" style="width:650px;"></textarea>
			</span>
		</div>
		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="확인"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/memberboard/list.do'"/> 
		</div>
	</form>
</body>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content", //textarea ID
    sSkinURI: "${root}/SmartEditor2Skin",
    htParams : {
      bUseToolbar : true,	// 툴바 사용 여부 (true:사용/ false:사용하지 않음[default:true] )
      bUseVerticalResizer : true,	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음[default:true])
      bUseModeChanger : true	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음[default:true])
    },
    //Editor 로딩이 완료된 후 처리될 내용 ex) 수정시 입력한글 내용 삽입가능
    fOnAppLoad : function(){
       //예제 코드
       	
       //oEditors.getById["bbsContent"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
    },
    fCreator: "createSEditor2"
});

function doPost()
{
	//에디터의 내용을 실제 Textarea로 가져옴
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);

	submit();
}

</script>
</html>