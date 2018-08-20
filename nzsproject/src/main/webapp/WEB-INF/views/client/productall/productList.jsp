<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 치신 버전의 방식으로 HTML 보여주도록 설정 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

<!-- 모바일 웹페이지 설정 -->
<!-- viewport : 화면에 보이는 영역을 제어하는 기술, width는 device-width로 설정, initial-scale는 초기비율 -->
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">

<link rel="shortcut icon" href="/resources/images/common/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />

<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스 필터를 적용하면 된다. -->
<!-- [if lt IE 9]> <script src="/resources/include/js/html5shiv.js"></script> <![endif]-->


<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/board.css">
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css">

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript" src="/resources/include/jquery/common.js"></script>

<script type="text/javascript">
	(function() {

	}); // End Jquery
</script>
</head>
<body>
	<div class="main_prodlist main_prodlist_list">
		<c:choose>
			<c:when test="${not empty productFavList}">
				<c:forEach var="FavList" items="${productFavList}" varStatus="status">
					<div class="col-sm-6 contract"
						ng-repeat="restaurant in restaurant_list"
						on-finish-render="completeRestaurantListRender()">
						<div class="item clearfix"
							ng-click="select_restaurant(restaurant, $index)"
							style="cursor: pointer;">
							<table>
								<tbody>
									<tr>
										<td>
											<div ng-show="restaurant|restaurant_is_available" class="logo"
												style="background-image: url(/media/restaurant_logos/'${FavList.si_image}');">${FavList.st_name}</div>
											<div ng-show="! (restaurant|restaurant_is_available)"
												class="logo not-available ng-binding ng-hide">
												현재 요기요<br>서비스가<br>제공되지<br>않습니다.
											</div>
										</td>
										<td>
											<div class="restaurants-info">
												<div class="restaurant-name ng-binding"
													ng-bind="restaurant.name" title="BHC-한양대마장점">BHC-한양대마장점</div>
												<div class="stars">
													<span> <span class="ico-star1 ng-binding"
														ng-show="restaurant.review_avg > 0">★ 4.5</span>
													</span> <span class="review_num ng-binding"
														ng-show="restaurant.review_count > 0"> 리뷰 1305 </span> <span
														class="review_num ng-binding"
														ng-show="restaurant.owner_reply_count > 0"> 사장님댓글
														438 </span> <span ng-show="restaurant.review_count < 1"
														class="ng-hide"> 첫번째 리뷰를 남겨주세요! </span>
												</div>
												<ul>
													<li class="payment-methods ng-binding yogiseo-payment"
														ng-class="is_online_payment(restaurant) ? 'yogiseo-payment' : ''">요기서결제</li>
													<!--
					  <li ng-show='restaurant.payment_methods.indexOf("none") > -1' class="payment-yogiyo">현금 결제</li>
					  <li ng-show='restaurant.payment_methods.indexOf("creditcard") > -1' class="payment-yogiyo">현장 카드 결제</li>
					  <li ng-show='restaurant.payment_methods.indexOf("online") > -1' class="ico-payment-yogiyo">요기서 결제</li>
					  <li ng-show='restaurant.payment_methods.indexOf("onlydbank") > -1' class="ico-payment-yogiyo">계좌이체 결제</li>
					  <li ng-show='restaurant.payment_methods.indexOf("onlyhpp") > -1' class="ico-payment-yogiyo">모바일 결제</li>
					  <li ng-show='restaurant.payment_methods.indexOf("onlycard") > -1' class="ico-payment-yogiyo">온라인카드 결제</li>
					  -->
													<li class="min-price ng-binding">15,000원 이상 배달</li>
													<li class="full-w"
														ng-show="is_yogiyo &amp;&amp; (delivery_discount_value($index) > 0 || additional_discount_value($index) > 0 || restaurant.tags.length > 0 &amp;&amp; restaurant.tags.indexOf('CESCO') > -1)">
														<span class="coupon-base ng-binding"
														ng-show="delivery_discount_value($index) > 0">배달할인
															2,000원</span> <span
														class="coupon-base coupon-style1 ng-binding ng-hide"
														ng-show="additional_discount_value($index) > 0">추가할인
															0%</span> <span
														ng-show="restaurant.tags.length > 0 &amp;&amp; restaurant.tags.indexOf(&quot;CESCO&quot;) > -1"
														class="ico-cesco ng-hide">cesco</span>
													</li>
													<li class="delivery-time ng-binding"
														ng-show="restaurant.estimated_delivery_time">35~45분</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>








					<tr class="tac" data-num="${board.b_num}">
						<td>${board.b_num}</td>
						<td class="goDetail tal">${board.b_title}</td>
						<td>${board.b_date}</td>
						<td class="name">${board.b_name}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>












	</div>
</body>
</html>