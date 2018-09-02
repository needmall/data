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
	#leftDiv{
		width: 1200px;
		float: left !important;
		text-align: center;
	}
	
	h2{
text-align:left;
}
	.btnarea{
		text-align: center;
	}
	
</style>


<script type="text/javascript">
	$(function() {
		$("#saveBtn").click(function() {
			$("#newsForm").attr({"method":"post","action":"/admin/news/adminNewsInsert.do","enctype":"multipart/form-data"});
			$("#newsForm").submit();
		});
	})
</script>

<div id="leftDiv">
	<form class="form-horizontal" id="newsForm">
		<h2>공지사항 상세보기 </h2>
    	<hr>		
  		<input type="hidden" name="n_file">  		
  		<div class="form-group">
    		<label for="n_title" class="col-sm-1 control-label" >제목</label>
    		<div class="col-sm-11">
    			<input type="text" class="form-control change" id="n_title" name="n_title" >
    		</div>
  		</div>  		  		  
	  	<div class="form-group">
	    	<label for="pi_image" class="col-sm-1 control-label">상품사진</label>
	    	<div class="col-sm-11" id="filearea">	     			     	
	     		<input type="file" id="file" name="file"  class="updateItem">
	     	</div>
	  	</div>
		<div class="form-group">
    		<label for="n_udate" class="col-sm-1 control-label" >내 용</label>
    		<div class="col-sm-11">
    			<input type="text" class="form-control change" id="n_content" name="n_content" >
    		</div>
  		</div>	  	
		<div class="form-group" > 
			<div class="btnarea">
				<a class="btn btn-default" href="/admin/news/adminNewsList.do">목 록</a>
				<input type="button" class="btn btn-default updateItem" id="saveBtn" value="저 장"/>
				<input type="reset" class="btn btn-default updateItem"  value="취 소"/>  				 				
  			</div>
  		</div>
	</form>	
</div>
