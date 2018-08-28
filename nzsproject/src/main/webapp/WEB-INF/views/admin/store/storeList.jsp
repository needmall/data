<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
  	.addimg{position: absolute;}
	.imgdiv{position: relative; top:-2px; left:-30%; z-index: 100; text-align: center;}
	.modal-content{
		padding: 10px;
		text-align: center;	
	}
	.form-group div input{
		text-align: center;	
	}
</style>
	
 

<script type="text/javascript">
$(function() {
	// 이미지 확인 
	$(".imgBtn").click(function () {			
		var thisdiv = $(this).parents("td").find(".addimg");			
		if(thisdiv.html() == ""){
			$(".imgBtn").parents("td").find(".addimg").html("");  //다른이미지창 비우기
			var p = $("<p>");
			var img = $("<img>");				
			var imgname=$(this).attr("data-siimage");				
			p.html(imgname.replace(/_/g, "<br>"));
			img.attr({
				src:"/uploadStorage/store/"+imgname,
				width:"200px"				
			});
			var div = $("<div>");
			
			div.append(img).append(p);
			div.addClass("imgdiv img-thumbnail");
			thisdiv.append(div);
		}else{
			thisdiv.html("");
		}
	})
	


	$(".fees").click(function() {
		//수수료 버튼 눌렀을때 월 정보 표시를 위한 객체
		var nowDate = new Date();
		var nowYear = nowDate.getFullYear();
		var nowMonth = nowDate.getMonth()+1;
		var nowDay = nowDate.getDate();
			
		$(".contentarea").html("");
		var expireDate= new Date($(this).parents("tr").find(".expireDate").html());
		var num = $(this).parents("tr").find(".stnum").html();		
		var name = $(this).parents("tr").find(".stname").html();		
		$("#num").val(num);
		$("#name").val(name);		
		
		if($(this).parents("tr").find(".expireDate").html() =="" || nowDate > expireDate){
			$("#stratday").val(nowDate.toLocaleDateString());
			nowDate.setMonth(nowDate.getMonth()+1)
			$("#endday").val(nowDate.toLocaleDateString());  //지금으로 부터 한달
		}else{
			$("#stratday").val(expireDate.toLocaleDateString());
			expireDate.setMonth(expireDate.getMonth()+1)
			$("#endday").val(expireDate.toLocaleDateString()); //만료 일로 부터 한달
		}
		
	})
})

		
</script>

<form id="feesForm">		
	<input type="hidden" name="p_num" id="p_num" />
	<input type="hidden" name="pi_num" id="pi_num" />
	<input type="hidden" name="pi_image" id="pi_image" />
</form>

<div class="table-responsive">
	<h2>매장 목록 </h2>
    	<hr>
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>매장번호</th>
				<th>매장명</th>
				<th>판매자번호</th>
				<th>사업자번호</th>				
				<th>사업지</th>				
				<th>이메일</th>
				<th>영업시간</th>	
				<th>영업전화</th>
				<th>대표자</th>
				<th>등록일</th>
				<th>판매점 구분</th>
				<th>수수료</th>
				<th>기간만료</th>				
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty storeList}">
					<c:forEach var="store" items="${storeList}" varStatus="status">
						<tr>
							<td class="stnum">${store.st_num}</td>
							<td class="stname">${store.st_name}</td>
							<td>${store.s_num}</td>
							<td>${store.st_bnum}</td>							
							<td>${store.st_address}</td>
							<td>${store.st_email}</td>
							<td>${store.st_hours}</td>
							<td>${store.st_cell}</td>
							<td>${store.st_ceo}</td>
							<td>${store.st_date}</td>
							<td><input type="button" class="btn btn-default imgBtn" data-siimage='${store.si_image}' value='${store.si_division}'/><div class="addimg"></div></td>
							<td><input type="button" class="btn btn-default fees" data-toggle="modal" data-target=".bs-example-modal-sm" value="확인"/></td>
							<td class="expireDate">${store.expire}</td>
						</tr>						
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="11" class="tac">등록된 판매점이 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>

	
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="modalforfees" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<h4>수수료 결제 확인 </h4>
    	<hr>
    	<form class="form-horizontal" >
    	<div class="form-group">
    		<label for="num" class="col-sm-4 control-label" >매장번호</label>
    		<div class="col-sm-7">
    			<input type="text" class="form-control" readonly="readonly" id="num" name="num">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="st_name" class="col-sm-4 control-label" >매장명</label>
    		<div class="col-sm-7">
    			<input type="text" class="form-control " readonly="readonly" id="name" name="name">
    		</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="" class="col-sm-4 control-label">적용기간</label>
    		<div class="col-sm-7">
	    		<div class="input-group">
	      			<input type="text" class="form-control col-xs-3 " readonly="readonly" id="stratday" name="f_setdate">
	      			  	~
	      			<input type="text" class="form-control col-xs-3 " readonly="readonly" id="endday"  >
	    		</div>
    		</div>
   		</div>
   		</form>
    	<div class="contentarea" ></div>
    	<hr>
      	<input type="button" class="btn btn-default check" value="결제확인"/>    
      	<input type="button" class="btn btn-default force" value="강제만료"/>
      	<button type="button" class="btn btn-default" data-dismiss="modal">취 소</button>
    </div>
  </div>
</div>	


