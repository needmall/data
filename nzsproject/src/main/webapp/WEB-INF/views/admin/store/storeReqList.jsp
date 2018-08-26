<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">

</style>
	
 

<script type="text/javascript">
	$(function () {
		$(".handle").click(function() {			
			$("#reqst_num").val($(this).find("td:eq(0)").html());
			$("#s_num").val($(this).find("td:eq(1)").html());
			$("#st_bnum").val($(this).find("td:eq(2)").html());
			$("#st_name").val($(this).find("td:eq(3)").html());
			$("#st_address").val($(this).find("td:eq(4)").html());
			$("#st_email").val($(this).find("td:eq(5)").html());
			$("#st_hours").val($(this).find("td:eq(6)").html());
			$("#st_cell").val($(this).find("td:eq(7)").html());
			$("#st_ceo").val($(this).find("td:eq(8)").html());
			$("#st_date").val($(this).find("td:eq(9)").html());
			
			$("#handleFrom").attr({"method":"post","action":"/admin/store/storeRegist.do"});
			$("#handleFrom").submit();
		});
	})		
		
</script>

<form id="handleFrom">
	<input type="hidden" name="reqst_num" id="reqst_num">
	<input type="hidden" name="s_num" id="s_num">
	<input type="hidden" name="st_bnum" id="st_bnum">
	<input type="hidden" name="st_name" id="st_name">
	<input type="hidden" name="st_address" id="st_address">
	<input type="hidden" name="st_email" id="st_email">
	<input type="hidden" name="st_hours" id="st_hours">
	<input type="hidden" name="st_cell" id="st_cell">
	<input type="hidden" name="st_ceo" id="st_ceo">
	<input type="hidden" name="st_date" id="st_date"> 	
</form>
<div class="table-responsive">
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>매장요청번호</th>
				<th>판매자번호</th>
				<th>사업자번호</th>
				<th>상호명</th>
				<th>사업지</th>				
				<th>이메일</th>
				<th>영업시간</th>	
				<th>영업전화</th>
				<th>대표자</th>
				<th>요청일</th>				
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty storeReqList}">
					<c:forEach var="storeReq" items="${storeReqList}" varStatus="status">
						<tr class="handle">
							<td>${storeReq.reqst_num}</td>
							<td>${storeReq.s_num}</td>
							<td>${storeReq.st_bnum}</td>
							<td>${storeReq.st_name}</td>
							<td>${storeReq.st_address}</td>
							<td>${storeReq.st_email}</td>
							<td>${storeReq.st_hours}</td>
							<td>${storeReq.st_cell}</td>
							<td>${storeReq.st_ceo}</td>
							<td>${storeReq.st_date}</td>
													
						</tr>						
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="10" class="tac">매장 요청이 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>
	
	


