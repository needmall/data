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
					
			<tr>
				<th>No</th>
				<td>Cate1</td>
			</tr>
		
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty productList}">
					<c:forEach var="product" items="${productList}" varStatus="status">
						<c:choose>						
						    <c:when test='${product.p_state==0}'>	
								<tr class="goDetail " data-num="${product.p_num}" >
									<td>${product.p_num}</td>
									<td>${product.c1_name}</td>
									<td>${product.c2_name}</td>
									<td>${product.p_name}</td>
									<td>${product.p_price}</td>							
									<td>${product.p_content}</td>							
									<td>${product.p_division}</td>
									<td>${product.p_date}</td>
									<td>${product.p_udate}</td>							
									<td><input type="button" class="btn btn-default imgBtn" data-pi_image="${product.pi_image}" value="확 인"><div class="addimg"></div></td>
									<td><input type="button" class="btn btn-default permit" data-pstate="${product.p_state}" value="가능"/></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="goDetail danger" data-num="${product.p_num}">
									<td>${product.p_num}</td>
									<td>${product.c1_name}</td>
									<td>${product.c2_name}</td>
									<td>${product.p_name}</td>
									<td>${product.p_price}</td>							
									<td>${product.p_content}</td>							
									<td>${product.p_division}</td>
									<td>${product.p_date}</td>
									<td>${product.p_udate}</td>							
									<td><input type="button" class="btn btn-default imgBtn" data-pi_image="${product.pi_image}" value="확 인"><div class="addimg"></div></td>
									<td><input type="button" class="btn btn-default permit" data-pstate="${product.p_state}" value="불가" /></td>
								</tr>
							</c:otherwise>
						</c:choose>	
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="11">등록된 물품이 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>
	
	


