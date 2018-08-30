<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<link rel="stylesheet" type="text/css" href="/resources/include/css/productSellInsert.css" />
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {
		var num = 0;
		/* 초기 설정 */
		setting();
		
		/* 상품 검색 */ 
		$("#searchBtn").click(function() {
			var url = "/productsell/search.do?keyword=" + $("#keyword").val();
			num = 0;
			// 검색 상품 리스트 초기화
			$(document).find(".new_item").remove();
			
			$.getJSON(url, function(data) {
				
				$(data).each(function () {
					num = num + 1;
					var pi_image	= this.pi_image;
					var p_name		= this.p_name;
					var p_price		= this.p_price;
					var p_content	= this.p_content;
					var p_num		= this.p_num;
					 
					addItem(num, pi_image, p_name, p_price, p_content, p_num);
				});
			}).fail(function() {
				alert("상품 검색을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
			});
		});
		
		/* 상품 등록 요청 페이지 이동 */
		$("#reqProductBtn").click(function() {
			location.href = "/seller/productrequest/productRequest.do"
		})
		
		/* 상품정보 선택 */
		$(document).on("click", ".new_item", function() {
			var pi_image = $(this).find("img").attr("src");
			var p_name = $(this).find(".itemP_name").html();
			var p_price = $(this).find(".itemP_price").html();
			var p_content = $(this).find(".itemP_content").html();
			var p_num = $(this).attr("data-p_num");
			
			$(".addImageProduct").attr("src", pi_image);
			$(".selectItemData:eq(0)").html(p_name);
			$(".selectItemData:eq(1)").html(p_price);
			$(".selectItemData:eq(2)").html(p_content);
			$("#p_num").val(p_num);
		});
		
		$("#discount").change(function() {
			
			if($("#discount").val() == "input") {
				$("#inputDiscount").show();
				$("#discount").hide();
			} else {
				$("#inputDiscount").hide();
				$("#discount").show();
			}
			
		});
		
		
	}); // End Jquery
	
	function addDiscount() {
		var discount = 0;
		var new_default = $("<option>");
		var new_input = $("<option>");
		
		new_default.html("선택");
		$("#discount").append(new_default);
		
		for(var i = 0; i < 8 ; i++) {
			discount += 5;
			var new_option = $("<option>")
			new_option.attr("value", discount);
			new_option.html(discount + "%");
			$("#discount").append(new_option);
		}
		
		new_input.html("직접 입력");
		new_input.attr("value", "input");
		$("#discount").append(new_input);		
	}
	
	
	/* 검색 상품정보 동적 생성*/
	function addItem(num, pi_image, p_name, p_price, p_content, p_num) {
		var new_tr = $("<tr>");
		new_tr.addClass("new_item");
		new_tr.attr("data-p_num", p_num);
		
		var new_td_num = $("<td>");
		new_td_num.html(num);
		
		var new_td_pi_image = $("<td>");
		var new_td_image = $("<img>");
		new_td_image.addClass("itemImage");
		new_td_image.attr("src", "/uploadStorage/product/" + pi_image);
		new_td_image.css("width", "100px");
		
		var new_td_p_name = $("<td>");
		new_td_p_name.addClass("itemP_name");
		new_td_p_name.html(p_name);
		
		var new_td_p_price = $("<td>");
		new_td_p_price.addClass("itemP_price");
		new_td_p_price.html(p_price + "원");
		
		var new_td_p_content = $("<td>");
		new_td_p_content.addClass("itemP_content");
		new_td_p_content.html(p_content);
		
		new_td_pi_image.append(new_td_image);
		new_tr.append(new_td_num).append(new_td_pi_image).append(new_td_p_name).append(new_td_p_price).append(new_td_p_content);
		$("#addTableSizeA").find("tbody").append(new_tr);
	}
	
	function setting() {
		// 할인율 생성, 직접입력 숨김
		addDiscount();
		$("#inputDiscount").hide();
	}
</script>

<div>
	<div>
		<div id="addMarginCenter">
			<%-- 상품검색 --%>
			<form class="form-inline-block">
				<div class="form-group">
					<input type="text" id="keyword" class="form-control addInline-block" name="keyword" placeholder="상품 검색" />
					<button type="button" id="searchBtn" class="btn btn-success">검색</button>
				</div>
			</form>
		</div>
		<div class="addTextRight">
			<button type="button" id="reqProductBtn" class="btn btn-danger addInline-block">상품등록 요청</button>
		</div>
		<div id="addTableSizeA">
			<%-- 검색결과 --%>
			<table class="table table-striped">
				<thead>
					<tr class="addTextCenter">
						<th>번호</th>
						<th>이미지</th>
						<th>이름</th>
						<th>가격</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<tr class="addTextCenter new_item">
						<td colspan="5">상품을 검색 하십시요.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%-- 상품 선택정보 --%>
	<div class="test">
		<div id="addTableSizeB" class="addInline-block addTextCenter">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th colspan="2">
							<div class="">
								<img class="img-thumbnail addImageProduct">
							</div>
						</th>
					</tr>
					<tr>
						<td>
							<div class="">
								<p>상품명</p>
							</div>
						</td>
						<td>
							<div class="selectItemData">
								<p></p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="">
								<p>소비자 가격</p>
							</div>
						</td>
						<td>
							<div class="selectItemData">
								<p></p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="">
								<p>상품 설명
								<p>
							</div>
						</td>
						<td>
							<div class="selectItemData">
								<p></p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="addTableSizeC" class="addInline-block">
			<div class="">
				<%-- 판매 상품 정보 --%>
				<form action="" class="form-inline">
					<table>
						<tr>
							<td colspan="4"><input type="hidden" id="p_num" name="p_num" /></td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="form-group">
									<label class="control-label" for="ps_expiration">유통기한</label>
									<input type="datetime-local" id="ps_expiration" class="form-control" name="ps_expiration" min="" max="" aria-describedby="ps_expirationStatus" />
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_expirationStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="form-group">
									<label class="control-label" for="ps_price">판매 가격</label>
									<input type="text" id="ps_price" class="form-control" name="ps_price" aria-describedby="ps_priceStatus"/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_priceStatus" class="sr-only"></span>
									<label id="addMarginDiscount" class="control-label" for="discount">할인율</label>
									<select id="discount" class="form-control" aria-describedby="discountStatus"></select>
									<input type="text" id="inputDiscount" class="form-control"/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="discountStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="form-group">
									<label class="control-label" for="ps_count">판매 수량</label>
									<input type="text" id="ps_count" class="form-control" name="ps_count" aria-describedby="ps_countStatus"/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_countStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div id="addCenterSubmit">
				<button type="button" id="submitBtn" class="btn btn-primary btn-lg addSizeSubmit">등록</button>
				<button type="button" id="cancelBtn" class="btn btn-default btn-lg addSizeSubmit">취소</button>
			</div>
			
		</div>
	</div>
</div>
