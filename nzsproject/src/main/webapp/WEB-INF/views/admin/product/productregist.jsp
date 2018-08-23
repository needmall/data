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
				alert("카테고리1 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
		
		$("#category1").change(function() {  //on(이벤트, 대상, 콜백함수) 
			console.log("ajaaaax");
			var url = "/admin/product/Category2dep.do?c1_num="+$("#category1 > option:selected").val();
			$.getJSON(url, function(data) {
				// 초기화
				$("#category2").html("");
				$("#category2").append("<option>-----선택하세요-----</option>");
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
		});
	})//최상위 마지막
</script>



	<form class="form-horizontal">
  		<div class="form-group">
    		<label for="category1" class="col-sm-3 control-label">카테고리</label>
    		<div class="col-sm-4">    		
	    		<select name="category1" id="category1" class="form-control">
					<option>-----선택하세요-----</option>		
				</select>
				 > 
				<select name="category2" id="category2" class="form-control">
					<option>-----선택하세요-----</option>		
				</select>
			</div>
  		</div>
  		<div class="form-group">
    		<label for="p_name" class="col-sm-3 control-label">상 품 명</label>
    		<div class="col-sm-4">
    			<input type="text" class="form-control" id="p_name" name="p_name" >
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="p_price" class="col-sm-3 control-label">가    격</label>
    		<div class="col-sm-4">
	    		<div class="input-group">
	      			<div class="input-group-addon">￦</div>
	      			<input type="text" class="form-control col-xs-3" id="exampleInputAmount" placeholder="Amount">
	      			<div class="input-group-addon">WON</div>
	    		</div>
    		</div>
   		</div>
		<div class="form-group">
	    	<label for="p_content" class="col-sm-3 control-label">상품내용</label>
	    	<div class="col-sm-4">
	    		<textarea class="form-control" cols="400" rows="10" id="p_content" name="p_content" placeholder="상품내용을 입력하세요"></textarea>
	    	</div>	
	  	</div>  
	  	<div class="form-group">
	    	<label for="pi_image" class="col-sm-3 control-label">상품사진</label>
	    	<div class="col-sm-4">
	     		<input type="file" id="exampleInputFile">
	     	</div>
	  	</div>
	  	<div class="form-group" >
	    	<label for="p_division" class="col-sm-3  control-label">상품구분</label>
	    	<div class="col-sm-4">
		    	<select name="p_division" id="p_division" class="form-control col-xs-3">
					<option>-----선택하세요-----</option>		
				</select>
			</div>    
	  	</div>
		<div class="form-group" > 
			<div class="btnarea">
  				<input type="button" class="btn btn-default" value="등  록"/>
  				<input type="button" class="btn btn-default" value="취  소"/>
  			</div>
  		</div>
	</form>	


