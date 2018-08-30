<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">

</style>
	
 

<script type="text/javascript">
	$(function () {
		$(".handle").click(function() {			
			$("#reqp_num").val($(this).find("td:eq(0)").html());
			$("#c2_num").val($(this).find("td:eq(1)").html());
			$("#p_name").val($(this).find("td:eq(2)").html());
			$("#p_price").val($(this).find("td:eq(3)").html());
			$("#p_date").val($(this).find("td:eq(4)").html());
			$("#p_content").val($(this).find("td:eq(5)").html());
			$("#s_num").val($(this).find("td:eq(6)").html());
			
			$("#handleFrom").attr({"method":"post","action":"/admin/product/reqproductRegist.do"});
			$("#handleFrom").submit();
		});
	})		
		
</script>

<form id="handleFrom">
	<input type="hidden" name="reqp_num" id="reqp_num">
	<input type="hidden" name="c2_num" id="c2_num">
	<input type="hidden" name="p_name" id="p_name">
	<input type="hidden" name="p_price" id="p_price">
	<input type="hidden" name="p_date" id="p_date">
	<input type="hidden" name="p_content" id="p_content">
	<input type="hidden" name="s_num" id="s_num">	
</form>
<div class="table-responsive">
	<h2>물품등록 요청 목록</h2>
    	<hr>
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>ReqNo</th>
				<th>Cate1</th>
				<th>Cate2</th>
				<th>물품명</th>
				<th>가격</th>				
				<th>내용</th>
				<th>요청일</th>	
				<th>판매자</th>							
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty produuctReqList}">
					<c:forEach var="productReq" items="${produuctReqList}" varStatus="status">
						<tr class="handle">
							<td>${productReq.reqp_num}</td>
							<td>${productReq.c1_num}</td>
							<td>${productReq.c2_bnum}</td>
							<td>${productReq.p_name}</td>
							<td>${productReq.p_price}</td>
							<td>${productReq.p_date}</td>
							<td>${productReq.p_content}</td>
							<td>${productReq.s_num}</td>				
						</tr>						
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="8" class="tac">물품 등록 요청이 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>
	
	


