function registerForm(form){
	/*if(check==false){
		alert("하나라도 체크하세요.");
		form.interestValue[0].focus();
		return false;
	}*/
	
	if($("input[name='id']").val()==""){
		//alert("아이디를 입력하세요.");
		//alertify.alert("아이디를 입력하세요");
		swal({ 
			  title: "warning!",
			  text: "아이디를 입력하세요.",
			  type: "warning" 
			 });
		
		$("input[name='id']").focus();
		return false;
	}
	
	if($("input[name='pw']").val()==""){
		//alertify.alert("비밀번호를 입력하세요");
		swal({ 
			  title: "warning!",
			  text: "비밀번호를 입력하세요.",
			  type: "warning" 
			 });
		$("input[name='pw']").focus();
		return false;
	}
	
	if($("input[name='pw']").val()!=$("input[name='passwordCheck']").val()){
		//alertify.alert("비밀번호를 확인하세요.");
		//alert("pw: "+$("input[name='pw']").val()+"  passwordCheck: "+$("input[name='passwordCheck']").val())
		swal({ 
			  title: "warning!",
			  text: "비밀번호를 확인하세요.",
			  type: "warning" 
			 });
		$("input[name='passwordCheck']").val("");
		$("input[name='passwordCheck']").focus();
		return false;
	}
	
	if($("input[name='nickName']").val()==""){
		//alertify.alert("닉네임을 입력하세요.");
		swal({ 
			  title: "warning!",
			  text: "닉네임을 입력하세요.",
			  type: "warning" 
			 });
		$("input[name='nickName']").focus();
		return false;
	}
	
	if($("input[name='age']").val()==""){
		//alertify.alert("나이를 입력하세요.");
		swal({ 
			  title: "warning!",
			  text: "나이를 입력하세요.",
			  type: "warning" 
			 });
		$("input[name='age']").focus();
		return false;
	}
	
	if($("input[name='phone']").val()==""){
		//alertify.alert("전화번호를 입력하세요.");
		swal({ 
			  title: "warning!",
			  text: "전화번호를 입력하세요.",
			  type: "warning" 
			 });
		$("input[name='phone']").focus();
		return false;
	}
	
	if($("select[name='year']").val()==""||$("select[name='month']").val()==""||$("select[name='day']").val()==""){
		//alertify.alert("생년월일을 입력하세요.");
		swal({ 
			  title: "warning!",
			  text: "생년월일을 입력하세요.",
			  type: "warning" 
			 });
		$("select[name='year']").focus();
		return false;
	}
	
	var str="";
	if($("select[name='year']").val()!=""&&$("select[name='month']").val()!=""&&$("select[name='day']").val()!=""){
		//alert(form.year.value);
		str+=form.year.value+"-"+form.month.value+"-"+form.day.value;
		//alert("birthday: "+str)
		$("input[name='birthday']").attr("value", str);
	}
	
	if($("input[name='zipcode']").val()==""){
		//alertify.alert("우편번호를 입력하세요.");
		swal({ 
			  title: "warning!",
			  text: "우편번호를 입력하세요.",
			  type: "warning" 
			 });
		$("input[name='zipcode']").focus();
		return false;
	}
	
	if($("input[name='addr']").val()==""){
		//alertify.alert("주소를 입력하세요.");
		swal({ 
			  title: "warning!",
			  text: "주소를 입력하세요.",
			  type: "warning" 
			 });
		$("input[name='addr']").focus();
		return false;
	}
	
}

function idCheck(form, root){
	//alert($("input[name='id']").val());
	//alert(form.id.value);
	if($("input[name='id']").val()==""){
		/*alert("아이디를 입력하세요.");*/
		//alertify.alert("아이디를 입력하세요");
		swal({ 
			  title: "warning!",
			  text: "아이디를 입력하세요.",
			  type: "warning" 
			 });
		$("input[name='id']").focus();
		return false;
	}
	
	var url=root+"/member/idCheck.do?id="+form.id.value;
	window.open(url,"","width=400, height=200"); //jqueryUI dialog이용하면됨.
	//alert(form.id.value +"," + root);
}

function nickNameCheck(form, root){
	
	if($("input[name='nickName']").val()==""){
		//alertify.alert("닉네임을 입력하세요.");
		swal({ 
			  title: "warning!",
			  text: "닉네임을 입력하세요.",
			  type: "warning" 
			 });
		$("input[name='nickName']").focus();
		return false;
	}
	
	var url=root+"/member/nickNameCheck.do?nickName="+form.nickName.value;
	window.open(url,"","width=400, height=200"); //jqueryUI dialog이용하면됨.
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







