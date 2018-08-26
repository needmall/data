<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">

</style>
	
 

<script type="text/javascript">
		
		
</script>


<div class="table-responsive">
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>판매요청번호</th>
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
						<tr data-num="${storeReq.reqst_num}" >
							<td>${storeReq.reqst_num}</td>
							<td>${storeReq.s_num}</td>
							<td>${storeReq.st_bnum}</td>
							<td>${storeReq.st_address}</td>
							<td>${storeReq.st_email}</td>
							<td>${storeReq.st_hours}</td>
							<td>${storeReq.st_cell}</td>
							<td>${storeReq.st_ceo}</td>
							<td>${storeReq.st_date}</td>
							<td>${storeReq.st_num}</td>						
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
	
	


