<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 치신 버전의 방식으로 HTML 보여주도록 설정 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

<!-- 모바일 웹페이지 설정 -->
<!-- viewport : 화면에 보이는 영역을 제어하는 기술, width는 device-width로 설정, initial-scale는 초기비율 -->
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">

<link rel="shortcut icon" href="/resources/images/common/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />

<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스 필터를 적용하면 된다. -->
<!-- [if lt IE 9]> <script src="/resources/include/js/html5shiv.js"></script> <![endif]-->


<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css">
<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css">

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript" src="/resources/include/jquery/common.js"></script>

<script type="text/javascript">
	(function() {

	}); // End Jquery
</script>
</head>
<body>
	<div class="main_prodlist main_prodlist_list">
		<ul class="product_list">
			<li>
				<div class="prod_main_info">
					<div>
					
					</div>
					<div>
					
					</div>
					<div>
					
					</div>
					<div>
					
					</div>
					<div>
					
					</div>
				</div>
			</li>
			
			
		</ul>
	</div>

	<%-- <table class="table">
				<tbody id="list">
					<tr>
						<td>번호 </td>
						<td>제목</td>
						<td>작성일</td>
						<td>작성자</td>
					</tr>
					<c:choose>
						<c:when test="${not empty productFavList}" >
							<c:forEach var="board" items="${productFavList}" varStatus="status">
								<tr class="tac">
									<td>${board.si_image}</td>
									<td class="goDetail tal">${board.st_name}</td>
									<td>${board.pi_image}</td>
									<td class="name">${board.p_name}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table> --%>
</body>
</html>