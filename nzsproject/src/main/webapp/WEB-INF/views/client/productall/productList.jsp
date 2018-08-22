<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<link rel="stylesheet" type="text/css" href="/resources/include/css/productall.css">
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<!-- 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services"></script>
<!-- services와 clusterer 라이브러리 불러오기 -->
<!-- clusterer: 마커를 클러스터링 할 수 있는 클러스터러 라이브러리 입니다.
      services: 장소 검색 과 주소-좌표 변환 을 할 수 있는 services 라이브러리 입니다.
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services,clusterer"></script> -->


<script type="text/javascript">
	$(function() {
		
		// 위도, 경도
		var lat=0;
		var lon=0;
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function (position) {					 
				lat = position.coords.latitude;
				lon = position.coords.longitude;
				console.log("안 lat:"+lat+", lon:" +lon);
			});			
				console.log("lat:"+lat+", lon:" +lon);
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다			
						// 검색을 유도하는 안내문 작성
		}
		
		// 할인율 계산
		$(".col-sm-6").each(function(index) {
			var p_price 		= $(".p_price").eq(index).html();
			var ps_price 		= $(".ps_price").eq(index).html();
			var discountRate 	= (p_price - ps_price) / p_price * 100 
			$(".discountRate").eq(index).html(Math.round(discountRate));
		})
		
		// 주소 검색
		$(".ico-pick").click(function() {
			
		});
		
	}); // End Jquery
</script>

<!-- 당신의 위치 -->
<div>
	<input type="text" id="address" name="address" ><input type="button" id="search" value="검색">
</div>
<div>
	<h3 id="yourlocation"></h3>
	<h3 id="nolocation"></h3>
</div>



<div id="search" class="clearfix search-show slim-search">
	<div class="input-group">
		<span class="input-group-btn loc">
			<button class="btn btn-default ico-loc" type="button">&nbsp;</button>
		</span>
		<form class="ng-valid-minlength ng-dirty ng-valid ng-valid-required">
			<input type="search"
				class="form-control ng-scope ng-valid-minlength ng-dirty ng-valid ng-valid-required ng-touched"
				name="address_input" autocomplete="off" spellcheck="false"
				placeholder="예) 역삼동,신림동" required="required">
		</form>
		<span id="button_search_address"
			class="input-group-btn always-show-search-buttons">
			<button
				class="btn-search-location-cancel btn-search-location btn btn-default ng-hide"
				type="button">
				<span class="searchfield-cancel-button">&nbsp;</span>
			</button>
			<button class="btn btn-default ico-pick" type="button">검색</button>
		</span>
	</div>
</div>
<div class="main_prodlist main_prodlist_list">
	<h2>☆ 즐겨찾기 매장</h2>
	<c:choose>
		<c:when test="${not empty productFavList}">
			<c:forEach var="FavList" items="${productFavList}" varStatus="status">
				<div class="col-sm-6 contract">
					<div class="item clearfix">
						<table>
							<tbody>
								<tr data-num="${FavList.ps_num}">
									<td>
										<div class="logo">
											<img class="fileImage" src="/uploadStorage/store/${FavList.si_image}">
											<p>${FavList.st_name}</p>
										</div>
									</td>
									<td>
										<div class="logo">
											<img class="fileImage" src="/uploadStorage/product/${FavList.pi_image}">
										</div>
									</td>
									<td>
										<div class="restaurants-info">
											<div class="restaurant-name ng-binding" title="${FavList.p_name}">${FavList.p_name}
											</div>
											<div class="restaurant-name ng-binding" title="${FavList.ps_expiration}">${FavList.ps_expiration}
											</div>
											<div class="stars">
												<%-- <span> <span class="ico-star1 ng-binding"
														ng-show="restaurant.review_avg > 0">★ 4.5</span>
													 </span> <span class="review_num ng-binding"
														ng-show="restaurant.review_count > 0"> 리뷰 1305 </span>
													<span class="review_num ng-binding" ng-show="restaurant.owner_reply_count > 0"> 사장님댓글 438</span>
													<span ng-show="restaurant.review_count < 1" class="ng-hide"> 첫번째 리뷰를 남겨주세요! </span> --%>
											</div>
										</div>
									</td>
									<td>
										<div>
											<span>남은수량</span>
											<div></div>
											<span>${FavList.ps_count}개</span>
										</div>
									</td>
									<td>
										<div>
											<ul>
												<li class="payment-methods ng-binding yogiseo-payment">
													<span class="discountRate"></span><span>%</span>
												</li>
											</ul>
										</div>
									</td>
									<td>
										<div>
											<ul>
												<li class="payment-methods ng-binding yogiseo-payment"><span class="p_price">${FavList.p_price}</span>
												</li>
												<li class="payment-methods ng-binding yogiseo-payment">
													<span class="ps_price">${FavList.ps_price}</span>
												</li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="6" class="tac">등록된 상품이 존재하지 않습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
</div>
