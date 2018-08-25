<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
	.btnarea{
		text-align: center;
	}


</style>
	

<script type="text/javascript">

	$(function() {
		//업데이트에 필요할 양식에 정보 입력하기		

		var c1num = ${productDetail.c1_num};
		var c2num = ${productDetail.c2_num};
		var pdivision = '${productDetail.p_division}';
		$("#p_division").val(pdivision);
		// 구분 직접입력 숨기기
		$("#p_division").hide();
		
		// 선택된카테고리  dep1 호출
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
				if(c1_num == c1num){
					option.prop("selected",true);
				}
				 
				option.append(span);				
				$("#category1").append(option);
				
			});
			}).fail(function() {
				alert("카테고리1 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.	");
		});
		//$("#category1").val(c1num).prop("selected", true); //맞는 방벙이나 여기서는 ajax로 값 불러오기전에 수행되어서 사용 불가능 
		
		// 선택된 카테고리 dep2 호출		
		var url = "/admin/product/Category2dep.do?c1_num="+c1num;
		$.getJSON(url, function(data) {					
		//불러온 데이터 처리
			$(data).each(function() {
				var c2_name = this.c2_name;
				var c2_num = this.c2_num;
				
				var option = $("<option>");
				var span = $("<span>");
				option.attr("value",c2_num);
				span.html(c2_name);
				if(c2_num == c2num){
					option.prop("selected",true);
				}
				option.append(span);				
				$("#category2").append(option);
			});
		}).fail(function() {
			alert("카테고리2 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
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
				if(p_division == pdivision){
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
		
		//category1 변경시 다시 category2 불러오기
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
		
		
		//업데이트시 필요한 폼양식 숨기기
		$(".updateItem").hide();
		
		// 수정 버튼 누르면 나오는 버튼들 숨기기
		$("#saveBtn").hide();
		$("#cancelBtn").hide();
		
		//수정 버튼 클릭시
		$("#updateBtn").click(function() {
			$("#saveBtn").show();
			$("#cancelBtn").show();			
			$("#updateBtn").hide();
			$("#deleteBtn").hide();
			$(".change").prop("readonly",false);
			$(".detailItem").hide();
			$(".updateItem").show();						
		})
		
		//수정후 저장 버튼 클릭시
		$("#saveBtn").click(function() {
			if(confirm("정말 수정 하시겠습니까?")){
				$("#productForm").attr({"method":"post","action":"/admin/product/productUpdate.do","enctype":"multipart/form-data"});
				$("#productForm").submit();
			}else{
				return;
			}
		})
		
		// 취소 버튼 클릭시
		$("#cancelBtn").click(function() {
			location.href="/admin/product/productDetail.do?p_num="+$("#p_num").val();			
		})
		//삭제버튼 클릭시
		$("#deleteBtn").click(function() {
			$.ajax({
				url:"/admin/product/productUsageCount.do",  //전송 url
				type:"post",  // 전송 시 method 방식
				data:"p_num="+$("#p_num").val(),  //폼전체 데이터 전송
				dataType:"text",
				success: function(result){								
					if(result==0){ // 상품이 사용 되지 않았을 경우 사용 가능
						if(confirm("정말 삭제 하시겠습니까?")){							
							$("#productForm").attr({"method":"post","action":"/admin/product/productDelete.do","enctype":"multipart/form-data"});
							$("#productForm").submit();
						}else{
							return;
						}
					}else{
						console.log("사용중인 상품:"+result);
						alert("판매자가 이미 등록을 한 상품으로 삭제 불가능 합니다.");						
					}								
				},
				error:function(){  //실행시 오류가 발생하였을 경우
					alert("시스템 오류 입니다. 관리자에게 문의하세요!!");							
				}
			});
		})
	})
</script>

	<form class="form-horizontal" id="productForm">
		<input type="hidden" name="p_num" id="p_num" value="${productDetail.p_num}"/>
		<input type="hidden" name="pi_num" id="pi_num" value="${productDetail.pi_num}"/>
		<input type="hidden" name="pi_image" id="pi_image" value="${productDetail.pi_image}"/>
  		<div class="form-group">
    		<label for="category1" class="col-sm-3 control-label">카테고리</label>
    		<div class="col-sm-4" id="selectarea">    		
	    		<input type="text" class="form-control detailItem" readonly="readonly" id="pdc1" value="${productDetail.c1_name}">
	    		<input type="text" class="form-control detailItem" readonly="readonly" id="pdc2" value="${productDetail.c2_name}">    		
	    		<select name="c1_num" id="category1" class="form-control updateItem">
					<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>		
				</select>			
				<select name="c2_num" id="category2" class="form-control updateItem">
					<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>		
				</select>
			</div>			
  		</div>
  		<div class="form-group">
    		<label for="p_name" class="col-sm-3 control-label" >상 품 명</label>
    		<div class="col-sm-4">
    			<input type="text" class="form-control change" readonly="readonly" name="p_name" value="${productDetail.p_name}">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="p_price" class="col-sm-3 control-label">가    격</label>
    		<div class="col-sm-4">
	    		<div class="input-group">
	      			<div class="input-group-addon">￦</div>
	      			<input type="text" class="form-control col-xs-3 change" readonly="readonly" name="p_price"  value="${productDetail.p_price}">
	      			<div class="input-group-addon">WON</div>
	    		</div>
    		</div>
   		</div>
		<div class="form-group">
	    	<label for="p_content" class="col-sm-3 control-label">상품내용</label>
	    	<div class="col-sm-4">
	    		<textarea class="form-control change" cols="400" rows="5" placeholder="상품내용을 입력하세요" readonly="readonly" name="p_content" >${productDetail.p_content}</textarea>
	    	</div>	
	  	</div>  
	  	<div class="form-group">
	    	<label for="pi_image" class="col-sm-3 control-label">상품사진</label>
	    	<div class="col-sm-4" id="filearea">
	     		<img id="imgarea"class="img-thumbnail" src="/uploadStorage/product/${productDetail.pi_image}"/>	     	
	     		<input type="file" id="file" name="file"  class="updateItem">
	     	</div>
	  	</div>
	  	<div class="form-group" >
	    	<label for="p_division" class="col-sm-3  control-label">판매점구분</label>
	    	<div class="col-sm-4">
		    	<input type="text" class="form-control detailItem" readonly="readonly" id="pdpd" value="${productDetail.p_division}" >																		
		    	<select name="division" id="division" class="form-control col-xs-3 updateItem">
					<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>								
				</select>
				<input type="text" class="form-control col-xs-3" id="p_division" name="p_division" >				
			</div>  
	  	</div>
		<div class="form-group" > 
			<div class="btnarea">
				<a class="btn btn-default" href="/admin/product/productList.do">목 록</a>
				<input type="button" class="btn btn-default" id="saveBtn" value="저 장"/>
				<input type="button" class="btn btn-default" id="cancelBtn" value="취 소"/>
  				<input type="button" class="btn btn-default" id="updateBtn" value="수 정"/>
  				<input type="button" class="btn btn-default" id="deleteBtn" value="삭 제"/> 				
  			</div>
  		</div>
	</form>	
