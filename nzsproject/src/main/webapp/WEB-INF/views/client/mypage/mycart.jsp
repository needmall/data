<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브러우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율 -->

<!-- 모바일 웹 페이지 설정 -->
<!-- 모바일 웹 페이지 설정 종료 -->

<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
<!-- [if lt IE 9] -->
<!-- <script src="/resources/js/html5shiv.js"</script> -->
<!-- [endif] -->

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 		 <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" /> -->
<link rel="stylesheet" type="text/css" href="/resources/include/css/productdetail.css" />

<!-- 부가적인 테마 -->

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script type="text/javascript">
var start =0;
var all_count=0;
var all_price=0;
var hidden;
	$(function(){
		
		$('#myModal').on('shown.bs.modal', function () {
		  	$('#myInput').focus();
			$('#myModal').modal({
			  backdrop: 'static',
			  keyboard: false
			})
		})
		
		$(".update_btn").click(function() {
			var ps_count = $(this).parents("tr").find(".ps_count").attr("data-num");   //db에 저장된 장바구니 개수
			var ps_count_max =  $(this).parents("tr").find(".ps_count").attr("max");	// 구매할수있는 최대 	
			var cart2_num = $(this).parents("tr").attr("data-cart");
			var now_count = $(this).parents("tr").find(".ps_count").val();
			var p_price = $(this).parents("tr").attr("data-price");
			$(this).parents("tr").find(".p_price").html(now_count*p_price);
			
// 			var url="/mypage/countUpdate.do?cart2_num="+cart2_num+"&ps_count="+now_count;
				
// 			console.log(ps_count);
// 			console.log(ps_count_max);
// 			console.log(cart2_num);
// 			console.log(now_count);
// 			console.log("p_price : "+p_price);
			if(parseInt(now_count) > parseInt(ps_count_max)){
				alert("최대 개수는 "+ps_count_max+" 입니다.")
				$(this).parents("tr").find(".ps_count").val(ps_count_max);
				alert("최대 개수로 수정 하시려면 한번 더 눌러주세요");
			}else{
				if(confirm("수정 하시겠습니까?")){
					$.ajax({
						url :"/mypage/countUpdate.do",
						type:"post",
						data:"cart2_num="+cart2_num+"&cart2_count="+now_count,
						dataType: "text",
						success: function() {
							console.log("성공");
							alert("수정 되었습니다.");
							var result = parseInt(now_count) * parseInt($(".p_price").html());
							
							$(this).parents("tr").find(".ps_count").val(result);
						},
						error: function() {
							alert("시스템 오류입니다. 관리자한테 문의하세요.");
						}
					})
				}
			}
		});
		$(".close").click(function() {
			
			var cart2_num= $(this).parents("tr").attr("data-cart");
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					url :"/mypage/itemdelete.do",
					type:"post",
					data:"cart2_num="+cart2_num,
					dataType: "text",
					success: function() {
						console.log("성공");
						alert("삭제 되었습니다.");
					},
					error: function() {
						alert("시스템 오류입니다. 관리자한테 문의하세요.");
					}
					
				})
			}
		})	
	
	    //최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chk]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chk]").prop("checked",false);
	        }
	    })
