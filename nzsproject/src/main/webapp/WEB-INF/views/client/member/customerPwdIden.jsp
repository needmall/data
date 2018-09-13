<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
   <html>
      <head>
      <meta charset="UTF-8" />
      
         <title>customer 비밀번호 찾기</title>
         
         <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
         <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         
          <link rel="shortcut icon" href="/resources/image/icon.png" />
          <link rel="apple-touch-icon" href="/resources/image/icon.png" />
          
          <!-- ★★ jQuery 쓰려면 무조건 정의 해줘야함! ↓↓↓ -->
		  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
          <script type="text/javascript" src="/resources/include/js/common.js"></script>
          <script type="text/javascript" src="/resources/include/js/membercheck.js"></script>
          
          <!-- ★ cs_division 0 줄 방법 -->
          
          <script type="text/javascript">
	          function errorCodeCheck() {
		      		var status = '<c:out value="${status}" />';
		      		if (status != "") {
		      			// 명확한 자료형 명시를 위해 status의 타입을 정수형으로 변환.
		      			switch (parseInt(status)) {
		      		
		      			case 1:
		      				alert("아이디가 존재하지 않습니다.\n다시 입력해 주세요.");
		      				break;
		      			
	      				}
	      			}
	      		}  
          
          	$(function(){
          		errorCodeCheck();
          		var c_pwd = createPW();
          		$("#customerPwdIden").click(function(){
          			if (!formCheck($('#c_id'), $('.error:eq(0)'), "아이디를")) return;
          			else if (!formCheck($('#c_mailName'), $('.error:eq(1)'), "이메일 주소를")) return;
          			else{
          				$("#c_pwd").val(c_pwd);
          				$("#c_mail").val($("#c_mailName").val()+"@"+$("#c_mailDomain").val());
          				$("#memberForm").attr({
          					"method":"post",	// 주소가 같아서 method가 다르기 때문에 ㄱㅊ
          					"action":"/member/customerPwdIden.do"
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
          </script> 
      </head>
      <body>
         <div class="contentContainer">
         <h2>비밀번호 찾기</h2>
	<div class="well">
		<form id="memberForm" class="form-horizontal">
			<input type="hidden" name="c_mail" id="c_mail" />
			<input type="hidden" name="c_pwd" id="c_pwd" />
			
			<div class="form-group form-group-sm">
				<label for="c_name" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="c_id" name="c_id" class="form-control" placeholder="id" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>						
			</div>
			
			
			<!-- 이메일 -->
			<div class="form-group form-group-sm">
				<label for="c_mailName" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="c_mailName" name="c_mailName" maxlength="60" class="form-control" placeholder="이메일 아이디만">
				</div>
				<div class="col-sm-2">
					<select id="c_mailDomain" class="form-control">
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="nate.com">네이트</option>																	
					</select> 
				</div>				
				
				<div class="col-sm-3">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			<div class="form-group">	
				<div class="col-sm-offset-2 col-sm-6">
					<input type="button" value="확인" id="customerPwdIden" class="btn btn-default" /> 
					<input type="button" value="재작성" id="joinReset" class="btn btn-default" />
					<input type="button" value="취소" id="joinCancel" class="btn btn-default" />						
				</div>
			</div>																										
		</form>
	</div>
</div>
      </body>
</html>