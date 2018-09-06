<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%--<%@ page isElgnored="true"%> --%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
	
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
	
	<!-- 모바일 웹 페이지 설정 -->
	<!-- 모바일 웹 페이지 설정 종료 -->
	
	<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
	<!-- [if lt IE 9] -->
	<!-- <script src="/resources/js/html5shiv.js"</script> -->
	<!-- [endif] -->
	<meta http-equiv="refresh" content="5; url=/mypage/mypageList.do?t=3">
<!-- 	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script> -->

	
	<style type="text/css">
/*    		div{border: 1px solid gray;}      */
		.all{text-align: center; height: auto;}
		.in{ width: 1100px; margin-left: auto; margin-right: auto; padding-top: 30px; }
		.item_title{font-size: 20px; color: olive; margin-bottom: 30px; margin-top: 30px;}
		.display{padding-bottom: 20px; margin: 5px;}
		.display div{margin-bottom: 15px;}
		#shopping{margin-right: 30px;}
	</style>
	
	<script type="text/javascript">

	 var cnt =0;
		$(function(){
			$("#btn_shopping").click(function(){
				location.href="/productall/productList.do"
			})
			$("#btn_buypage").click(function(){
				$(".hidden").attr({
					"method":"post",
					"action":"/mypage/mypageList.do?t=3"
				});
 				$(".hidden").submit();
			})
			
		})
	</script>
</head>
<body>
	<div class="all">
	<form class="hidden">
		<input type="hidden" id="c_num" name="c_num" value="1"> <!-- 아이디 세션값 들어오면 지워야함 -->
	</form>
	
		<div class="in">
			<div class="display">
				<div><span class="item_title">물품 구매 성공</span></div>
				<br/>
				<p>물품이 성공적으로 구매 완료 되었습니다.</p>
				<p>구입하신 물품은 MyPage-내 구매내역에서 확인 및 사용하실 수 있습니다.</p> 
			</div>
			<div><label class="location_content">잠시후에  MyPage 로 넘어갑니다.</label> </div>
		</div>
		<hr/>
		<div>
			<input id="btn_shopping" type="button" value="쇼핑하기" class="btn btn-default">
			<input id="btn_buypage" type="button" value="MyPage 이동" class="btn btn-default"> 
		</div>
	</div>
</body>
</html>