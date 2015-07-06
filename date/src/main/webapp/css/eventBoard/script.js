function checkForm(eventBoardForm){
	
	//alert(eventBoardForm.event_period.value);
	var d=eventBoardForm.event_period.value.split("~");
	if(d.length!=2){
		alert("이벤트 시작 날짜~이벤트 종료 날짜 형식으로 입력하세요.");
		eventBoardForm.event_period.focus();
		return false;
	}
	
	// month 테이블
	var mt=new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	
	// 오늘 데이트 객체
	var now=new Date();
	var Y=now.getYear(); // 년
	var M=now.getMonth() + 1; // 월
	var D=now.getDate(); // 일
	//alert("Y: "+Y);
	
	var lim=new Array(9999, 12, 31); // 일,월,년도 한계범위설정
	var lim_=new Array('년도', '월일', '일자'); // 일원년의 표기 스트링
	var lim__=new Array(4, 2, 2); // 일,월,년의 유효길이
	
	var a=new Array(); // 정수화 포맷을 담을 배열
	
	for(var k=0;k<2;k++){ 
		//alert("d[k]: "+d[k]);
		var tmp = d[k].trim().split("-"); // -로 나누어 배열로 담는다.
		if (tmp.length != 3) { // 배열의 길이가 유효한지 확인.
			alert("유효하지 않은 날짜포맷입니다\nyyyy-mm-dd 형식으로 넣어주세요");
			eventBoardForm.event_period.focus();
			return false;
		}else{
			a[0] = parseInt(tmp[0]); // 년을 정수화하여 담는다.
			//alert("a[0]: "+a[0]);
			a[1] = parseInt(tmp[1]); // 월
			a[2] = parseInt(tmp[2]); // 일
			for(var i in a) { // 배열의 길이만큼 루프를 돈다.
				if (a[i] < 0 || a[i] > lim[i] || tmp[i].length != lim__[i]) { // 일,월,년도별 유효성 체크
					alert(lim_[i] + "를 제대로 입력해 주세요");
					eventBoardForm.event_period.focus();
					return false;
				}
			}
			if(mt[a[1] - 1] < a[2]) { // 월별 요일의 범위체크
				alert("일자의 범위가 틀립니다.");
				eventBoardForm.event_period.focus();
				return false;
			}
			//alert(a); // 걸러진것만 출력
		}
	}
	
	//------------------------------------------------------------------------------------
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	
	//------------------------------------------------------------------------------------
	if(eventBoardForm.writer.value==null||eventBoardForm.writer.value==""){
		alert("작성자를 입력하세요.");
		eventBoardForm.writer.focus();
		return false;
	}
	
	if(eventBoardForm.event_title.value==null||eventBoardForm.event_title.value==""){
		alert("제목을 입력하세요.");
		eventBoardForm.event_title.focus();
		return false;
	}
	
/*	if(eventBoardForm.event_content.value==null||eventBoardForm.event_content.value==""){
		alert("내용을 입력하세요.");
		eventBoardForm.event_content.focus();
		return false;
	}*/
	
	if(eventBoardForm.event_point.value==null||eventBoardForm.event_point.value==""){
		alert("차감 포인트를 입력하세요.");
		eventBoardForm.event_point.focus();
		return false;
	}
	
	if(eventBoardForm.event_giveaway.value==null||eventBoardForm.event_giveaway.value==""){
		alert("이벤트 경품을 입력하세요.");
		eventBoardForm.event_giveaway.focus();
		return false;
	}
	
}

function updateFun(updateForm){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
}
/*
function enterFun(enterForm){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
}*/

function deleteCheck(deleteForm){

}