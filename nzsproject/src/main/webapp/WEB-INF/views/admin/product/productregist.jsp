<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
	.btnarea{
		text-align: center;
	}
</style>
	
 

<script type="text/javascript">
	$(function name() {
		var url = "/admin/product/catedep1.do;
		$.getJSON(url, function(data) {
			//불러온 데이터 처리
			$(data).each(function() {
				var st_num = this.st_num;
				var st_lat = this.st_lat;
				var st_lon = this.st_lon;
				var si_image = this.si_image;
				var st_name = this.st_name;
				var st_address = this.st_address;
				var distance = this.distance;
										
				//목록 생성
				addNewItem(st_num, st_lat, st_lon,si_image, st_name, st_address, distance, map);
				
				// 마커들을 지도위에 표시합니다																				
				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
					position : new daum.maps.LatLng(st_lat, st_lon),
					title :st_name
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
																				
				// 생성된 마커를 배열에 추가합니다
				markers.push(marker);
				
			});
			}).fail(function() {
				alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	})
</script>



	<form class="form-horizontal">
  		<div class="form-group">
    		<label for="category1" class="col-sm-3 control-label">카테고리</label>
    		<div class="col-sm-4">    		
	    		<select name="p_division" id="p_division" class="form-control">
					<option>-----선택하세요-----</option>		
				</select>
				<select name="p_division" id="p_division" class="form-control">
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


