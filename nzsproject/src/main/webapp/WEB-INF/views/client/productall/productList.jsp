<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<link rel="stylesheet" type="text/css" href="/resources/include/css/productall.css" />
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<!-- 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services"></script>

<script type="text/javascript">
	
	
	
	$(function() {
		
		/* 할인율 계산 */
		addDiscountRate($(".contract"));
		
		/* 주소-좌표 변환 객체 생성 */
		var geocoder = new daum.maps.services.Geocoder();
		
		/* 주소 검색 버튼 */
		$("#search").click(function() {
			/* 주소 검색 */
			geocoder.addressSearch($("#address").val(), function (result, status) {	
				if (status === daum.maps.services.Status.OK) {
					var lat = result[0].address.y;
					var lon = result[0].address.x;
					var nowlocation = result[0].address_name;
					
					/* 검색 주소 입출력 */
					$("#yourlocation").val(nowlocation);
					$("#yourlocation").show();
			
					addSearch(lat, lon);
				}
				/* 주소 초기화 */ 
				$("#address").val("");
			});
		}); // END #search
		
		$(".glyphicon-screenshot").click(function() {
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation.getCurrentPosition(function(position) {
					var lat = position.coords.latitude;
					var lon = position.coords.longitude;
					
					geocoder.coord2RegionCode(lon, lat, getAddress);
					addSearch(lat, lon);
				});
			}
		});

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
	}); // End Jquery
	
	/* 할인율 계산 */
	function addDiscountRate(div_cnt) {
		div_cnt.each(function(index) {
			var p_price 		= div_cnt.find($(".p_price")).eq(index).html();
			var ps_price 		= div_cnt.find($(".ps_price")).eq(index).html();
			var discountRate 	= (p_price - ps_price) / p_price * 100;
			div_cnt.find($(".discountRate")).eq(index).html(Math.round(discountRate));
		})
	}
	

	// 맵의 가운데 위도 경도를 행정주소로 반환
	function getAddress (result, status) {  
		if (status === daum.maps.services.Status.OK) {
			var nowlocation = result[0].address_name;
			$("#yourlocation").val(nowlocation);
		}
	}
	
	function addSearch(lat, lon) {
		var url = "/productall/productLocList.do?c_lat="+lat+"&c_lon="+lon;
		$.getJSON(url, function(data) {
			/* 주변매장 상품 초기화 */
			$(".periphery_list").html("");
			
			$(data).each(function() {
				var ps_num = this.ps_num;
				var si_image = this.si_image;
				var st_name = this.st_name;
				var pi_image = this.pi_image;
				var p_name	= this.p_name;
				var p_price	= this.p_price;
				var ps_expiration = this.ps_expiration;
				var ps_count = this.ps_count;
				var ps_price = this.ps_price;
				var prv_count = this.prv_count;
				var prv_scope = this.prv_scope;
				var distance = this.distance;
				
				/* 목록 생성 */
				addNewItem(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope, distance);
			});
			/* 동적 추가된 상품 할인율 계산 */
			addDiscountRate($(".contract_periphery"));
		}).fail(function() {
			alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	}
	
	/* 주소 검색 주변매장 동적 생성 */
	function addNewItem(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope, distance) {
		
		var new_div_contract = $("<div>");
		new_div_contract.addClass("col-sm-6 contract_periphery");
		
		var new_div_clearfix = $("<div>");
		new_div_clearfix.addClass("item clearfix");
		
		var new_table = $("<table>");
		var new_tbody = $("<tbody>");
		
		var new_tr = $("<tr>");
		new_tr.attr("data-ps_num", ps_num);
		
		var new_td_si = $("<td>");
	
		var new_div_logo = $("<div>");
		new_div_logo.addClass("logo");
		
		var new_img_si = $("<img>");
		new_img_si.attr("src" , "/uploadStorage/store/" + si_image);
		new_img_si.addClass("fileImage");
		
		var new_p_name = $("<p>");
		new_p_name.text(st_name);
		
		var new_td_pi = $("<td>");
		var new_div_product = $("<div>");
		new_div_product.addClass("logo");
		
		var new_img_pi = $("<img>");
		new_img_pi.attr("src", "/uploadStorage/product/" + pi_image);
		new_img_pi.addClass("fileImage");
		
		var new_td_p = $("<td>");
		var new_div_name = $("<div>");
		new_div_name.addClass("restaurants-info");
		var new_div_expiration = $("<div>");
		new_div_expiration.attr("title", p_name);
		new_div_expiration.addClass("restaurant-name ng-binding");
		new_div_expiration.text(p_name);
		
		var new_div_scope = $("<div>");
		new_div_scope.attr("title", ps_expiration);
		new_div_scope.addClass("restaurant-name ng-binding");
		new_div_scope.text(ps_expiration);
		
		var new_div_stars = $("<div>");
		new_div_stars.addClass("stars");
		var new_span_scope = $("<span>");
		new_span_scope.addClass("ico-star1 ng-binding");
		new_span_scope.text("★ " + prv_scope + " | ");
		var new_span_count_prv = $("<span>");
		new_span_count_prv.addClass("review_num ng-binding");
		new_span_count_prv.text("리뷰 " + prv_count);
		
		var new_td_ps = $("<td>");
		var new_div_txt = $("<div>");
		var new_span_txt = $("<span>");
		new_span_txt.text("남은수량");
		var new_div_space = $("<div>");
		var new_span_count_ps = $("<span>");
		new_span_count_ps.text(ps_count + "개");
		
		var new_td_discount = $("<td>");
		var new_div_discount = $("<div>");
		var new_ul_txt = $("<ul>");
		var new_li_txt = $("<li>");
		new_li_txt.addClass("payment-methods ng-binding yogiseo-payment");
		var new_span_discount = $("<span>");
		new_span_discount.addClass("discountRate");
		var new_span_text = $("<span>");
		new_span_text.text("%");
		
		var new_td_p_ps = $("<td>");
		var new_div_price = $("<div>");
		var new_ul_price = $("<ul>");
		var new_li_price = $("<li>");
		new_li_price.addClass("payment-methods ng-binding yogiseo-payment");
		var new_span_price = $("<span>");
		new_span_price.addClass("p_price");
		new_span_price.text(p_price);
		var new_li_ps_price = $("<li>");
		new_li_ps_price.addClass("payment-methods ng-binding yogiseo-payment");
		var new_span_price_ps = $("<span>");
		new_span_price_ps.addClass("ps_price");
		new_span_price_ps.text(ps_price);
		var new_li_m = $("<li>");
		new_li_m.addClass("payment-methods ng-binding yogiseo-payment");
		var new_span_m = $("<span>");
		new_span_m.html("거리 " + Math.round(distance) + "m");
		
		new_div_logo.append(new_img_si).append(new_p_name);
		new_td_si.append(new_div_logo);
		new_tr.append(new_td_si);
		
		new_div_product.append(new_img_pi);
		new_td_pi.append(new_div_product)
		new_tr.append(new_td_pi);
		
		new_div_stars.append(new_span_scope).append(new_span_count_prv);
		new_div_scope.append(new_div_stars);
		new_div_expiration.append(new_div_scope);
		new_div_name.append(new_div_expiration);
		new_td_p.append(new_div_name);
		new_tr.append(new_td_p);
		
		new_div_txt.append(new_span_txt).append(new_div_space).append(new_span_count_ps);
		new_td_ps.append(new_div_txt);
		new_tr.append(new_td_ps);
		
		new_li_txt.append(new_span_discount).append(new_span_text);
		new_ul_txt.append(new_li_txt);
		new_div_discount.append(new_ul_txt)
		new_td_discount.append(new_div_discount);
		new_tr.append(new_td_discount);
		
		new_li_price.append(new_span_price);
		new_ul_price.append(new_li_price);
		new_li_ps_price.append(new_span_price_ps);
		new_ul_price.append(new_li_ps_price);
		new_li_m.append(new_span_m);
		new_ul_price.append(new_li_m);
		new_div_price.append(new_ul_price);
		new_td_p_ps.append(new_div_price)
		new_tr.append(new_td_p_ps);
		
		new_table.append(new_tbody).append(new_tr);
		new_div_contract.append(new_div_contract).append(new_table);
		
		$(".periphery_list").append(new_div_contract);

	}
</script>

<!-- 당신의 위치 -->
<div class="form-inline">
	<div class="form-group">
		<label for="yourlocation"> 검색된 지역  </label>
		<input class="form-control" type="text" id="yourlocation" readonly="readonly">
	</div>
	<div class="form-group" >
		<label for="address">매장 검색 지역  </label>				
		<input class="form-control" type="text" id="address" name="address" placeholder="검색할 지역을 입력하세요(예, 성동구 도선동)">
		<button type="button" class="glyphicon glyphicon-screenshot">&nbsp;</button>
		<input class="btn btn-default" type="button" id="search" value="검 색">
	</div>
</div>
<form id="detailForm">
	<input type="hidden" id="ps_num" name="ps_num" />
</form>


<div class="main_prodlist main_prodlist_list">
	<h2>☆ 즐겨찾기 매장 상품</h2>
	<div class="favorites_list">
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
											<div class="restaurant-name ng-binding"
												title="${FavList.p_name}">${FavList.p_name}</div>
											<div class="restaurant-name ng-binding"
												title="${FavList.ps_expiration}">${FavList.ps_expiration}</div>
											<div class="stars">
												<span class="ico-star1 ng-binding">★ ${FavList.prv_scope} | </span>
												<span class="review_num ng-binding">리뷰 ${FavList.prv_count}</span>
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
</div>

<div class="main_prodlist main_prodlist_list periphery">
	<h2>☆ 주변 매장 상품</h2>
	<div class="periphery_list">
	<c:choose>
		<c:when test="${not empty productAllList}">
			<c:forEach var="AllList" items="${productAllList}" varStatus="status">
				<div class="col-sm-6 contract">
					<div class="item clearfix">
						<table>
							<tbody>
								<tr data-num="${AllList.ps_num}">
									<td>
										<div class="logo">
											<img class="fileImage" src="/uploadStorage/store/${AllList.si_image}">
											<p>${AllList.st_name}</p>
										</div>
									</td>
									<td>
										<div class="logo">
											<img class="fileImage" src="/uploadStorage/product/${AllList.pi_image}">
										</div>
									</td>
									<td>
										<div class="restaurants-info">
											<div class="restaurant-name ng-binding" title="${AllList.p_name}">${AllList.p_name}
											</div>
											<div class="restaurant-name ng-binding" title="${AllList.ps_expiration}">${AllList.ps_expiration}
											</div>
											<div class="stars">
												<span class="ico-star1 ng-binding">★ ${AllList.prv_scope} | </span>
												<span class="review_num ng-binding">리뷰 ${AllList.prv_count}</span>
											</div>
										</div>
									</td>
									<td>
										<div>
											<span>남은수량</span>
											<div></div>
											<span>${AllList.ps_count}개</span>
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
												<li class="payment-methods ng-binding yogiseo-payment"><span class="p_price">${AllList.p_price}</span>
												</li>
												<li class="payment-methods ng-binding yogiseo-payment">
													<span class="ps_price">${AllList.ps_price}</span>
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
</div>
