<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
   <html>
      <head>
      <meta charset="UTF-8" />
      
         <title>회원가입</title>
         
         <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
         <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         
          <link rel="shortcut icon" href="/resources/image/icon.png" />
          <link rel="apple-touch-icon" href="/resources/image/icon.png" />
          
          <!-- ★★ jQuery 쓰려면 무조건 정의 해줘야함! ↓↓↓ -->
		  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
          <script type="text/javascript" src="/resources/include/js/common.js"></script>
          <script type="text/javascript" src="/resources/include/js/join.js"></script>
          <script type="text/javascript" src="/resources/include/js/membercheck.js"></script>
          
          <!-- daum map -->
          <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
          
          <!-- ★ cs_division 0 줄 방법 -->
          
          <script type="text/javascript">
          	function errCodeCheck(){ 
          		var errCode = '<c:out value="${errCode}" />';
          		if(errCode != ''){
          			switch (parseInt(errCode)){
          			case 1:
          				alert("이미 가입된 회원입니다!");
          				break;
          			case 2:
          				alert("회원가입 처리가 실패하였습니다. 잠시 후 다시 시도해 주십시오.")
          				break;
          			}
          		}
          	}
          	
          	/* daum map */
          	function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;	// 도로(road)명 주소..ㅋㅋㅋㅋㅋㅋㅋ
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('sample6_address').value = fullAddr;
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('sample6_address2').focus();
		            }
		        }).open();
          	}
          	var emailConfirm = emailConfirm();
          	$(function(){
          		$("#cIdenBut").click(function(){
          			if (!formCheck($('#c_mailName'), $('.error:eq(6)'), "이메일 주소를")) return;
          			$("#emailConfirm").val(emailConfirm);
          			$("#c_mail").val($("#c_mailName").val()+"@"+$("#c_mailDomain").val());
          			$.ajax({
        				url : "/member/customerEmailConfirm.do",
        				type : "post",
        				data : {c_mail:$('#c_mail').val(),
        						emailConfirm:$('#emailConfirm').val()},
        				error : function(){
        					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도하세요.')
        				},
        				success : function(resultData){
        					console.log("resultData : " + resultData);
        					if(resultData=="1"){
        						$("#c_iden").parents(".form-group").find(".error").html("전송완료.");
        					}else if(resultData=="0"){
        						$("#c_iden").parents(".form-group").find(".error").html("전송 실패.");
        						idConfirm = 2;
        					}
        				}
        			});	//ajax
          		});	//#cIdenBut.click
          	});	//$(function())
          
          </script> 
      </head>
      <body>
         <div class="contentContainer">
	<div class="well">
		<form id="memberForm" class="form-horizontal">
			<input type="hidden" name="c_mail" id="c_mail" />
			<input type="hidden" name="c_address" id="c_address" />
			<input type="hidden" name="emailConfirm" id="emailConfirm" />
			
			<div class="form-group form-group-sm">
				<label for="c_id" class="col-sm-2 control-label">사용자 ID</label>
				<div class="col-sm-3">
					<input type="text" id="c_id" name="c_id"  maxlength="12" class="form-control" placeholder="ID" />
				</div>
				<div class="col-sm-2">
					<input type="button" id="customerIdConfirmBtn" value="아이디 중복체크" class="form-control btn-primary" />
				</div> 
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="c_pwd" class="col-sm-2 control-label">비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="c_pwd" name="c_pwd" maxlength="15" class="form-control" placeholder="Password" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="c_pwdCheck" class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password"  id="c_pwdCheck" name="c_pwdCheck" maxlength="15" class="form-control" placeholder="Password Check" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="c_name" class="col-sm-2 control-label">회원이름</label>
				<div class="col-sm-3">
					<input type="text" id="c_name" name="c_name" maxlength="10" class="form-control" placeholder="Name" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>						
			</div>
			
			<!-- 성별(주민번호 뒷자리로 처리할지) -->
			
			<div class="form-group form-group-sm">
				<label for="c_birthday" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3">
					<input type="date" id="c_birthday" name="c_birthday" class="form-control">	
				</div>
				<div class="col-sm-2">
					<input type="text" id="c_genderNum" name="c_genderNum" maxlength="1" class="form-control" placeholder="주민등록번호 7번째 1자리">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			<!-- 주소 -->
			<!-- <div class="form-group form-group-sm">
				<label for="c_address" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" id="c_address" name="c_address" class="form-control" placeholder="c_address">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div> -->
			
			<!-- daum map -->
			<div class="form-group form-group-sm">
				<label for="sample6_postcode" class="col-sm-2 control-label">우편번호</label>
				<div class="col-sm-3">
					<input type="text" id="sample6_postcode" class="form-control" readonly="readonly" placeholder="우편번호">
				</div>
				<div class="col-sm-2">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="sample6_address" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" id="sample6_address" class="form-control" readonly="readonly" placeholder="주소">
				</div>
				<div class="col-sm-2">	
					<input type="text" id="sample6_address2" class="form-control" placeholder="상세주소">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			
			<!-- 이메일 -->
			
			<div class="form-group form-group-sm">
				<label for="c_mailName" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="c_mailName" name="c_mailName" maxlength="60" class="form-control" placeholder="이메일 아이디만 입력해주세요">
				</div>
				<div class="col-sm-2">
					<select id="c_mailDomain" class="form-control">
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="nate.com">네이트</option>																	
					</select> 
				</div>				
				<div class="col-sm-2">
					<input type="button" id="cIdenBut" name="cIdenBut" value="인증"><br>
				</div>
				<div class="col-sm-3">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			
			<div class="form-group form-group-sm">
				<label for="c_iden" class="col-sm-2 control-label">인증번호 입력</label>
				<div class="col-sm-3">
					<input type="text" id="c_iden" name="c_iden" readonly="readonly" class="form-control">
				</div>
				<div class="col-sm-3">
					<p class="form-control-static error"></p>
				</div>						
			</div>
			
			
			
			<div class="form-group form-group-sm">
				<label for="c_cell" class="col-sm-2 control-label">핸드폰 번호</label>
				<div class="col-sm-3">
					<input type="text" id="c_cell" name="c_cell" maxlength="15" class="form-control" placeholder="Phone Number">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>	
												
			
			
			<div class="form-group">	
				<div class="col-sm-offset-2 col-sm-6">
					<input type="button" value="확인" id="customerJoinInsert" class="btn btn-default" /> 
					<input type="button" value="재작성" id="joinReset" class="btn btn-default" />
					<input type="button" value="취소" id="joinCancel" class="btn btn-default" />						
				</div>	
			</div>																										
		</form>
	</div>
</div>
      </body>
</html>