// 	   
		$(".goDetail2 td:not(:nth-last-child(1), :nth-last-child(2),:nth-last-child(3),:nth-last-child(4),:nth-last-child(6),:nth-last-child(7))").click(function() {					 //, :nth-last-child(2))
			var ps_num = $(this).parents("tr").attr("data-num");				
			location.href="/productdetail/productdetailmain.do?ps_num="+ps_num;	
		});
	
		$(".btn_cart").click(function() {
			
// 			p_name,pi_image,p_content,ps_count,expirationChange,ps_price
			var p_name = $(this).parents("tr").find(".p_name").val();
			var pi_image =$(this).parents("tr").find(".pi_image").val();
			var p_content =$(this).parents("tr").find(".p_content").val();
			var ps_count =$(this).parents("tr").find(".ps_count").attr("max");
			var expirationChange =$(this).parents("tr").find(".expirationChange").val();
			var ps_price =$(this).parents("tr").find(".ps_price").val();
			var ps_num =$(this).parents("tr").find(".ps_num").val();
			var c_num =$(this).parents("tr").find(".c_num").val();
			var cart2_count =$(this).parents("tr").find(".cart2_count").val();
			var cart2_num =$(this).parents("tr").find(".cart2_num").val();
			var result = ps_count-cart2_count;
			$(this).parents("tr").find(".changeCount").val((ps_count-cart2_count));
			var changeCount = $(this).parents("tr").find(".changeCount").val();
			
			all_price= ps_price * cart2_count;
			buy(p_name,pi_image,p_content,cart2_count,expirationChange,ps_price);

			
			$("#btn_buy").click(function() {

// 				console.log("p_name = "+p_name)
// 				console.log("pi_image = " +pi_image)
// 				console.log("p_content = " +p_content)
// 				console.log("expirationChange = "+ expirationChange);
// 				console.log("ps_price = "+ ps_price);
// 				console.log("ps_num = "+ ps_num);
// 				console.log("c_num = "+ c_num);
// 				console.log("cart2_count = "+ cart2_count);
// 				console.log("cart2_num = "+ cart2_num);
// 				console.log("changeCount = "+ changeCount);
// 				console.log("result = "+ result);
				if(ps_count==0){
					$.ajax({
						url :"/mypage/itemdelete.do",
						type:"post",
						data:"cart2_num="+cart2_num,
						dataType: "text",
						success: function() {
							console.log("성공");
							alert("재고가 없어서 장바구니에서 제외 되었습니다."); ///////////////////-> 카트 화면 새로고침이 안됨;
							$('.modal').modal('hide');
						},
						error: function() {
							alert("시스템 오류입니다. 관리자한테 문의하세요.");
						}
						
					})
				}else{
					$(".hidden").attr({
						"method":"post",
						"action":"/mypage/mycartBuy.do"
					});
	 				$(".hidden").submit();
				}
	  		});
		})
// 		console.log(${fn:length(cartList)} );
//		페이징
// 		for(int i =0; i< ${fn:length(cartList)} i++)
// 		if((i % 5) ==1){
// 			li_add = $("<li><a href='#'>1</a></li>")
// 			li_add.appendTo.$(".pre_li")
// 		}

				
// 			$("#btn_cart").click(function() {
// 				$("#hidden").attr({
// 					"method":"post",
// 					"action":"/mypage/mycartBuy.do"
// 				});
// 			$("#hidden").submit();
		
	})//풩션 끝--------------------------------------------------------------------------------
	function buy(p_name,pi_image,p_content,ps_count,expirationChange,ps_price){
				$(".container-fluid").html("");
				var div_row = $("<div class='row'>");
				var div_head=$("<div class='col-md-4' style='width: 30%; padding-left: 50px; '>");
				var img =$("<img src='/uploadStorage/product/"+pi_image+"' width='200px' height='200px;'>");
				

				div_head.append(img);
				div_row.append(div_head);
				
				var div_content =$("<div class='col-xs-4 col-sm-6' style='padding-top: 70px; width: 48%'>");
				var label_tilte=$("<p><label>"+p_name+"</label></p>");
				var label_content =$("<label style='width: 85%'>"+p_content+"</label>")
				div_content.append(label_tilte);
				div_content.append(label_content);
				div_row.append(div_content);
				
				var div_right =$("<div class='col-md-4 .col-md-offset-4' style='padding-top: 80px; width: 20%'>");
				var label_right =$("<label>단가 가격 : <spna class='format-money'>"+ps_price+"</span>원 // 개수: <spna class='format-money span_count'>"+ps_count+"</span>개</label>");
				var p_right =$("<p>유통기한 "+expirationChange+"</p>");
				div_right.append(label_right);
				div_right.append(p_right);
				div_row.append(div_right);
				
				
				label_all = ps_price * ps_count;
				
				if(start == 0){
// 					var div_buttun =$("<div class='col-xs-4 col-sm-6' style='text-align: center; width: 100%; padding-bottom: -150px; padding-top: -150px'>")
// 					div_buttun.html("<button>2</button>")
					var br = $("<hr/>");
					var div_all =$("<div class='row'>");
					var div_price = $("<div class='.col-xs-8 .col-sm-6 .col-md-offset-4' style='width: 100%; text-align: right;'>");
					var div_label=$("<div style='text-align: right; padding-right: 30px;'></div>");
					var label_all =$("<label style='text-align: right;' class='bg-info'>총 가격 : <span class='format-money'>"+all_price+"<span>원 </label>");
					div_label.append(label_all);
					
					div_all.append(div_price);
					div_all.append(div_label);
					
					$(".container-fluid").append(div_row).append(br).append(div_all);
				}else{
					label_all.html("총 가격 : <span class='format-money'>"+all_price +"<span>원")
				}
			}
	
