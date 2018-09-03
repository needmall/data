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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

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
// 	페이징 계산 ㅡㅡ 
// 	int page = 22; 
// 	int countList = 10; 한 페이지에 출력될 게시물 수 (countList)
// 	int countPage = 10; 한 화면에 출력될 페이지 수 (countPage)
// 	int totalCount = 255; 현재 페이지 번호 (이하 page)
// 	int totalPage = totalCount / countList;
	
// 	if (totalCount % countList > 0) {
// 	    totalPage++;
// 	}
// 	if (totalPage < page) {
// 	    page = totalPage;
// 	}
	
// 	int startPage = ((page - 1) / 10) * 10 + 1;
// 	int endPage = startPage + countPage - 1;
	
// 	if (endPage > totalPage) {
// 	    endPage = totalPage;
// 	}
// 	if (startPage > 1) {
// 	    System.out.print("<a href=\"?page=1\">처음</a>");
// 	}
// 	if (page > 1) {
// 	    System.out.println("<a href=\"?page=" + (page - 1)  + "\">이전</a>");
// 	}
// 	for (int iCount = startPage; iCount <= endPage; iCount++) {
// 	    if (iCount == page) {
// 	        System.out.print(" <b>" + iCount + "</b>");
// 	    } else {
// 	        System.out.print(" " + iCount + " ");
// 	    }
// 	}
// 	if (page < totalPage) {
// 	    System.out.println("<a href=\"?page=" + (page + 1)  + "\">다음</a>");
// 	}
// 	if (endPage < totalPage) {
// 	    System.out.print("<a href=\"?page=" + totalPage + "\">끝</a>");
// 	}
	$(function(){
		$('.dropdown-toggle').dropdown();
		jQuery('.format-money').text(function() {
		    jQuery(this).text(
		        jQuery(this).text().format()
		    );
		});
		
		$("#li_list2").click(function(){
// 			$("#tab2").load("ajax/mypage/mybuyList.do");
		})

	});//풩션 끝!
	//구입버튼 모달
	


	</script>
</head>
<body>
	<div class="all">	
	<input type="hidden" id="total_count">	
		<div role="tabpanel">
			<ul id="nav" class="nav nav-tabs clearfix right" role="tablist"  >	
			  	<li role="presentation" class="dropdown">
				  	<a class="dropdown-toggle" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="/page.html">회원정보 관리</a>
			    	<ul class="dropdown-menu" role="menu">
			      		<li role="presentation" id="li_list1-1"><a role="menuitem" data-toggle="tab" tabindex="-1" href="#tab1-1">회원정보 수정</a></li>
	   					<li role="presentation" id="li_list1-2"><a role="menuitem" data-toggle="tab" tabindex="-1" href="#tab1-2">회원 탈퇴</a></li>
			    	</ul>
			  	</li>
				<li><a href="#tab2" data-toggle="tab" id="li_list2">구매목록</a></li>
				<li><a href="#tab3" data-toggle="tab">장바구니</a></li>
<!-- 				<li><a href="#tab3" data-toggle="tab">리뷰</a></li> -->
			</ul>
		</div>
		<div class="tab-content">  <!-- 텝 시작 부분 -->
			<div class="tab-pane" id= "tab1-1"> <!-- 정보수정 페이지  -->
				<jsp:include page="/WEB-INF/views/client/member/join_customer_modify.jsp"></jsp:include>
			</div>
			<div class="tab-pane" id= "tab1-2">
				<p>test2</p>
			</div>
			<div class="tab-pane" id="tab2">
				<jsp:include page="mybuyList.jsp"></jsp:include>
			</div>
			<div class="tab-pane" id="tab3">
				<p>menu2 부분입니다.</p>
<%-- 					<c:import url="mycart.jsp"></c:import> --%>
<%-- 	<%@include file="productdetallbuy.jsp" %> --%>
			</div>
		</div>
	</div>

	<div class="div_last"></div>
</body>
</html>