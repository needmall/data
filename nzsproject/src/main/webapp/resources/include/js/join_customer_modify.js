var loginCustomerId = "";
$(function(){
	errorCodeCheck();
	emailCheck();

	var message = ["기존 비밀번호를 입력해 주세요.",
		"", "","", "- 포함 입력해주세요. 예시) 010-0000-0000","-포함 입력해주세요.","-포함 입력해주세요. 예시)123-12-12345"];
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});

	// customer
	$('#c_opwd, #sample6_address2, #c_mailName').bind("focus",function(){
		var idx = $('#c_opwd, #sample6_address2, #c_mailName, #c_cell').index(this);
		console.log("대상 : "+ idx );
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	/* customer 수정폼에서 확인 버튼 클릭 시 처리 이벤트 */
	$("#joinCustomerModify").click(function(){
		//	입력값 체크
		if (!formCheck($('#c_opwd1'), $('.error:eq(0)'), "기존 비밀번호를")) return;
		else if (!inputVerify(1,'#c_opwd1', '.error:eq(0)')) return;
		//else if (!formCheck($('#sample6_postcode'), $('.error:eq(5)'), "우편번호를")) return;
		else if (!formCheck($('#sample6_address2'), $('.error:eq(2)'), "상세주소를")) return;
		else if (!formCheck($('#c_mailName'), $('.error:eq(3)'), "이메일 주소를")) return;
		else if (!formCheck($('#c_cell'), $('.error:eq(4)'), "핸드폰번호를")) return;
		else if (!inputVerify(2,'#c_cell', '.error:eq(4)')) return;
		
		else {    
			
			var message = confirm("회원 정보를 수정하시겠습니까?");
			if(message==true){
				$("#c_mail").val($("#c_mailName").val()+"@"+$("#c_mailDomain").val());
				$("#c_address").val($("#sample6_address").val()+"/"+$("#sample6_address2").val()+"/"+$("#sample6_postcode").val());
				$("#memberForm1").attr({
					"method":"post",
					"action":"/member/join_customer_modify.do"
				});
				$("#memberForm").submit();
			} else {
				return false;
			}			
		}
	});
	
	$("#joinCustomerModifyReset").click(function(){
		$("#memberForm").each(function(){
			this.reset();
		}); 
	});

	$("#joinCustomerModifyCancel").click(function(){
		location.href="/member/login.do";
	});
});
