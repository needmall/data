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
		<tr>
			<th>No</th>
			<td>${newsDetail.n_num}<td>				
		</tr>
		<tr>
			<th>제목</th>
			<td>${newsDetail.n_title}<td>				
		</tr>
		<tr>
			<th>등록일</th>
			<td>${newsDetail.n_udate}<td>				
		</tr>
		<c:when test="${not empty newsDetail.n_file}">
			<tr>
				<th rowspan="2">내용</th>
				<td>
				
				<img id="imgarea"class="img-thumbnail" src="/uploadStorage/news/${newsDetail.n_file}"/>
				<td>				
			</tr>
		</c:when>
		<tr>			
			<td>${newsDetail.n_content}<td>				
		</tr>			
	</table>
</div>

