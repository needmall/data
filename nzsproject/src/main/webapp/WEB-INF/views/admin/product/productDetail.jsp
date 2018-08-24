<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
	.btnarea{
		text-align: center;
	}


</style>
	
 
<!-- 상품등록에 쓰인 js 반복-->
<script type="text/javascript" src="/resources/include/js/admin/productRegist.js"></script>

<script type="text/javascript">
	$(function() {
		//업데이트에 필요할 양식에 정보 입력하기
// 		$("#category1").val($("#pdc1").val());
// 		$("#division").val('${productDetail.p_division}');
		
		// p_division값 셋팅
		var pdivi = $("#pdpd").val();		
		$("#p_division").val(pdivi);
		
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
    			<input type="text" class="form-control change" readonly="readonly" value="${productDetail.p_name}">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="p_price" class="col-sm-3 control-label">가    격</label>
    		<div class="col-sm-4">
	    		<div class="input-group">
	      			<div class="input-group-addon">￦</div>
	      			<input type="text" class="form-control col-xs-3 change" readonly="readonly" value="${productDetail.p_price}">
	      			<div class="input-group-addon">WON</div>
	    		</div>
    		</div>
   		</div>
		<div class="form-group">
	    	<label for="p_content" class="col-sm-3 control-label">상품내용</label>
	    	<div class="col-sm-4">
	    		<textarea class="form-control change" cols="400" rows="10" placeholder="상품내용을 입력하세요" readonly="readonly" >${productDetail.p_content}</textarea>
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
