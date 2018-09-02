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
	$(function() {
		$(".goDetail").click(function() {
			location.href="adminNewsDetail.do?n_num="+$(this).attr("data-num");
		});
		
		$("#registBtn").click(function() {
			location.href="adminNewsRegist.do";
		})
		
	})//최상위
</script>


<div class="table-responsive">	
	<input type="button" id="registBtn" class="btn btn-default" value="등 록">
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>No</th>
				<th>제목</th>				
				<th>내용</th>
				<th>등록일</th>	
				<th>수정일</th>	
				<th>이미지</th>					
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty adminNewsList}">
					<c:forEach var="news" items="${adminNewsList}" varStatus="status">
						<tr class="goDetail " data-num="${news.n_num}" >
							<td>${news.n_num}</td>
							<td>${news.n_title}</td>
							<td>${news.n_date}</td>
							<td>${news.n_date}</td>
							<td>${news.n_udate}</td>
							<td>${news.n_file}</td>						
						</tr>		
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="6">등록된 물품이 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>

