function registerForm(form){
	/*if(check==false){
		alert("하나라도 체크하세요.");
		form.interestValue[0].focus();
		return false;
	}*/
	
	if($("input[name='id']").val()==""){
		alert("아이디를 입력하세요.");
		$("input[name='id']").focus();
		return false;
	}
	
	if($("input[name='password']").val()==""){
		alert("비밀번호를 입력하세요.");
		$("input[name='password']").focus();
		return false;
	}
	var str="";
	if($("select[name='year']").val()!=""||$("select[name='month']").val()!=""||$("select[name='day']").val()!=""){
		//alert(form.year.value);
		str+=form.year.value+"-"+form.month.value+"-"+form.day.value;
		$("input[name='birthday']").attr("value", str);
	}
	
	
	
}

function idCheck(form, root){
	
	if($("input[name='id']").val()==""){
		alert("아이디를 입력하세요.");
		$("input[name='id']").focus();
		return false;
	}
	
	var url=root+"/member/idCheck.do?id=" + form.id.value;
	window.open(url,"","width=250, height=150"); //jqueryUI dialog이용하면됨.
	//alert(form.id.value +"," + root);
}

function nickNameCheck(form, root){
	
	if($("input[name='nickName']").val()==""){
		alert("닉네임을 입력하세요.");
		$("input[name='nickName']").focus();
		return false;
	}
	
	var url=root+"/member/nickNameCheck.do?nickName="+form.nickName.value;
	window.open(url,"","width=250, height=150"); //jqueryUI dialog이용하면됨.
	//alert(form.id.value +"," + root);
}

function zipcodeCheck(form, root){
	//alert(form.zipcode.value +","+ root);
	var url=root+"/member/zipcodeCheck.do";
	//alert(url);
	window.open(url,"","width=500, height=500");
	
	
}

function sendAddress(zipcode, sido, gugun, dong, ri, bunji){
	var address=sido+gugun+dong+ri+bunji;
	//alert(zipcode+"\n"+address);
	
	//opener.memberForm.zipcode.value=zipcode;
	//opener.memberForm.address.value=address;
	$(opener.document).find("input[name='zipcode']").val(zipcode);
	$(opener.document).find("input[name='addr']").val(address);
	self.close();
}







