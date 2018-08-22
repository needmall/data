// join.js 도 2개 만들어야 하나여 아이디 다르니

// 고객 비밀번호와 비밀번호 확인 일치 여부 확인
function customerPasswordCheck(){
	if($("#c_pwd").val() != $("#c_pwdCheck").val()){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$("#c_pwdCheck").focus();
		$("#c_pwdCheck").val("");
		return false;
	}else{
		return true;
	}
}

//판매자 비밀번호와 비밀번호 확인 일치 여부 확인
function sellerPasswordCheck(){
	if($("#s_pwd").val() != $("#s_pwdCheck").val()){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$("#s_pwdCheck").focus();
		$("#s_pwdCheck").val("");
		return false;
	}else{
		return true;
	}
}

// customer 비밀번호에 아이디 포함되는지 확인
function customerIdPwdCheck(){
	var c_id = $("#c_id").val();
	var c_pwd = $("#c_pwd").val();
	if(c_pwd.indexOf(c_id) > -1){
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#c_pwd").val("");
		$("#c_pwd").focus();
		return false;
	}else{
		return true;
	}
}

// seller 비밀번호에 아이디 포함되는지 확인
function sellerIdPwdCheck(){
	var s_id = $("#s_id").val();
	var s_pwd = $("#s_pwd").val();
	if(s_pwd.indexOf(s_id) > -1){
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#s_pwd").val("");
		$("#s_pwd").focus();
		return false;
	}else{
		return true;
	}
}

var idConfirm = 1;
$(function(){
	errCodeCheck();
	// 사용자에게 요구사항에 대한 문자열로 배열 초기화.
	var message = ["영문, 숫자만 가능. 6~12자로 입력해주세요", "영문,숫자,특수문자만 가능. 8~15자 입력해 주세요.", "비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.","","","","", "- 포함 입력해주세요. 예시) 010-0000-0000"];
	
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});
	
	// customer
	$('#c_id, #c_pwd, #c_pwdCheck, #c_cell').bind("focus",function(){	// 이벤트는 focus
		var idx = $("#c_id, #c_pwd, #c_pwdCheck, #c_cell").index(this);
		console.log("대상 : " + idx);
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	// seller
	$('#s_id, #s_pwd, #s_pwdCheck, #s_cell').bind("focus",function(){	// 이벤트는 focus
		var idx = $("#s_id, #s_pwd, #s_pwdCheck, #s_cell").index(this);
		console.log("대상 : " + idx);
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	// customer id 중복 확인
	$("#customerIdConfirmBtn").click(function(){
		if (!formCheck($('#c_id'), $('.error:eq(0)'), "아이디를")) return;
		else if (!inputVerify(0,'#c_id','.error:eq(0)')) return;
		else{
			$.ajax({
				url : "/member/customerIdConfirm.do",
				type : "post",
				data : "c_id="+$("#c_id").val(),
				error : function(){
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도하세요.')
				},
				success : function(resultData){
					console.log("resultData : " + resultData);
					if(resultData=="1"){
						$("#c_id").parents(".form-group").find(".error").html("현재 사용 중인 아이디 입니다.");
					}else if(resultData=="2"){
						$("#c_id").parents(".form-group").find(".error").html("사용 가능한 아이디입니다.");
						idConfirm = 2;
					}
				}
			});
		}
	});
	
	// seller id 중복 확인
	$("#sellerIdConfirmBtn").click(function(){
		if (!formCheck($('#s_id'), $('.error:eq(0)'), "아이디를")) return;
		else if (!inputVerify(0,'#s_id','.error:eq(0)')) return;
		else{
			$.ajax({
				url : "/member/sellerIdConfirm.do",
				type : "post",
				data : "s_id="+$("#s_id").val(),
				error : function(){
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도하세요.')
				},
				success : function(resultData){
					console.log("resultData : " + resultData);
					if(resultData=="1"){
						$("#s_id").parents(".form-group").find(".error").html("현재 사용 중인 아이디 입니다.");
					}else if(resultData=="2"){
						$("#s_id").parents(".form-group").find(".error").html("사용 가능한 아이디입니다.");
						idConfirm = 2;
					}
				}
			});
		}
	});
	
	/* customer 확인 버튼 클릭 시 처리 이벤트 */
	$("#customerJoinInsert").click(function(){
		// 입력값 체크
		if (!formCheck($('#c_id'), $('.error:eq(0)'), "아이디를")) return;
		else if (!inputVerify(0,'#c_id','.error:eq(0)')) return;
		else if (!formCheck($('#c_pwd'), $('.error:eq(1)'), "비밀번호를")) return;
		else if (!inputVerify(1,'#c_pwd','.error:eq(1)')) return;
		else if (!customerIdPwdCheck()) return;
		else if (!formCheck($('#c_pwdCheck'), $('.error:eq(2)'), "비밀번호 확인을")) return;
		else if (!inputVerify(1,'#c_pwdCheck','.error:eq(2)')) return;
		else if (!customerPasswordCheck()) return;
		else if (!formCheck($('#c_name'), $('.error:eq(3)'), "이름을")) return;
		
		else if (!formCheck($('#c_birthday'), $('.error:eq(4)'), "생년월일을")) return;
		//else if (!inputVerify(2,'#c_birthday','.error:eq(3)')) return;	
		else if (!formCheck($('#c_gendernum'), $('.error:eq(4)'), "주민번호 뒷자리를")) return;
		//else if (!inputVerify(2,'#c_gendernum','.error:eq(3)')) return;	
		
		// ★4번 생년월일 채우기
		else if (!formCheck($('#c_address'), $('.error:eq(5)'), "주소를")) return;
		
		
		else if (!formCheck($('#c_mailName'), $('.error:eq(6)'), "이메일 주소를")) return;
		else if (!formCheck($('#c_cell'), $('.error:eq(7)'), "핸드폰번호를")) return;
		else if (!inputVerify(2,'#c_cell','.error:eq(7)')) return;	
		else if (idConfirm!=2){ alert("아이디 중복 체크 진행해 주세요."); return;}
		else {
			$("#c_mail").val($("#c_mailName").val()+"@"+$("#c_mailDomain").val());
			//$("#pinno").val($("#birth").val()+"-"+$("#gender").val());
			$("#c_gender").val();
			$("#memberForm").attr({
				"method":"post",	// 주소가 같아서 method가 다르기 때문에 ㄱㅊ
				"action":"/member/join_customer.do"
			});
			$("#memberForm").submit();
		}		
	});
	
	$("#joinCancel").click(function(){
		location.href="/member/login.do";
	});
	
	$("#joinReset").click(function(){
		$("#memberForm").each(function(){	// memberForm에 있는거 다 지워주기 위해 each로 반복
			this.reset();
		});
	});
});