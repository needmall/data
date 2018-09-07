<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta charset="UTF-8" />
      
         <title>회원가입</title>
         
         <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
         <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         
          <link rel="shortcut icon" href="/resources/image/icon.png" />
          <link rel="apple-touch-icon" href="/resources/image/icon.png" />
          
          <!-- ★★ jQuery 쓰려면 무조건 정의 해줘야함! ↓↓↓ -->
		  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
          <script type="text/javascript" src="/resources/include/js/common.js"></script>
          <!-- <script type="text/javascript" src="/resources/include/js/join.js"></script> -->
          
          <script type="text/javascript">
          	$(function(){
          		$("#customer").click(function(){
          			location.href="/member/join_customer_agreement.do"
          		});
          		$("#seller").click(function(){
          			location.href="/member/join_seller_agreement.do"
          		});
          	});
          </script> 
          
        <style type="text/css">
        #btnArea{text-align: center;}
   			.btn{ margin:30px; font-size: 50px; width: 300px; height: 200px;}
		</style>
      </head>
<body>
	<div id="btnArea">
		<input type="button" class="btn btn-default" id="customer" value="고 객 ">
		<input type="button" class="btn btn-default" id="seller" value="판 매 자">
	</div>	
</body>
</html>