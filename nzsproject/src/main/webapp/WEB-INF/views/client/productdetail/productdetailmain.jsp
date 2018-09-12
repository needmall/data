<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="/resources/include/js/countTime_1.1.js"></script>

<script type="text/javascript">
	var start =0;
	var all_count=0;
	var all_price=0;
	var itemStaus =0;
	
			$(function() {
				jQuery('.format-money').text(function() {
				    jQuery(this).text(
				        jQuery(this).text().format()
				    );
				});
				
// 				buy(p_name,pi_image,p_content,ps_count,ps_expiration,ps_price);
				$(document).on('click',"#buy_buttun",function(){
					//////////////////////////////////////////////////
					
					var c_num = $("#c_num").val();
					var ps_num =$("#ps_num").val();
					var ps_price = ${detail.ps_price };
					var count = $("#count").val();
					
					$("#multiply_count").val(count);
					all_price= ps_price * $("#count").val();
					buy('${detail.p_name }','${detail.pi_image}','${detail.p_content }',count,'${detail.ps_expiration}','${detail.ps_price }');
					if(c_num !="null"){
						$.ajax({
							url :"/mypage/cartConfirmList.do",
							type:"post",
							data:"c_num="+c_num+"&ps_num="+ps_num,
							dataType: "text",
							success: function(data) {
								console.log(data);
								if(data ==1){
									if(confirm("이미 장바구니에  등록되어있습니다. 장바구니로 이동하시겠습니까?")){
										$("#hidden").attr({
											"method":"post",
											"action":"/mypage/mypageList.do?t=2"
										});
										$("#hidden").submit();
									}
								}
							}
						})
					}
				});
				
				var ps_count = ${detail.ps_count };
                $("#count").keyup(function(event){
                    if ((event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                    if($("#count").val().replace(/\s/g,"")==""){
                   		$("#count").val(1);
                   	}
                    if($("#count").val() > ps_count){
                    	$("#count").val(1);
                    	alert("최대 수량은 "+ps_count  +"입니다.");
//                     	${detail.ps_count} 수정해야함
                    }
                }); 
    			$('#myModal').on('shown.bs.modal', function () {
  				  	$('#myInput').focus();
	  				$('#myModal').modal({
	  				  backdrop: 'static',
	  				  keyboard: false
	  				})
  				})
  				var psexpiration = $("#ps_expiration").val();
  		      // input:date 입력하기 위한 함수
// 				Date.prototype.myformat = function() {
// 		           var yyyy = this.getFullYear().toString();
// 		           var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
// 		           var dd  = this.getDate().toString();
// 		           var hh = this.getHours().toString();
// 		           var mi = this.getMinutes().toString();
// 		           var ss = this.getSeconds().toString();
		           
// 		           return yyyy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]) +" " + (hh[1]?hh:"0"+hh[0]) +":" +(mi[1]?mi:"0"+mi[0])+ ":"+ (ss[1]?ss:"0"+ss[0]); // padding
// 		         };

// 		         var a= new Date(psexpiration);
//   		       var abc = a.myformat();
//   		       console.log(abc);
                //쇼킹딜 타임
//              time:'2018-08-24 00:00:00'//기준시간
	            $('#countTime').countTime({
 					cls : $('.expire'),
					time: psexpiration
				});
        		// 할인율 계산
       			var p_price 		= ${detail.p_price}
       			var ps_price 		= ${detail.ps_price}
       			var discountRate 	= (p_price - ps_price) / p_price * 100 
       			$("#discountspan").html(Math.round(discountRate));
       			console.log(Math.round(discountRate));
       		
        		
				$( ".ul- li" ).click(function() {
					if($(this).index()==0){
// 						console.log($(this).index());
						precautions();
					}else if($(this).index()==1){
						itemReview();
					}else if($(this).index()==2){
						sellerReview();
					}else if($(this).index()==3){
						sellInformation();
					}
		       })
		         
               	$(document).on("click",".accordion_banner > .accordion_title",function() {
		            if($(this).next("div").is(":visible")){
		           		$(this).next("div").slideUp("fast");
		            } else {
		                $(".accordion_banner .accordion_sub").slideUp("fast");
		                $(this).next("div").slideToggle("fast");
	           	 	}
        		});
				
				$(".ul- li:first-child").trigger("click");
			//////////////////////////////////////////////////상품 즐겨찾기임
				$("#itemsearch").click(function() {
					var p_num = $("#p_num").val();
					var c_num = $("#c_num").val();
					var st_num = $("#st_num").val();
					
					console.log(p_num);
					console.log(c_num);
					if(c_num =="null" ){
						alert("로그인을 해주십시오.")
					}else{
						if(confirm("상품을 즐겨 찾기 하시겠습니까?")){
							$.ajax({
								url :"/productdetail/productdetailFavpList.do",
								type:"post",
								data:"c_num="+c_num+"&p_num="+p_num,
								dataType: "text",
								success: function(data) {
									if(data == 0){//c_num,p_num
										$.ajax({
											url :"/productdetail/productdetailFavpInsert.do",
											type:"post",
											data:"c_num="+c_num+"&p_num="+p_num,
											dataType: "text",
											success: function(data) {
												console.log(data);
												alert("추가 되었습니다.");
											},
											error: function() {
												alert("시스템 오류입니다. 관리자한테 문의하세요.");
											}
										})
									}else if(data==1){
// 										alert("이미 등록되어있습니다.")	
										alert("이미 등록되어있습니다.")
										if(confirm("상품 즐겨찾기를 취소 하시겠습니까?")){
											$.ajax({
												url :"/productdetail/productdetailFavpDelete.do",
												type:"post",
												data:"c_num="+c_num+"&p_num="+p_num,
												dataType: "text",
												success: function(data) {
													console.log("삭제 완료");
												}
											})
										}
									}
								},
								error: function() {
									alert("시스템 오류입니다. 관리자한테 문의하세요.");
								}
							})
						}
					}
				})///itemsearch.click end
				
				////////////////////////////////////////////////////판매점 즐겨찾기임
				$("#sellersearch").click(function() {
					var p_num = $("#p_num").val();
					var c_num = $("#c_num").val();
					var st_num = $("#st_num").val();
					
					console.log(p_num);
					console.log(c_num);
				
					if(c_num =="null" ){
						alert("로그인을 해주십시오.")
					}else{
						if(confirm("상품을 즐겨 찾기 하시겠습니까?")){
							$.ajax({
								url :"/productdetail/productdetailFavsList.do",
								type:"post",
								data:"c_num="+c_num+"&st_num="+st_num,
								dataType: "text",
								success: function(data) {
									if(data == 0){//c_num,p_num
										$.ajax({
											url :"/productdetail/productdetailFavsInsert.do",
											type:"post",
											data:"c_num="+c_num+"&st_num="+st_num,
											dataType: "text",
											success: function(data) {
												console.log(data);
												alert("추가 되었습니다.");
											},
											error: function() {
												alert("시스템 오류입니다. 관리자한테 문의하세요.");
											}
										})
									}else if(data==1){
										alert("이미 등록되어있습니다.")
										if(confirm("판매점 즐겨찾기를 취소 하시겠습니까?")){
											$.ajax({
												url :"/productdetail/productdetailFavsDelete.do",
												type:"post",
												data:"c_num="+c_num+"&st_num="+st_num,
												dataType: "text",
												success: function(data) {
													console.log("삭제 완료");
												}
											})
										}
									}
								},
								error: function() {
									alert("시스템 오류입니다. 관리자한테 문의하세요.");
								}
							})
						}
					}
				})
				
				
				////////////////////////////////////////////////////////////장바구니 로직
				$("#cart").click(function(){
					var c_num = $("#c_num").val();
					var cart2_count = $("#count").val();
					var ps_num =$("#ps_num").val();
					var status =0;
					if(c_num =="null" ){
						alert("로그인을 해주십시오.")
					}else{
						$.ajax({
							url :"/productdetail/productdetailCartList.do",
							type:"post",
							data:"c_num="+c_num+"&ps_num="+ps_num,
							dataType: "text",
							success: function(data) {
								if(data==0){
									console.log("")
									$.ajax({
										url :"/productdetail/productdetailCartInsert.do",
										type:"post",
										data:"ps_num="+ps_num+"&cart2_count="+cart2_count+"&c_num="+c_num,
										dataType: "text",
										success: function(data) {
											alert("추가 되었습니다.");
											$.ajax({
												url :"/mypage/dateCountUpdate.do",
												type:"post",
												data:"c_num="+c_num,
												dataType: "text",
											})
											status =1;
										},
										error: function() {
											alert("시스템 오류입니다. 관리자한테 문의하세요.");
										}
									})
								}else if(data ==1){
									alert("이미 등록되어있습니다.");
									status=1;
								}
								if(status==1){
									if(confirm("장바구니로 이동하시겠습니까?")){
										$("#hidden").attr({
											"method":"post",
											"action":"/mypage/mypageList.do?t=2"
										});
										$("#hidden").submit();
									}
								}
							}
						})
					}
				})

				
				$("#btn_cart_buy").click(function(){
					var c_num =$("#c_num").val();
					var value = ($("#ps_count").val() - $("#count").val());
					var count = $("#count").val();
					if(c_num =="null"){
						alert("로그인을 해주세요");
						$("#myModal").modal("hide");
					}else{
						
	// 					console.log("value= "+ value);
						$("#changeCount").val(value);
						
						$("#hidden").attr({
							"method":"post",
							"action":"/mypage/productBuy.do"
						});
						$("#hidden").submit();
					}
				})
				
// 				console.log(${login})
			});////////////////////////////////////////////////////////////풩션 끝
			function precautions(){
				$("#contentTB").html("");
				var div1 = $("<div style='width: 100%; padding-top: 50px; text-align: left;'>");
				var div2 = $("<div style='display: inline-block; width: 100%'>");
				var ol = $("<ol style='text-align: left; margin: 10px; font-size: 18px'>");
				
				var li1 = $("<li> Need Malld은 다양한 편의점이 입점된 오픈마켓 쇼핑몰입니다.</li>")
				var p1 = $("<p>각 편의점 마다 할인 가격은 다르며 수령 방법은 직접 수령 밖에 되지 않습니다.(배달 x)</p>");
				
				var li2 = $("<li> 유통기한이 끝나는 순간 제품은 구입을 할 수 없게 됩니다.</li>")
				var span = $("<span> 저희는 유통기한을 준수 하며 만약 장바구니에 넣어놓을 경우 사는게 자동으로 삭제되며</span>");
				var p2 = $("<p> 구입 후 제품의 소비기간이 지나면 폐기 먹지 말고 폐기처분 해주셔야 합니다.</p>");
				
				var li3 = $("<li> 유통기한이 끝나기 전에 구입 후 찾아가지 않을경우 .</li>")
				var p3 = $("<p> 제품이 변질 되거나 상하는거를 방지 하기위해 구입 후 3일시 폐기처분 합니다.</p>");
				
				var li4 = $("<li> 상품 파손, 불량 등 문제가 있을 경우 사진 촬영후 연락 바랍니다.</li>")
				var p4 = $("<p> 이메일 : NZS@gmail.com 로 연락주세요</p>");
				div1.append(div2);
				div2.append(ol);
				ol.append(li1).append(p1).append(li2).append(span).append(p2).append(li3).append(p3).append(li4).append(p4);
				
				
				$("#contentTB").append(div1); 
			}
			
			function sellerReview(){
				var label =$("<label>");
				label.html("판매점 서비스 리뷰");
				$("#contentTB").html("");
				$("#contentTB").append(label);
				var url ="/productdetail/productdetailSreviewlist.do?s_num="+${detail.s_num};
				$.getJSON(url, function(data){
// 					console.log("아니 이거 실행안함?"+data.length);
					if(data.length==0){
						notitemReviewTag();
					}
					$(data).each(function() {
// 					accordion_sub.html(this.prv_num);
						var srv_date = this.srv_date;
						var srv_image = this.srv_image;
						var srv_content = this.srv_content;
						var srv_scope = this.srv_scope;
						var c_id= this.c_id;
						
						itemReviewTag(srv_date,srv_image,srv_content,srv_scope,c_id);
					})
				})
			}
			  
			function itemReview(){
				var label =$("<label>");
				label.html("상품 리뷰");
				$("#contentTB").html("");
				$("#contentTB").append(label);
				var url ="/productdetail/productdetailPreviewlist.do?p_num="+${detail.p_num}
				$.getJSON(url, function(data){
					if(data.length==0){
						notitemReviewTag();
					}
					$(data).each(function() {
// 					console.log(data.length);	
// 					accordion_sub.html(this.prv_num);
						var prv_date = this.prv_date;
						var prv_image = this.prv_image;
						var prv_content = this.prv_content;
						var prv_scope = this.prv_scope;
						var c_id= this.c_id;

						itemReviewTag(prv_date,prv_image,prv_content,prv_scope,c_id);
						
					})
				})
			}
			function notitemReviewTag(){
				var accordion_banner = $("<div>");
				accordion_banner.addClass("accordion_banner panel panel-default");
				
				var accordion_title = $("<div>");
				accordion_title.addClass("accordion_title panel-body panel panel-default");
				accordion_title.html("현재 리뷰가 없습니다.");
				//accordion_title.html(prv_date);
				
				var accordion_sub = $("<div>");
				accordion_sub.addClass("accordion_sub panel-footer");
				accordion_sub.html("");
				
				var buttun = $("<button type='button' class='close' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
				
				accordion_banner.append(accordion_title.append(buttun)).append(accordion_sub);
				$("#contentTB").append(accordion_banner);
			}
			
			function itemReviewTag(prv_date,prv_image,prv_content,prv_scope,c_id,msg) {
				console.log("prv_image = " +prv_image)
				var accordion_banner = $("<div>");
				accordion_banner.addClass("accordion_banner panel panel-default");
				
				var accordion_title = $("<div>");
				accordion_title.addClass("accordion_title panel-body panel panel-default");
				accordion_title.html("아이디"+c_id+"님의 리뷰 입니다. &nbsp;&nbsp;평점 :"+prv_scope+"점&nbsp;&nbsp;&nbsp;&nbsp;"+prv_date+" 작성");
				//accordion_title.html(prv_date);
				
				var accordion_sub = $("<div>");
				accordion_sub.addClass("accordion_sub panel-footer");
				if(prv_image==null){
					accordion_sub.html(""+prv_content);
				}else{
					accordion_sub.html("<img src='/uploadStorage/review/"+prv_image+"' width='10%' height='10%'/>"+prv_content);
				}
				
				var buttun = $("<button type='button' class='close' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
				
				accordion_banner.append(accordion_title.append(buttun)).append(accordion_sub);
				$("#contentTB").append(accordion_banner);
				
				
			}
			
			function sellInformation() {
				$("#contentTB").html("");
				var url = "/productdetail/productdetailStore.do?st_num="+${detail.st_num};

     			$.getJSON(url, function(data){
     				console.log(data.s_num);
					var div =$("<div>")
					div.addClass("contentTB");
					var table =$("<table>");
					table.addClass("table");

					
					var colgroup=$("<colgroup width='100%'><col width='40%'><col width='20%'><col width='80%'><col width='0%'></colgroup>");
					table.html(
							"<tr><td>판매점 이름<td><td >"+data.st_name+"<td></tr>"
							+"<tr><td>판매점 주소<td><td>"+data.st_address+"<td></tr>"
							+"<tr><td>판매 시간<td><td>"+data.st_hours+"<td></tr>"
							+"<tr><td>판매점 이메일<td><td>"+data.st_email+"<td></tr>"
							+"<tr><td>고객문의 대표번호<td><td>"+data.st_cell+"<td></tr>"
							+"<tr><td>판매자명  <td><td>"+data.st_ceo+"<td></tr>"
					);
					div.append(table.append(colgroup));
     				$("#contentTB").append(div);
     			})
			}
			
			
			function buy(p_name,pi_image,p_content,ps_count,expirationChange,ps_price){
				$(".container-fluid").html("");
				var div_row = $("<div class='row'>");
				var div_head=$("<div class='col-md-4' style='width: 30%; padding-left: 50px; '>");
				console.log("pi_image = "+pi_image)
				var img =$("<img src='/uploadStorage/product/"+pi_image+"' width='200px' height='200px;'>");
				
				div_head.append(img);
				div_row.append(div_head);
				
				var div_content =$("<div class='col-xs-4 col-sm-6' style='padding-top: 70px; width: 48%'>");
				var label_tilte=$("<p><label>"+p_name+"</label></p");
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
				
				
				var label_all;
				
				if(start == 0){
// 					var div_buttun =$("<div class='col-xs-4 col-sm-6' style='text-align: center; width: 100%; padding-bottom: -150px; padding-top: -150px'>")
// 					div_buttun.html("<button>2</button>")
					var br = $("<hr/>");
					var div_all =$("<div class='row'>");
					var div_price = $("<div class='.col-xs-8 .col-sm-6 .col-md-offset-4' style='width: 100%; text-align: right;'>");
					var div_label=$("<div style='text-align: right; padding-right: 30px;'></div>");
					var label_all =$("<label style='text-align: right;' class='bg-info'>총 가격 : <span class='format-money'>"+all_price+"<span>원 </label>");
					div_label.append(label_all)
					
					div_all.append(div_price);
					div_all.append(div_label);
					
					$(".container-fluid").append(div_row).append(br).append(div_all);
				}else{
					label_all.html("총 가격 : <span class='format-money'>"+all_price +"<span>원")
				}
			}
			
			
		</script>
<style>
/*  	div{border: 1px solid black;} */
	#table_left{ padding: 10px;}
	#simg{width: 400px; height: 400px; float: left; margin-right: 30px;margin-top: 15px; margin-left: 15px;  }
	table tr td{
		font-size: 15px;
		padding: 8px;
	}
	table tr td:nth-child(1){
		padding-left: 100px;
	}
	h4{padding: 15px;}
	.all{height: calc( auto + 500px );}
	.accordion_banner{background-color: silver; color:black; }
	.ul-{padding-top: 10px; }
	.h4color{background-color: #F6F6F6; font-size: 20px; font-weight: bold;}
	.div_buttun{text-align: right!important; margin: 15px 5px 0px 760px ;}
 	.cart{margin-right: 60px !important;} 
	.div_table{height: 380px; width: 100%}
	.div_last{height: 100px;}
</style>

</head>
<body>
<div class="all">

	<form id="hidden">
		<input type="hidden" id="datasize" name="datasize" value="">
		<input type="hidden" id="p_num" name="p_num" value="${detail.p_num }">
		<input type="hidden" id="ps_num" name="ps_num" value="${detail.ps_num }">
		<input type="hidden" id="s_num" name="s_num" value="${detail.s_num }">
		<input type="hidden" id="prv_image" name="prv_image" value="${detail.pi_image }">
		<input type="hidden" id="p_content" name="p_content" value="${detail.p_content }">
		<input type="hidden" id="ps_expiration" name="ps_expiration" value="${detail.ps_expiration }">
		<input type="hidden" id="ps_count" name="ps_count" value="${detail.ps_count }">
		<input type="hidden" id="ps_price" name="ps_price" value="${detail.ps_price }">
		<input type="hidden" id="st_num" name="st_num" value="${detail.st_num }">
		<input type="hidden" id="changeCount" name="changeCount" value="0">
		<input type="hidden" id="multiply_count" name="multiply_count" value="0">
		
		<c:if test="${empty login.c_num}">
			<input type="hidden" id="c_num" name="c_num" value="null">
		</c:if>
		<c:if test="${login.c_num ==null}">
			<input type="hidden" id="c_num" name="c_num" value="null">
		</c:if>
		<c:if test="${login.c_num !=0}">
			<input type="hidden" id="c_num" name="c_num" value="${login.c_num}">
		</c:if>
<!-- 		위에 c_num 세션값으로 갖고와야함 ------------------------------------------------------------------------------>
		
	</form>
	
	<div class="form-group">
		<label for="category1" class="col-sm-3 control-label">카테고리</label>
		<div class="col-sm-4">
			<label>${detail.c1_name }</label> > <label>${detail.c2_name}</label>
		</div>
	</div>
	<br/>
	<div>
		<h4 class="h4color">판매 브랜드 : ${detail.p_division } ${detail.st_name}</h4>
	</div>
	  
	<div class="list-group-item">
		<!-- 		class=" zoomTarget level0" 아래 div-->
		<div >
			<img id="simg" class="img-thumbnail" src="/uploadStorage/product/${detail.pi_image}" width="100%"
				height="100%" />
		</div>
		
		<div class="div_table">
			<table class="table-striped" id="table_left">
				<colgroup>
					<col width="30%">
					<col width="50px">
					<col width="400px;">
				</colgroup>
				<tr>
					<td colspan="3">
						<p><label>상품명 ${detail.p_name }</label> </p>
						<span style="color: red;">남은시간 (<span id="countTime"></span>)</span>
						<button type="button" id="itemsearch" class="btn btn-link" style="text-align: right;"><strong><mark>☆</mark></strong> 상품 즐겨찾기</button>
						<button type="button" id="sellersearch" class="btn btn-link" style="text-align: right;"><strong><mark>☆</mark></strong> 판매점 즐겨찾기</button>
					</td>
				</tr>

				<tr>
					<td >소비자 가격</td>
					<td>:</td>
					<td><span class="format-money">${detail.p_price }</span>원</td>
				</tr>
				<tr>
					<td >판매가격</td>
					<td >:</td>
					<td ><span class="format-money">${detail.ps_price }</span>원</td>
				</tr>

				<tr>
					<td >상품 설명</td>
					<td >:</td>
					<td >${detail.p_content }</td>
				</tr>
				<tr>
					<td >유통기한</td>
					<td >:</td>
					<td>${detail.ps_expiration} 까지 !!</td>
				</tr>
				<tr>
					<td>남은 재고</td>
					<td>:</td>
					<td>
						<label>"${detail.ps_count }개 남았습니다."</label>
					</td>
				</tr>
				<tr>
					<td>구입 수량</td>
					<td>:</td>
					<td>
						<input id="count" type="number" min="1" max="${detail.ps_count }" value="1">
					</td>
				</tr>
				<tr>
					<td>판매점 주소</td>
					<td>:</td>
					<td>
						<span>${detail.st_address} </span>
					</td>
				</tr>
				<tr>
					<td>할인율 <span id="discountspan"></span> &#37;</td>
					<td></td>
					<td><span class="trade" style="color: red;">교환 환불 불가</span></td>
				</tr>
			</table>
		</div>
		<div class="div_buttun2">
			<div class="div_buttun">
				<button id="buy_buttun" type="button" class="btn btn-default expire" data-toggle="modal" data-target="#myModal">바로 구매하기</button>
				<input class="btn btn-default cart expire" type="button" value="장바구니 담기" id="cart" name="cart">
			</div>
		</div>
	</div>
	<form class="form-inline">
 		<div class="form-group">
		<ul class="ul- list-group" >
			<li class="form-control"  ><a>상품 주의사항</a></li>
			<li class="form-control"  ><a>상품 리뷰</a></li>
			<li class="form-control" ><a>서비스 리뷰</a></li>
			<li class="form-control" ><a>판매자 정보</a></li>
		</ul>
		</div>
	</form>

	<div class="panel-group" id="accordion" role="tablist"
		aria-multiselectable="true">
		<div class="contentTB" id="contentTB"></div>
		<div>
<!-- 			<input type="text" value=""> -->
		</div>
	</div>
	
	
	
	
	
<%-- 	<c:import url="productdetallbuy.jsp"></c:import> --%>
<%-- 	<%@include file="productdetallbuy.jsp" %> --%>
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
		      	<button type="button" id="btn_cart_buy" class="btn btn-primary">결제</button>
		    </div>
		    </div>
		  </div>
		</div>
<!-- 		모달 부분 -->
</div>
<div class="div_last"></div>
</body>
</html>