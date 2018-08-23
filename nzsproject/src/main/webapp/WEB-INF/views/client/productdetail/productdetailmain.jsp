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
<script type="text/javascript" src="/resources/include/js/jquery.zoomooz.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 		 <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" /> -->
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/productdetail.css" />

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/include/js/countTime_1.1.js"></script>

<script type="text/javascript">
			$(function() {
// 				category();
				
                 $("#count").keyup(function(event){
                    if ((event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                        
                    }
                    if($("#count").val() > ${detail.ps_count}){
                    	$("#count").val(1);
                    	alert("최대 수량은 "+${detail.ps_count}  +"입니다.");
//                     	${detail.ps_count} 수정해야함
                    }
                }); 
                
                //쇼킹딜 타임
	            $('#countTime').countTime({
// 					time:'2018-08-24 00:00:00'//기준시간
					time:'${detail.ps_expirationChange}'
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
						itemReview();
					}else if($(this).index()==1){
						sellerReview();
					}else if($(this).index()==2){
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
			});
			
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
				accordion_banner.addClass("accordion_banner panel panel-primary");
				
				var accordion_title = $("<div>");
				accordion_title.addClass("accordion_title panel-body");
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

				var accordion_banner = $("<div>");
				accordion_banner.addClass("accordion_banner panel panel-primary");
				
				var accordion_title = $("<div>");
				accordion_title.addClass("accordion_title panel-body");
				accordion_title.html("아이디"+c_id+"님의 리뷰 입니다. &nbsp;&nbsp;평점 :"+prv_scope+"점&nbsp;&nbsp;&nbsp;&nbsp;"+prv_date+"작성");
				//accordion_title.html(prv_date);
				
				var accordion_sub = $("<div>");
				accordion_sub.addClass("accordion_sub panel-footer");
				accordion_sub.html("<img src='/uploadStorage/product/'"+prv_image+"' width='10%' height='10%'/>"+prv_content);
// 				console.log(prv_content);
				
				var buttun = $("<button type='button' class='close' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
				
				accordion_banner.append(accordion_title.append(buttun)).append(accordion_sub);
				$("#contentTB").append(accordion_banner);
				
			}
			
			function sellInformation() {
				$("#contentTB").html("");
				var url = "/productdetail/productdetailStore.do?st_num="+${detail.st_num};
				//ps_num -> 받아오면 바꿔야함 ---------------------------------------
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
							+"<tr><td>판매점 이메일<td><td>"+data.st_email+"<td></tr>"
							+"<tr><td>고객문의 대표번호<td><td>"+data.st_bnum+"<td></tr>"
							+"<tr><td>판매자명  <td><td>"+data.st_ceo+"<td></tr>"
					);
					div.append(table.append(colgroup));
     				$("#contentTB").append(div);
     			})
			}
			

		</script>
<style>

	#table_left{ padding: 10px;}
	#simg{width: 350px; height: 350px; float: left;}
	
	table tr td{
		font-size: 15px;
		padding: 8px;
	}
	table tr td:nth-child(1){
		padding-left: 100px;
	}
	h4{padding: 15px;}
	.all{height: 1524px;}

	.accordion_banner{background-color: silver; color:black; }
	.ul-{padding-top: 10px; }
	.h4color{background-color: #F6F6F6; font-size: 20px; font-weight: bold;}]
</style>


</head>
<body>
<div class="all">
	<input type="hidden" id="p_num" name="p_num">
	<input type="hidden" id="ps_num" name="ps_num">
	<input type="hidden" id="s_num" name="s_num">
	
	<div class="form-group">
		<label for="category1" class="col-sm-3 control-label">카테고리</label>
		<div class="col-sm-4">
			<label>${detail.c1_name }</label> > <label>${detail.c2_name}</label>
		</div>
	</div>
	<br/>
	<div>
		<h4 class="h4color">판매 브랜드 : ${detail.p_division }</h4>
	</div>
	  
	<div class="list-group-item">
		<!-- 		class=" zoomTarget level0" 아래 div-->
		<div >
			<img id="simg" class="img-thumbnail" src="/uploadStorage/product/${detail.pi_image}" width="100%"
				height="100%" />
		</div>
		<div >
			<table class="table-striped" id="table_left">
				<colgroup>
					<col width="50px">
					<col width="2px">
					<col width="400px;">
				</colgroup>
				<tr>
					<td colspan="3">
						남은시간 (<span id="countTime"></span>)
						<button type="button" class="btn btn-link" style="text-align: right;"><strong><mark>☆</mark></strong> 상품 즐겨찾기(미)</button>
						<button type="button" class="btn btn-link" style="text-align: right;"><strong><mark>☆</mark></strong> 판매점 즐겨찾기(미)</button>
						
						<br><hr>
					</td>
				</tr>

				<tr>
					<td >소비자 가격</td>
					<td>:</td>
					<td >${detail.p_price }원</td>
				</tr>
				<tr>
					<td >판매가격</td>
					<td >:</td>
					<td >${detail.ps_price }원</td>
				</tr>

				<tr>
					<td >상품 설명</td>
					<td >:</td>
					<td >${detail.p_content }</td>
				</tr>
				<tr>
					<td >유통기한</td>
					<td >:</td>
					<td >${detail.ps_expiration } 까지 !!</td>
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
					<td>할인율 <span id="discountspan"></span> &#37;</td>
					<td></td>
					<td><span class="trade" style="color: red;">교환 환불 불가</span></td>
				</tr>
				
				<tr>
					<td><input class="btn btn-default" type="button" value="바로 구매하기" id="buy" name="buy"></td>
					<td><input class="btn btn-default" type="button" value="장바구니 담기" id="cart" name="cart"></td>
				</tr>
			</table>
		</div>
	</div>
	<form class="form-inline">
 		<div class="form-group">
		<ul class="ul- list-group" >
			<li class="form-control"  ><a>상품 리뷰</a></li>
			<li class="form-control" ><a>서비스 리뷰</a></li>
			<li class="form-control" ><a>판매자 정보</a></li>
		</ul>
		</div>
	</form>

	<div class="panel-group" id="accordion" role="tablist"
		aria-multiselectable="true">
		<div class="contentTB" id="contentTB"></div>
	</div>
	
</div>
</body>
</html>