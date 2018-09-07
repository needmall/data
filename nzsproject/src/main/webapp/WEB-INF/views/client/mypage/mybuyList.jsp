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
<script type="text/javascript" src="/resources/include/js/jquery.twbsPagination.js"></script>
	
	<style type="text/css">
	/* 	div{border: 1px solid black;} */
		.all{padding-bottom: 100px;}
		.item_succes{font-size: 25px; text-align: left!important;}
		.list_td{padding-top: 20px;}
		.list_td2{padding-top: 5px;}
		.list_td3{padding-top: 10px;}
		#shopping{margin-right: 30px;}
		#nav li{width: 20%}
		.tab-pane{padding-top: 50px;}
		.div_last{height: 100px;}
		#document_navi{text-align: center;}
		
	</style>
	<script type="text/javascript">
		
		
		
	</script>
</head>
<body>
	<div class="item_succes"><span>구매 성공 내역</span></div>
	<hr/>
<!-- 	<div style="text-align: right ;"><input type="date"></div> -->
		<table class="table table-striped table-hover" id="tableList">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="50%">
				<col width="5%">
				<col width="8%">
				<col width="8%">
				<col width="7%">
				<col width="7%">
			</colgroup>
			<tbody>
				<tr>
					<td>번호</td>
					<td>물품명</td>
					<td>물품설명</td>
					<td>수량</td>
					<td>가격</td>
					<td>구입일</td>
					<td>리 뷰</td>
					<td>수령확인</td>
				</tr>
			</tbody>
		</table>
		<div class="text-center"> <!-- 페이징 버튼 -->
			<ul id="pagination-demo" class="pagination-sm"></ul>
		</div>

</body>
</html>