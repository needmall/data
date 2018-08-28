<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
  	
</style>
	
 

<script type="text/javascript">

</script>

<div class="table-responsive">
	<h2>고객 목록 </h2>
    	<hr>
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>고객 번호</th>
				<th>ID</th>
				<th>이름</th>
				<th>성별</th>				
				<th>생일</th>				
				<th>주소</th>
				<th>메일</th>	
				<th>전화</th>
				<th>등록일</th>							
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty customerList}">
					<c:forEach var="customer" items="${customerList}" varStatus="status">
						<tr>
							<td>${customer.c_num}</td>
							<td>${customer.c_id}</td>
							<td>${customer.c_name}</td>
							<td>${customer.c_gender}</td>							
							<td>${customer.c_birthday}</td>
							<td>${customer.c_address}</td>
							<td>${customer.c_mail}</td>
							<td>${customer.c_cell}</td>
							<td>${customer.c_date}</td>							
						</tr>
					
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="10" >등록된 고객이 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>



