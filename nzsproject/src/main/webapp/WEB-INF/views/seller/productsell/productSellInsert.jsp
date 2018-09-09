<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/include/css/productSellInsert.css" />
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {
		
		/* 초기 설정 */
		setting();
		
		/* 상품 검색 */ 
		$("#searchBtn").click(function() {
			
			if(!chkData("#keyword", "판매할 상품 이름을")) return;
			else {			
				var url = "/productsell/search.do?keyword=" + $("#keyword").val();
				// 상품검색 결과 Json 동적 생성
				addProductInfo(url);
			}
		});
		
		/* 판매상품 카테고리 선택 */
		$(".category").click(function() {
			var c2_num = $(this).attr("name");
			var url = "/productsell/category.do?c2_num=" + c2_num;
			// 카테고리 선택 결과 Json 동적 생성
			addProductInfo(url);
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
			
			$(".addImage").attr("src", pi_image);
			$(".selectItemData:eq(0)").html(p_name);
			$(".p_price").html(p_price);
			$(".selectItemData:eq(2)").html(p_content);
			$("#p_num").val(p_num);
			
			// 입력 폼 허용
			$(".adddisabled").removeAttr("disabled");
		});
		
		/* 할인율 선택, 입력 토글 */
		$("#changeBtn").click(function() {
			if($("#changeBtn").attr("name") == "0") {
				$("#inputDiscount").val("");
				$("#inputDiscount").show();
				$("#discount").hide();
				
				$("#changeBtn").attr("name", "1");
				$("#changeBtn").html("선택");
			} else {
				$("#discount").find("option:first");
				$("#discount").show();
				$("#inputDiscount").hide();

				$("#changeBtn").attr("name", "0");
				$("#changeBtn").html("입력");
			}	
		});
		
		/* 판매 상품 등록 */
		$("#submitBtn").click(function() {
			var p_price = $(".p_price").html().replace("원", "") * 1;
			var p_name = $(".selectItemData:eq(0)").html();
			
			if(!chkData("#date", "유통기한을")) return;
			else if(!chkData("#ps_price", "판매 가격을")) return;
			else if(!chkNumber("#ps_price", "판매 가격이", 0, p_price)) return;
			else if(!chkData("#ps_count", "판매 수량을")) return;
			else if(!chkNumber("#ps_count", "판매 수량이", 0, 99999)) return;
			else if(confirm(p_name + "를 등록 하시겠습니까?") == true) {
				$("#submitForm").attr({
					"method" : "POST",
					"action" : "/productsell/productinsert.do"
				});
				$("#submitForm").submit();
			}
		});
		
		/* 판매상품 취소 */
		$("#cancelBtn").click(function() {
			location.href = "/productsell/list.do";
		});
		
		/* 유통기한 형식 변경 */
		$("#date").change(function() {
			var date = new Date($("#date").val());
			
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var hours = date.getHours()
			var minutes = date.getMinutes();
			
			// 10시 이전 형식 변경
			if(hours < 10) {
				 hours = "0" + hours;
			}
			
			// 오전 12시, 오후 24시 형식 변경
			if(hours == 0) {
				hours = "12";
			} else if(hours == 12) {
				hours = "00";
			}
			
			// 형식 변경
			$("#ps_expiration").val(year + "/" + month + "/" + day + " " + hours + ":" + minutes);
		});
		
		/* 할인율 선택 판매가격 계산 */
		$("#discount").change(function() {
			addDiscountValue($("#discount"));
		});
		
		/* 할인율 입력 판매가가격 계산 */
		$("#inputDiscount").change(function() {
			if(!chkNumber("#inputDiscount", "할인율이", 0, 100)) return;
			addDiscountValue($("#inputDiscount"));
		});
		
		/* 판매가 입력 할인율 계산*/
		$("#ps_price").change(function() {
			var p_price = $(".p_price").html().replace("원", "") * 1;
			
			$("#inputDiscount").val("");
			$("#inputDiscount").show();
			$("#discount").hide();
			
			$("#changeBtn").attr("name", "1");
			$("#changeBtn").html("선택");
			if(!chkNumber("#ps_price", "판매 가격이", 0, p_price)) return;
			addDiscountValue($("#ps_price"));
		})
		
		/* 엔터값 제거 */
		$(document).on("keydown", "#keyword", function(event) {
			if(event.keyCode === 13) {
				event.preventDefault();
			}
		});
		
	}); // End Jquery
	
	/* 할인율 option 동적 */
	function addDiscount() {
		var discount = 0;
		var new_default = $("<option>");
		new_default.html("선택");
		
		$("#discount").append(new_default);
		
		for(var i = 0; i < 10 ; i++) {
			discount += 5;
			var new_option = $("<option>")
			new_option.attr("value", discount);
			new_option.html(discount);
			$("#discount").append(new_option);
		}	
	}
	
	/* 할인율 판매가격 계산 */
	function addDiscountValue(discount) {
		var p_price = $(".p_price").html().replace("원", "") * 1;
		var name = discount.attr("name");
		if(name == 0) {
			var ps_price = p_price - (p_price * (discount.val() * 0.01));
			$("#ps_price").val(ps_price);
		} else if(name == "ps_price") {
			var ps_price = 100 - ((discount.val() * 100) / p_price) ;
			$("#inputDiscount").val(ps_price.toFixed(1));
		}
	}
	
	/* 유통기한 최소 시간 유효성 */
	function addDateFormat(inputDate) {
		var date = new Date();

		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hours = date.getHours()
		var minutes = date.getMinutes();

		var arr = [month, day, hours, minutes];
		// 10 미만의 숫자 문자 추가
		for(var i = 0; i < 4; i++) {
			if(arr[i] < 10) arr[i] = "0" + arr[i];
		}
		
		// date 타입 형식추가(yyyy-MM-ddThh:mm)
		var min = year + "-" + arr[0] + "-" + arr[1] + "T" + arr[2] + ":" + arr[3];
		var max = (year+1) + "-" + (arr[0]) + "-" + arr[1] + "T" + arr[2] + ":" + arr[3];
		
		// 최소, 최대 속성값 추가
		$(inputDate).attr({
			"min" : min,
			"max" : max
		});
	}
	
	/* 상품 정보 동적 생성 */
	function addProductInfo(url) {
		var num = 0;
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
	}
	
	  
	/* 검색 상품정보 동적 생성*/
	function addItem(num, pi_image, p_name, p_price, p_content, p_num) {
		var new_tr = $("<tr>");
		new_tr.addClass("new_item");
		new_tr.attr("data-p_num", p_num);
		 
		var new_td_num = $("<td>");
		new_td_num.addClass("tdPaddingTop49")
		var new_div_num = $("<div>");
		new_div_num.html(num);
		
		var new_td_pi_image = $("<td>");
		var new_div_image = $("<div>");
		var new_td_image = $("<img>");
		new_td_image.addClass("itemImage");
		new_td_image.attr("src", "/uploadStorage/product/" + pi_image);
		new_td_image.css("width", "100px");
		
		var new_td_p_name = $("<td>");
		new_td_p_name.addClass("tdPaddingTop49")
		var new_div_name = $("<div>");
		new_div_name.addClass("itemP_name");
		new_div_name.html(p_name);
		
		var new_td_p_price = $("<td>");
		new_td_p_price.addClass("tdPaddingTop49")
		var new_div_price = $("<div>");
		new_div_price.addClass("itemP_price");
		new_div_price.html(p_price + "원");
		
		var new_td_p_content = $("<td>");
		new_td_p_content.addClass("tdPaddingTop49")
		var new_div_content = $("<div>");
		new_div_content.addClass("itemP_content");
		new_div_content.html(p_content);
		
		new_td_p_content.append(new_div_content);
		new_td_p_price.append(new_div_price);
		new_td_p_name.append(new_div_name);
		new_div_image.append(new_td_image);
		new_td_pi_image.append(new_div_image);
		new_td_num.append(new_div_num);
		
		new_tr.append(new_td_num).append(new_td_pi_image).append(new_td_p_name).append(new_td_p_price).append(new_td_p_content);
		$("#addTableSizeA").find("tbody").append(new_tr);
	}
	
	function setting() {
		// 할인율 선택 생성
		addDiscount();
		// 할인율 입력 숨김
		$("#inputDiscount").hide();
		// 입력 데이터 최소, 최대 속성 추가
		addDateFormat("#date");
	}
