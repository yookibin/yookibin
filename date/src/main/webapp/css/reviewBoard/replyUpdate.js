/**
 * 
 */
function upSelectToServer(review_code,requestRoot){
	
	$.ajax({
		url : requestRoot + "/reviewBoard/updateReview.do",
		type : "post",
		data : {
			review_code : review_code,
		},
		
		success : function(data) {
			console.log(data);
			
		}
	});
}