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
		//수정 버튼 클릭시
		$("#updateBtn").click(function() {
			
		})
		
		//삭제버튼 클릭시
		$("#deleteBtn").click(function() {
			$.ajax({
				url:"/admin/product/productUsageCount.do",  //전송 url
				type:"post",  // 전송 시 method 방식
				data:"p_num="+$("#p_name").attr("data-p_num"),  //폼전체 데이터 전송
				dataType:"text",
				success: function(resultData){								
					if(resultData==0){
						// 삭제 명령어
						//
						//

					}else{
						console.log("사용중인 상품:"+resultData);
						alert("댓글이 있어 삭제가 불가능 합니다.");
						return;
					}								
				},
				error: function(xhr, textStatus, errorThrown){ //실행시 오류가 발생하였을 경우
					alert("시스템 오류입니다. 관리자에게 문의 하세요.");
				}								
			});
		})
	})
</script>


	
	<form class="form-horizontal" id="productInsertForm">
  		<div class="form-group">
    		<label for="category1" class="col-sm-3 control-label">카테고리</label>
    		<div class="col-sm-4">    		
	    		<input type="text" class="form-control" id="c1_name" name="c1_name" readonly="readonly" value="${productDetail.c1_name}">
	    		<input type="text" class="form-control" id="c2_name" name="c2_name" readonly="readonly" value="${productDetail.c2_name}">
			</div>
  		</div>
  		<div class="form-group">
    		<label for="p_name" class="col-sm-3 control-label" >상 품 명</label>
    		<div class="col-sm-4">
    			<input type="text" class="form-control" id="p_name" name="p_name" data-p_num="${productDetail.p_num}" readonly="readonly" value="${productDetail.p_name}">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="p_price" class="col-sm-3 control-label">가    격</label>
    		<div class="col-sm-4">
	    		<div class="input-group">
	      			<div class="input-group-addon">￦</div>
	      			<input type="text" class="form-control col-xs-3" id="p_price" name="p_price" readonly="readonly" value="${productDetail.p_price}">
	      			<div class="input-group-addon">WON</div>
	    		</div>
    		</div>
   		</div>
		<div class="form-group">
	    	<label for="p_content" class="col-sm-3 control-label">상품내용</label>
	    	<div class="col-sm-4">
	    		<textarea class="form-control" cols="400" rows="10" id="p_content" name="p_content" placeholder="상품내용을 입력하세요" readonly="readonly" >${productDetail.p_content}</textarea>
	    	</div>	
	  	</div>  
	  	<div class="form-group">
	    	<label for="pi_image" class="col-sm-3 control-label">상품사진</label>
	    	<div class="col-sm-4">
	     		<img id="imgarea"class="img-thumbnail" src="/uploadStorage/product/${productDetail.pi_image}"/>
	     	</div>
	  	</div>
	  	<div class="form-group" >
	    	<label for="p_division" class="col-sm-3  control-label">판매점구분</label>
	    	<div class="col-sm-4">
		    	<input type="text" class="form-control" id="p_division" name="p_division" readonly="readonly" value="${productDetail.p_division}" >															
			</div>    
	  	</div>
		<div class="form-group" > 
			<div class="btnarea">
				<a class="btn btn-default" href="/admin/product/productList.do">목 록</a>
  				<input type="button" class="btn btn-default" id="updateBtn" value="수 정"/>
  				<input type="button" class="btn btn-default" id="deleteBtn" value="삭 제"/> 				
  			</div>
  		</div>
	</form>	
