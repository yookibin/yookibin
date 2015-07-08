/**
 * 
 */
function deleteToServer(review_code,requestRoot){
/*	alert(review_code);
	alert("root:"+requestRoot);*/
	
	$.ajax({
		url : requestRoot + "/reviewBoard/deleteReview.do",
		type : "post",
		data : {
			review_code : review_code,
		},
		
		success : function(data) {
			console.log(data);
			
			alert("삭제하시겠습니까?");
			$("#"+review_code).remove();
		}
	});
}