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
<script type="text/javascript">
	$(function(){
	    //최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chk]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chk]").prop("checked",false);
	        }
	    })
	})
	
</script>
<style type="text/css">
	.nav_div{text-align: center;}
/* 	tbody > tr > td{text-align: center; vertical-align: middle;} */
</style>
</head>
<body>
	<table class="table table-striped table-hover">
		<colgroup>
			<col width="5%">
			<col width="10%">
			<col width="50%">
			<col width="7%">
			<col width="5%">
			<col width="10%">
			<col width="4%">
			<col width="4%">
		</colgroup>
		<tbody>
			<tr>
				<td><input type="checkbox" id="checkall" /></td>
				<td>사진</td>
				<td>제품명</td>
				<td>수량</td>
				<td>가격</td>
				<td>유통기한</td>
				<td>구매</td>
				<td>취소</td>
			</tr>
			
			
			
			
			
			<c:choose>
				<c:when test="${not empty cartList}">
					<c:forEach var="cart" items="${cartList }" varStatus="status">
						<tr>
							<td class="align-middle"><input type="checkbox" name="chk" data-num="${cart.cart2_num }"/></td>
							<td><img class="img-thumbnail" src="/uploadStorage/product/${cart.pi_image }" width="150px" height="50px;"/></td>
							<td>${cart.p_name}) <p>${cart.p_content }</p></td>
							<td>${cart.ps_count }개</td>
							<td>${cart.ps_price }원</td>
							<td>${cart.ps_expirationChange }</td>
							<td>구매</td>
							<td><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></td>
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

	<div class="nav_div">
		<nav>
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
<%-- 	<%@include file="productdetallbuy.jsp" %> --%>
</body>
</html>