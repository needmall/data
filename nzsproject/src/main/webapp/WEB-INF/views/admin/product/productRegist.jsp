<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
	.btnarea{
		text-align: center;
	}

</style>

 	
<script type="text/javascript" src="/resources/include/js/admin/productRegist.js"></script> 


	
	<form class="form-horizontal" id="productInsertForm">
  		<div class="form-group">
    		<label for="category1" class="col-sm-3 control-label">카테고리</label>
    		<div class="col-sm-4">    		
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
    		<div class="col-sm-4">
    			<input type="text" class="form-control" id="p_name" name="p_name" >
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="p_price" class="col-sm-3 control-label">가    격</label>
    		<div class="col-sm-4">
	    		<div class="input-group">
	      			<div class="input-group-addon">￦</div>
	      			<input type="text" class="form-control col-xs-3" id="p_price" name="p_price">
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
	     		<input type="file" id="file" name="file" >
	     	</div>
	  	</div>
	  	<div class="form-group" >
	    	<label for="p_division" class="col-sm-3  control-label">판매점구분</label>
	    	<div class="col-sm-4">
		    	<select name="division" id="division" class="form-control col-xs-3">
					<option value='none'>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 선택하세요 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>								
				</select>
				<input type="text" class="form-control col-xs-3" id="p_division" name="p_division" placeholder="판매구분을 직접 입력하세요.">				
			</div>    
	  	</div>
		<div class="form-group" > 
			<div class="btnarea">
  				<input type="button" class="btn btn-default" id="registBtn" value="등  록"/>
  				<input type="reset" class="btn btn-default" value="취  소"/>
  			</div>
  		</div>
	</form>	
