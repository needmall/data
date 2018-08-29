<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
  	
</style>
	
 

<script type="text/javascript">

</script>

<div class="table-responsive">
	<h2>판매자 목록 </h2>
    	<hr>
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>판매자 번호</th>
				<th>ID</th>
				<th>이름</th>
				<th>성별</th>				
				<th>생일</th>				
				<th>주소</th>
				<th>메일</th>	
				<th>전화</th>
				<th>휴대폰</th>
				<th>등록일</th>							
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty sellerList}">
					<c:forEach var="seller" items="${sellerList}" varStatus="status">
						<tr>
							<td>${seller.s_num}</td>
							<td>${seller.s_id}</td>
							<td>${seller.s_name}</td>
							<td>${seller.s_gender}</td>							
							<td>${seller.s_birthday}</td>
							<td>${seller.s_address}</td>
							<td>${seller.s_mail}</td>
							<td>${seller.s_phone}</td>
							<td>${seller.s_cell}</td>
							<td>${seller.s_date}</td>							
						</tr>
					
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="10" >등록된 판매자가 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>



