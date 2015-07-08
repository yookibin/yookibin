/**
 * 
 */
function writeToServer(requestRoot, place_code, nickName) {
/*	alert(requestRoot);
	alert($("#starReply").val());
	alert(place_code);
	alert($("#writeReply").val());*/
	
	$.ajax({
		url : requestRoot + "/reviewBoard/insertReview.do",
		type : "post",
		data : {
			star : $("#starReply").val(),
			place_code : place_code,
			nickName : nickName,
			writeReply : $("#writeReply").val()
		},
		success : function(data) {
			if(data==1){
				alert("입력 되었습니다.");
				location.reload();
			}
		}
	});
}