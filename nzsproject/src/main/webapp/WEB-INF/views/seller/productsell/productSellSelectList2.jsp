<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/include/css/productSellList.css" />

<script type="text/javascript">
	$(function() {
		var date_val;
		/* 상품 등록 페이지 이동 */
		$("#reqProductBtn").click(function() {
			location.href = "/productsell/writeform.do";
		});
		
		/* 유통기한별 상태 변화 */
		$(".ps_expiration").each(function() {
			var expiration = new Date($(this).html());
			var expiration_year = expiration.getFullYear();
			var expiration_month = expiration.getMonth() + 1;
			var expiration_day = expiration.getDate();
			var expiration_hours = expiration.getHours()
			var expiration_minutes = expiration.getMinutes();

			var date = new Date();
			var now_year = date.getFullYear();
			var now_month = date.getMonth() + 1;
			var now_day = date.getDate();
			var now_hours = date.getHours()
			var now_minutes = date.getMinutes();
			//date.setDate(date.getDate() - 1);
			if(expiration > date) {
				console.log("Aexpiration : " + expiration);
				console.log("Adate : " + date);
			} else {
				console.log("Bexpiration : " + expiration);
				console.log("Bdate : " + date);
			}
			
			
			// 유통기한 1일 이상
			if(expiration > date) {
				$(this).parents("td").siblings("td.status").css('background-color', 'green');
			} else if(expiration_year == now_year && expiration_month == now_month && expiration_day == now_day) {
			// 유통기한 당일
				$(this).parents("td").siblings("td.status").css('background-color', 'yellow');
				setInterval(function() {
					// 유통기한 초과
					if(expiration < date) {
						$(this).parents("td").siblings("td.status").css('background-color', 'red');
					}
				}, 5000);
			}	
		});
		

		/* 상세 페이지 이동 */
		$(".productInfo").click(function() {
			var ps_num = $(this).attr("data-num");
			location.href = "/productsell/detailform.do?ps_num=" + ps_num;
		});
		
		/* 탭 이동  */
		$('#myTab a').click(function (e) {
			e.preventDefault()
  			$(this).tab('show')
		});
		
		/* 할인율 계산 */
		addDiscountRate($(".productInfo"));
		
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
</script>

<div role="tabpanel">
	<ul id="myTab" class="nav nav-tabs" role="tablist">
      <li role="presentation" class="active"><a href="#list" id="list-tab" role="tab" data-toggle="tab" aria-controls="list" aria-expanded="true">판매상품 목록</a></li>
      <li role="presentation"><a href="#statistics" id="statistics-tab" role="tab" data-toggle="tab" aria-controls="statistics" aria-expanded="false">판매상품 통계</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="list" aria-labelledby="list-tab">
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
						<th>상태</th>
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
										<div><span class="p_price format-money">${List.p_price}</span><span>원</span></div>
									</td>
									<td>
										<div><span class="ps_price format-money">${List.ps_price}</span><span>원</span></div>
									</td>
									<td>
										<div><span class="discountRate"></span><span>%</span></div>
									</td>
									<td>
										<div>${List.ps_count}</div>
									</td>
									<td>
										<div class="ps_expiration">${List.ps_expiration}</div>
									</td>
									<td>
										<div>${List.ps_udate}</div>
									</td>
									<td class="status">
										
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
		<!-- 판매 상품 통계 페이지 -->
      <div role="tabpanel" class="tab-pane" id="statistics" aria-labelledby="statistics-tab">
      	<c:import url="/seller/statistic/sellerStoreData.do">
			<c:param name="st_num" value="${st_num}"></c:param>
		</c:import>
      </div>
	</div>
</div>