<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
   <html>
      <head>
      <meta charset="UTF-8" />
      
         <title>고객정보 수정 전 비밀번호 확인</title>
         
         <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
         <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         
          <link rel="shortcut icon" href="/resources/image/icon.png" />
          <link rel="apple-touch-icon" href="/resources/image/icon.png" />
          
          <!-- ★★ jQuery 쓰려면 무조건 정의 해줘야함! ↓↓↓ -->
		  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
          <script type="text/javascript" src="/resources/include/js/common.js"></script>
          <script type="text/javascript" src="/resources/include/js/modify.js"></script>
          
          <script type="text/javascript">
          function errorCodeCheck(){
        	  var status = '<c:out value="${status}" />';
        	  if(status != ""){
        	  		alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
        	  }
          }
          
          loginCustomerId = "${member.c_id}";
          
          function emailCheck(){
        	  var c_mail = "${c_mail[1]}";
        	  $("#c_mailDomain").val(c_mail).prop("selected", "true");
          }
        
          </script> 
      </head>
      <body>
         <div class="contentContainer">
	<div class="well">
		<form id="memberForm" class="form-horizontal">
			<input type="hidden" name="c_num" id="c_num" value="${member.c_num}" />
			
			<div class="form-group form-group-sm">
				<label for="c_id" class="col-sm-2 control-label">사용자 ID</label>
				<div class="col-sm-3">
					${member.c_id}
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="c_opwd" class="col-sm-2 control-label">기존 비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="c_opwd" name="c_opwd" maxlength="15" class="form-control" placeholder="기존 비밀번호 입력" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			
			<div class="form-group">	
				<div class="col-sm-offset-2 col-sm-6">
					<input type="button" value="확인" id="customerModifyCheck" class="btn btn-default" />
					<input type="button" value="취소" id="modifyCancel" class="btn btn-default" />						
				</div>	
			</div>																										
		</form>
	</div>
</div>
      </body>
</html>