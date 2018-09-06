<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
   <html>
      <head>
      <meta charset="UTF-8" />
      
         <title>seller id 찾기</title>
         
         <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
         <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         
          <link rel="shortcut icon" href="/resources/image/icon.png" />
          <link rel="apple-touch-icon" href="/resources/image/icon.png" />
          
          <!-- ★★ jQuery 쓰려면 무조건 정의 해줘야함! ↓↓↓ -->
		  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
          <script type="text/javascript" src="/resources/include/js/common.js"></script>
          
          
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
          		$("#sellerPwdIden").click(function(){
          			if (!formCheck($('#s_id'), $('.error:eq(0)'), "아이디를")) return;
          			else if (!formCheck($('#s_mailName'), $('.error:eq(1)'), "이메일 주소를")) return;
          			else{
          				$("#s_mail").val($("#s_mailName").val()+"@"+$("#s_mailDomain").val());
          				$("#memberForm").attr({
          					"method":"post",	// 주소가 같아서 method가 다르기 때문에 ㄱㅊ
          					"action":"/member/sellerPwdIden.do"
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
         <h2>아이디 찾기</h2>
	<div class="well">
		<form id="memberForm" class="form-horizontal">
			<input type="hidden" name="s_mail" id="s_mail" />
			<input type="hidden" name="s_address" id="s_address" />
			
			<div class="form-group form-group-sm">
				<label for="s_name" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="s_id" name="s_id" class="form-control" placeholder="ID" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>						
			</div>
			
			
			<!-- 이메일 -->
			<div class="form-group form-group-sm">
				<label for="s_mailName" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="s_mailName" name="s_mailName" maxlength="60" class="form-control" placeholder="s_mail">
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
			
			<div class="form-group">	
				<div class="col-sm-offset-2 col-sm-6">
					<input type="button" value="확인" id="sellerPwdIden" class="btn btn-default" /> 
					<input type="button" value="재작성" id="joinReset" class="btn btn-default" />
					<input type="button" value="취소" id="joinCancel" class="btn btn-default" />						
				</div>
			</div>																										
		</form>
	</div>
</div>
      </body>
</html>