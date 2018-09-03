$(function(){
//	아래 함수는 서버로 받아 온 코드값에 대한 처리 함수(login.jsp 파일에 정의.)
	errorCodeCheck();
	$('#c_id, #c_pwd').bind("keyup",function(){
		$(this).parents("div").find(".error").html("");
	});

	/* 로그인 버튼 클릭 시 처리 이벤트 */
	$("#loginBtn").click(function(){
		$("#s_id").val($("#c_id").val());
		$("#c_id").val($("#s_id").val());
		
		$("#s_pwd").val($("#c_pwd").val());
		$("#c_pwd").val($("#s_pwd").val());
		
		
		if (!formCheck($('#c_id'), $('.error:eq(0)'), "아이디를")){
			$('#c_id').focus();
			return;
		}
		else if (!inputVerify(0,'#c_id','.error:eq(0)')) return;
		else if (!formCheck($('#c_pwd'),$('.error:eq(1)'), "비밀번호를")){
			$('#c_pwd').focus();
			return;
		}
		else if (!inputVerify(1,'#c_pwd', '.error:eq(1)')) return;
		else {
			$("#loginForm").attr({
				"method":"POST",
				"action":"/member/login.do"
			});
			$("#loginForm").submit();
		}
	});

	/* 회원가입 버튼 클릭 시 처리 이벤트 */
	$("#joinBtn").click(function(){
		location.href="/member/join_select.do";
	});
});