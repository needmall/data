<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
	

</style>
	
 

<script type="text/javascript">
	$(function() {
			
			
	})//최상위 마지막
</script>

<div class="table-responsive">
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>No</th>
				<th>Cate1</th>
				<th>Cate2</th>
				<th>상품명</th>
				<th>상품가격</th>				
				<th>상품내용</th>
				<th>상품등록일</th>
				<th>상품수정일</th>
				<th>상품구분</th>				
				<th>상품이미지</th>
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty productList}">
					<c:forEach var="product" items="${productList}" varStatus="status">
						<tr class="tac" data-num="${product.p_num}">
							<td>${product.p_num}</td>
							<td>${product.c1_name}</td>
							<td>${product.c2_name}</td>
							<td>${product.p_name}</td>
							<td>${product.p_price}</td>							
							<td>${product.p_content}</td>							
							<td>${product.p_division}</td>
							<td>${product.p_date}</td>
							<td>${product.p_udate}</td>							
							<td>${product.pi_image}</td>
						</tr>	
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="9" class="tac">등록된 게시물이 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>
	
	


