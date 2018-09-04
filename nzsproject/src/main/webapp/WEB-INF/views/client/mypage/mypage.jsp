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
<script type="text/javascript" src="/resources/include/js/jquery.twbsPagination.js"></script>
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<style type="text/css">
/* 	div{border: 1px solid black;} */

	.nav_div{text-align: center;}
	.td_list{padding-top:30px; }
	.td_list2{padding-top:20px; }
	.td_list3{padding-top:25px; }
	.td_list4{padding-top:25px; padding-left: 7px; }
	.close{margin-right: 15px;}
	.div_date{text-align: right;}
	.div_last{height: 100px;}
</style>

	<script type="text/javascript">
// 	페이징 계산 ㅡㅡ 
// 	int page = 22; 
// 	int countList = 10; 한 페이지에 출력될 게시물 수 (countList)
// 	int countPage = 10; 한 화면에 출력될 페이지 수 (countPage)
// 	int totalCount = 255; 현재 페이지 번호 (이하 page)
// 	int totalPage = totalCount / countList;
	
// 	if (totalCount % countList > 0) {
// 	    totalPage++;
// 	}
// 	if (totalPage < page) {
// 	    page = totalPage;
// 	}
	
// 	int startPage = ((page - 1) / 10) * 10 + 1;
// 	int endPage = startPage + countPage - 1;
	
// 	if (endPage > totalPage) {
// 	    endPage = totalPage;
// 	}
// 	if (startPage > 1) {
// 	    System.out.print("<a href=\"?page=1\">처음</a>");
// 	}
// 	if (page > 1) {
// 	    System.out.println("<a href=\"?page=" + (page - 1)  + "\">이전</a>");
// 	}
// 	for (int iCount = startPage; iCount <= endPage; iCount++) {
// 	    if (iCount == page) {
// 	        System.out.print(" <b>" + iCount + "</b>");
// 	    } else {
// 	        System.out.print(" " + iCount + " ");
// 	    }
// 	}
// 	if (page < totalPage) {
// 	    System.out.println("<a href=\"?page=" + (page + 1)  + "\">다음</a>");
// 	}
// 	if (endPage < totalPage) {
// 	    System.out.print("<a href=\"?page=" + totalPage + "\">끝</a>");
// 	}
var count;
		$(function(){
			$('.dropdown-toggle').dropdown();
			jQuery('.format-money').text(function() {
			    jQuery(this).text(
			        jQuery(this).text().format()
			    );
			});
		
			$("#li_list3").click(function(){
		// 			$("#tab2").load("ajax/mypage/mybuyList.do");
				$.ajax({
					url :"/mypage/pageList.do",
					data :"c_num="+1,
					type:"post",
					dataType: "text",
					success: function(data) {
						var value =data;
						var totalPages = parseInt(value/10);
						if (totalPages%10 > 0) {  // 만약 52개면 6개 버튼을 만들기 위해서 
							totalPages++;
						}
// 						console.log(total);
						$('#pagination-demo').twbsPagination({
			    			totalPages: totalPages,  // 전체 page 수
			   				visiblePages: 10,  // 출력될 page 수
			    			onPageClick: function (event, page) {
			    				$(".goDetail").remove();
			    				$('#page-content').text('Page ' + page);
			    				console.log("page  :="+page)
			    				var pageValue = (page-1);  //인덱스 번호는 0부터 시작하므로
			    				
			    				count = (page-1)*10+1;
			    				$.getJSON("/mypage/mybuyList.do?c_num="+1+"&page="+pageValue, function(data){
// 			    					$("#tableList").html("");
			    					if(data.length==0){
			    						notitemReviewTag();
			    					}
			    					$(data).each(function() {
			    						
										var ps_num = this.ps_num;
										var b2_num = this.b2_num;
										var p_num = this.p_num;
										var s_num = this.s_num;
										var pi_image = this.pi_image;
										var p_name = this.p_name;
										var p_content = this.p_content;
										var b_count = this.b_count;
										var original_multiply_count = this.original_multiply_count;
										var multiply_count = this.multiply_count;
										var b_confirm = this.b_confirm;
										var b1_date = this.b1_date;
										
										
										buyList(ps_num,b2_num,p_num,s_num,pi_image,p_name,p_content,b_count,original_multiply_count,multiply_count,b_confirm,b1_date,count);
										count= count+1;
			    					})
			    				})
			         			
							}
						});
					}
				});
			})
			$(".goDetail td:not(:nth-last-child(1),:nth-last-child(2),:nth-last-child(3),:nth-last-child(4))").click(function() {					 //, :nth-last-child(2))
				var ps_num = $(this).parents("tr").attr("data-num");				
				location.href="/productdetail/productdetailmain.do?ps_num="+ps_num;	
			});	
		
			
			
			$("document").on('click','.btn_confirm',function() {
				if(confirm("정말 수령 하시겠습니까?")){
					var b2_num = $(this).parents("tr").attr("data-b2_num");
					console.log("b2_num" + b2_num)
					$.ajax({
						url :"/mypage/cartConfirmUpdate.do",
						type: "post",
						data: "b_confirm="+1+"&b2_num="+b2_num,
						dataType: "text",
						success: function() {
							console.log("성공");
						}
					})
				}
			})
			
			$("#li_list2").click(function(){

			})

		});//풩션 끝!
		
		function buyList(ps_num,b2_num,p_num,s_num,pi_image,p_name,p_content,b_count,original_multiply_count,multiply_count,b_confirm,b1_date,count){
			
			
			var tr = $("<tr class='tr_list goDetail' data-num ='"+ps_num+"' data-b2_num = '"+b2_num+"' data-p_num ='"+p_num+"' data-s_num ='"+s_num+"'>");
			var td1= $("<td><div class='list_td'>"+count+"</div></td>");
			var td2= $("<td><div ><img class='img-thumbnail' src='/uploadStorage/product/"+pi_image+"' width='70px' height='50px;'/></div></td>");
			var td3= $("<td><div class='list_td2' style='text-align: left;'><p><label>"+p_name+"</label></p>"+p_content+"</div></td>");
			var td4= $("<td ><div class='list_td'>"+b_count+"개</div></td>");
			var td5= $("<td><div class='list_td3'><span class='span_count format-money' style='text-decoration: line-through;'>"+original_multiply_count+"</span>원<br/><span class='span_count format-money'>"+multiply_count+"</span>원</div></td>");
			var td6= $("<td><div class='list_td'>"+b1_date+"</div></td>");
			var td7= $("<td><div class='list_td3'><button type='button' class='btn btn-default' id='btn_serviceR' data-toggle='modal' data-target='#galleryModal' data-whatever='@mdo'>서비스 리뷰</button><button type='button' class='btn btn-default' id='btn_sellerR' data-toggle='modal' data-target='#galleryModal' data-whatever='@mdo'>판매자 리뷰</button></div></td>");
			var div= $("<div class='list_td'></div>");
			var input;
			if(b_confirm==0){
				input =("<input type='button' class='btn btn-default btn_confirm' name='btn_confirm' value='수령'>")
			}else if(b_confirm){
				input = ("<span class='label label-danger'>수령</span>");
			} 
			div.append(input);
			
			var tr2= $("</tr>");
			tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(div).append(tr2);
			$("#tableList").append(tr);
		}
		
	</script>
