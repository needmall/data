<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
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

<title><tiles:getAsString name="title" /></title>

<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/css/navbar-static-top.css"
	rel="stylesheet">
<link href="/resources/include/css/sticky-footer-navbar.css"
	rel="stylesheet">

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
body {
	width: 1140px !important;
	margin-left: auto;
	margin-right: auto;
	min-height: 100px;
}

.footer	{
	margin-left: -200px !important;	 
}

h4 {
	text-align: center;
	display: inline-block;
	font-weight: bold;
}

#carousel-example-generic-block {
	height: 450px;
}

.item .block {
	width: 350px;
	height: 230px !important;
	margin-left: auto;
	margin-right: auto;
}

.item .width {
	width : 560px;
	height : 261px !important;
	margin-left : auto;
	margin-right : auto;
}


.carousel-indicators li {
	border: 1px solid black;
	background-color: white;
}

.carousel-indicators .active {
	background-color: black;
}

.table-responsive, #listInfo, #newsList {
	width: 560px;
	height: 280px;
}

.table-responsive th:nth-child(2) {
	width: 300px;
}

#newsList, #listInfo {
	display: inline-block;
}

#newsList {
	float: right;
}

table th {
	text-align: center;
}

#middle-2 {
	height: 280px;
}

#middle-2 .carousel-indicators {
	top: 220px;
	left: 520px;
}

#carousel-example-generic-width {
	height: 230px;
}
			
</style>

<script type="text/javascript">
		$(function() {
			
			$('.carousel').carousel({
				  wrap: "true"
			});
				
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
			});	// END AJAX
						
		}); // END JQUERY
	</script>
</head>

<body>
	<!-- 헤더 설정  -->
	<tiles:insertAttribute name="header" />
	<div id="middle-1">
		<div>
			<h4>오늘의 인기 상품</h4>
			<div id="carousel-example-generic-block" class="carousel slide"
				data-ride="carousel">

				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic-block" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic-block" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic-block" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div>
							<img class="center-block block">
						</div>
						<div class="text-center">
							<h3></h3>
						</div>
					</div>
					<div class="item">
						<div>
							<img class="center-block block">
						</div>
						<div class="text-center">
							<h3></h3>
						</div>
					</div>
					<div class="item">
						<div>
							<img class="center-block block">
						</div>
						<div class="text-center">
							<h3></h3>
						</div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic-block" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic-block" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div id="middle-2">
			<div id="listInfo">
				
					<h4>행사 안내</h4>
					<div id="carousel-example-generic-width" class="carousel slide"
						data-ride="carousel">

						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic-width" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic-width" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic-width" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<div>
									<img class="center-block width" src="/uploadStorage/event/2889D90184FF4377A8CA80ED720A082C.jpg">
								</div>
							</div>
							<div class="item">
								<div>
									<img class="center-block width" src="/uploadStorage/event/C2EA8071FA254019A1B7EB873AA31859.jpg">
								</div>
							</div>
							<div class="item">
								<div>
									<img class="center-block width" src="/uploadStorage/event/C350926620C5458383B7DDF7B0C19F8B.jpg">
								</div>
							</div>
						</div>
					</div>
			</div>
			<div id="newsList">
				<h4>공지 사항</h4>
				<c:import url="/news/newsList.do" />
			</div>
		</div>
	</div>

	<footer class="footer">
		<!-- 푸터 설정 -->
		<tiles:insertAttribute name="footer" />
	</footer>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