</script>
<style type="text/css">
	.nav_div{text-align: center;}
	.td_list{padding-top:30px; }
	.td_list2{padding-top:20px; }
	.td_list3{padding-top:25px; }
	.td_list4{padding-top:25px; padding-left: 7px; }
	.close{margin-right: 15px;}
	.div_date{text-align: right;}
	.div_last{height: 100px;}
</style>
</head>
<body>

	<div>
		<div class="div_date">
			<c:if test=" ${ !empty date}">
					<label>수정일 : <span>${date}</span></label>
			</c:if>
		</div>
		<table class="table table-striped table-hover">
			<colgroup>
				<col width="10%">
				<col width="50%">
				<col width="13%">
				<col width="6%">
				<col width="8%">
				<col width="3%">
				<col width="4%">
			</colgroup>
			<tbody>
			
				<tr>
					<td>제품</td>
					<td>설명</td>
					<td>수량</td>
					<td>가격</td>
					<td>유통기한</td>
					<td>구매</td>
					<td colspan="2">취소</td>
				</tr>
				<c:choose>
					<c:when test="${not empty cartList}">
						<c:forEach var="cart" items="${cartList }" varStatus="status">
							<tr class="goDetail2" data-num="${cart.ps_num}" data-cart="${cart.cart2_num}" data-price ="${cart.ps_price}">
								<td><img class="img-thumbnail" src="/uploadStorage/product/${cart.pi_image }" width="150px" height="50px;"/></td>
								<td><div class="td_list2"><label>${cart.p_name}</label><p>${cart.p_content }</p></div></td>
								<td>
									<div class="td_list3">
										<input type="number" value="${cart.cart2_count }" class="ps_count" style="width: 35px;" height="15px;" max="${cart.ps_count }" min="1" data-num="${cart.cart2_count }"> 개 
										<button type="button" name="update_btn" class="btn btn-default update_btn" style="width: 50px; font-size: 10px;">수정</button>
									</div>
								</td>
								<td>
									<div class="td_list2">
										<span class="p_price2 format-money" style="text-decoration: line-through;">${cart.multiply_count }</span>원 
										<span class="p_price format-money">${cart.original_multiply_count }</span>원 
									</div>
								</td>
								<td><div class="td_list2">${cart.ps_expiration }</div></td>
								<td><div class="td_list3"><button name="buy_btn" type="button" class="btn btn-default btn_cart" data-toggle="modal" data-target="#myModal" style='font-size:10px;'>클릭</button></div></td>
								<td><div class="td_list4"><button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></div></td>
								<td>
<!-- 									p_name,pi_image,p_content,ps_count,expirationChange,ps_price -->
									<form class="hidden">
										<input type="hidden" class="p_name" name="p_name" value="${cart.p_name}">
										<input type="hidden" class="pi_image" name="pi_image" value="${cart.pi_image}">
										<input type="hidden" class="p_content" name="p_content" value="${cart.p_content}">
										<input type="hidden" class="ps_count" name="ps_count" value="${cart.ps_count}">
										<input type="hidden" class="expirationChange" name="ps_expiration" value="${cart.ps_expiration}">
										<input type="hidden" class="ps_price" name="ps_price" value="${cart.ps_price}">
										<input type="hidden" class="c_num" name="c_num" value="${cart.c_num}">
										<input type="hidden" class="ps_num" name="ps_num" value="${cart.ps_num}">
										<input type="hidden" class="cart2_count" name="cart2_count" value="${cart.cart2_count}">
										<input type="hidden" class="cart2_num" name="cart2_num" value="${cart.cart2_num}">
										<input type="hidden" class="changeCount"  name="changeCount" value="0">
									</form>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="tac">장바구니에 등록된 물품이 존재하지않습니다.
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<div class="nav_div">
			<nav>
			  <ul class="pagination">
			    <li class="pre_li">
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
	
	<!-- 		    <li><a href="#">1</a></li> -->
	
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
		<!-- 		모달부분 -->
		<div class="modal fade bs-example-modal-lg"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" style="width: 1200px;" >
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">상품 구매 페이지</h4>
		      </div>
		      <div class="modal-body">
		       	 <div class="container-fluid">

				</div>
			</div>
		    <div class="modal-footer">
		      	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		      	<button type="button" id="btn_buy" class="btn btn-primary">결제</button>
		    </div>
		    </div>
		  </div>
		</div>
	<!-- 모달 끝 -->
	</div>
<div class="div_last"></div>
</body>
</html>