</head>
<body>
	<div class="all">	
	<input type="hidden" id="total_count">	
		<div role="tabpanel">
			<ul id="nav" class="nav nav-tabs clearfix right" role="tablist"  >	
<!-- 			  	<li role="presentation" class="dropdown"> -->
<!-- 				  	<a class="dropdown-toggle" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="/page.html">회원정보 관리</a> -->
<!-- 			    	<ul class="dropdown-menu" role="menu"> -->
<!-- 			      		<li role="presentation" id="li_list1-1"><a role="menuitem" data-toggle="tab" tabindex="-1" href="#tab1-1">회원정보 수정</a></li> -->
<!-- 	   					<li role="presentation" id="li_list1-2"><a role="menuitem" data-toggle="tab" tabindex="-1" href="#tab1-2">회원 탈퇴</a></li> -->
<!-- 			    	</ul> -->
<!-- 			  	</li> -->
			  	<li><a href="#tab1" data-toggle="tab">회원정보 수정</a></li>
				<li><a href="#tab2" data-toggle="tab" id="li_list2">장바구니</a></li>
				<li><a href="#tab3" data-toggle="tab" id="li_list3">구매목록</a></li>
				<li><a href="#tab4" data-toggle="tab">즐겨찾기</a></li>
<!-- 				<li><a href="#tab3" data-toggle="tab">리뷰</a></li> -->
			</ul>
		</div>
		<div class="tab-content">  <!-- 텝 시작 부분 -->
			<div class="tab-pane" id= "tab1"> <!-- 정보수정 페이지  -->
				<jsp:include page="/WEB-INF/views/client/member/join_customer_modify.jsp"></jsp:include>
			</div>
			<div class="tab-pane" id="tab2">
				<div id="page_group">
					<jsp:include page="mycart.jsp"></jsp:include>
				</div>
			</div>
			<div class="tab-pane" id="tab3">
<!-- 				//시작 부분 -->
				<jsp:include page="mybuyList.jsp"></jsp:include>
<!-- 				//끝 부분  -->
			</div>
			<div class="tab-pane" id="tab4">
				<div id="page_group">
					
				</div>
			</div>
		</div>
	</div>

	<div class="div_last"></div>
</body>
</html>