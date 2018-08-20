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
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

		<script type="text/javascript">
// 			var intervals = ${detail.ps_regdate}
// 			function timer() {
// 			    $("#countdown").val(intervals);
// 			    setTimeout(timer, 10); // 0.01초
// 			    intervals--;
// 			    if(intervals >= 0) {
// 			      //아웃
// 			    }
// 			}
// 			setTimeout(timer, 10);
		</script>
		
		<style>
			.ul-{width:650px; height:5px; list-style:none;padding-top:15px}
			.ul- li{float:left;margin-right:10px;font-family:dotum; text-align: left;}
			.all{width: 960px;margin: auto; text-align: center;}
			.middle_left{width: 25%; margin: 5%}
			.middle_light{width: 55%; margin: 5%}  
			.middle{float:left;margin-right:10px;font-family:dotum;border: 1px solid black;}
			.h3-{text-align: left;}
			.center{border: 1px solid black;}
		</style> 
   </head>
   <body>

	<div class="all">
		<div>
			<ul class="ul-">
				<li class="middle"><a href="#">상위 카테고리 1</a></li>
				<li class="middle"><a href="#">상위 카테고리 2</a></li>
				<li class="middle"><a href="#">상위 카테고리 3</a></li>
			</ul>
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
		<h3 class="h3-">${detail.p_division }</h3> 
		<div>
		  	<div class="middle_left middle">
		  		<img src="/uploadStorage/product/${detail.pi_image}" width="100%" height="100%"/>
		  	</div>
		  	<div class="middle_light middle">
		  		<table>
		  			<tr>
		  				<td>쇼킹딜 (<span id="countdown"></span>)</td>
		  			</tr>
		  			<tr><td colspan="2"><hr></td></tr>
		  			<tr>
		  				<td>소비자 가격</td>
		  				<td>	:${detail.ps_price }원</td>
		  			</tr>
		  			<tr>
		  				<td>판매가격</td>
		  				<td>	:${detail.p_price }원</td>
		  			</tr>
		  			<tr>
		  				<td>제조사</td>
		  				<td>	:${detail.p_division}</td>
		  			</tr>
		  			
		  			<tr>
		  				<td>상품 설명	</td>
		  				<td>:${detail.p_content }</td>
		  			</tr>
		  			<tr>
		  				<td>남은 재고</td>
		  				<td>:<input type="number" min="1" max="${detail.ps_count }" value="1"> </td>
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
  	</div>
   </body>
</html>