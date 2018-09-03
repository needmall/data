var loginCustomerId = "";
var loginSellerId = "";
$(function(){
	errorCodeCheck();
	emailCheck();

	var message = ["기존 비밀번호를 입력해 주세요.",
		"영문,숫자,특수문자만 가능. 8 ~ 15자 입력해 주세요.",
		"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.","","","","", "- 포함 입력해주세요. 예시) 010-0000-0000","-포함 입력해주세요.","-포함 입력해주세요. 예시)123-12-12345"];
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});

	// customer
	$('#c_opwd, #c_pwd, #c_pwdCheck, #c_cell').bind("focus",function(){
		var idx = $('#c_opwd, #c_pwd, #c_pwdCheck, #c_cell').index(this);
		//	console.log("대상 : "+ idx );
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	// seller
	$('#s_opwd, #s_pwd, #s_pwdCheck, #s_cell').bind("focus",function(){
		var idx = $('#s_opwd, #s_pwd, #s_pwdCheck, #s_cell').index(this);
		//	console.log("대상 : "+ idx );
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});

	/* customer 수정폼에서 확인 버튼 클릭 시 처리 이벤트 */
	$("#customerModify").click(function(){
		//	입력값 체크
		if (!formCheck($('#c_opwd'), $('.error:eq(0)'), "기존 비밀번호를")) return;
		else if (!inputVerify(1,'#c_opwd', '.error:eq(0)')) return;
		//else if (!formCheck($('#sample6_postcode'), $('.error:eq(5)'), "우편번호를")) return;
		else if (!formCheck($('#sample6_address2'), $('.error:eq(4)'), "상세주소를")) return;
		else if (!formCheck($('#c_mailName'), $('.error:eq(5)'), "이메일 주소를")) return;
		else if (!formCheck($('#c_cell'), $('.error:eq(6)'), "핸드폰번호를")) return;
		else if (!inputVerify(2,'#c_cell', '.error:eq(6)')) return;
		
		else {    
			if($('#c_pwd').val()!=""){
				if (!inputVerify(1,'#c_pwd', '.error:eq(1)')) return;
				if (!customerIdPwdCheck()) return;
			}
			if($('#c_pwdCheck').val()!=""){
				if (!inputVerify(1,'#c_pwdCheck', '.error:eq(2)')) return;
			}
			if($('#c_pwd').val()!="" && $('#c_pwdCheck').val()!=""){
				if (!customerPasswordCheck()) return;
			}
			
			var message = confirm("회원 정보를 수정하시겠습니까?");
			if(message==true){
				$("#c_mail").val($("#c_mailName").val()+"@"+$("#c_mailDomain").val());
				$("#c_address").val($("#sample6_address").val()+"/"+$("#sample6_address2").val()+"/"+$("#sample6_postcode").val());
				$("#memberForm").attr({
					"method":"post",
					"action":"/member/join_customer_modify.do"
				});
				$("#memberForm").submit();
			} else {
				return false;
			}			
		}
	});
	
	/* seller 수정폼에서 확인 버튼 클릭 시 처리 이벤트 */
	$("#sellerModify").click(function(){
		//	입력값 체크
		if (!formCheck($('#s_opwd'), $('.error:eq(0)'), "기존 비밀번호를")) return;
		else if (!inputVerify(1,'#s_opwd', '.error:eq(0)')) return;
		//else if (!formCheck($('#sample6_postcode'), $('.error:eq(5)'), "우편번호를")) return;
		else if (!formCheck($('#sample6_address2'), $('.error:eq(4)'), "상세주소를")) return;
		else if (!formCheck($('#s_mailName'), $('.error:eq(5)'), "이메일 주소를")) return;
		else if (!formCheck($('#s_cell'), $('.error:eq(6)'), "핸드폰번호를")) return;
		else if (!inputVerify(2,'#s_cell', '.error:eq(6)')) return;
		
		else {    
			if($('#s_pwd').val()!=""){
				if (!inputVerify(1,'#s_pwd', '.error:eq(1)')) return;
				if (!sellerIdPwdCheck()) return;
			}
			if($('#s_pwdCheck').val()!=""){
				if (!inputVerify(1,'#s_pwdCheck', '.error:eq(2)')) return;
			}
			if($('#s_pwd').val()!="" && $('#s_pwdCheck').val()!=""){
				if (!sellerPasswordCheck()) return;
			}
			
			var message = confirm("회원 정보를 수정하시겠습니까?");
			if(message==true){
				$("#s_mail").val($("#s_mailName").val()+"@"+$("#s_mailDomain").val());
				$("#s_address").val($("#sample6_address").val()+"/"+$("#sample6_address2").val()+"/"+$("#sample6_postcode").val());
				$("#memberForm").attr({
					"method":"post",
					"action":"/member/join_seller_modify.do"
				});
				$("#memberForm").submit();
			} else {
				return false;
			}			
		}
	});

	$("#modifyReset").click(function(){
		$("#memberForm").each(function(){
			this.reset();
		}); 
	});

	$("#modifyCancel").click(function(){
		location.href="/member/login.do";
	});
});

function customerPasswordCheck(){
	if($("#c_pwd").val() != $("#c_pwdCheck").val()){
		alert("패스워드 입력이 일치하지 않습니다");
		$("#c_pwd").val("");
		$("#c_pwdCheck").val("");
		$("#c_pwd").focus();
		return false;
	}  
	return true;
}

function sellerPasswordCheck(){
	if($("#s_pwd").val() != $("#s_pwdCheck").val()){
		alert("패스워드 입력이 일치하지 않습니다");
		$("#s_pwd").val("");
		$("#s_pwdCheck").val("");
		$("#s_pwd").focus();
		return false;
	}  
	return true;
}

function customerIdPwdCheck(){
	var c_id = loginCustomerId;
	var c_pwd = $("#c_pwd").val();
	if( c_pwd.indexOf(c_id) > -1 ){
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#c_pwd").val("");
		$("#c_pwd").focus();
		return false;
	}else{  
		return true;
	}
}

function sellerIdPwdCheck(){
	var s_id = loginSellerId;
	var s_pwd = $("#s_pwd").val();
	if( s_pwd.indexOf(s_id) > -1 ){
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#s_pwd").val("");
		$("#s_pwd").focus();
		return false;
	}else{  
		return true;
	}
}