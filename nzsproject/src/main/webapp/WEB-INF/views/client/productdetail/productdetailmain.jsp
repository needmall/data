<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
      
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
        <!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->
      
         <!-- 모바일 웹 페이지 설정 -->
         <!-- 모바일 웹 페이지 설정 종료 -->
      
         <!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
         <!-- [if lt IE 9] -->
         <!-- <script src="/resources/js/html5shiv.js"</script> -->
         <!-- [endif] -->
         <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
         <script type="text/javascript" src="/resources/include/js/common.js"></script>
         <script type="text/javascript" src="/resources/include/js/jquery.zoomooz.min.js"></script>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 		 <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" /> -->
<!-- 		 <link rel="stylesheet" type="text/css" href="/resources/include/css/productdetail.css" /> -->
		 
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(function() {
				$("#item").click(function() {
					submenu();
				})
				
			})
			
			
			function submenu() {
     			$.ajax({
     				url : "/productdetail/productdetailStore.do",
     				type : "get",
//      				data : "p_num="+$("#p_num").val(), 이거 나중에 받아오면 넣어야함
     				dataType : "text",
     				error : function(){
     					alert('시스템 오류입니다. 관리자에게 문의하세요');
     				},
     				success : function(resultData){
     					if(resultData==0){
     						for (var i = 0; i < array.length; i++) {
     							a = $("<tr>").append($("<td>").val("판매자"))
     							a.append($("<td>").val("정보 넣을거임"))
     						}
     						$("#submenu").append(a);
     					}else{
     						alert("정보 넣는 곳 에서 오류 납니다.");
     						return;
     					}
     				}
     			});
     			

			}

		</script>
		<style>
			.all{height: 3000px;}
			.contentTB{width: 100%}
		</style> 
   </head>
   
   <body  class="zoomContainer">

	<div class="all">
		<div>
		<!--//////////////////////////////////////////////////////////////////////////  -->
			<nav id="topMenu" >
				<ul>
<%-- 					<c:if test="${not empty category }"> --%>

<%-- 						<c:forEach var="category" items="${category }" varStatus="status"> --%>
<%-- 							<c:set var="check" value="${category.c1_num }"></c:set> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${status.first }"> --%>
<!-- 									<li class="topMenuLi"> -->
<%--  					                	<a class="menuLink" href="#">${category.getC1_name() }</a> --%>
<%--  					                	<c:forEach var= "category2" items="${category2 }" varStatus="status2"> --%>
<%-- 	 					                	<c:if test="${category.getC1_name()} eq ${category2.getC1_name()}"> --%>
<!-- 		 					             		<ul class="submenu"> -->
<%-- 								                    <li><a href="#">${category.getC2_name()  }</a></li> --%>
<!-- 								                </ul> -->
<%-- 								            </c:if> --%>
<%-- 						                </c:forEach> --%>
<!-- 						        	</li> -->
<%-- 								</c:when> --%>

<%-- 							</c:choose> --%>
<%-- 						</c:forEach> --%>
<%-- 					</c:if> --%>
				</ul>
			</nav>
							
	<!--//////////////////////////////////////////////////////////////////////////  -->
		</div>
		<div class="center" >
			<ul class="ul-">
				<li class="middle">
					<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
					</select>
				</li>
				<li>&lt</li>
				<li class="middle">
					<select>
						<option>4</option>
						<option>5</option>
						<option>6</option>				
					</select>
				</li>
			</ul>
		</div>
		<div><h3 class="h3-">${detail.p_division }</h3></div>
		<div>
		  	<div class="middle_left middle zoomTarget level0">
		  		<img src="/uploadStorage/product/${detail.pi_image}" width="100%" height="100%"/>
		  	</div>
		  	<div class="middle_light middle">
		  		<table class="table-main">
		  			<tr>
		  				<td>쇼킹딜 &nbsp;(<span id="countdown"></span>)</td>
		  			</tr>
		  			<tr><td colspan="2"><hr></td></tr>
		  			<tr>
		  				<td>소비자 가격</td>
		  				<td>&nbsp;:&nbsp;${detail.ps_price }원</td>
		  			</tr>
		  			<tr>
		  				<td>판매가격</td>
		  				<td>&nbsp;:&nbsp;${detail.p_price }원</td>
		  			</tr>
		  			<tr>
		  				<td>제조사</td>
		  				<td>&nbsp;:&nbsp;${detail.p_division}</td>
		  			</tr>
		  			
		  			<tr>
		  				<td>상품 설명	</td>
		  				<td>&nbsp;:&nbsp;${detail.p_content }</td>
		  			</tr>
		  			<tr>
		  				<td>남은 재고</td>
		  				<td>&nbsp;:&nbsp;<input type="number" min="1" max="${detail.ps_count }" value="1"> </td>
		  			</tr>
		  			<tr>
		  				<td>
		  					할인율 ${detail.discount }%
		  				</td>
		  				<td>
		  					교환 환불 불가
		  				</td>
		  			</tr>
		  			<tr>
		  				<td><input type="button" value="바로 구매하기"></td>
		  				<td><input type="button" value="장바구니 담기"></td>
		  			</tr>
		  		</table>
		  	</div>
	  	</div>
	  	<div>
			<ul class="ul-">
				<li><a href="#">상품</a></li>
				<li><a href="#">상품 리뷰</a></li>
				<li><a href="#">서비스 리뷰</a></li>
				<li><a href="#">Q&A</a></li>
				<li><a href="#">판매자 정보</a></li>
			</ul>
		</div>
		<div class="sub-menu">
			<div class="contentTB" style="background: black;">
			<table>
				<tbody id="submenu">
					<colgroup width="100%">
						<col width="20%">
						<col width="70%">  
					</colgroup> 

				</tbody>
			</table>
		</div>
		</div>
  	</div>
   </body>
</html>