<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
  	
</style>
	
 

<script type="text/javascript">

</script>


<div class="table-responsive">
	<h2>판매량 통계 </h2>
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
			<c:when test='${not empty salesDataList}'>	
				<c:forEach var="sales" items="${salesDataList}" varStatus="status">
			<tr>
				<td>${sales.months}</td>
				<td>${sales.registAmount}</td>
				<td>${sales.registSum}</td>
				<td>${sales.sellAmount}</td>
				<td>${sales.sellSum}</td>
				<td>${sales.rate}</td>				
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
<div class="table-responsive">
	<h2>매장 통계 </h2>
    	<hr>
	<table class="table table-bordered table-hover">		
		<thead>			
			<tr>
				<th>기 간</th>
				<th>총 매장수</th>
				<th>영업 매장수</th>
				<th>영업 매장 비율</th>
				<th>신규 매장수</th>				
				<th>폐점 매장수</th>
							
			</tr>
		</thead>
		<tbody id="list">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>				
			</tr>
		</tbody>	
	</table>
</div>	
<div class="table-responsive">
	<h2>고객 통계 </h2>
    	<hr>
	<table class="table table-bordered table-hover">		
		<thead>			
			<tr>
				<th>기 간</th>
				<th>총 고객수</th>
				<th>활동 고객수</th>
				<th>활동 고객 비율</th>
				<th>신규 고객수</th>				
				<th>탈퇴 회원수</th>
											
			</tr>
		</thead>
		<tbody id="list">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>				
			</tr>
		</tbody>	
	</table>
</div>		


