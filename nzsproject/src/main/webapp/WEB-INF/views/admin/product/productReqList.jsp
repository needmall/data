<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">

</style>
	
 

<script type="text/javascript">
	$(function () {
		$(".handle").click(function() {			
			$("#reqp_num").val($(this).find("td:eq(0)").html());
			$("#c1_name").val($(this).find("td:eq(1)").html());
			$("#c2_name").val($(this).find("td:eq(2)").html());
			$("#p_name").val($(this).find("td:eq(3)").html());
			$("#p_price").val($(this).find("td:eq(4)").html());
			$("#p_content").val($(this).find("td:eq(5)").html());
			$("#p_date").val($(this).find("td:eq(6)").html());
			$("#s_num").val($(this).find("td:eq(7)").html());
			$("#c1_num").val($(this).find("td:eq(1)").attr("data-c1num"));
			
			$("#handleFrom").attr({"method":"post","action":"/admin/product/reqproductRegist.do"});
			$("#handleFrom").submit();
		});
	})		
		
</script>

<form id="handleFrom">
	<input type="hidden" name="reqp_num" id="reqp_num">
	<input type="hidden" name="c1_name" id="c1_name">
	<input type="hidden" name="c2_name" id="c2_name">
	<input type="hidden" name="p_name" id="p_name">
	<input type="hidden" name="p_price" id="p_price">
	<input type="hidden" name="p_content" id="p_content">
	<input type="hidden" name="p_date" id="p_date">
	<input type="hidden" name="s_num" id="s_num">
	<input type="hidden" name="c1_num" id="c1_num">

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
				<c:when test="${not empty productReqList}">
					<c:forEach var="productReq" items="${productReqList}" varStatus="status">
						<tr class="handle">
							<td>${productReq.reqp_num}</td>
							<td data-c1num="${productReq.c1_num}">${productReq.c1_name}</td>
							<td>${productReq.c2_name}</td>
							<td>${productReq.p_name}</td>
							<td>${productReq.p_price}</td>							
							<td>${productReq.p_content}</td>
							<td>${productReq.p_date}</td>
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
	
	


