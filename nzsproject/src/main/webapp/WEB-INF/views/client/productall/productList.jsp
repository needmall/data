<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<link rel="stylesheet" type="text/css" href="/resources/include/css/productall.css">
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<!-- 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services"></script>

<script type="text/javascript">
	
	
	
	$(function() {
		
		// 검색된 주소의 JSON
		var obj_json = new Object();
		
		// 주소 검색 목록 숨김
		$(".am-flip-x").hide();
		
		// 주소-좌표 변환 객체 생성
		var geocoder = new daum.maps.services.Geocoder();
		
		// 주소 검색 버튼
		$(".btn:eq(2)").click(function() {
			
			// 주소 검색
			geocoder.addressSearch($("input[type='search']").val(), function (result, status) {
						
				if (status === daum.maps.services.Status.OK) {						
					// 검색 주소 리스트 초기화, 보이기
					$(".search_address_info").html("");
					$(".am-flip-x").show();
					
					// 검색 주소 리스트 생성 및 저장
					result.forEach(addressAdd);
					obj_json = result;
				}
			});
		});
					
		/* 할인율 계산 */
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
		
		/* 검색 주소 리스트 선택 */
		$(document).on("click", ".search_address_info", function() {
			// 선택 주서의 index
			var index = $(".search_address_info").index(this)
			
			// 선택 결과 표시
			$("input[type='search']").val($(this).text());
		
			
			ajaxAdd(obj_json[index]);
		});
		
		/* 비밀번호 입력 */
		/* $("#pwdBtn").click(function() {
			if($("#b_pwd").val().replace("/\s/g", "") == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#b_pwd").focus();
			} else {
				$.ajax({
					url : "/board/pwdConfirm.do",
					type : "POST",
					data : $("#f_pwd").serialize(),	// 폼 데이터 전송
					datatype : "text",
					error : function() {
						alert("시스템 오류입니다. 관리자에게 문의하세요.")
					},
					success : function(resultData) {
						var goUrl = "";
						if(resultData == "실패") {
							$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.");
							$("#b_pwd").select();
						} else if(resultData == "성공") {
							$("#msg").text("");
							if(btnChk == 1) {
								goUrl = "/board/updateForm.do";
							} else if(btnChk == 2) {
								goUrl = "/board/boardDelete.do";
							}
							$("#f_data").attr({
								"method" : "GET",
								"action" : goUrl
							});
							$("#f_data").submit();
						}
					}
				}); // END AJAX 
			}
		});
		 */
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
	
	/* 주소리스트 동적 생성 */
	function addressAdd(item, index) {
		var new_li = $("<li>"); 
		new_li.addClass("ng-scope search_address_info");
		
		var new_a = $("<a>");
		new_a.attr("href", "javascript:void(0)");
		new_a.append(item.address_name);
		
		new_li.append(new_a);
		$(".am-flip-x").append(new_li);
	}
	
	/**/
	function ajaxAdd(obj_json) {
		var insertUrl = "/productall/productLocList.do";
	
		$.ajax({
			url : insertUrl,
			type : "post",
			headers : {
				"Content-Type" : "application/json",
				"H-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				c_lat : obj_json.y * 1,
				c_lon : obj_json.x * 1
			}),
			error : function() {
				alert("시스템 오류입니다. 관리자에게 문의 하세요");
			},
			success : function(resultData) {
				
				
			}
		}); // END AJAX
	}
</script>


<div id="search" class="slim-search clearfix search-show">
	<div class="input-group">
		<span class="input-group-btn loc">
			<button class="btn btn-default ico-loc" type="button"
				ng-click="get_current_location()">&nbsp;</button>
		</span>
		<form action="." onsubmit="return false"
			class="ng-valid-minlength ng-dirty ng-valid-parse ng-valid ng-valid-required">
			<input type="search" class="form-control ng-scope ng-valid-minlength ng-dirty ng-valid-parse ng-valid ng-valid-required ng-touched"
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
											<div class="restaurant-name ng-binding"
												title="${FavList.p_name}">${FavList.p_name}</div>
											<div class="restaurant-name ng-binding"
												title="${FavList.ps_expiration}">${FavList.ps_expiration}</div>
											<div class="stars">
												<span><span class="ico-star1 ng-binding">★ ${FavList.prv_scope}</span>
												</span><span class="review_num ng-binding">리뷰 ${FavList.prv_count}</span>
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
												<span><span class="ico-star1 ng-binding">★ ${AllList.prv_scope}</span>
												</span><span class="review_num ng-binding">리뷰 ${AllList.prv_count}</span>
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
