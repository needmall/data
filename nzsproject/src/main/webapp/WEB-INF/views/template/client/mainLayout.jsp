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
/* div{border: 1px solid black;} */
body {
	width: 1140px !important;
	margin-left: auto;
	margin-right: auto;
	min-height: 100px;
}

.footer {
	margin-left: -380px !important;
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
	width: 560px;
	height: 261px !important;
	margin-left: auto;
	margin-right: auto;
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
.last_div{
	padding-top: 100px;
}
.container{
	margin-right: 0px;
	margin-left: 0px;
}
#middle-1 h4{
	margin-left: 10px;
}
</style>

<script type="text/javascript">
	$(function() {

		$('.carousel').carousel({
			wrap : "true"
		});

		$.ajax({
			url : "/admin/statistic/popItem.do", //전송 url
			type : "get", // 전송 시 method 방식				
			dataType : "json",
			success : function(result) {
				var cnt = 0;
				$(result).each(function() {

					var pi_image = this.pi_image;
					var p_name = this.p_name;
					
					addItem(pi_image, p_name);
					carousel(cnt);
					if (3 < cnt++) return false;
					
				});
				$("#carousel-example-generic-block").find(".carousel-inner").children(".item:eq(0)").addClass("active");
			},
			error : function() { //실행시 오류가 발생하였을 경우
				alert("시스템 오류 입니다. 관리자에게 문의하세요!!");
			}
		}); // END AJAX
		$.ajax({
			url:"/mypage/recentItem.do",
			type : "get", // 전송 시 method 방식				
			dataType : "json",
			success : function(result) {
				var cnt = 0;
				$(result).each(function() {

					var pi_image = this.pi_image;
					var p_name = this.p_name;
					var ps_num = this.ps_num;
					var add = $("#recently_item");
					addRecentItem(pi_image, p_name,ps_num,add);
				});
			}
		})
		$.ajax({
			url:"/mypage/sellItem.do",
			type : "get", // 전송 시 method 방식				
			dataType : "json",
			success : function(result) {
				var cnt = 0;
				$(result).each(function() {

					var pi_image = this.pi_image;
					var p_name = this.p_name;
					var ps_num = this.ps_num;
					var add = $("#sell_item");
					addRecentItem(pi_image, p_name,ps_num,add);
				});
			}
		})
	}); // END JQUERY
	function carousel(c){
		var li = $("<li data-target='#carousel-example-generic-block' data-slide-to="+c+" class='active'></li>")
		$("#carousel").append(li);
	}
	function addRecentItem(pi_image, p_name,ps_num,add){
		var div= $("<div class='col-xs-6 col-md-3' style='width: 146px; height: 150px;'>");
		var a = $("<a href='/productdetail/productdetailmain.do?ps_num="+ps_num+"' class='thumbnail'>");
		var img =$("<img src='/uploadStorage/product/"+pi_image+"' style='width: 100%; height: 100px;'>");
		a.append(img);
		div.append(a);
		
		add.append(div);
	}
	function addItem(pi_image, p_name) {
		var div_item = $("<div style='width: 100%; height: 100%;'>");
		div_item.addClass("item");

		var div_img = $("<div>");
		var img = $("<img style='width: 55%; height:55%'>");
		img.attr("src", "/uploadStorage/product/" + pi_image);
		img.addClass("center-block block");

		var div_h3 = $("<div>");
		div_h3.addClass("text-center")
		var h3 = $("<h3>");
		h3.html(p_name);

		div_h3.append(h3);
		div_img.append(img);
		div_item.append(div_img).append(div_h3);
		$("#carousel-example-generic-block").find(".carousel-inner").append(div_item);

	}
</script>
</head>


<body>
	<!-- 헤더 설정  -->
	<tiles:insertAttribute name="header" />
	<div >
		<div id="middle-1">
			<div>
				<h4>오늘의 인기 상품</h4>
				<div id="carousel-example-generic-block" class="carousel slide" data-ride="carousel">

					<!-- Indicators -->
					<ol class="carousel-indicators" id="carousel">
						
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox"></div>
				</div>
			</div>
		</div>
		
		<h4>가장 가격이 싼 상품 Top8</h4>
		<div class="row" id="sell_item" ></div>

		<h4>유통기한이 가장 많이 남은 상품</h4>
		<div class="row" id="recently_item" ></div>
		
		<br>
		
		<div id="middle-2">
			<div id="listInfo">
				<h4>행사 안내</h4>
				<div id="carousel-example-generic-width" class="carousel slide"
					data-ride="carousel">

					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic-width"
							data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic-width"
							data-slide-to="1"></li>
						<li data-target="#carousel-example-generic-width"
							data-slide-to="2"></li>
					</ol>
					
					
					

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div>
								<img class="center-block width"
									src="/uploadStorage/event/2889D90184FF4377A8CA80ED720A082C.jpg">
							</div>
						</div>
						<div class="item">
							<div>
								<img class="center-block width"
									src="/uploadStorage/event/C2EA8071FA254019A1B7EB873AA31859.jpg">
							</div>
						</div>
						<div class="item">
							<div>
								<img class="center-block width"
									src="/uploadStorage/event/C350926620C5458383B7DDF7B0C19F8B.jpg">
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
	<div class="last_div"></div>
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
