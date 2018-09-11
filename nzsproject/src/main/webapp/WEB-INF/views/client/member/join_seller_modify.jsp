<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%-- 아래 내용은 DB에 이메일 정보가 javauser2018@naver.com으로 저장되어 있기에 @를 구분자로 분리하고 작성한 소스--%>
<c:set var="s_mail" value="${fn:split(member.s_mail,'@')}" />
<c:set var="s_address" value="${fn:split(member.s_address,'/')}" />

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
          <script type="text/javascript" src="/resources/include/js/modifyInf.js"></script>
          
          <!-- daum map -->
          <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
          
          <!-- ★ cs_division 0 줄 방법 -->
          
          <script type="text/javascript">
          function errorCodeCheck(){
        	  var status = '<c:out value="${status}" />';
        	  if(status != ""){
        	  		alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
        	  }
          }
          
          loginSellerId = "${member.s_id}";
          function emailCheck(){
        	  var s_mail = "${s_mail[1]}";
        	  $("#s_mailDomain").val(s_mail).prop("selected", "true");
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
          </script> 
      </head>
      <body>
         <div class="contentContainer">
	<div class="well">
		<form id="memberForm" class="form-horizontal">
			<input type="hidden" name="s_num" id="s_num" value="${member.s_num}" />
			<input type="hidden" name="s_mail" id="s_mail" />
			<input type="hidden" name="s_address" id="s_address" />
			
			<div class="form-group form-group-sm">
				<label for="s_id" class="col-sm-2 control-label">사용자 ID</label>
				<div class="col-sm-3">
					${member.s_id}
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="s_opwd" class="col-sm-2 control-label">기존 비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="s_opwd" name="s_opwd" maxlength="15" class="form-control" placeholder="기존 비밀번호 입력" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			
			<!-- <div class="form-group form-group-sm">
				<label for="s_pwd" class="col-sm-2 control-label">변경할 비밀 번호(선택)</label>
				<div class="col-sm-3">
					<input type="password" id="s_pwd" name="s_pwd" maxlength="15" class="form-control" placeholder="변경할 비밀번호 입력 (선택)" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="s_pwdCheck" class="col-sm-2 control-label">변경할 비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password"  id="s_pwdCheck" name="s_pwdCheck" maxlength="15" class="form-control" placeholder="변경할 비밀번호 확인" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div> -->
			
			
			<div class="form-group form-group-sm">
				<label for="s_name" class="col-sm-2 control-label">회원이름</label>
				<div class="col-sm-3">
					${member.s_name}
				</div>						
			</div>
			
			<!-- 성별(주민번호 뒷자리로 처리할지) -->
			
			<div class="form-group form-group-sm">
				<label for="s_birthday" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3">
					${member.s_birthday}
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			<div class="form-group form-group-sm">
				<label for="s_name" class="col-sm-2 control-label">성별</label>
				<div class="col-sm-3">
					${member.s_gender}
				</div>						
			</div>
			
			<!-- 주소 -->
			<!-- <div class="form-group form-group-sm">
				<label for="s_address" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" id="s_address" name="s_address" class="form-control" placeholder="s_address">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div> -->
			
			<!-- daum map -->
			<div class="form-group form-group-sm">
				<label for="sample6_postcode" class="col-sm-2 control-label">우편번호</label>
				<div class="col-sm-3">
					<input type="text" id="sample6_postcode" class="form-control" readonly="readonly" placeholder="우편번호" value="${s_address[2]}" >
				</div>
				<div class="col-sm-2">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="sample6_address" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" id="sample6_address" class="form-control" readonly="readonly" placeholder="주소" value="${s_address[0]}">
				</div>
				<div class="col-sm-2">	
					<input type="text" id="sample6_address2" class="form-control" placeholder="상세주소" value="${s_address[1]}">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			
			<!-- 이메일 -->
			<div class="form-group form-group-sm">
				<label for="s_mailName" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="s_mailName" name="s_mailName" maxlength="60" class="form-control" placeholder="아이디만 입력" value="${s_mail[0]}">
				</div>
				<div class="col-sm-2">
					<select id="s_mailDomain" class="form-control">
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="nate.com">네이트</option>																	
					</select> 
				</div>
				<div class="col-sm-3">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			<div class="form-group form-group-sm">
				<label for="s_cell" class="col-sm-2 control-label">핸드폰 번호</label>
				<div class="col-sm-3">
					<input type="text" id="s_cell" name="s_cell" maxlength="15" class="form-control" placeholder="Phone Number" value="${member.s_cell}">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>	
												
			
			
			<div class="form-group">	
				<div class="col-sm-offset-2 col-sm-6">
					<input type="button" value="확인" id="sellerModify" class="btn btn-default" /> 
					<input type="button" value="재작성" id="modifyReset" class="btn btn-default" />
					<input type="button" value="취소" id="modifyCancel" class="btn btn-default" />						
				</div>	
			</div>																										
		</form>
	</div>
</div>
      </body>
</html>