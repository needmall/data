<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
  	th, td{
  		text-align: center;
  	}
</style>
	
 

<script type="text/javascript">
	$(function() {
		$(".goDetail").click(function() {
			location.href="/admin/statistic/productSalesData.do?ps_num="+$(this).attr("data-num");
		})
	})
</script>


<div class="table-responsive">
	<h2>판매점별 통계 </h2>
    	<hr>
	<table class="table table-bordered table-hover">		
		<thead>			
			<tr>
				<th>상품 번호</th>			
				<th>등록 총량</th>
				<th>등록 총액</th>
				<th>판매 총량</th>
				<th>판매 총액</th>
				<th>판매 비율</th>			
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test='${not empty productSalesList}'>	
					<c:forEach var="productSales" items="${productSalesList}" varStatus="status">
				<tr class="goDetail" data-num="${productSales.ps_num}">
					<td>${productSales.ps_num}</td>
					<td>${productSales.registAmount}</td>
					<td>${productSales.registSum}</td>
					<td>${productSales.sellAmount}</td>
					<td>${productSales.sellSum}</td>
					<td>${productSales.rate}%</td>				
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="6">통계 자료가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>
	


