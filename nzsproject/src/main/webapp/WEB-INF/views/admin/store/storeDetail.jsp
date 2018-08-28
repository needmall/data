<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

	
<style type="text/css">
#leftDiv{
		width: 600px;
		float: left !important;
		text-align: center;
	}
	#latlonAddress{
		width: 83% !important;
		float: left !important;
	}

</style>

<!-- 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services"></script>
<script type="text/javascript">
$(function() {
	var sidivision = '${storeDetail.si_division}';
	
	// 구분 직접입력 숨기기
	
	$("#division").hide();
	$("#file").hide();
	
	// 수정 버튼 누르면 나오는 버튼들 숨기기
	$("#saveBtn").hide();
	$("#cancelBtn").hide();
	
	// 구분 목록 반환
	var url_d = "/admin/store/division.do";
	$.getJSON(url_d, function(data) {
		//불러온 데이터 처리
		$(data).each(function() {
			var si_division = this.si_division;			
			
			var option = $("<option>");
			var span = $("<span>");
			option.attr("value",si_division);
			span.html(si_division);
			if(sidivision == si_division){
				option.prop("selected",true);
			}
			option.append(span);				
			$("#division").append(option);				
		});
		//마지막 기타란 추가
		$("#division").append("<option value='extra'>기타 (직접입력) </option>");
		
		}).fail(function() {
			alert("구분목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
	});	
	
	// 구분 선택이 none으로 변경시 직접 입력하는 창 띄우기	
	$("#division").change(function() {  //on(이벤트, 대상, 콜백함수) 
		if($(this).find("option:selected").val()=="none"){				
			$("#si_division").hide();
			$("#file").val("");
			$("#file").hide();
		}else if($(this).find("option:selected").val()=="extra"){
			$("#si_division").val("");
			$("#si_division").show();
			$("#file").val("");
			$("#file").show();
		}else{
			$("#si_division").hide();				
			$("#si_division").val($(this).find("option:selected").val());
			$("#file").val("");
			$("#file").hide();
		}
	});
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	//위도 경도 입력하기 버튼
	$("#locationCheck").click(function() {
		
		var latlonAddress = $("#latlonAddress").val();
		// 주소로  위도 경도 찍기
		geocoder.addressSearch(latlonAddress, function (result, status) { // 주소 검색으로 나오는 첫번째 결과를  위도 경도로 받아오기
		
			if (status === daum.maps.services.Status.OK) {						
				var lat = result[0].address.y
				var lon = result[0].address.x						
				$("#st_lat").val(lat);
				$("#st_lon").val(lon);
														
				// 행정동 표시
				// 좌표로 행정동 주소 정보를 요청합니다
				geocoder.coord2RegionCode(lon, lat, getAddress);					
			}else{
				$("#latlonAddress").val("");
				$("#latlonAddress").focus();
				alert("주소를 제대로 다시 입력하여 주세요.(예,성동구 무학로2길 54)");
			}
		})	
	})
	
	//취소 버튼
	$("#cancleBtn").click(function() {
		$("#reqForm").attr({"method":"post","action":"/admin/store/storeRegist.do"});
		$("#reqForm").submit();
	})
		
	// 수정 버튼 
	$("#updateBtn").click(function() {
		$("#saveBtn").show();
		$("#cancelBtn").show();			
		$("#updateBtn").hide();
		$(".change").prop("readonly",false);
		$("#si_division").prop("readonly",false);
		$("#division").show();
		$("#si_division").hide();
	})
	
	// 취소 버튼 클릭시
	$("#cancelBtn").click(function() {
		location.href="/admin/store/storeDetail.do?st_num="+$("#st_num").val();			
	})
		
	//저장버튼 클릭
	$("#saveBtn").click(function() {
		if(!chkData("#st_bnum","사업자번호를")){				
			return;
		}else if(!chkData("#st_name","상호명을")){				
			return;
		}else if(!chkData("#st_address","사업지 주소를")){
			return;
		}else if(!chkData("#st_email","이메일을")){
			return;
		}else if(!chkData("#st_hours","영업시간을")){
			return;
		}else if(!chkData("#st_cell","영업전화를")){
			return;
		}else if(!chkData("#st_ceo","대표자를")){
			return;
		}else if(!chkData("#st_lat","위도 경도를")){
			return;
		}else if($("#division").find("option:selected").val()=="none"){
			alert("판매점 구분을 선택해 주세요.");			
			return;
		}else if(!chkData("#si_division","판매점 구분을" )){
			return;			
		}else if($("#division").find("option:selected").val()=="extra" && !chkData("#file","사진을")){
			return;
		}else if($("#division").find("option:selected").val()=="extra" && !chkFile($("#file"))){
			return;
		}else{	
			if(confirm("정말 수정하시겠습니까?")){
				/* 첨부파일 보낼때에는 post 방식에서 enctype="multipart/form-data" 속성을 설정하여야 한다. */						
				$("#updateForm").attr({"method":"post","action":"/admin/store/storeUpdate.do","enctype":"multipart/form-data"});
				$("#updateForm").submit();
			}
		}
	})
	
	
	})//최상위 마지막
	
	//맵의 가운데 위도 경도를 행정주소로 반환
	function getAddress (result, status) {  
	if (status === daum.maps.services.Status.OK) {
		var nowlocation = result[0].address_name;
		$("#latlonAddress").val( nowlocation);
	}
} 	

</script>
    
    
    
<div id="leftDiv" >

	<h2>매장 상세보기</h2>	
	<hr>
	<form class="form-horizontal" id="updateForm">

	  	<div class="form-group">
	    	<label for="st_num" class="col-sm-3 control-label">매장번호</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_num" name="st_num" value="${storeDetail.st_num}" readonly="readonly">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_name" class="col-sm-3 control-label">상호명</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control change"  id="st_name" name="st_name" value="${storeDetail.st_name}" readonly="readonly">
	     	</div>
	  	</div>	  	
	  	<div class="form-group">
	    	<label for="s_num" class="col-sm-3 control-label">판매자번호</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="s_num" name="s_num" value="${storeDetail.s_num}" readonly="readonly">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_bnum" class="col-sm-3 control-label">사업자번호</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_bnum" name="st_bnum" value="${storeDetail.st_bnum}" readonly="readonly">
	     	</div>
	  	</div>	  	
	  	<div class="form-group">
	    	<label for="st_address" class="col-sm-3 control-label">사업지 주소</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control change"  id="st_address" name="st_address"  value="${storeDetail.st_address}" readonly="readonly">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_email" class="col-sm-3 control-label">이메일</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control change"  id="st_email" name="st_email" value="${storeDetail.st_email}" readonly="readonly">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_hours" class="col-sm-3 control-label">영업시간</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control change"  id="st_hours" name="st_hours"  value="${storeDetail.st_hours}" readonly="readonly">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_cell" class="col-sm-3 control-label">영업전화</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control change"  id="st_cell" name="st_cell"  value="${storeDetail.st_cell}" readonly="readonly">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_ceo" class="col-sm-3 control-label">대표자</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control change"  id="st_ceo" name="st_ceo" value="${storeDetail.st_ceo}" readonly="readonly">
	     	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="latlon" class="col-sm-3 control-label">위도경도 주소</label>
	  		<div class="col-sm-8 ">	  			
    			<input type="text"  class="form-control change"  id="latlonAddress" name="latlonAddress" value="${storeDetail.st_address}" readonly="readonly">
      			<input type="button" class="btn btn-default" id="locationCheck" value="적  용 ">
	    	</div>
    	 </div>  	
	  	<div class="form-group " >	    	
	    	<label for="st_lat" class="col-sm-3 control-label">적용 위치</label>
	    	<div class="form-inline col-sm-8 "> 
	    		<div class="input-group ">
	    			<div class="input-group-addon">위도</div>  			
	      			<input type="text" class="form-control col-xs-3"  id="st_lat" name="st_lat" value="${storeDetail.st_lat}" readonly="readonly">
	      			<div class="input-group-addon">경도</div>
	      			<input type="text" class="form-control col-xs-3"  id="st_lon" name="st_lon" value="${storeDetail.st_lon}" readonly="readonly">
	      		</div>
	    	 </div>	    	
	  	</div>	      			
	    		
	  	<div class="form-group " >
	    	<label for="si_division" class="col-sm-3  control-label">판매점구분</label>
	    	<div class="col-sm-8">
		    	<select name="division" id="division" class="form-control col-xs-3" >
					<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>								
				</select>
				<input type="text" class="form-control" id="si_division" name="si_division" placeholder="판매구분을 직접 입력하세요." value="${storeDetail.si_division}" readonly="readonly">
				<input type="file" class="form-control" id="file" name="file">
			</div>    
	  	</div>	  		
	</form>
	<a class="btn btn-default" href="/admin/store/storeList.do">목 록</a>
	<input type="button" class="btn btn-default" id="saveBtn" value="저 장"/>
	<input type="button" class="btn btn-default" id="cancelBtn" value="취 소"/>
	<input type="button" class="btn btn-default"  id="updateBtn" value="수 정">
</div>