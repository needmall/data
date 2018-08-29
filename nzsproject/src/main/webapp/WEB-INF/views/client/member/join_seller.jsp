<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          </script> 
      </head>
      <body>
         <div class="contentContainer">
	<div class="well">
		<form id="memberForm" class="form-horizontal">
			<input type="hidden" name="s_mail" id="s_mail" />
			<input type="hidden" name="st_email" id="st_email" />
			
			<div class="form-group form-group-sm">
				<label for="s_id" class="col-sm-2 control-label">사용자 ID</label>
				<div class="col-sm-3">
					<input type="text" id="s_id" name="s_id"  maxlength="12" class="form-control" placeholder="User ID" />
				</div>
				<div class="col-sm-2">
					<input type="button" id="sellerIdConfirmBtn" value="아이디 중복체크" class="form-control btn-primary" />
				</div> 
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="s_pwd" class="col-sm-2 control-label">비밀 번호</label>
				<div class="col-sm-3">
					<input type="password" id="s_pwd" name="s_pwd" maxlength="15" class="form-control" placeholder="Password" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="s_pwdCheck" class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password"  id="s_pwdCheck" name="s_pwdCheck" maxlength="15" class="form-control" placeholder="Password Confirm" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="s_name" class="col-sm-2 control-label">회원이름</label>
				<div class="col-sm-3">
					<input type="text" id="s_name" name="s_name" maxlength="10" class="form-control" placeholder="NAME" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>						
			</div>
			<div class="form-group form-group-sm">
				<label for="s_birthday" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3">
					<input type="date" id="s_birthday" name="s_birthday" class="form-control">	
				</div>
				<div class="col-sm-2">
					<input type="text" id="s_genderNum" name="s_genderNum" maxlength="1" class="form-control" placeholder="주민등록번호 7번째 1자리">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<!-- 주소 -->
			<div class="form-group form-group-sm">
				<label for="s_address" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" id="s_address" name="s_address" class="form-control" placeholder="c_address">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="s_mailName" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="s_mailName" name="s_mailName" maxlength="60" class="form-control" placeholder="s_mailName">
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
					<input type="text" id="s_cell" name="s_cell" maxlength="15" class="form-control" placeholder="s_cell Number">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label for="s_phone" class="col-sm-2 control-label">유선 전화</label>
				<div class="col-sm-3">
					<input type="text" id="s_phone" name="s_phone" maxlength="15" class="form-control" placeholder="s_phone Number">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>	
		
			<hr>
			<!-- store 정보 -->
			<div class="form-group form-group-sm">
				<label for="st_bnum" class="col-sm-2 control-label">사업자 번호</label>
				<div class="col-sm-3">
					<input type="text" id="st_bnum" name="st_bnum"  maxlength="20" class="form-control" placeholder="사업자 번호" />
				</div>
				<div class="col-sm-2">
					<input type="button" id="stBnumConfirmBtn" value="사업자 번호 중복체크" class="form-control btn-primary" />
				</div> 
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			
			<div class="form-group form-group-sm">
				<label for="st_name" class="col-sm-2 control-label">상호명</label>
				<div class="col-sm-3">
					<input type="text" id="st_name" name="st_name"  maxlength="20" class="form-control" placeholder="User ID" />
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>
			<!-- 주소 -->
			<div class="form-group form-group-sm">
				<label for="st_address" class="col-sm-2 control-label">사업지 주소</label>
				<div class="col-sm-3">
					<input type="text" id="st_address" name="st_address" class="form-control" placeholder="st_address">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>	
			<div class="form-group form-group-sm">
				<label for="st_hours" class="col-sm-2 control-label">영업 시간</label>
				<div class="col-sm-3">
					<input type="text" id="st_hours" name="st_hours" maxlength="15" class="form-control" placeholder="st_hours">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>	
			<div class="form-group form-group-sm">
				<label for="st_cell" class="col-sm-2 control-label">매장 전화번호</label>
				<div class="col-sm-3">
					<input type="text" id="st_cell" name="st_cell" maxlength="15" class="form-control" placeholder="st_cell Number">	
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>
			</div>	
									
			<div class="form-group form-group-sm">
				<label for="st_ceo" class="col-sm-2 control-label">대표자</label>
				<div class="col-sm-3">
					<input type="text" id="st_ceo" name="st_ceo" maxlength="10" class="form-control" placeholder="st_ceo" >
				</div>
				<div class="col-sm-5">
					<p class="form-control-static error"></p>
				</div>						
			</div>
			<div class="form-group form-group-sm">
				<label for="st_emailName" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="st_emailName" name="st_emailName" maxlength="60" class="form-control" placeholder="st_email">
				</div>
				<div class="col-sm-2">
					<select id="st_emailDomain" class="form-control">
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
					<input type="button" value="확인" id="sellerJoinInsert" class="btn btn-default" /> 
					<input type="button" value="재작성" id="joinReset" class="btn btn-default" />
					<input type="button" value="취소" id="joinCancel" class="btn btn-default" />						
				</div>	
			</div>
			
																													
		</form>
	</div>
</div>
      </body>
</html>