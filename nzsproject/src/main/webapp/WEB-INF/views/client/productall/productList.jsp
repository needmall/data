<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<link rel="stylesheet" type="text/css" href="/resources/include/css/productall.css">
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<!-- 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services"></script>

<script type="text/javascript">
	$(function() {
		
		// 판매자 번호 목록, 반복문 변수
		var s_num = new Array();
		var i = 0;
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 검색해서 해당 위치로 이동, 목록 , 마커 생성
		$("#search").click(function() {
			// 반복문 초기화
			i = 0;
			
			// 주소로  위도 경도 찍기
			geocoder.addressSearch($("#address").val(), function (result, status) { // 주소 검색으로 나오는 첫번째 결과를  위도 경도로 받아오기
						
				if (status === daum.maps.services.Status.OK) {						
					var lat = result[0].address.y
					var lon = result[0].address.x						
					$("#c_lat").val(lat);
					$("#c_lon").val(lon);
									
					// 행정동 표시
					// 좌표로 행정동 주소 정보를 요청합니다
					/* geocoder.coord2RegionCode(lon, lat, getAddress); */
					//$("#yourlocation").show();
									
				/* 	var url = "/storeall/storelist.do?c_lat="+lat+"&c_lon="+lon;
					$.getJSON(url, function(data) {
						$(data).each(function() {
							console.log("1: " + this.st_num);
						});
					}).fail(function() {
						alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
					}); */
				}
			});
		});
					
		
		
		
		
		
		// 할인율 계산
		$(".col-sm-6").each(function(index) {
			var p_price 		= $(".p_price").eq(index).html();
			var ps_price 		= $(".ps_price").eq(index).html();
			var discountRate 	= (p_price - ps_price) / p_price * 100 
			$(".discountRate").eq(index).html(Math.round(discountRate));
		})
		
		
		
		
		
		/* 상세페이지 이동 */
		$(".restaurants-info").click(function() {
			var ps_num = $(this).parents("tr").attr("data-num");
			$("#ps_num").val(ps_num);
			
			$("#detailForm").attr({
				"method" : "GET",
				"action" : "/productdetail/productdetailmain.do"
			});
			$("#detailForm").submit();
		});
		
		// 구매 버튼 생성 및 삭제
		/* $('.col-sm-6').hover(function(){
			var new_span = $("<span>");
			new_span.addClass("new_buy");
			new_span.append($(this).$(".item"));
			$(this).children().appendTo(new_span);
		}, function(){
			//$(this).children(".new_buy").remove();
			}
		); */
		
	}); // End Jquery

	// 맵의 가운데 위도 경도를 행정주소로 반환
	function getAddress(result, status) {
		if (status === daum.maps.services.Status.OK) {
			var nowlocation = result[0].address_name;
			$("#yourlocation").html("매장 검색 위치 :" + nowlocation);
		}
	}
</script>

<!-- 당신의 위치 -->
<div>
	<span id="yourlocation"></span> <span id="nolocation"></span> <input
		type="text" id="address" name="address"><input type="button"
		id="search" value="검색">
</div>

<input type="hidden" name="c_lat" id="c_lat">
<input type="hidden" name="c_lon" id="c_lon">


<div id="search" class="slim-search clearfix search-show">
	<div class="input-group">
		<span class="input-group-btn loc">
			<button class="btn btn-default ico-loc" type="button"
				ng-click="get_current_location()">&nbsp;</button>
		</span>
		<form action="." onsubmit="return false"
			class="ng-valid-minlength ng-dirty ng-valid-parse ng-valid ng-valid-required">
			<input type="search"
				class="form-control ng-scope ng-valid-minlength ng-dirty ng-valid-parse ng-valid ng-valid-required ng-touched"
				name="address_input" placeholder="예) 역삼동,신림동">
			<ul tabindex="-1"
				class="dropdown-menu ng-scope am-flip-x bottom-left" role="menu"
				style="top: 40px; left: 49px; display: block; visibility: visible; min-width: 372px;">
				
				<!-- ngRepeat: item in content -->
				<li class="ng-scope">
					<!-- ngIf: !item.divider && item.href --> <!-- ngIf: !item.divider && item.click -->
					<a role="menuitem" tabindex="-1" href="javascript:void(0)"
					ng-if="!item.divider &amp;&amp; item.click"
					ng-click="$eval(item.click);$hide()" ng-bind-html="item.text"
					class="ng-binding ng-scope">현재 위치로 설정합니다.</a>
				<!-- end ngIf: !item.divider && item.click -->
				</li>
				<!-- end ngRepeat: item in content -->
				<li role="presentation" ng-class="{divider: item.divider}"
					ng-repeat="item in content" class="ng-scope divider">
					<!-- ngIf: !item.divider && item.href --> <!-- ngIf: !item.divider && item.click -->
				</li>
				<!-- end ngRepeat: item in content -->
				<li role="presentation" ng-class="{divider: item.divider}"
					ng-repeat="item in content" class="ng-scope">
					<!-- ngIf: !item.divider && item.href --> <!-- ngIf: !item.divider && item.click -->
					<a role="menuitem" tabindex="-1" href="javascript:void(0)"
					ng-if="!item.divider &amp;&amp; item.click"
					ng-click="$eval(item.click);$hide()" ng-bind-html="item.text"
					class="ng-binding ng-scope">서울 성동구 상왕십리동</a>
				<!-- end ngIf: !item.divider && item.click -->
				</li>
			</ul>
		</form>
		<span id="button_search_address"
			class="input-group-btn always-show-search-buttons  show-search-buttons">
			<button
				class="btn-search-location-cancel btn-search-location btn btn-default" type="button">
				<span class="searchfield-cancel-button">&nbsp;</span>
			</button>
			<button class="btn btn-default ico-pick" type="button">검색</button>
		</span>
	</div>
</div>
<div>
	<form action="" id="detailForm" name="detailForm">
		<input type="hidden" id="ps_num" name="ps_num" />
	</form>
</div>
<div class="main_prodlist main_prodlist_list">
	<h2>☆ 즐겨찾기 매장 상품</h2>
	<c:choose>
		<c:when test="${not empty productFavList}">
			<c:forEach var="FavList" items="${productFavList}" varStatus="status">
				<div class="col-sm-6 contract">
					<div class="item clearfix">
						<table>
							<tbody>
								<tr class="tac" data-num="${FavList.ps_num}">
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
											<div class="restaurant-name ng-binding" title="${FavList.p_name}">${FavList.p_name}</div>
											<div class="restaurant-name ng-binding" title="${FavList.ps_expiration}">${FavList.ps_expiration}</div>
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

<div class="main_prodlist main_prodlist_list">
	<h2>☆ 주변 매장 상품</h2>
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
