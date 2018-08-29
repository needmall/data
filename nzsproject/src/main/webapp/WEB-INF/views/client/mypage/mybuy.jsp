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
/*    		div{border: 1px solid gray;}      */
		.all{text-align: center; height: 1024px;}
		.in{ width: 1100px; margin-left: auto; margin-right: auto; padding-top: 50px; }
		.item_title{font-size: 20px; color: olive; margin-bottom: 30px; margin-top: 30px;}
		h3{text-align: left;}
		.item_succes{font-size: 25px; text-align: left!important;}
		.list_td{padding-top: 30px;}
		.list_td2{padding-top: 10px;}
		.list_td3{padding-top: 25px;}
		#shopping{margin-right: 30px;}
	</style>
	
	<script type="text/javascript">
		$(function(){
			jQuery('.format-money').text(function() {
			    jQuery(this).text(
			        jQuery(this).text().format()
			    );
			});
			$("#shopping").click(function(){
				location.href="/productall/productList.do"
			})
		})
	</script>
</head>
<body>
	<div class="all">
		<div class="in">
			<div>
				<span class="item_title">물품 구매 성공</span>
				<br/>
				<p>물품이 성공적으로 구매 완료 되었습니다.</p>
				<p>구입하신 물품은 MyPage-내 구매내역에서 확인 및 사용하실 수 있습니다.</p> 
			</div>
			<div class="display">
				<div class="item_succes"><span>구매 성공 내역</span></div>
				<hr/>
				<table class="table table-striped table-hover">
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="50%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<tbody>
						<tr>
							<td>번호</td>
							<td>물품명</td>
							<td>물품설명</td>
							<td>수량</td>
							<td>가격</td>
						</tr>
						<c:choose>
							<c:when test="${not empty buylist}">
									<c:forEach var="buy" items="${buylist}" varStatus="status">
										<tr class="tr_list">
											<td><div class="list_td">${status.count}</div> </td>
											<td><div class="list_td2"><img class="img-thumbnail" src="/uploadStorage/product/${buy.pi_image }" width="70px" height="50px;"/></div></td>
											<td><div class="list_td2" style="text-align: left;"><p><label>${buy.p_name}</label></p>${buy.p_content}</div></td>
											<td ><div class="list_td">${buy.b_count }개</div></td>
											<td>
												<div class="list_td3">
													<span class="span_count format-money" style="text-decoration: line-through;"> ${buy.original_multiply_count}</span>원
													<span class="span_count format-money"> ${buy.multiply_count}</span>원
												</div>
												
											</td>
										
										</tr>
									</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8" class="tac">등록된 게시물이 존재하지않습니다.
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<hr/>
		<div><input id="shopping" type="button" value="쇼핑하기"><input id="cart" type="button" value="MyPage 이동"> </div>
	</div>
</body>
</html>