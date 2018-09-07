<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/images/icon.png">

    <title><tiles:getAsString name="title"/></title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/include/css/navbar-static-top.css" rel="stylesheet">
    <link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet">

	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->  
    
    <style type="text/css">
   		#middle{margin-left: auto; margin-right: auto; height: 440px; padding-left: 10px;}
   		#todaychoice{ margin-left: 15px; margin-right:25px;   width: 550px; float: left;}
    	
    	#newslist{width: 550px; }
    	h4{text-align: center; display: inline-block; font-weight: bold;}
    	
    	
    	#newsList:after{ clear:both}
    	.item img{margin-left: auto; margin-right: auto; height: 370px; width: 370px;}
    	body {width: 1140px;margin-left: auto; margin-right: auto; min-height: 100px;}
    	.footer{    margin-left: -200px	 width: 1140px;}

	</style>

	<script type="text/javascript">
		$(function() {
			
			$('.carousel').carousel({
				  wrap: "true"
				})
				
			$.ajax({
				url:"/admin/statistic/popItem.do",  //전송 url
				type:"get",  // 전송 시 method 방식				
				dataType:"json",
				success: function(result){
					var cnt =0;
					$(result).each(function() {	
						if(cnt<3){
							var pi_image = this.pi_image;
							var p_name = this.p_name;
							var setitem = $(".item:eq("+cnt+")");
							setitem.find("img").attr("src","/uploadStorage/product/"+pi_image);
							setitem.find("h3").html(p_name);
							cnt++;	
						}
					})
					
				},
				error:function(){  //실행시 오류가 발생하였을 경우
					alert("시스템 오류 입니다. 관리자에게 문의하세요!!");							
				}
			});	
						
		});
	</script>
	
  </head>

  <body>	  
    <!-- 헤더 설정  -->
      <tiles:insertAttribute name="header"/>    
      
      
	<div id="middle" >      
		<div id="todaychoice" class="carousel">
			<h4>오늘의 인기 상품</h4>
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			  </ol>
				
	
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img  >
			      <div class="carousel-caption">
			           <h3></h3>		    			
			      </div>
			    </div>
			    <div class="item">
			      <img >
			      <div class="carousel-caption">
			        	<h3></h3>		    			
			    </div>
			    </div>	
			    <div class="item">
			      <img >
			      <div class="carousel-caption">
			        	<h3></h3>		    			
			      </div>
			    </div>			        
			  </div>
			
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		<div id="newsList">
			<h4>공지 사항</h4>
	       	<c:import url="/news/newsList.do"> 
	       	
			</c:import>  
		</div>
	</div>
    <!-- Begin page content -->
    <div class="container" id="maincontainer">
     
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>전체 상품</h2>
          <p>판매중인 모든 상품이 거리순으로  정렬되어 있습니다.</p>
          <p><a class="btn btn-default" href="/productall/productList.do" role="button">전체 상품 보기 &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>전체 스토어</h2>
          <p>모든 스토어들이 거리순으로 정렬되어 있습니다.</p>
          <p><a class="btn btn-default" href="/storeall/storeall.do" role="button">전체 스토어 보기 &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>마이페이지</h2>
          <p>정보 수정 / 장바구니 / 구매목록 / 즐겨찾기 등 회원 전반적인 정보관리</p>
          <p><a class="btn btn-default" href="/mypage/mypageList.do?t=2" role="button">마이페이지 &raquo;</a></p>
        </div>
      </div>
    </div>
    <footer class="footer">
		<!-- 푸터 설정 -->
		<tiles:insertAttribute name="footer"/>
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
    