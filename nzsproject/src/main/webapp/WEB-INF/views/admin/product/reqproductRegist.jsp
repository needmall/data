<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
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
	$(function() {
		var buttonDiv=$("#registBtn").parents("div");
		buttonDiv.find("input[type=reset]").attr({"type":"button","id":"cancleBtn"});
		
		$("#cancleBtn").click(function() {
			$("#handleFrom").attr({"method":"post","action":"/admin/product/reqproductRegist.do"});
			$("#handleFrom").submit();
		})
	})
</script>


<div id="leftDiv" >	
	<form class="form-horizontal" id="handleFrom" >
		<h2>물품 요청 </h2>
    	<hr>
  		<div class="form-group">  		
    		<label for="" class="col-sm-3 control-label">요청번호</label>
    		<div class="col-sm-8">    		
	    		<input type="text" class="form-control" value='${reqproductVO.reqp_num}' readonly="readonly" name="reqp_num">
			</div>
  		</div>
  		<div class="form-group">
    		<label for="" class="col-sm-3 control-label">카테고리</label>
    		<div class="col-sm-8">
    			<input type="text" class="form-control" name="c1_name" value="${reqproductVO.c1_name }" readonly="readonly">
    			<input type="text" class="form-control" name="c2_name" value="${reqproductVO.c2_name }" readonly="readonly">
    		</div>
  		</div>
  		<div class="form-group">  		
    		<label for="" class="col-sm-3 control-label">물품명</label>
    		<div class="col-sm-8">    		
	    		<input type="text" class="form-control" name="p_name"  value='${reqproductVO.p_name}' readonly="readonly">
			</div>
  		</div>
  		<div class="form-group">
    		<label for="" class="col-sm-3 control-label">가    격</label>
    		<div class="col-sm-8">
	    		<div class="input-group">
	      			<div class="input-group-addon">￦</div>
	      			<input type="text" class="form-control col-xs-3" name="p_price" value='${reqproductVO.p_price}' readonly="readonly">
	      			<div class="input-group-addon">WON</div>
	    		</div>
    		</div>
   		</div>
		<div class="form-group">
	    	<label for="" class="col-sm-3 control-label">상품내용</label>
	    	<div class="col-sm-8">
	    		<textarea class="form-control" cols="400" rows="5" name="p_content"  readonly="readonly">${reqproductVO.p_content}</textarea>
	    	</div>	
	  	</div>  
		  		<div class="form-group">  		
    		<label for="" class="col-sm-3 control-label">요청일</label>
    		<div class="col-sm-8">    		
	    		<input type="text" class="form-control" name="p_date" value='${reqproductVO.p_date}'  readonly="readonly">
			</div>
  		</div>  		
  		<div class="form-group">  		
    		<label for="category1" class="col-sm-3 control-label">판매자</label>
    		<div class="col-sm-8">    		
	    		<input type="text" class="form-control" name="s_num" value='${reqproductVO.s_num}' readonly="readonly" >
			</div>
  		</div>
  		<input type="hidden" name="c1_num" value='${reqproductVO.c1_num}'>
	</form>	
</div>
<jsp:include page="productRegist.jsp"></jsp:include>
