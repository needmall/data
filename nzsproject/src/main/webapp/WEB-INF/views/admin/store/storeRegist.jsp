<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
	.leftDiv{
		width: 600px;
		float: left !important;
	}
	.rightDiv{
		width: 600px;
		float: left !important;
	}
</style>

<script type="text/javascript">
	$(function() {
		// 구분 직접입력 숨기기
		$("#si_division").hide();
		
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
			}else if($(this).find("option:selected").val()=="extra"){
				$("#si_division").val("");
				$("#si_division").show();	
			}else{
				$("#si_division").hide();
				$("#si_division").val($(this).find("option:selected").val());
			}
		});
	})
	

</script> 	
<div class="leftDiv">
	<form class="form-horizontal" id="reqForm">		
  		<div class="form-group">
	    	<label for="reqst_num" class="col-sm-3 control-label">판매 요청 번호</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5"  readonly="readonly" value="${storeReq.reqst_num}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="s_num" class="col-sm-3 control-label">판매자번호</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5"  readonly="readonly" value="${storeReq.s_num}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_bnum" class="col-sm-3 control-label">사업자번호</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5"  readonly="readonly" value="${storeReq.st_bnum}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_name" class="col-sm-3 control-label">상호명</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5"  readonly="readonly" value="${storeReq.st_name}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_address" class="col-sm-3 control-label">사업지</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5"   readonly="readonly" value="${storeReq.st_address}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_email" class="col-sm-3 control-label">이메일</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5"  readonly="readonly" value="${storeReq.st_email}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_hours" class="col-sm-3 control-label">영업시간</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5" readonly="readonly" value="${storeReq.st_hours}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_cell" class="col-sm-3 control-label">영업전화</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5" readonly="readonly" value="${storeReq.st_cell}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_ceo" class="col-sm-3 control-label">대표자</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5"  readonly="readonly" value="${storeReq.st_ceo}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_date" class="col-sm-3 control-label">요청일</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control col-xs-5"  readonly="readonly" value="${storeReq.st_date}">
	     	</div>
	  	</div>  		
	</form>
</div>
<div class="rightDiv">	
	<form class="form-horizontal" id="registForm">	 
	  	<div class="form-group">
	    	<label for="st_bnum" class="col-sm-3 control-label">사업자번호</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_bnum" name="st_bnum" value="${storeReq.st_bnum}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_name" class="col-sm-3 control-label">상호명</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_name" name="st_name" value="${storeReq.st_name}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_address" class="col-sm-3 control-label">사업지</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_address" name="st_address"  value="${storeReq.st_address}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_email" class="col-sm-3 control-label">이메일</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_email" name="st_email" value="${storeReq.st_email}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_hours" class="col-sm-3 control-label">영업시간</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_hours" name="st_hours"  value="${storeReq.st_hours}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_cell" class="col-sm-3 control-label">영업전화</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_cell" name="st_cell"  value="${storeReq.st_cell}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_ceo" class="col-sm-3 control-label">대표자</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_ceo" name="st_ceo" value="${storeReq.st_ceo}">
	     	</div>
	  	</div>
	  	<div class="form-group">
	    	<label for="st_ceo" class="col-sm-3 control-label">위도</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_ceo" name="st_ceo" >
	     	</div>
	     	<label for="st_ceo" class="col-sm-3 control-label">경도</label>
	    	<div class="col-sm-8">
	     		<input type="text"  class="form-control"  id="st_ceo" name="st_ceo" >
	     	</div>
	  	</div>
	  	<div class="form-group" >
	    	<label for="si_division" class="col-sm-3  control-label">판매점구분</label>
	    	<div class="col-sm-8">
		    	<select name="division" id="division" class="form-control col-xs-3">
					<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>								
				</select>
				<input type="text" class="form-control" id="si_division" name="si_division" placeholder="판매구분을 직접 입력하세요.">				
			</div>    
	  	</div>	  		
	</form>	
</div>