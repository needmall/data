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
		//업데이트시 필요한 폼양식 숨기기
		$(".updateItem").hide();
		
		//수정 버튼 클릭시
		$("#updateBtn").click(function() {
			$("#saveBtn").show();
			$("#cancelBtn").show();			
			$("#updateBtn").hide();
			$("#deleteBtn").hide();
			$(".change").prop("readonly",false);			
			$(".updateItem").show();						
		});
		
		//수정버튼후 저장 버튼 클릭시
		$("#saveBtn").click(function() {
			if(confirm("정말 수정 하시겠습니까?")){
				$("#newsForm").attr({"method":"post","action":"/admin/news/adminNewsUpdate.do","enctype":"multipart/form-data"});
				$("#newsForm").submit();
			}else{
				return;
			}
		})
		
		// 취소 버튼 클릭시
		$("#cancelBtn").click(function() {
			location.href="/admin/news/adminNewsDetail.do?n_num="+$("#n_num").val();			
		})
		
		//삭제버튼 클릭시
		$("#deleteBtn").click(function() {		
			if(confirm("정말 삭제 하시겠습니까?")){							
				$("#newsForm").attr({"method":"post","action":"/admin/news/adminNewsDelete.do","enctype":"multipart/form-data"});
				$("#newsForm").submit();
			}else{
				return;
			}		
		})
	})
</script>

<div id="leftDiv">
	<form class="form-horizontal" id="newsForm">
		<h2>공지사항 상세보기 </h2>
    	<hr>		
  		<input type="hidden" name="n_file" value="${adminNewsDetail.n_file}">
  		<div class="form-group">
    		<label for="n_num" class="col-sm-1 control-label" >No</label>
    		<div class="col-sm-11">
    			<input type="text" class="form-control" readonly="readonly" id="n_num" name="n_num" value="${adminNewsDetail.n_num}">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="n_title" class="col-sm-1 control-label" >제목</label>
    		<div class="col-sm-11">
    			<input type="text" class="form-control change" readonly="readonly" id="n_title" name="n_title" value="${adminNewsDetail.n_title}">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="n_date" class="col-sm-1 control-label" >등록일</label>
    		<div class="col-sm-11">
    			<input type="text" class="form-control change" readonly="readonly" id="n_date" name="n_date" value="${adminNewsDetail.n_date}">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="n_udate" class="col-sm-1 control-label" >수정일</label>
    		<div class="col-sm-11">
    			<input type="text" class="form-control change" readonly="readonly" id="n_udate" name="n_udate" value="${adminNewsDetail.n_udate}">
    		</div>
  		</div> 
  		<c:choose>
		<c:when test="${not empty adminNewsDetail.n_file}">  		 		  
		  	<div class="form-group">
		    	<label for="pi_image" class="col-sm-1 control-label">상품사진</label>
		    	<div class="col-sm-11" id="filearea">
		     		<img id="imgarea"class="img-thumbnail" src="/uploadStorage/news/${adminNewsDetail.n_file}"/>	     	
		     		<input type="file" id="file" name="file"  class="updateItem">
		     	</div>
		  	</div>
	  	</c:when>
	  	</c:choose>
		<div class="form-group">
    		<label for="n_udate" class="col-sm-1 control-label" >내 용</label>
    		<div class="col-sm-11">
    			<input type="text" class="form-control change" readonly="readonly" id="n_content" name="n_content" value="${adminNewsDetail.n_content}">
    		</div>
  		</div>	  	
		<div class="form-group" > 
			<div class="btnarea">
				<a class="btn btn-default" href="/admin/news/adminNewsList.do">목 록</a>
				<input type="button" class="btn btn-default updateItem" id="saveBtn" value="저 장"/>
				<input type="button" class="btn btn-default updateItem" id="cancelBtn" value="취 소"/>
  				<input type="button" class="btn btn-default" id="updateBtn" value="수 정"/>
  				<input type="button" class="btn btn-default" id="deleteBtn" value="삭 제"/> 				
  			</div>
  		</div>
	</form>	
</div>
