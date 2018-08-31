<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 		 <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" /> -->
<link rel="stylesheet" type="text/css" href="/resources/include/css/productdetail.css" />

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	.all{padding-bottom: 100px;}
	.item_succes{font-size: 25px; text-align: left!important;}
	.list_td{padding-top: 20px;}
	.list_td2{padding-top: 5px;}
	.list_td3{padding-top: 10px;}
	#shopping{margin-right: 30px;}
	#nav li{width: 20%}
	.tab-pane{padding-top: 50px;}
	.div_last{height: 100px;}
</style>
	<script type="text/javascript">
	$(function(){
		$('.dropdown-toggle').dropdown();
		jQuery('.format-money').text(function() {
		    jQuery(this).text(
		        jQuery(this).text().format()
		    );
		});
		
		});
	</script>
</head>
<body>
	<div class="all">
		<div role="tabpanel">
			<ul id="nav" class="nav nav-tabs clearfix right" role="tablist"  >	
			  	<li role="presentation" class="dropdown">
				  	<a class="dropdown-toggle" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="/page.html">회원관리</a>
			    	<ul class="dropdown-menu" role="menu">
			      		<li role="presentation"><a role="menuitem" data-toggle="tab" tabindex="-1" href="#tab1-1">회원정보 수정</a></li>
	   					<li role="presentation"><a role="menuitem" data-toggle="tab" tabindex="-1" href="#tab1-2">회원 탈퇴</a></li>
			    	</ul>
			  	</li>
				<li><a href="#tab2" data-toggle="tab">구매목록</a></li>
				<li><a href="#tab3" data-toggle="tab">장바구니</a></li>
				<li><a href="#tab3" data-toggle="tab">리뷰</a></li>
			</ul>
		</div>
		<div class="tab-content"> 
			<div class="tab-pane" id= "tab1-1">
				<p>test</p>
			</div>
			<div class="tab-pane" id= "tab1-2">
				<p>test2</p>
			</div>
			<div class="tab-pane" id="tab2">
				 <div>
					<div class="item_succes"><span>구매 성공 내역</span></div>
					<hr/>
					<input type="date">
					<table class="table table-striped table-hover">
						<colgroup>
							<col width="5%">
							<col width="10%">
							<col width="50%">
							<col width="7%">
							<col width="8%">
							<col width="10%">
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
								<td>수령확인</td>
							</tr>
							<c:choose>
								<c:when test="${not empty buylist}">
										<c:forEach var="buy" items="${buylist}" varStatus="status">
											<tr class="tr_list">
												<td><div class="list_td">${status.count}</div> </td>
												<td><div ><img class="img-thumbnail" src="/uploadStorage/product/${buy.pi_image }" width="70px" height="50px;"/></div></td>
												<td><div class="list_td2" style="text-align: left;"><p><label>${buy.p_name}</label></p>${buy.p_content}</div></td>
												<td ><div class="list_td">${buy.b_count }개</div></td>
												<td>
													<div class="list_td3">
														<span class="span_count format-money" style="text-decoration: line-through;"> ${buy.original_multiply_count}</span>원<br/>
														<span class="span_count format-money"> ${buy.multiply_count}</span>원
													</div>
												</td>
												<td><div class="list_td">${buy.b1_date} </div>
												<td><div class="list_td">${buy.b_confirm} </div>
											</tr>
										</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<th colspan="5" class="tac">구매하신 물품이 존재하지않습니다.</th>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane" id="tab3">
				<p>menu2 부분입니다.</p>
			</div>
		</div>
	</div>
	<div class="div_last"></div>
</body>
</html>