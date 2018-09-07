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
 
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/productdetail.css" />

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
	   #productsList{
      width:1100px;      
      margin-left: auto; 
      margin-right: auto;   
   }
   .selectedstname{clear: both; margin-top: 100px}
   #productsList .align-center {
      text-align : center; 
   }

   #productsList .jb-th-1 {
      width : 70px;
      padding : 10px 0px;
   }
   #productsList .jb-th-2 {
      width : 30px;
   }

   #productsList .fileImageLogo {
      width: 70px;
      height: 40px;
   }
   
   #productsList .fileImageProduct {
      width: 70px;
      height: 70px;
   }
   #productsList .review_num:before {
     content: "|";
     color: #d9d9d9;
   }
   #productsList .p_price {
      text-decoration : line-through;
   }
   #productsList ul {
      list-style-type : none;
   }
   #productsList tr {
      width: 520px;
      
   }
   #productsList td {   
      padding-left   : 7px;
      padding-right   : 7px; 
   }
   
   #productsList ul {
      padding   : 0px;
      margin   : 0px;
   }
   #productsList .col-md-6 {
      width: 530px;
      padding: 5px;
   }
   #productsList .contract{    
      margin: 10px;
   }
   #productsList h4{
      padding-top: 20px;
   }
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
var t = "${t}";
		$(function(){
			
			$("#customUpdate").click(function(){
				$("#coustomer").submit();
			})
			
			if(t=="2"){
				$("#nav a[href='#tab2']").tab("show");				
			}else if(t=="3"){
				$("#nav a[href='#tab3']").tab("show");
			}else {
				$("#nav a[href='#tab4']").tab("show");
			}
			
			
			/*
			else if(t=="4"){
				$("#nav a[href='#tab4']").tab("show");
			}
			 else{
				$("#nav a[href='#tab1']").tab("show");				
			} */
			

			$('.dropdown-toggle').dropdown();
			
			jQuery('.format-money').text(function() {
			    jQuery(this).text(
			        jQuery(this).text().format()
			    );
			});
			
			var c_num = ${login.c_num};

			$.ajax({
				url :"/mypage/pageList.do?t=3",
				data: "c_num="+c_num,
				type:"post",
				dataType: "text",
				success: function(data) {
					var value =data;
					var totalPages = parseInt(value/10);
					if (totalPages%10 > 0) {  // 만약 52개면 6개 버튼을 만들기 위해서 
						totalPages++;
					}
					if(totalPages == 0 ){
						totalPages=1;
					}
					console.log(totalPages);
					$('#pagination-demo').twbsPagination({
		    			totalPages: totalPages,  // 전체 page 수
		   				visiblePages: 10,  // 출력될 page 수
		    			onPageClick: function (event, page) {
		    				$(".goDetail").remove();
		    				$('#page-content').text('Page' + page);
		    				console.log("page  :="+page)
		    				var pageValue = (page-1);  //인덱스 번호는 0부터 시작하므로
		    				console.log("pageValue = " +pageValue)
		    				count = (page-1)*10+1;
		    				$.getJSON("/mypage/mybuyList.do?page="+pageValue+"&c_num="+c_num+"&tab=3", function(data){
// 			    					$("#tableList").html("");
		    					if(data.length==0){
// 		    						notitemReviewTag();
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
			
			$(".goDetail td:not(:nth-last-child(1),:nth-last-child(2),:nth-last-child(3),:nth-last-child(4))").click(function() {					 //, :nth-last-child(2))
				var ps_num = $(this).parents("tr").attr("data-num");				
				location.href="/productdetail/productdetailmain.do?ps_num="+ps_num;	
			});	
			
			$(document).on('click','.btn_confirm',function() {
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
			

			//상품 리뷰
			$(document).on('click','.btn_productR',function() {
				var p_num = $(this).parents("tr").attr("data-p_num");
				var s_num = $(this).parents("tr").attr("data-s_num");
				var c_name = "${login.c_name}";
				
				$(".modal-title").html("상품 리뷰");
				$(".myReview2").remove();
				$(".myReview").remove();
				$("#form_productR").show();
				$("#form_sellerR").hide();
				
				$(".btn_hide1").show();
				$(".btn_hide2").hide();
				
				$(".p_num").val(p_num);
				$.getJSON("/mypage/myProductRList.do?p_num="+p_num, function(data){
// 					$("#tableList").html("");
					if(data.length==0){
						notList();
					}
					$(data).each(function() {
						var prv_num = this.prv_num;
						var prv_date  =this.prv_date;
						var prv_image =this.prv_image;
						var prv_content = this.prv_content;
						var prv_scope = this.prv_scope;
						productList(prv_image,prv_scope,prv_content,prv_date,prv_num);
					})
				})
			})
			$(document).on('click','.myReview',function(){   // 선택 시 선택 리뷰 나옴 
				var prv_num = $(this).attr("data-num");
				console.log("prv_num = " +prv_num)
				$.getJSON("/mypage/myProductRselectList.do?prv_num="+prv_num,function(data){
					$(data).each(function() {
						var prv_num = this.prv_num;
						var prv_date  =this.prv_date;
						var prv_image =this.prv_image;
						var prv_content = this.prv_content;
						var prv_scope = this.prv_scope;
						
						$("#prv_scope").val(prv_scope);
						$("#prv_content").html(prv_content);
// 						$("#prv_image").val(prv_image);
						$("#prv_num").val(prv_num);
						

					})
				})
			})
			
			//서비스 리뷰
			$(document).on('click','.btn_sellerR',function() {
				var p_num = $(this).parents("tr").attr("data-p_num");
				var s_num = $(this).parents("tr").attr("data-s_num");
				var c_name = "${login.c_name}";
// 				var c_num = "${login.c_num}"
// 				console.log("p_num ="+p_num);
//            	 	console.log("s_num ="+s_num);
//            	 	console.log("c_num ="+c_num );
				
				$(".modal-title").html("서비스 리뷰");
				$(".myReview").remove();
				$(".myReview2").remove();
				$("#form_productR").hide();
				$("#form_sellerR").show();
				
				$(".btn_hide1").hide();
				$(".btn_hide2").show();
				
				$(".s_num").val(s_num);
				
				$.getJSON("/mypage/mySellerRList.do?s_num="+s_num, function(data){
// 					$("#tableList").html("");
					if(data.length==0){
						notList();
					}
					$(data).each(function() {
						var srv_num = this.srv_num;
						var srv_date  =this.srv_date;
						var srv_image =this.srv_image;
						var srv_content = this.srv_content;
						var srv_scope = this.srv_scope;
						sellerList(srv_image,srv_scope,srv_content,srv_date,srv_num);
					})
				})
			})
			$(document).on('click','.myReview2',function(){   // 선택 시 선택 리뷰 나옴 
				var srv_num = $(this).attr("data-num");
				
				$.getJSON("/mypage/mySellerRselectList.do?srv_num="+srv_num, function(data){
					$(data).each(function() {
						var srv_num = this.srv_num;
						var srv_date  =this.srv_date;
						var srv_image =this.srv_image;
						var srv_content = this.srv_content;
						var srv_scope = this.srv_scope;
						console.log("srv_num"+ srv_num)
						console.log("srv_date"+ srv_date)
						console.log("srv_image"+ srv_image)
						console.log("srv_content"+ srv_content)
						console.log("srv_scope"+ srv_scope)
						$("#srv_scope").val(srv_scope);
						$("#srv_content").html(srv_content);
						$("#srv_image").val(srv_image);
						$(".srv_num").val(srv_num); 
					})
				})
			})
			//
			
			$("#insert1").click(function() { //삽입
// 				$("#form_productR").attr({"method":"post","action":"/mypage/myProductRInsert.do","enctype":"multipart/form-data"});
// 				$("#form_productR").submit();

				if(!checkForm("#prv_scope","별점을")) return;
               else if(!checkForm("#prv_content","내용을")) return;
				//이미지 파일 제어 해야함
               else {
                  $("#form_productR").ajaxForm({ 
                     url:"/mypage/myProductRInsert.do",
                     type:"post",
                     enctype:"multipart/form-data",
                     dataType :"text",
                     error: function(){
                        alert("시스템 오류 입니다. 관리자에게 문의하세요");
                     },
                     success : function(data){
                        console.log(data);
                        if(data==1){
                        	alert("등록 완료");
                        	formReset();
                           $("#galleryModal").modal("hide");
                        }else{
                           alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
                           formReset();
                        }                           
                     }
                  });
                  $("#form_productR").submit();
               }
			})
	 		 $("#update1").click(function(){
				
                $("#form_productR").ajaxForm({ 
                    url:"/mypage/myProductRupdate.do",
                    type:"post",
                    enctype:"multipart/form-data",
                    dataType :"text",
                    error: function(){
                       alert("시스템 오류 입니다. 관리자에게 문의하세요");
                    },
                    success : function(data){
                       console.log(data);
                       if(data==1){
                       	formReset();
                       	  alert("수정 완료")
                          $("#galleryModal").modal("hide");
                       }else{
                          alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
                          formReset();
                       }                           
                    }
                 });
                 $("#form_productR").submit();
			})
			$("#delete1").click(function(){
				var a =$("#prv_num").val();
				console.log("dsadasdas = "+a);
                $("#form_productR").ajaxForm({ 

                    url:"/mypage/myProductDelete.do",
                    type:"post",
                    enctype:"multipart/form-data",
                    dataType :"text",
                    error: function(){
                       alert("시스템 오류 입니다. 관리자에게 문의하세요");
                    },
                    success : function(data){
                       console.log(data);
                       if(data==1){
                       	  formReset();
                       	  alert("삭제 완료")
                          $("#galleryModal").modal("hide");
                       }else{
                          alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
                          formReset();
                       }                           
                    }
                 });
                 $("#form_productR").submit();
			})  
			////////////////////////////////////////서비스 리뷰 삽입
			$("#insert2").click(function() {

				if(!checkForm("#srv_scope","별점을")) return;
                else if(!checkForm("#srv_content","내용을")) return;
				
                else {
                  $("#form_sellerR").ajaxForm({ 
                     url:"/mypage/mySellerInsert.do",
                     type:"post",
                     enctype:"multipart/form-data",
                     dataType :"text",
                     error: function(){
                        alert("시스템 오류 입니다. 관리자에게 문의하세요");
                     },
                     success : function(data){
                        console.log(data);
                        if(data==1){
                        	formReset();
                           $("#galleryModal").modal("hide");
                        }else{
                           alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
                           formReset();
                        }                           
                     }
                  });
                  $("#form_sellerR").submit();
               }
			})
			$("#update2").click(function(){
				
                $("#form_sellerR").ajaxForm({ 
                    url:"/mypage/mySellerRupdate.do",
                    type:"post",
                    enctype:"multipart/form-data",
                    dataType :"text",
                    error: function(){
                       alert("시스템 오류 입니다. 관리자에게 문의하세요");
                    },
                    success : function(data){
                       console.log(data);
                       if(data==1){
                       	formReset();
                       	  alert("수정 완료")
                       	  formReset();
                          $("#galleryModal").modal("hide");
                       }else{
                          alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
                          formReset();
                       }                           
                    }
                 });
                 $("#form_sellerR").submit();
			})
			$("#delete2").click(function(){
				console.log("즐" +$("#srv_num").val())
                $("#form_sellerR").ajaxForm({ 
                    url:"/mypage/mySellerDelete.do",
                    type:"post",
                    enctype:"multipart/form-data",
                    dataType :"text",
                    error: function(){
                       alert("시스템 오류 입니다. 관리자에게 문의하세요");
                    },
                    success : function(data){
                       console.log(data);
                       if(data==1){
                       	formReset();
                       	  alert("삭제 완료")
                       	  formReset();
                          $("#galleryModal").modal("hide");
                       }else{
                          alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
                          formReset();
                       }                           
                    }
                 });
                 $("#form_sellerR").submit();
			})
			//////////////////////////////////////////즐겨찾기
			/* 즐겨찾기 매장 클릭하면 리스트 출력 */
	         $(document).on("click",".selectStore",function(){
	            var stnum=$(this).attr("data-num");
	            var stname=$(this).find(".stname").html();
	            //목록 선택되면 실행
	            var url = "/storeall/storeProducts.do?st_num="+stnum;
	            
	            /* 상품 초기화 */
	            $("#productsList").html("");
	            $("#productsList").append("<h4 class='h4color selectedstname'>판매 제품 목록: "+stname+"</h4>");
	            
	            
	            $.getJSON(url, function(data) {
	               
	               if(data == ""){
	                  $("#productsList").html("<h4>해당 매장에서 판매중인 상품이 없습니다.</h4>");
	               }else{
	                  $(data).each(function() {               
	                     var ps_num = this.ps_num;
	                     var si_image = this.si_image;
	                     var st_name = this.st_name.replace(/\s/, "<br>");
	                     var pi_image = this.pi_image;
	                     var p_name = this.p_name;
	                     var p_price = this.p_price;
	                     var ps_expiration = this.ps_expiration;
	                     var ps_count = this.ps_count;
	                     var ps_price = this.ps_price;
	                     var prv_count = this.prv_count;
	                     var prv_scope = this.prv_scope;
	                     var distance = this.distance;               
	                     
	                     /* 목록 생성 */
	                     addProducts(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope);
	                     
	                  });
	               }
	            }).fail(function() {
	               alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
	            });
	         });
			
			
		});//풩션 끝!

		function formReset(){
			$("#form_sellerR").each(function(){
				this.reset();
			})
			$("#form_productR").each(function(){
				this.reset();
			})
		}
		//상품 리뷰
		function productList(prv_image,prv_scope,prv_content,prv_date,prv_num,c_name){
			
			var tr =$("<tr class='myReview' data-num="+prv_num+"></tr>");
			var td1 = $("<td><img class='img-thumbnail' src='/uploadStorage/review/"+prv_image+"'/></td>");
			var td2 = $("<td>"+prv_scope+"</td>");
			var td3 = $("<td>"+prv_content+"</td>");
			var td4 = $("<td>"+prv_date+"</td>");
			
			tr.append(td1).append(td2).append(td3).append(td4)
			$(".tableReview").append(tr);
			
		}
		//상품 리뷰
		function sellerList(srv_image,srv_scope,srv_content,srv_date,srv_num,c_name){
			
			var tr =$("<tr class='myReview2' data-num="+srv_num+"></tr>");
			var td1 = $("<td><img class='img-thumbnail' src='/uploadStorage/review/"+srv_image+"'/></td>");
			var td2 = $("<td>"+srv_scope+"</td>");
			var td3 = $("<td>"+srv_content+"</td>");
			var td4 = $("<td>"+srv_date+"</td>");
			
			tr.append(td1).append(td2).append(td3).append(td4)
			$(".tableReview").append(tr);
			
		}

		//자신의 리뷰가 없을때
		function notList(c_name) {
			var tr =$("<tr class='myReview'>");
			var td =$("<td colspan='4'>등록된 고객님의 리뷰가 없습니다</td>");
			tr.append(td);
			$(".tableReview").append(tr);
		}
		
		
		//구매목록
		function buyList(ps_num,b2_num,p_num,s_num,pi_image,p_name,p_content,b_count,original_multiply_count,multiply_count,b_confirm,b1_date,count){
			var tr = $("<tr class='tr_list goDetail' data-num ='"+ps_num+"' data-b2_num = '"+b2_num+"' data-p_num ='"+p_num+"' data-s_num ='"+s_num+"'>");
			var td1= $("<td><div class='list_td'>"+count+"</div></td>");
			var td2= $("<td><div ><img class='img-thumbnail' src='/uploadStorage/product/"+pi_image+"' width='70px' height='50px;'/></div></td>");
			var td3= $("<td><div class='list_td2' style='text-align: left;'><p><label>"+p_name+"</label></p>"+p_content+"</div></td>");
			var td4= $("<td ><div class='list_td'>"+b_count+"개</div></td>");
			var td5= $("<td><div class='list_td3'><span class='span_count format-money' style='text-decoration: line-through;'>"+original_multiply_count+"</span>원<br/><span class='span_count format-money'>"+multiply_count+"</span>원</div></td>");
			var td6= $("<td><div class='list_td'>"+b1_date+"</div></td>");
			var td7= $("<td><div class='list_td3'><button type='button' class='btn btn-default btn_productR' data-toggle='modal' data-target='#galleryModal' data-whatever='@mdo'>상품 리뷰</button><button type='button' class='btn btn-default btn_sellerR' id='btn_sellerR' data-toggle='modal' data-target='#galleryModal' data-whatever='@mdo'>서비스 리뷰</button></div></td>");
			var div= $("<td><div class='list_td'></div></td>");
			var input;
			if(b_confirm==0){
				input =("<input type='button' class='btn btn-default btn_confirm' name='btn_confirm' value='수령'>")
			}else if(b_confirm){
				input = ("<span class='label label-danger' style='font-size: 16px;'>완료</span>");
			}
			div.append(input);
			
			var tr2= $("</tr>");
			tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(div).append(tr2);
			$("#tableList").append(tr);
		}
		   //목록이 선택되면 매장 뿌려주기
	      /* 주소 검색 주변매장 동적 생성 */
	   function addProducts(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope, distance) {
	      /* 상품 할인율 계산 */               
	      var disRate = Math.round((p_price - ps_price) / p_price * 100);         
	      var new_div_contract = $("<div>");
	      new_div_contract.addClass("col-md-6 list-group-item contract discount");

	      var new_a_clearfix = $("<a>");
	      new_a_clearfix.attr("href","/productdetail/productdetailmain.do?ps_num="+ps_num);
	      new_a_clearfix.addClass("list-group-item");

	      var new_table = $("<table>");
	      var new_tbody = $("<tbody>");
	      

	      var new_tr = $("<tr>");
	      new_tr.attr("data-num", ps_num);
	      
	      var new_td_si = $("<td>");
	      new_td_si.addClass("jb-th-1");
	      var new_div_logo = $("<div>");
	      
	      var new_img_si = $("<img>");
	      new_img_si.attr("src", "/uploadStorage/store/" + si_image);
	      new_img_si.addClass("fileImageLogo");

	      var new_p_name = $("<p>");
	      new_p_name.html(st_name);
	      new_p_name.addClass("stname align-center");

	      var new_td_pi = $("<td>");
	      new_td_pi.addClass("jb-th-1");
	      var new_div_product = $("<div>");

	      var new_img_pi = $("<img>");
	      new_img_pi.attr("src", "/uploadStorage/product/" + pi_image);
	      new_img_pi.addClass("fileImageProduct");

	      var new_td_p = $("<td>");
	      var new_div_name = $("<div>");
	      new_div_name.addClass("restaurants-info");
	      var new_div_expiration = $("<div>");
	      new_div_expiration.attr("title", p_name);
	      new_div_expiration.html(p_name);

	      var new_div_scope = $("<div>");
	      new_div_scope.attr("title", ps_expiration);
	      new_div_scope.html(ps_expiration);

	      var new_div_stars = $("<div>");
	      new_div_stars.addClass("stars");
	      var new_span_scope = $("<span>");
	      new_span_scope.addClass("ico-star1 ng-binding glyphicon glyphicon-star");
	      new_span_scope.html(prv_scope);
	      var new_span_count_prv = $("<span>");
	      new_span_count_prv.addClass("review_num");
	      new_span_count_prv.html("리뷰 " + prv_count);

	      var new_td_ps = $("<td>");
	      var new_div_txt = $("<div>");
	      new_div_txt.addClass("align-center");
	      var new_span_txt = $("<span>");      
	      new_span_txt.html("남은수량");
	      var new_div_space = $("<div>");
	      var new_span_count_ps = $("<span>");
	      new_span_count_ps.html(ps_count + "개");

	      var new_td_discount = $("<td>");
	      new_td_discount.addClass("jb-th-2");
	      var new_div_discount = $("<div>");
	      var new_ul_txt = $("<ul>");
	      var new_li_txt = $("<li>");      
	      var new_span_discount = $("<span>");
	      new_span_discount.html(disRate);
	      var new_span_text = $("<span>");
	      new_span_text.html("%");

	      var new_td_p_ps = $("<td>");
	      var new_div_price = $("<div>");
	      new_div_price.addClass("align-center");
	      var new_ul_price = $("<ul>");
	      var new_li_price = $("<li>");      
	      var new_span_price = $("<span>");
	      new_span_price.addClass("p_price");
	      new_span_price.html(p_price+"원");
	      var new_li_ps_price = $("<li>");   
	      var new_span_price_ps = $("<span>");
	      new_span_price_ps.addClass("ps_price");
	      new_span_price_ps.html(ps_price+"원");
	      

	      new_div_logo.append(new_img_si).append(new_p_name);
	      new_td_si.append(new_div_logo);
	      new_tr.append(new_td_si);

	      new_div_product.append(new_img_pi);
	      new_td_pi.append(new_div_product)
	      new_tr.append(new_td_pi);

	      new_div_stars.append(new_span_scope).append(new_span_count_prv);
	      new_div_scope.append(new_div_stars);
	      new_div_expiration.append(new_div_scope);
	      new_div_name.append(new_div_expiration);
	      new_td_p.append(new_div_name);
	      new_tr.append(new_td_p);

	      new_div_txt.append(new_span_txt).append(new_div_space).append(new_span_count_ps);
	      new_td_ps.append(new_div_txt);
	      new_tr.append(new_td_ps);

	      new_li_txt.append(new_span_discount).append(new_span_text);
	      new_ul_txt.append(new_li_txt);
	      new_div_discount.append(new_ul_txt)
	      new_td_discount.append(new_div_discount);
	      new_tr.append(new_td_discount);
	      
	      new_li_price.append(new_span_price);
	      new_ul_price.append(new_li_price);
	      new_li_ps_price.append(new_span_price_ps);
	      new_ul_price.append(new_li_ps_price);
	      
	      new_div_price.append(new_ul_price);
	      new_td_p_ps.append(new_div_price)
	      new_tr.append(new_td_p_ps);

	      new_table.append(new_tbody).append(new_tr);
	      new_a_clearfix.append(new_table);
	      new_div_contract.append(new_a_clearfix);

	      $("#productsList").append(new_div_contract);

	      return new_div_contract;
	   }
	</script>
</head>
<body>
 	<form id="coustomer" action="/member/login.do" method="get">
		 <input type="hidden" name="login" value="${login}">
		 
	</form> 
	
	<div class="all">	
	<input type="hidden" name="total_count">	
		<div role="tabpanel">
			<ul id="nav" class="nav nav-tabs clearfix right" role="tablist"  >	

<!-- 			  	<li data-toggle="tab"><a href="#tab1"  data-toggle="tab">회원정보 수정</a></li> -->
			  	<li data-toggle="tab"><a href="/member/login.do"  data-toggle="tab" id="customUpdate">회원정보 수정</a></li>
			  	
				<li data-toggle="tab"><a href="#tab2"  data-toggle="tab" id="li_list2">장바구니</a></li>
				<li data-toggle="tab"><a href="#tab3"  data-toggle="tab" id="li_list3">구매목록</a></li>
				<li data-toggle="tab"><a href="#tab4"  data-toggle="tab">즐겨찾기</a></li>
<!-- 				<li><a href="#tab3" data-toggle="tab">리뷰</a></li> -->
			</ul>
		</div>
		<div class="tab-content">  <!-- 텝 시작 부분 -->
			<div class="tab-pane active" id= "tab1"> <!-- 정보수정 페이지  -->
<%-- 				<c:import url="/member/login.do"> --%>
<%-- 					<c:param name="login" value="{login}"></c:param> --%>
<%-- 				</c:import> --%>
				
			</div>
			<div class="tab-pane" id="tab2">
				<div id="page_group">
					<jsp:include page="mycart.jsp">
						<jsp:param value="${login}" name="login"/>
					</jsp:include>
				</div>
			</div>
			<div class="tab-pane" id="tab3">
<!-- 				//시작 부분 -->
				<jsp:include page="mybuyList.jsp"></jsp:include>
<!-- 				//끝 부분  -->
			</div>
			<div class="tab-pane" id="tab4">
				<jsp:include page="/WEB-INF/views/client/storeall/favStore.jsp"></jsp:include>
				<div id="productsList"></div>
			</div>
		</div>
	</div>
	
			    		<%-- (modal) --%>
	<div class="modal fade" id="galleryModal" tabindex="-1" role="dialog" aria-labelledby="galleryModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="galleryModalLabel">title</h4>
	      </div>
	      <div class="modal-body">
				<!--------------------- 	      동적 바디 추가  부분			--------------->	      
				
	        <div>
				<table class="table table-striped table-hover tableReview">
					<colgroup>
						<col width="15%">
						<col width="10%">
						<col width="55%">
						<col width="20%">
					</colgroup>
					
					<tr>
						<th>사진</th>
						<th>평점</th>
						<th>내용</th>
						<th>날짜</th>
					</tr>

				</table>
	        </div>
	        <hr>
<!-- 	      	//////////////  Preview-->
	        <form id="form_productR">
	          <div style="text-align: right">
					<label for="prv_scope">별점 :</label>
		            <input type="number" style="width: 50px;" step="0.5" name="prv_scope" id="prv_scope" min="0" max="5">
	          </div>
	          <div class="form-group">
	            	<label class="control-label">작성자</label>
				<label class="form-control" style="width: 100%">${login.c_id }</label>
	          </div>

		      <div class="form-group">
		            <label for="prv_content" class="control-label">글내용</label>
		            <textarea class="form-control" name="prv_content" id="prv_content" ></textarea>
		      </div>
		      <div class="form-group">
		            <label for="file" class="control-label">이미지</label>
		            <input type="file" name="file" id="pf"/>
		      </div>
		      <input type="hidden" name="c_num" class="c_num" id="pc" value="${login.c_num}">
		      <input type="hidden" name="p_num" class="p_num" id="pp" value="0">
		      <input type="hidden" name="prv_num" id="prv_num" class="prv_num" value="0">
		      <input type="hidden" name="prv_image" class="prv_image" id="prv_image" value="0">
	      	</form>
	      	
<!-- 	      	//////////////  Sreview-->
	      	<form id="form_sellerR"">
	          <div style="text-align: right">
					<label for="srv_scope">별점 :</label>
		            <input type="number" style="width: 50px;" step="0.5" name="srv_scope" id="srv_scope" min="0" max="5">
	          </div>
	          <div class="form-group">
	            <label class="control-label">작성자</label>
	            <label class="form-control" style="width: 100%">${login.c_id }</label>
	          </div>
	        
		      <div class="form-group">
		            <label for="srv_content" class="control-label">글내용</label>
		            <textarea class="form-control" name="srv_content" id="srv_content" ></textarea>
		      </div>
		      <div class="form-group">
		            <label for="file" class="control-label">이미지</label>
		            <input type="file" name="file" id="sf" />
		      </div>
		      <input type="hidden" name="c_num" class="c_num" id="sc" value="${login.c_num}">
		      <input type="hidden" name="s_num" class="s_num" id="ss" value="0">
		      <input type="hidden" name="srv_num" class="srv_num" id="srv_num" value="0">
		      <input type="hidden" name="srv_image" class="srv_image" id="srv_image" value="0">
	      	</form>
	      </div>
	      <div class="modal-footer btn_hide1">
	      	<button type="button" class="btn btn-primary" id="insert1" >등록</button>
<!-- 	      	<button type="button" class="btn btn-primary" id="update1" >수정</button>	 -->
<!-- 	      	<button type="button" class="btn btn-primary" id="delete1" >삭제</button>	 -->
	      	<button type="button" class="btn btn-default" data-dismiss="modal" >닫기</button>
	      	
	      </div>
	      <div class="modal-footer btn_hide2">
	      	<button type="button" class="btn btn-primary" id="insert2" >등록</button>
<!-- 	      	<button type="button" class="btn btn-primary" id="update2" >수정</button>	 -->
<!-- 	      	<button type="button" class="btn btn-primary" id="delete2" >삭제</button>	 -->
	      	<button type="button" class="btn btn-default" data-dismiss="modal" >닫기</button>
	      	
	      </div>
	    </div>
	  </div>
	</div>
	

	<div class="div_last"></div>
</body>
</html>