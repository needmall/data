<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">

</style>
	
 

<script type="text/javascript">

</script>


<div class="container">
	<form class="form-inline">
  <div class="form-group">
    <label for="category1">카테고리</label>
    <span id="category1"></span>
	<span id="category2"></span>    
  </div>
  <div class="form-group">
    <label for="p_name">상 품 명</label>
    <input type="text" class="form-control" id="p_name" name="p_name" >
  </div>
  <div class="form-group">
    <label for="p_price">가    격</label>
    <div class="input-group">
      <div class="input-group-addon">ㅉㅉㅉ</div>
      <input type="text" class="form-control" id="exampleInputAmount" placeholder="Amount">
      <div class="input-group-addon">원</div>
    </div>
    
  </div>
  <div class="form-group">
    <label for="p_content">상품내용</label>
    <textarea class="form-control" id="p_content" name="p_content" placeholder="상품내용을 입력하세요"></textarea>
  </div>  
  <div class="form-group">
    <label for="pi_image">상품사진</label>
     <input type="file" id="exampleInputFile">
    <p class="help-block">상품에 사용할 사진을 첨부해 주세요</p>
  </div>
  <div class="form-group">
    <label for="p_division">상품구분</label>
    <select name="p_division" id="p_division" class="form-control">
		<option>-----선택하세요-----</option>		
	</select>    
  </div>  
  <button type="submit" class="btn btn-default">등 록</button>
</form>	
</div>

