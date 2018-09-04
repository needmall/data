<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
  	th, td{
  		text-align: center;
  	}
</style>
	
 

<script type="text/javascript">

</script>


<div class="table-responsive">
	<h2>판매점별 통계 </h2>
    	<hr>
	<table class="table table-bordered table-hover">		
		<thead>			
			<tr>
				<th>기 간</th>			
				<th>등록 총량</th>
				<th>등록 총액</th>
				<th>판매 총량</th>
				<th>판매 총액</th>
				<th>판매 비율</th>			
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test='${not empty storeSalesData}'>	
					<c:forEach var="storeSales" items="${storeSalesData}" varStatus="status">
				<tr>
					<td>${storeSales.months}</td>
					<td>${storeSales.registAmount}</td>
					<td>${storeSales.registSum}</td>
					<td>${storeSales.sellAmount}</td>
					<td>${storeSales.sellSum}</td>
					<td>${storeSales.rate}%</td>				
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
	


