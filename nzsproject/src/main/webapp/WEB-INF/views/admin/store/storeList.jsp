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
	/* 상세페이지 이동 이벤트 */
	$(".goDetail td:not(:nth-child(3), :nth-last-child(2), :nth-last-child(3))").click(function() {					 //, :nth-last-child(2))
		var st_num = $(this).parents("tr").find(".stnum").html();				
		location.href="/admin/store/storeDetail.do?st_num="+st_num;		
	});
	
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
	

	//모달 이미지
	$(".fees").click(function() {
		//해당 s_num, f_num 입력
		$("#s_num").val($(this).parents("tr").find(".snum").html());
		$("#f_num").val($(this).parents("tr").find(".expireDate").attr("data-fnum"));
		
		// input:date 입력하기 위한 함수
		Date.prototype.myformat = function() {
	        var yyyy = this.getFullYear().toString();
	        var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
	        var dd  = this.getDate().toString();
	        return yyyy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]); // padding
	      };


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

 			$("#stratday").val(nowDate.myformat());
			nowDate.setMonth(nowDate.getMonth()+1)
			$("#endday").val(nowDate.myformat());  //지금으로 부터 한달
		}else{
			$("#stratday").val(expireDate.myformat());
			expireDate.setMonth(expireDate.getMonth()+1)
			$("#endday").val(expireDate.myformat()); //만료 일로 부터 한달
		}	
		
		//연습연습
		var dae = $(this).parents("tr").find(".expireDate").attr("data-date");
		
		
	})
	
	
	// 수수료 결제 버튼 클릭
	$("#feesPay").click(function() {
		var nowDate = new Date();
		if(confirm(nowDate.getMonth()+1+"월 결제가 확인되었습니까?")){	
			$("#feeForm").attr({"method":"post","action":"/admin/store/storeFeeInsert.do"});
			$("#feeForm").submit();
		}
		
	})
	
	//강제 해지
	$("#terminate").click(function() {
		if(confirm("최근 결제 내역을 삭제 합니다.")){	
			
			$("#feeForm").attr({"method":"post","action":"/admin/store/storeFeeDelete.do"});
			$("#feeForm").submit();
		}
	})
	
})//최상위 마지막

		
</script>

<div class="table-responsive">
	<h2>매장 목록 </h2>
    	<hr>
	<table class="table table-bordered table-hover">	
		<thead>			
			<tr>
				<th>No</th>
				<th>매장명</th>
				<th>판매자번호</th>
				<th>사업자번호</th>				
				<th>사업지</th>				
				<th>이메일</th>
				<th>영업시간</th>	
				<th>영업전화</th>
				<th>대표자</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>구분</th>
				<th>수수료</th>
				<th>기간만료</th>				
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty storeList}">
					<c:forEach var="store" items="${storeList}" varStatus="status">
						<c:choose>
							<c:when test="${store.status==0}">
								<tr class="goDetail danger">
									<td class="stnum">${store.st_num}</td>
									<td class="stname">${store.st_name}</td>
									<td class="snum">${store.s_num}</td>
									<td>${store.st_bnum}</td>							
									<td>${store.st_address}</td>
									<td>${store.st_email}</td>
									<td>${store.st_hours}</td>
									<td>${store.st_cell}</td>
									<td>${store.st_ceo}</td>
									<td>${store.st_date}</td>
									<td>${store.st_udate}</td>
									<td><input type="button" class="btn btn-default imgBtn" data-siimage='${store.si_image}' value='${store.si_division}'/><div class="addimg"></div></td>
									<td><input type="button" class="btn btn-default fees" data-toggle="modal" data-target=".bs-example-modal-sm" value="확인"/></td>
									<td class="expireDate" data-fnum='${store.f_num}' >${store.expire}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="goDetail">
									<td class="stnum">${store.st_num}</td>
									<td class="stname">${store.st_name}</td>
									<td class="snum">${store.s_num}</td>
									<td>${store.st_bnum}</td>							
									<td>${store.st_address}</td>
									<td>${store.st_email}</td>
									<td>${store.st_hours}</td>
									<td>${store.st_cell}</td>
									<td>${store.st_ceo}</td>
									<td>${store.st_date}</td>
									<td>${store.st_udate}</td>
									<td><input type="button" class="btn btn-default imgBtn" data-siimage='${store.si_image}' value='${store.si_division}'/><div class="addimg"></div></td>
									<td><input type="button" class="btn btn-default fees" data-toggle="modal" data-target=".bs-example-modal-sm" value="확인"/></td>
									<td class="expireDate" data-fnum='${store.f_num}' >${store.expire}</td>
								</tr>
							</c:otherwise>	
						</c:choose>					
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="11" >등록된 판매점이 존재하지 않습니다.</td></tr>
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
    	<form class="form-horizontal" id="feeForm">
	    	<div class="form-group">
	    		<label for="num" class="col-sm-4 control-label" >매장번호</label>
	    		<div class="col-sm-8">
	    			<input type="text" class="form-control" readonly="readonly" id="num" >
	    		</div>
	  		</div>
	  		<div class="form-group">
	    		<label for="st_name" class="col-sm-4 control-label" >매장명</label>
	    		<div class="col-sm-8">
	    			<input type="text" class="form-control " readonly="readonly" id="name" >
	    		</div>
	  		</div>
	  		
	  		<div class="form-group">
	    		<label for="" class="col-sm-4 control-label">적용기간</label>
	    		<div class="col-sm-8">
		    		<div class="input-group">
		      			<input type="text" class="form-control col-xs-3 " readonly="readonly" id="stratday"  name="f_setdate" >~
		      			<input type="text" class="form-control col-xs-3 " readonly="readonly" id="endday" >
		    		</div>
	    		</div>
	   		</div>
	   		<input type="hidden" id="s_num" name="s_num" >
	   		<input type="hidden" id="f_num" name="f_num" >   	
   		</form>
 
    	<div class="contentarea" ></div>
    	<hr>
      	<input type="button" class="btn btn-default check" id="feesPay" value="결제확인"/>    
      	<input type="button" class="btn btn-default force" id="terminate" value="강제만료" />
      	<button type="button" class="btn btn-default" data-dismiss="modal">취 소</button>
    </div>
  </div>
</div>	


