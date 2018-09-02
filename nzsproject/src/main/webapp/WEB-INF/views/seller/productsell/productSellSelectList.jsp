<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/include/css/productSellList.css" />

<script type="text/javascript">
	$(function() {
		
		//pi_image, p_name, p_price, p_content, 
		
		/* 상품 등록 페이지 이동 */
		$("#reqProductBtn").click(function() {
			location.href = "/productsell/writeform.do";
		});
		
		/* 상세 페이지 이동 */
		$(".productInfo").click(function() {
			var ps_num = $(this).attr("data-num");
			location.href = "/productsell/detailform.do?ps_num=" + ps_num;
		});
		
		/* 할인율 계산 */
		addDiscountRate($(".productInfo"));
	
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
</script>
<div>
	<div class="addTextRight">
			<button type="button" id="reqProductBtn" class="btn btn-danger addInline-block">상품등록</button>
	</div>
	<div id="addTableSizeA">
		<%-- 검색결과 --%>
		<table class="table table-striped align-center">
			<thead>
				<tr class="align-center">
					<th>번호</th>
					<th>이미지</th>
					<th>이름</th>
					<th>소비자 가격</th>
					<th>판매가격</th>
					<th>할인율</th>
					<th>갯수</th>
					<th>유통기한</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty productList}">
						<c:forEach var="List" items="${productList}" varStatus="status">
							<tr class="productInfo" data-num="${List.ps_num}">
								<td>
									<div>${status.count}</div>
								</td>
								<td>
									<div class="div_pi_image"><img class="fileImageProduct" src="/uploadStorage/product/${List.pi_image}"></div>
								</td>
								<td>
									<div>${List.p_name}</div>
								</td>
								<td>
									<div><span class="p_price">${List.p_price}</span><span>원</span></div>
								</td>
								<td>
									<div><span class="ps_price">${List.ps_price}</span><span>원</span></div>
								</td>
								<td>
									<div><span class="discountRate"></span><span>%</span></div>
								</td>
								<td>
									<div>${List.ps_count}</div>
								</td>
								<td>
									<div>${List.ps_expiration}</div>
								</td>
								<td>
									<div>${List.ps_udate}</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="addTextCenter new_item">
							<td colspan="9">등록된 상품이 없습니다.</td>
						</tr>	
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>