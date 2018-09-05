<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	
		<title>Insert title here</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
         
        <link rel="shortcut icon" href="/resources/image/icon.png" />
        <link rel="apple-touch-icon" href="/resources/image/icon.png" />
        
        <!-- ★★ jQuery 쓰려면 무조건 정의 해줘야함! ↓↓↓ -->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="/resources/include/js/common.js"></script>
        
                   
	</head>
	<body>
		<c:choose>
			<c:when test="${c_id != null and c_id != ''}">
				<label>[ ${c_name} ] 님의 아이디는 </label>
				<strong>${c_id}</strong> 입니다.
			</c:when>
			<c:when test="${s_id != null and s_id != ''}">
				<label>[ ${s_name} ] 님의 아이디는 </label>
				<strong>${s_id}</strong> 입니다.
			</c:when>
		</c:choose>
				
	</body>
</html>