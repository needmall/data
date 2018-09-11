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
	/* 스토어 이름 형식 추가 */
	addStorename($(".store_name"));
	
	/* 주소-좌표 변환 객체 생성 */
	var geocoder = new daum.maps.services.Geocoder();

		
		// geolocation 확인
		if (navigator.geolocation) {
			console.log("11111111111");
			// 접속 위치 확인
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude;
				var lon = position.coords.longitude;
				
				// 위도, 경도의 주소 검색
				geocoder.coord2RegionCode(lon, lat, getAddress);
				// 주변 매장 검색
				addItem(lat, lon);
				
			});
		} else {
			// 모든 매장 검색
			addItem();
			console.log("2222222222");
		}
		
	
	/* 주소 검색 버튼 */
	$("#search").click(function() {
	
		/* 주소 검색 */
		geocoder.addressSearch($("#address").val(), function(result, status) {
		
			if (status === daum.maps.services.Status.OK) {
				var lat = result[0].address.y;
				var lon = result[0].address.x;
				var nowlocation = result[0].address_name;

				/* 검색 주소 입출력 */
				$("#yourlocation").val(nowlocation);
				$("#yourlocation").show();
				
				addItem(lat, lon);
			}
			
			/* 주소 초기화 */
			$("#address").val("");
		});
	}); // END #search
	
 	/* 상세페이지 이동 */
 	$(document).on("click", ".list-group-item", function() {
 		var ps_num = $(this).find("tr").attr("data-num");
 		$("#ps_num").val(ps_num);
 		$("#review").val("0");
		
 		$("#detailForm").attr({
 			"method" : "GET",
 			"action" : "/productdetail/productdetailmain.do"
 		});
 			$("#detailForm").submit();
 	});
	
	/* 가격 (,) 생성 */
	jQuery('.format-money').text(function() {
	    jQuery(this).text(
	        jQuery(this).text().format()
	    );
	});
	
}); // End Jquery

	/* 할인율 계산 */
	function addDiscountRate(div_cnt) {
		div_cnt.each(function(index) {
			var p_price = div_cnt.find($(".p_price")).eq(index).html();
			var ps_price = div_cnt.find($(".ps_price")).eq(index).html();
			var discountRate = (p_price - ps_price) / p_price * 100;
			div_cnt.find($(".discountRate")).eq(index).html(Math.round(discountRate));
		})
	}

	// 맵의 가운데 위도 경도를 행정주소로 반환
	function getAddress(result, status) {
		if (status === daum.maps.services.Status.OK) {
			var nowlocation = result[0].address_name;
			$("#yourlocation").val(nowlocation);
		}
	}
	
	// 위도, 경도 or 모든 매장 검색
	function addItem(lat, lon) {
		if(lat > 0 && lon > 0) {
			var url = "/productall/productLocList.do?c_lat=" + lat + "&c_lon=" + lon;	
		} else {
			var url = "/productall/productLocList.do";
		}
		
		$.getJSON(url, function(data) {
			// 판매 상품 목록 동적 추가
			$(data).each(function() {
				var ps_num = this.ps_num;
				var si_image = this.si_image;
				var st_name = this.st_name;
				var pi_image = this.pi_image;
				var p_name = this.p_name;
				var p_price = this.p_price;
				var ps_expiration = this.ps_expiration;
				var ps_count = this.ps_count;
				var ps_price = this.ps_price;
				var prv_count = this.prv_count;
				var prv_scope = this.prv_scope;
				var distance = this.distance;
				
				/* 목록 생성 */
				addNewItem(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope, distance);
			});
			/* 상품 할인율 계산, 스토어 이름 형식 동적 추가 */
			addDiscountRate($(".contract_periphery"));
			addStorename($(".store_name"));
		}).fail(function() {
			alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	}
	
	/* 매장이름 형식 추가 */
	function addStorename(item) {
		$(item).each(function() {
			var st_name = $(this).html().replace(/\s/g, "<br>");
			$(this).html(st_name);;
		});
	}
	
	/* 주소 검색 주변매장 동적 생성 */
	function addNewItem(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope, distance) {
		var new_div_contract = $("<div>");
		new_div_contract.addClass("col-md-6 contract contract_periphery list-group-item");

		var new_table = $("<table>");
		var new_tbody = $("<tbody>");

		var new_tr = $("<tr>");
		new_tr.attr("data-num", ps_num);
		
		var new_td_si = $("<td>");
		new_td_si.addClass("jb-th-1");
		var new_div_logo = $("<div>");
		
		var new_img_si = $("<img>");
		new_img_si.attr("src", "/uploadStorage/store/" + si_image);
		new_img_si.addClass("fileImageLogo");

		var new_p_name = $("<p>");
		new_p_name.html(st_name);
		new_p_name.addClass("store_name align-center");

		var new_td_pi = $("<td>");
		new_td_pi.addClass("jb-th-1");
		var new_div_product = $("<div>");

		var new_img_pi = $("<img>");
		new_img_pi.attr("src", "/uploadStorage/product/" + pi_image);
		new_img_pi.addClass("fileImageProduct");

		var new_td_p = $("<td>");
		var new_div_name = $("<div>");
		new_div_name.addClass("restaurants-info sizeWith193");
		var new_div_expiration = $("<div>");
		new_div_expiration.attr("title", p_name);
		new_div_expiration.addClass("restaurant-name ng-binding");
		new_div_expiration.html(p_name);

		var new_div_scope = $("<div>");
		new_div_scope.attr("title", ps_expiration);
		new_div_scope.addClass("restaurant-name ng-binding");
		new_div_scope.html(ps_expiration);

		var new_div_stars = $("<div>");
		new_div_stars.addClass("stars");
		var new_span_scope = $("<span>");
		new_span_scope.addClass("ico-star1 ng-binding glyphicon glyphicon-star");
		new_span_scope.html(prv_scope);
		var new_span_count_prv = $("<span>");
		new_span_count_prv.addClass("review_num ng-binding");
		new_span_count_prv.html("리뷰 " + prv_count);

		var new_td_ps = $("<td>");
		var new_div_txt = $("<div>");
		new_div_txt.addClass("restaurants-info align-center sizeWith58");
		var new_span_txt = $("<span>");
		new_span_txt.addClass("restaurant-name ng-binding");
		new_span_txt.html("남은수량");
		var new_span_count_ps = $("<span>");
		new_span_count_ps.html(ps_count + "개");

		var new_td_discount = $("<td>");
		new_td_discount.addClass("jb-th-2");
		var new_div_discount = $("<div>");
		var new_ul_txt = $("<ul>");
		var new_li_txt = $("<li>");
		new_li_txt.addClass("payment-methods ng-binding yogiseo-payment");
		var new_span_discount = $("<span>");
		new_span_discount.addClass("discountRate");
		var new_span_text = $("<span>");
		new_span_text.html("%");

		var new_td_p_ps = $("<td>");
		var new_div_price = $("<div>");
		new_div_price.addClass("align-center");
		var new_ul_price = $("<ul>");
		var new_li_price = $("<li>");
		new_li_price.addClass("payment-methods ng-binding yogiseo-payment");
		var new_span_price = $("<span>");
		new_span_price.addClass("p_price format-money");
		new_span_price.html(p_price);
		var new_span_priceWon = $("<span>");
		new_span_priceWon.html("원");
		var new_li_ps_price = $("<li>");
		new_li_ps_price.addClass("payment-methods ng-binding yogiseo-payment");
		var new_span_price_ps = $("<span>");
		new_span_price_ps.addClass("ps_price format-money");
		new_span_price_ps.html(ps_price);
		var new_span_price_psWon = $("<span>");
		new_span_price_psWon.html("원");
		var new_li_m = $("<li>");
		new_li_m.addClass("payment-methods ng-binding yogiseo-payment");
		
		var new_span_m = $("<span>");
		if(distance > 1000) {
			new_span_m.html((distance / 1000).toFixed(1) + "km");	
		} else {
			new_span_m.html((distance).toFixed(0) + "m");
		}
		
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

		new_div_txt.append(new_span_txt).append(new_span_count_ps);
		new_td_ps.append(new_div_txt);
		new_tr.append(new_td_ps);

		new_li_txt.append(new_span_discount).append(new_span_text);
		new_ul_txt.append(new_li_txt);
		new_div_discount.append(new_ul_txt)
		new_td_discount.append(new_div_discount);
		new_tr.append(new_td_discount);
		
		new_li_price.append(new_span_price).append(new_span_priceWon);
		new_ul_price.append(new_li_price);
		new_li_ps_price.append(new_span_price_ps).append(new_span_price_psWon);
		new_ul_price.append(new_li_ps_price);
		new_li_m.append(new_span_m);
		new_ul_price.append(new_li_m);
		new_div_price.append(new_ul_price);
		new_td_p_ps.append(new_div_price)
		new_tr.append(new_td_p_ps);

		new_table.append(new_tbody).append(new_tr);
		new_div_contract.append(new_table);

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
		<input class="btn btn-default" type="button" id="search" value="검 색">
	</div>
</div>
<div>
	<form id="detailForm">
		<input type="hidden" id="ps_num" name="ps_num" />
		<input type="hidden" id="review" name="review" />
	</form>
</div>
<div class="container restaurant-list">
	<c:if test="${not empty succes}">
		<div class="main_prodlist main_prodlist_list">
			<h4>즐겨찾기 매장 상품</h4>
			<div class="favorites_list">
				<c:choose>
					<c:when test="${not empty productFavList}">
						<c:forEach var="FavList" items="${productFavList}"
							varStatus="status">
							<div class="col-md-6 contract list-group-item">
								<!-- <a class="item clearfix list-group-item" href="/productdetail/productdetailmain.do?ps_num=${FavList.ps_num}">-->
									<table>
										<tbody>
											<tr data-num="${FavList.ps_num}">
												<td class="jb-th-1">
													<div>
														<img class="fileImageLogo"
															src="/uploadStorage/store/${FavList.si_image}">
														<p class="store_name align-center">${FavList.st_name}</p>
													</div>
												</td>
												<td class="jb-th-1">
													<div>
														<img class="fileImageProduct"
															src="/uploadStorage/product/${FavList.pi_image}">
													</div>
												</td>
												<td>
													<div class="restaurants-info sizeWith193">
														<div class="restaurant-name ng-binding"
															title="${FavList.p_name}">${FavList.p_name}</div>
														<div class="restaurant-name ng-binding"
															title="${FavList.ps_expiration}">${FavList.ps_expiration}</div>
														<div class="stars">
															<span
																class="ico-star1 ng-binding glyphicon glyphicon-star">${FavList.prv_scope}</span>
															<span class="review_num ng-binding">리뷰
																${FavList.prv_count}</span>
														</div>
													</div>
												</td>
												<td>
													<div class="restaurants-info align-center sizeWith58">
														<span class="restaurant-name ng-binding">남은수량</span>
														<span>${FavList.ps_count}개</span>
													</div>
												</td>
												<td class="jb-th-2">
													<div>
														<ul>
															<li class="payment-methods ng-binding yogiseo-payment">
																<span class="discountRate"></span><span>%</span>
															</li>
														</ul>
													</div>
												</td>
												<td>
													<div class="align-center">
														<ul>
															<li class="payment-methods ng-binding yogiseo-payment">
																<span class="p_price format-money">${FavList.p_price}</span><span>원</span>
															</li>
															<li class="payment-methods ng-binding yogiseo-payment">
																<span class="ps_price format-money">${FavList.ps_price}</span><span>원</span>
															</li>
														</ul>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								<!-- </a> -->
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
				<c:if test="${empty productFavList}">
					<div class="align-center"> 등록된 상품이 존재하지 않습니다.</div>
				</c:if>
			</div>
		</div>
	</c:if>
	<div class="main_prodlist main_prodlist_list periphery">
		<h4>주변 매장 상품&nbsp;&nbsp;<span>(반경 : 3km)</span></h4>
		<div class="periphery_list">
			
		</div>
	</div>
</div>