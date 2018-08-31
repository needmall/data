<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<!-- 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services"></script>
<!-- services와 clusterer 라이브러리 불러오기 -->
<!-- clusterer: 마커를 클러스터링 할 수 있는 클러스터러 라이브러리 입니다.
      services: 장소 검색 과 주소-좌표 변환 을 할 수 있는 services 라이브러리 입니다.
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services,clusterer"></script> -->

<style type="text/css">

</style>


<script type="text/javascript">
	
</script>

<div class="table-responsive">
	<h2> 공지 사항 </h2>
    	<hr>
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>No</th>
				<th>제목</th>				
				<th>등록일</th>				
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty newsList}">
					<c:forEach var="news" items="${newsList}" varStatus="status">
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

