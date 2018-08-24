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
				data:"p_num="+$("#p_num").val(),  //폼전체 데이터 전송
				dataType:"text",
				success: function(result){								
					if(result==0){ // 상품이 사용 되지 않았을 경우 사용 가능
						confirm("정말 삭제 하시겠습니까?");
						$("#delForm").attr({"method":"post","action":"/admin/product/productDelete.do"});
						$("#delForm").submit();
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
	<form id="delForm">
		<input type="hidden" name="p_num" id="p_num" value="${productDetail.p_num}"/>
		<input type="hidden" name="pi_num" id="pi_num" value="${productDetail.pi_num}"/>
		<input type="hidden" name="pi_image" id="pi_image" value="${productDetail.pi_image}"/>
	</form>
	
	<form class="form-horizontal" id="productDeleteForm">
  		<div class="form-group">
    		<label for="category1" class="col-sm-3 control-label">카테고리</label>
    		<div class="col-sm-4">    		
	    		<input type="text" class="form-control" readonly="readonly" value="${productDetail.c1_name}">
	    		<input type="text" class="form-control" readonly="readonly" value="${productDetail.c2_name}">
			</div>
  		</div>
  		<div class="form-group">
    		<label for="p_name" class="col-sm-3 control-label" >상 품 명</label>
    		<div class="col-sm-4">
    			<input type="text" class="form-control" readonly="readonly" value="${productDetail.p_name}">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="p_price" class="col-sm-3 control-label">가    격</label>
    		<div class="col-sm-4">
	    		<div class="input-group">
	      			<div class="input-group-addon">￦</div>
	      			<input type="text" class="form-control col-xs-3" readonly="readonly" value="${productDetail.p_price}">
	      			<div class="input-group-addon">WON</div>
	    		</div>
    		</div>
   		</div>
		<div class="form-group">
	    	<label for="p_content" class="col-sm-3 control-label">상품내용</label>
	    	<div class="col-sm-4">
	    		<textarea class="form-control" cols="400" rows="10"  placeholder="상품내용을 입력하세요" readonly="readonly" >${productDetail.p_content}</textarea>
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
		    	<input type="text" class="form-control" readonly="readonly" value="${productDetail.p_division}" >															
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
