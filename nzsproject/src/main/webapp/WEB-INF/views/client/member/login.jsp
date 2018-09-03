<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Login</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>
<script type="text/javascript">
	function errorCodeCheck() {
		var status = '<c:out value="${status}" />';
		if (status != "") {
			// 명확한 자료형 명시를 위해 status의 타입을 정수형으로 변환.
			switch (parseInt(status)) {
			case 0:
				alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
				break;
			case 1:
				alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
				break;
			case 2:
				alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
				break;
			case 6:
				alert("5번이상 로그인 시도로 30초동안 로그인 할 수 없습니다.\n잠시 후 다시 시도해 주세요");
				break;
			}
		}
	}
	
	$(function(){
		// logout confirm
		$("#logout").click(function(){
			var message = confirm("로그아웃..하시겠습니까..?");
			if(message==true){
				location.href="/member/logout.do"
			} else{
				return false;
			}
		});
		// customer 탈퇴 confirm
		$("#customerDelete").click(function(){
			var message = confirm("정말로..탈퇴...하시겠습니까?");
			if(message==true){
				location.href="/member/customerDelete.do"
			} else{
				return false;
			}
		});
		// seller 탈퇴 confirm
		$("#sellerDelete").click(function(){
			var message = confirm("정말로..탈퇴...하시겠습니까?");
			if(message==true){
				location.href="/member/sellerDelete.do"
			} else{
				return false;
			}
		});
		
		// seller 정보수정시 store 수정은 관리자에게 문의
		$("#sellerModify").click(function(){
			var message = confirm("매장 정보 수정은 관리자에게 문의하시기 바랍니다.");
			if(message==true){
				location.href="/member/join_seller_modify.do"
			} else{
				return false;
			}
		});
	})
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="well">
			<%-- 로그인 전 화면 --%>
			<c:choose>
			<c:when test="${login.c_id != null and login.c_id != ''}">
				<fieldset id="loginAfter">
					<legend>
						<strong>[ ${login.c_name} ]고객님 반갑습니다</strong>
					</legend>
					<span id="memberMenu" class="tac"> 
						<a href="#" id="logout">로그아웃</a>&nbsp;&nbsp;&nbsp; 
						<a href="/member/join_customer_modify.do">정보수정(비밀번호변경)</a>&nbsp;&nbsp;&nbsp; 
						<a href="#" id="customerDelete">회원탈퇴</a>
					</span>
				</fieldset>
			</c:when>
			
			<c:when test="${login.s_id != null and login.s_id != ''}">
				<fieldset id="loginAfter">
					<legend>
						<strong>[ ${login.s_name} ]판매자님 반갑습니다</strong>
					</legend>
					<span id="memberMenu" class="tac"> 
						<a href="#" id="logout">로그아웃</a>&nbsp;&nbsp;&nbsp; 
						<a href="#" id="sellerModify">정보수정(비밀번호변경)</a>&nbsp;&nbsp;&nbsp; 
						<a href="#" id="sellerDelete">회원탈퇴</a>
					</span>
				</fieldset>		
			</c:when>
			<c:otherwise>
			
			<form id="loginForm" class="form-horizontal">
					<div class="form-group">
						<label for="c_id" class="col-sm-2 control-label">아 이 디 </label>
						<div class="col-sm-4">
							<input type="text" id="c_id" name="c_id" class="form-control" placeholder="ID">
							<input type="hidden" id="s_id" name="s_id" class="form-control" placeholder="ID">
						</div>
						<p class="form-control-static error"></p>
					</div>
					<div class="form-group">
						<label for="c_pwd" class="col-sm-2 control-label">비밀번호 </label>
						<div class="col-sm-4">
							<input type="password" id="c_pwd" name="c_pwd" class="form-control" placeholder="Password">
							<input type="hidden" id="s_pwd" name="s_pwd" class="form-control" placeholder="Password">
						</div>
						<p class="form-control-static error"></p>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<input type="button" value="로그인" id="loginBtn" class="btn btn-default" /> 
							<input type="button" value="회원가입" id="joinBtn" class="btn btn-default" />
						</div>
					</div>
				</form>
			
			
			
			</c:otherwise>
			
			</c:choose>
			
		</div>
	</div>
</body>
</html>