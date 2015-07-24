/**
 * 
 */
function deleteToServer(review_code, requestRoot, review_id, nickName) {
	/*
	 * alert(review_code); alert("root:"+requestRoot);
	 */
	
	swal({
		title : "Delete",
		text : "정말로 삭제할까요?",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "예",
		cancelButtonText : "아니요",
		closeOnConfirm : false,
		closeOnCancel : false
	}, function(isConfirm) {
		if (isConfirm) {
			swal("GOOD!", "삭제가 완료 되었습니다.", "success");

			$.ajax({
				url : requestRoot + "/reviewBoard/deleteReview.do",
				type : "post",
				data : {
					review_code : review_code,
				},

				success : function(data) {
					console.log(data);
				}
			});
			
			$("#" + review_code).remove();
		} else {
			swal("BAD", "삭제가 취소 되었습니다.", "error");
		}
	});
}