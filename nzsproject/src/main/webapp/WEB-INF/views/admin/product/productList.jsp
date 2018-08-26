<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
  	.addimg{position: absolute;}
	.imgdiv{position: relative; top:-2px; left:-30%; z-index: 100}
</style>
	
 

<script type="text/javascript">
if(${registresult >= 1} ){
	alert("등록이 완료 되었습니다.");	
}
	
	$(function() {
		/* 상세페이지 이동 이벤트 */
		$(".goDetail td:not(:nth-last-child(1), :nth-last-child(2))").click(function() {					 //, :nth-last-child(2))
			var p_num = $(this).parents("tr").attr("data-num");				
			location.href="/admin/product/productDetail.do?p_num="+p_num;		
		});
		
		// 이미지 확인 
		
		
		$(".imgBtn").click(function () {			
			var thisdiv = $(this).parents("td").find(".addimg");			
			if(thisdiv.html() == ""){
				$(".imgBtn").parents("td").find(".addimg").html("");  //다른이미지창 비우기
				var p = $("<p>");
				var img = $("<img>");				
				var imgname=$(this).attr("data-pi_image");				
				p.html(imgname.replace(/_/g, "<br>"));
				img.attr({
					src:"/uploadStorage/product/"+imgname,
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
		
		
	 	// 상태 가능 을 불가능으로
		$(".permit").click(function() {	
			var p_num = $(this).parents("tr").attr("data-num");
			var p_state = $(this).attr("data-pstate");
				
			if($(this).val()=='가능'){
				var confirmresult=false;	
				    //confirmresult=usageCheck(p_num,p_state); //사용상태 확인후 상태 표시 토글
					if(usageCheck(p_num,p_state,this)){
					
					}
			}else{								
					stateToggle(p_num, p_state); // 상태 표시 토글
					$(this).parents("tr").removeClass("danger");
					$(this).val("가능");
					$(this).attr("data-p_state",0);
			}
			return;
		});		 
	})//최상위 마지막
	
	//사용상태 확인
	function usageCheck(p_num,p_state, item) {		
		$.ajax({
			url:"/admin/product/productUsageCount.do",  //전송 url
			type:"post",  // 전송 시 method 방식
			data:"p_num="+p_num,  //폼전체 데이터 전송
			dataType:"text",
			success: function(result){
				if(result!=0){
					if(confirm("판매중인 물품이 "+result+"개 입니다. 그래도 등록 불가 상태로 변경하시겠습니까?")){
						stateToggle(p_num, p_state);
						$(item).parents("tr").addClass("danger");
						$(item).val("불가");
						$(item).attr("data-p_state",1);
					}else{
						return;
					}
				}else{
					stateToggle(p_num, p_state);
					$(item).parents("tr").addClass("danger");
					$(item).val("불가");
					$(item).attr("data-p_state",1);
				}
			},
			error:function(){  //실행시 오류가 발생하였을 경우
				alert("시스템 오류 입니다. 관리자에게 문의하세요!!");							
			}
		});	
	}
	function stateToggle(p_num, p_state) {
		$.ajax({
			url:"/admin/product/stateUpdate.do",  //전송 url
			type:"post",  // 전송 시 method 방식
			data:"p_num="+p_num+"&p_state="+p_state,  //폼전체 데이터 전송
			dataType:"text",
			success: function(result){				
			},
			error:function(){  //실행시 오류가 발생하였을 경우
				alert("시스템 오류 입니다. 관리자에게 문의하세요!!");							
			}
		});	
	}
	
</script>


<div class="table-responsive">
	<table class="table table-bordered table-hover">
		<!-- <colgroup>
				<col width="5%">
				<col width="15%">
				<col width="15%">
				<col width="30%">
				<col width="20%">
				<col width="30%">
				<col width="10%">
				<col width="20%">
				<col width="20%">
				<col width="15%">
		</colgroup> -->
		<thead>			
			<tr>
				<th>No</th>
				<th>Cate1</th>
				<th>Cate2</th>
				<th>상품명</th>
				<th>가격</th>				
				<th>내용</th>
				<th>구분</th>	
				<th>등록일</th>
				<th>수정일</th>							
				<th>이미지</th>
				<th>판매</th>
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty productList}">
					<c:forEach var="product" items="${productList}" varStatus="status">
						<c:choose>						
						    <c:when test='${product.p_state==0}'>	
								<tr class="goDetail " data-num="${product.p_num}" >
									<td>${product.p_num}</td>
									<td>${product.c1_name}</td>
									<td>${product.c2_name}</td>
									<td>${product.p_name}</td>
									<td>${product.p_price}</td>							
									<td>${product.p_content}</td>							
									<td>${product.p_division}</td>
									<td>${product.p_date}</td>
									<td>${product.p_udate}</td>							
									<td><input type="button" class="btn btn-default imgBtn" data-pi_image="${product.pi_image}" value="확 인"><div class="addimg"></div></td>
									<td><input type="button" class="btn btn-default permit" data-pstate="${product.p_state}" value="가능"/></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="tac goDetail danger" data-num="${product.p_num}">
									<td>${product.p_num}</td>
									<td>${product.c1_name}</td>
									<td>${product.c2_name}</td>
									<td>${product.p_name}</td>
									<td>${product.p_price}</td>							
									<td>${product.p_content}</td>							
									<td>${product.p_division}</td>
									<td>${product.p_date}</td>
									<td>${product.p_udate}</td>							
									<td><input type="button" class="btn btn-default imgBtn" data-pi_image="${product.pi_image}" value="확 인"><div class="addimg"></div></td>
									<td><input type="button" class="btn btn-default permit" data-pstate="${product.p_state}" value="불가" /></td>
								</tr>
							</c:otherwise>
						</c:choose>	
					</c:forEach>		
				</c:when>
				<c:otherwise>
					<tr><td colspan="11" class="tac">등록된 물품이 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
</div>
	
	


