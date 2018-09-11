var loginCustomerId = "";
$(function(){
	errorCodeCheck();
	/*

	var message = ["기존 비밀번호를 입력해 주세요."];
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});

	// customer
	$('#c_opasswd').bind("focus",function(){
		var idx = $('#c_opasswd').index(this);
		console.log("대상 : "+ idx );
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});*/
	
	$('#memberModifyForm .error:eq(0)').html("비밀번호를 입력해 주세요.");
	$('#memberModifyForm #c_opasswd').bind("focus",function(){
		$('#memberModifyForm .error:eq(0)').html("비밀번호를 입력해 주세요.");
	});
	
	/* customer 수정폼 가기 전 비밀번호 확인에서 확인 버튼 클릭 시 처리 이벤트 */
	$("#modifyCustomerCheck").click(function(){
		//	입력값 체크
		if (!formCheck('#c_opasswd', '#memberModifyForm .error:eq(0)', "기존 비밀번호를")) return;
		else if (!inputVerify(1,'#c_opasswd', '#memberModifyForm .error:eq(0)')) return;
		else{
			$("#memberModifyForm").attr({
				"method":"post",
				"action":"/member/modify_customer_check.do"
			});
			$("#memberModifyForm").submit();
		}	
	});
	
	
	$("#modifyCustomerCheckCancel").click(function(){
		location.href="/member/login.do";
	});
});

