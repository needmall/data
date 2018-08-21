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

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(document).ready(function() { 
                $.ajax({  //{}->제이슨 표기임.
                    url:"/productdetail/productdetailSub.do",  //요청 url  //전송url
                    type:"post",  //get/post  //전송시 메서드 방식
                    dataType:"text"  //응답 받을 데이터 타입
                    
                });
                
			});

		</script>
		<style>
			.ul-{width:650px; list-style:none;padding-top:15px}
			.ul- li{float:left;margin-right:10px;font-family:dotum; text-align: left;}
			.all{width: 1024px;margin: auto; text-align: center;height:1000px; }
			.middle_left{width: 25%; height : 240px; margin: 5%}
			.middle_light{width: 55%;height : 240px;  margin: 5%}  
			.middle{float:left;margin-right:10px;font-family:dotum;border: 1px solid black;}
			.h3-{text-align: left; }
/* 			.center{border: 1px solid black;} */  
			.table-main tr td{text-align: left;}
			.table-main tr td-child(1){margin-left: 10px;}
			
			#topMenu { height: 30px; /* 메인 메뉴의 높이 */ width: 850px; /* 메인 메뉴의 넓이 */ } #topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */ list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */ margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */ padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */ } #topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */ color: white; /* 글씨 색을 흰색으로 설정 */ background-color: #2d2d2d; /* 배경 색을 RGB(2D2D2D)로 설정 */ float: left; /* 왼쪽으로 나열되도록 설정 */ line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */ vertical-align: middle; /* 세로 정렬을 가운데로 설정 */ text-align: center; /* 텍스트를 가운데로 정렬 */ position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */ } .menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */ text-decoration:none; /* a 태그의 꾸밈 효과 제거 */ display: block; /* a 태그의 클릭 범위를 넓힘 */ width: 150px; /* 기본 넓이를 150px로 설정 */ font-size: 12px; /* 폰트 사이즈를 12px로 설정 */ font-weight: bold; /* 폰트를 굵게 설정 */ font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */ } .menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */ color: white; } .topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */ color: red; /* 글씨 색 빨간색 */ background-color: #4d4d4d; /* 배경색을 밝은 회색으로 설정 */ } .submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */ color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */ background-color: white; /* 배경색을 흰색으로 설정 */ border: solid 1px black; /* 테두리를 설정 */ margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */ } .longLink { /* 좀 더 긴 메뉴 스타일 설정 */ width: 190px; /* 넓이는 190px로 설정 */ } .submenu { /* 하위 메뉴 스타일 설정 */ position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */ height: 0px; /* 초기 높이는 0px로 설정 */ overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */ transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */ -webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */ -moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */ -o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */ } .topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */ height: 93px; /* 높이를 93px로 설정 */ } .submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */ color: red; /* 글씨색을 빨간색으로 설정 */ background-color: #dddddd; /* 배경을 RGB(DDDDDD)로 설정 */ }

		</style> 
   </head>
   
   <body  class="zoomContainer">

	<div class="all">
		<div>
		<!--//////////////////////////////////////////////////////////////////////////  -->
			<nav id="topMenu" >
				<ul>
				
<%-- 					<c:foreach items="${category}" var="categoryList" varStatus="status"> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${status.first}"> --%>
<!-- 								<li class="topMenuLi"> -->
<%-- 					                <a class="menuLink" href="#">${categoryList.c1_name }</a> --%>
<%-- 					                <c:forEach items="${category}" var="categoryList2" varStatus="status2"> --%>
<!-- 						                <ul class="submenu"> -->
<%-- 						                    <li><a href="#">${categoryList.c2_name }</a></li> --%>
<!-- 						                </ul> -->
<%-- 					                </c:forEach> --%>
<!-- 					            </li> -->
<%-- 						  	</c:when> --%>
<%-- 							<c:otherwise>	 --%>
<!-- 								<li>|</li> -->
<!-- 					            <li class="topMenuLi"> -->
<!-- 					                <a class="menuLink" href="#">TAG CLOUD</a> -->
<!-- 					                <ul class="submenu"> -->
<%-- 						                <c:forEach items="${category}" var="categoryList2" varStatus="status2"> --%>
<%-- 						                	<c:if test="categoryList2.c2_name !='' "></c:if> --%>
<%-- 						                    <li><a href="#" class="submenuLink">${categoryList2.c2_name }</a></li> --%>
<%-- 						                </c:forEach>     --%>
<!-- 					                </ul> -->
<!-- 					            </li> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<%-- 					</c:foreach> --%>
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
		<div class="sub-menu"></div>
  	</div>
   </body>
</html>