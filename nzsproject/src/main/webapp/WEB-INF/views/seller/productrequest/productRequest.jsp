<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
	.btnarea{
		text-align: center;
	}
#leftDiv{
		width: 600px;
		float: left !important;
		text-align: center;
	}
h2{
text-align:left;
}

</style>

<script type="text/javascript">
var result = '${registresult}'; 

if(result == '2'){
	alert("등록이 완료 되었습니다.");	
}

$(function() {		
	// 구분 직접입력 숨기기
	$("#p_division").hide();
	
	//카테고리dep1 호출
	var url = "/admin/product/Category1dep.do";
	$.getJSON(url, function(data) {
		//불러온 데이터 처리
		$(data).each(function() {
			var c1_name = this.c1_name;
			var c1_num = this.c1_num;
			
			var option = $("<option>");
			var span = $("<span>");
			option.attr("value",c1_num);
			span.html(c1_name);			
			option.append(span);
			
			$("#category1").append(option);
			
		});
		}).fail(function() {
			alert("카테고리1 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.	");
	});
	
	// 구분 목록 반환
	var url_d = "/admin/product/division.do";
	$.getJSON(url_d, function(data) {
		//불러온 데이터 처리
		$(data).each(function() {
			var p_division = this.p_division;
			
			var option = $("<option>");
			var span = $("<span>");
			option.attr("value",p_division);
			span.html(p_division);
			option.append(span);				
			$("#division").append(option);				
		});
		//마지막 기타란 추가
		$("#division").append("<option value='extra'>기타 (직접입력) </option>");
		
		}).fail(function() {
			alert("구분목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
	});	

	
	//category1 변경시 category2 불러오기
	$("#category1").change(function() {  //on(이벤트, 대상, 콜백함수) 
		// 초기화
		$("#category2").html("");
		$("#category2").append("<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>");
		if($(this).find("option:selected").val()!="none"){
		
			var url = "/admin/product/Category2dep.do?c1_num="+$("#category1 > option:selected").val();
			$.getJSON(url, function(data) {					
				//불러온 데이터 처리
				$(data).each(function() {
					var c2_name = this.c2_name;
					var c2_num = this.c2_num;
					
					var option = $("<option>");
					var span = $("<span>");
					option.attr("value",c2_num);
					span.html(c2_name);
					option.append(span);				
					$("#category2").append(option);
				});
			}).fail(function() {
				alert("카테고리2 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
			});
		}
	});
		
	// 구분 선택이 none으로 변경시 직접 입력하는 창 띄우기	
	$("#division").change(function() {  //on(이벤트, 대상, 콜백함수) 
		if($(this).find("option:selected").val()=="none"){
			$("#p_division").hide();						
		}else if($(this).find("option:selected").val()=="extra"){
			$("#p_division").val("");
			$("#p_division").show();	
		}else{
			$("#p_division").hide();
			$("#p_division").val($(this).find("option:selected").val());
		}
	});
	
	// 등록 버튼 클릭시
	$("#requestBtn").click(function() {
		if($("#category1").find("option:selected").val()=="none"){
			$("#category1").focus();
			alert("카테고리(대분류)를 선택해 주세요.");				
			return;
		}else if($("#category2").find("option:selected").val()=="none"){
			alert("카테고리(소분류)를 선택해 주세요.");
			$("#category2").focus();
			return;				
		}else if(!chkData("#p_name","상품명을")){				
			return;
		}else if(!chkData("#p_content","상품내용을")){
			return;
		}else{	
		/* 첨부파일 보낼때에는 post 방식에서 enctype="multipart/form-data" 속성을 설정하여야 한다. */						
		$("#productRequestForm").attr({"method":"post","action":"/seller/productrequest/productRequstUpdate.do"});
		$("#productRequestForm").submit();
		}
	})
})//최상위 마지막
	

</script> 


<div id="leftDiv" >	
	<form class="form-horizontal" id="productRequestForm">
  		<div class="form-group">
    		<label for="category1" class="col-sm-3 control-label">카테고리</label>
    		<div class="col-sm-8">    		
	    		<select name="c1_num" id="category1" class="form-control">
					<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>		
				</select>			
				<select name="c2_num" id="category2" class="form-control">
					<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>		
				</select>
			</div>
  		</div>
  		<div class="form-group">
    		<label for="p_name" class="col-sm-3 control-label">상 품 명</label>
    		<div class="col-sm-8">
    			<input type="text" class="form-control" id="p_name" name="p_name" >
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="p_price" class="col-sm-3 control-label">가    격</label>
    		<div class="col-sm-8">
	    		<div class="input-group">
	      			<div class="input-group-addon">￦</div>
	      			<input type="text" class="form-control col-xs-3" id="p_price" name="p_price">
	      			<div class="input-group-addon">WON</div>
	    		</div>
    		</div>
   		</div>
		<div class="form-group">
	    	<label for="p_content" class="col-sm-3 control-label">상품내용</label>
	    	<div class="col-sm-8">
	    		<textarea class="form-control" cols="400" rows="5" id="p_content" name="p_content" placeholder="상품내용을 입력하세요"></textarea>
	    	</div>	
	  	</div> 
		<div class="form-group " > 
			<div class="btnarea center-block">
  				<input type="button" class="btn btn-default" id="requestBtn" value="요 청"/>
  				<input type="reset" class="btn btn-default" value="취  소"/>
  			</div>
  		</div>
	</form>	
</div>
