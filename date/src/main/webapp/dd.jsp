<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="board_boarder">
		<div class="board_title_list yaja_board_text">
			<h3>이벤트 게시판</h3>
		</div>
		
		<div class="board_read">
			<div class="borad_read_title">
				<p class="read_title">${글 제목}</p>
				<ul>
					<li>
						<span>${글쓴이}</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${날짜}</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${조회수}</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${차감포인트}</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${경품}</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${진행상황}</span>
						<span class="read_bar">|</span>
					</li>
				</ul>
			
			</div>
			<div class="board_read_content">
				${글내용 }
			</div>
			<div class="board_nav">
				<ul>
					<li>
						<button type="button" class="" onclick="">
							<span>참가하기</span>
						</button>
					</li>
					<li>
						<button type="button" class="" onclick="">
							<span>글목록</span>
						</button>
					</li>
				</ul>
				<p>
					<button type="button" class="" onclick="">
						<span>글수정</span>
					</button>
					<button type="button" class="" onclick="">
						<span>글삭제</span>
					</button>
					<button type="button" class="" onclick="">
						<span>응모회원관리</span>
					</button>
				</p>
			</div>
		</div>
		
	</div>
</body>
</html>