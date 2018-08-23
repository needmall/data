<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <html>
      <head>
      <meta charset="UTF-8" />
      
         <title>회원가입 완료 화면</title>
         
         <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
         <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         <meta http-equiv="refresh" content="8; url=/member/login.do">
         <!-- ↑↑ 8초후 login.do로 이동 ↑↑ -->
         
          <link rel="shortcut icon" href="/resources/image/icon.png" />
          <link rel="apple-touch-icon" href="/resources/image/icon.png" />
          
          <!-- ★★ jQuery 쓰려면 무조건 정의 해줘야함! ↓↓↓ -->
		  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
           
      </head>
      <body>
         <div class="contentContainer">
         	<div class="well">
         		<div class="tac">
         			NEED MALL 에 회원 가입해 주셔서 감사합니다.<br />
         			<span id="text">(8초후에 자동으로 로그인 화면으로 이동합니다.)</span>
         		</div>
         	</div>
         </div>
      </body>
</html>