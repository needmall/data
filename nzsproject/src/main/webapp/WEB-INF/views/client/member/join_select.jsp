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
          			location.href="/member/join_seller.do"
          		});
          	});
          </script> 
      </head>
<body>
	<input type="button" id="customer" value="고객">
	<input type="button" id="seller" value="판매자">
	<!-- client-setting.xml 안맞아서 404 및 500 떴었음 -->
</body>
</html>