</script>

<div>
	<div>
		<div id="addMarginCenter" class="text-center">
			<%-- 상품검색 --%>
			<form class="form-inline-block">
				<div class="form-group">
					<input type="text" id="keyword" class="form-control addInline-block" name="keyword" placeholder="상품 검색"/>
					<button type="button" id="searchBtn" class="btn btn-success addInline-block">검색</button>
				</div>
			</form>
			<div>
				<button type="button" class="btn btn-default category" name="1">도시락</button>
				<button type="button" class="btn btn-default category" name="2">삼각김밥</button>
				<button type="button" class="btn btn-default category" name="3">김밥</button>
				<button type="button" class="btn btn-default category" name="4">샌드위치</button>
				<button type="button" class="btn btn-default category" name="5">햄버거</button>
			</div>
		</div>
		<div class="text-right">
			<button type="button" id="reqProductBtn" class="btn btn-danger addInline-block">상품등록 요청</button>
		</div>
		<div id="addTableSizeA">
			<%-- 검색결과 --%>
			<table class="table table-striped text-center">
				<thead>
					<tr class="addCenterTh">
						<th class="sizeth1">번호</th>
						<th class="sizeth2">이미지</th>
						<th class="sizeth3">이름</th>
						<th class="sizeth4">가격</th>
						<th class="sizeth5">내용</th>
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
	<div class="productInfo row">
		<div id="addTableSizeB" class="addInline-block addTextCenter col-lg-4 table-bordered addTableSetting">
			<table class="table table-bordered text-center">
				<tbody>
					<tr>
						<th colspan="2">
							<div class="addImageSetting">
								<img class="img-thumbnail addImage">
							</div>
						</th>
					</tr>
					<tr class="sizeHight85 ">
						<td class="paddingTd35">
							<div class="">
								<p>상품명</p>
							</div>
						</td>
						<td class="paddingTd35">
							<div class="selectItemData">
							</div>
						</td>
					</tr>
					<tr class="sizeHight85 ">
						<td class="paddingTd35">
							<div class="">
								<p>소비자 가격</p>
							</div>
						</td>
						<td class="paddingTd35">
							<div class="selectItemData">
								<span class="p_price format-money"></span>
							</div>
						</td>
					</tr>
					<tr class="sizeHight150">
						<td class="paddingTd-content">
							<div class="">
								<p>상품 설명
								<p>
							</div>
						</td>
						<td class="sizeWidth395 paddingTd-content">
							<div class="selectItemData">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="addTableSizeC" class="addInline-block col-lg-4 table-bordered addTableSetting">
			<div class="">
				<%-- 판매 상품 정보 --%>
				<form action="" id="submitForm" class="form-inline">
					<input type="hidden" id="p_num" name="p_num" />
					<input type="hidden" id="ps_expiration" name="ps_expiration" />
					<table class="table table-bordered text-center">
						<tr class="sizeHight133">
							<td class="paddingTd55" colspan="2">
								<div class="form-group">
									<label class="control-label" for="date">유통기한</label>
									<input type="datetime-local" id="date" class="form-control adddisabled sizeInput225" min="" max="" aria-describedby="dateStatus" disabled />
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="dateStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr class="sizeHight133">
							<td class="paddingTd55 col-md-6">
								<div class="form-group">
									<label class="control-label" for="ps_price">판매 가격</label>
									<input type="text" id="ps_price" class="form-control adddisabled sizeInput75" name="ps_price" maxlength="6" aria-describedby="ps_priceStatus" disabled/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_priceStatus" class="sr-only"></span>
								</div>
							</td>	
							<td class="paddingTd55 col-md-6">
								<div class="form-group">
									<label id="addMarginDiscount" class="control-label" for="discount">할인율</label>
									<div class="input-group">
										<select id="discount" class="form-control adddisabled" name="0" style="width:75px;" aria-describedby="discountStatus" disabled></select>
										<input type="text" id="inputDiscount" class="form-control adddisabled sizeInput55" name="0" maxlength="3" disabled/>
										<div class="input-group-addon">%</div>
									</div>
									<button type="button" id="changeBtn" class="btn btn-info adddisabled" name="0" disabled>입력</button>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="discountStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr class="sizeHight87">
							<td class="paddingTd31" colspan="2">
								<div class="form-group">
									<label class="control-label" for="ps_count">판매 수량</label>
									<input type="text" id="ps_count" class="form-control adddisabled sizeInput75" name="ps_count" maxlength="5" aria-describedby="ps_countStatus" disabled/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_countStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr class="sizeHight235">
							<td class="paddingTd86" colspan="2">
								<div id="addCenterSubmit">
									<button type="button" id="submitBtn" class="btn btn-primary btn-lg adddisabled addSizeSubmit" disabled>등록</button>
									<button type="button" id="cancelBtn" class="btn btn-default btn-lg addSizeSubmit">취소</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
