<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/include/css/productSellInsert.css" />

<link rel="stylesheet" type="text/css" href="">
<script type="text/javascript">
	$(function() {
		/* 초기 설정 */
		setting();
		/* 할인율 계산 */
		addDiscountValue($("#ps_price"));
		
		 
		/* 수정 버튼 페이지 이동 */
		$("#completeBtn").click(function() {
			$("#submitForm").attr({
				"method" : "POST",
				"action" : "/productsell/productupdate.do"
			});
			$("#submitForm").submit();
		});
		
		/* 삭제 버튼 */
		$("#cancelBtn").click(function() {
			location.href = "/productsell/list.do";
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
		
		/* 할인율 선택 판매가격 계산 */
		$("#discount").change(function() {
			addDiscountValue($("#discount"));
		});
		
		/* 할인율 입력 판매가가격 계산 */
		$("#inputDiscount").change(function() {
			addDiscountValue($("#inputDiscount"));
		});
		
		/* 판매가 입력 할인율 계산*/
		$("#ps_price").change(function() {
			$("#inputDiscount").val("");
			$("#inputDiscount").show();
			$("#discount").hide();
			
			$("#changeBtn").attr("name", "1");
			$("#changeBtn").html("선택");
			addDiscountValue($("#ps_price"));
		})
			
	}); // END JQUERY
	
	/* 할인율 option 동적 생성 */
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
	
	/* 할인율, 판매가격 계산 */
	function addDiscountValue(discount) {
		var p_price = $(".p_price").html() * 1;
		var name = discount.attr("name");
		if(name == 0) {
			var ps_price = p_price - (p_price * (discount.val() * 0.01));
			$("#ps_price").val(ps_price);
		} else if(name == "ps_price") {
			var ps_price = 100 - ((discount.val() * 100) / p_price) ;
			$("#inputDiscount").val(ps_price.toFixed(1));
		}
	}
	
	function setting() {
		// 할인율 생성, 입력 숨김
		addDiscount();
		$("#inputDiscount").val("");
		$("#inputDiscount").show();
		$("#discount").hide();
		
		$("#changeBtn").attr("name", "1");
		$("#changeBtn").html("선택");
	}
</script>
<div>
	<div class="productInfo" data-num="${Detail.ps_num}">
		<!-- 판매 상품 정보 -->
		<div id="addTableSizeB" class="addInline-block addTextCenter">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th colspan="2">
							<div class="">
								<img class="img-thumbnail addImageProduct" src="/uploadStorage/product/${Detail.pi_image}">
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
								<p>${Detail.p_name}</p>
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
								<span class="p_price">${Detail.p_price}</span><span>원</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="">
								<p>상품 설명</p>
							</div>
						</td>
						<td>
							<div class="selectItemData">
								<p>${Detail.p_content}</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="addTableSizeC" class="addInline-block">
			<div class="">
				<%-- 판매 상품 정보 --%>
				<form action="" id="submitForm" class="form-inline">
					<input type="hidden" id="ps_num" name="ps_num" value="${Detail.ps_num}"/>
					<table class="table table-bordered">
						<tr>
							<td colspan="2">
								<div class="form-group">
									<label class="control-label" for="date">유통기한</label>
									<span class="">${Detail.ps_expiration}</span>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="dateStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label class="control-label" for="ps_price">판매 가격</label>
									<input type="text" id="ps_price" class="form-control addSizeInput75" name="ps_price" value="${Detail.ps_price}" aria-describedby="ps_priceStatus"/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_priceStatus" class="sr-only"></span>
								</div>
							</td>	
							<td>
								<div class="form-group">
									<label id="addMarginDiscount" class="control-label" for="discount">할인율</label>
									<div class="form-group">
										<select id="discount" class="form-control addSizeInput75" name="0" aria-describedby="discountStatus"></select>
										<input type="text" id="inputDiscount" class="form-control addSizeInput75" name="0" />
										<div class="input-group-addon">%</div>
									</div>
									<button type="button" id="changeBtn" class="btn btn-info" name="0">입력</button>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="discountStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="form-group">
									<label class="control-label" for="ps_count">판매 수량</label>
									<input type="text" id="ps_count" class="form-control" name="ps_count" value="${Detail.ps_count}" aria-describedby="ps_countStatus"/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_countStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div id="addCenterSubmit">
				<button type="button" id="completeBtn" class="btn btn-primary btn-lg addSizeSubmit">완료</button>
				<button type="button" id="cancelBtn" class="btn btn-default btn-lg addSizeSubmit">취소</button>
			</div>
		</div>
	</div>
	<div>
		<!-- 구매자 목록 -->
		<div>
		
		</div>
	</div>
</div>