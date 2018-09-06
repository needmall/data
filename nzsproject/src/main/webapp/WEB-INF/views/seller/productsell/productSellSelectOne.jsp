<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/include/css/productSellInsert.css" />

<link rel="stylesheet" type="text/css" href="">
<script type="text/javascript">
	$(function() {
		addDiscountRate($(".productInfo"));
	
		/* 수정 버튼 페이지 이동 */
		$("#updateBtn").click(function() {
			$("#updateForm").attr({
				"method" : "POST",
				"action" : "/productsell/updateform.do"
			});
			$("#updateForm").submit();	
		});
		
		/* 삭제 버튼 */
		$("#deleteBtn").click(function() {
			var p_name = "<c:out value='${Detail.p_name}' />";
			if(confirm(p_name + "를 삭제 하시겠습니까?") == true) {
				$("#updateForm").attr({
					"method" : "POST",
					"action" : "/productsell/productdelete.do"
				});
				$("#updateForm").submit();
			}
		});
		
		/* 목록 이동 */
		$("#listBtn").click(function() {
			location.href = "/productsell/list.do";
		});
		
		/* 가격 (,) 생성 */
		jQuery('.format-money').text(function() {
		    jQuery(this).text(
		        jQuery(this).text().format()
		    );
		});
		
	}); // END JQUERY
	
	/* 할인율 계산 */
	function addDiscountRate(div_cnt) {
		div_cnt.each(function(index) {
			var p_price = div_cnt.find($(".p_price")).eq(index).html();
			var ps_price = div_cnt.find($(".ps_price")).eq(index).html();
			var discountRate = (p_price - ps_price) / p_price * 100;
			div_cnt.find($(".discountRate")).eq(index).html(Math.round(discountRate));	
		})
	}
</script>
<div>
	<div class="productInfo row" data-num="${Detail.ps_num}">
		<!-- 판매 상품 정보 -->
		
		<div id="addTableSizeB" class="addInline-block addTextCenter col-lg-4 table-bordered addTableSetting">
			<table class="table table-bordered text-center">
				<tbody>
					<tr>
						<th colspan="2">
							<div class="addImageSetting">
								<img class="img-thumbnail addImage" src="/uploadStorage/product/${Detail.pi_image}">
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
								<p>${Detail.p_name}</p>
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
								<span class="p_price format-money">${Detail.p_price}</span><span>원</span>
							</div>
						</td>
					</tr>
					<tr class="sizeHight150">
						<td class="paddingTd-content">
							<div class="">
								<p>상품 설명</p>
							</div>
						</td>
						<td class="sizeWidth395 paddingTd-content">
							<div class="selectItemData">
								<p>${Detail.p_content}</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="addTableSizeC" class="addInline-block col-lg-4 table-bordered addTableSetting">
			<div class="">
				<%-- 판매 상품 정보 --%>
				<form action="" id="updateForm" class="form-inline">
					<input type="hidden" id="ps_num" name="ps_num" value="${Detail.ps_num}"/>
				</form>
					<table class="table table-bordered text-center">
						<tr class="sizeHight133">
							<td class="paddingTd55" colspan="2">
								<div class="form-group">
									<label class="control-label" for="date">유통기한</label>&nbsp;&nbsp;&nbsp;
									<span class="">${Detail.ps_expiration}</span>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="dateStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr class="sizeHight133">
							<td class="paddingTd55 col-md-6">
								<div class="form-group">
									<label class="control-label" for="ps_price">판매 가격</label>&nbsp;&nbsp;&nbsp;
									<span class="ps_price format-money">${Detail.ps_price}</span><span>원</span>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_priceStatus" class="sr-only"></span>
								</div>
							</td>	
							<td class="paddingTd55 col-md-6">
								<div class="form-group">
									<label id="addMarginDiscount" class="control-label" for="discount">할인율</label>&nbsp;&nbsp;&nbsp;
									<span class="discountRate"></span>
									<span>%</span>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="discountStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr class="sizeHight87">
							<td class="paddingTd31" colspan="2">
								<div class="form-group">
									<label class="control-label" for="ps_count">판매 수량</label>&nbsp;&nbsp;&nbsp;
									<span id="ps_count">${Detail.ps_count}</span><span>개</span>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_countStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr class="sizeHight235">
							<td class="paddingTd86" colspan="2">
								<div id="addCenterSubmit">
									<button type="button" id="updateBtn" class="btn btn-primary btn-lg addSizeSubmit">수정</button>
									<button type="button" id="deleteBtn" class="btn btn-default btn-lg addSizeSubmit">삭제</button>
									<button type="button" id="listBtn" class="btn btn-default btn-lg addSizeSubmit">목록</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div>
		<!-- 구매자 목록 -->
			<div>
		
			</div>
		</div>
	</div>