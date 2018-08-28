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

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-2">
          <ul class="nav nav-pills flex-column">
            <i class="fa fa-home fa-home text-dark fa-2x p-2">MyPage</i>
            <a class="btn btn-info" href="#">회원정보</a>
            <li class="nav-item text-dark">
              <a class="nav-link text-dark" href="#">수정</a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link text-dark">탈퇴</a>
            </li>
            <a class="btn btn-info" href="#">구매목록</a>
            <li class="nav-item text-dark">
              <a class="nav-link text-dark" href="#">구매 상황</a>
            </li>
            <li class="nav-item text-dark">
              <a class="nav-link text-dark" href="#">월 별</a>
            </li>
            <a class="btn btn-info" href="#">장바구니</a>
            <li class="nav-item">
              <a class="nav-link text-dark" href="#">My 장바구니</a>
            </li>
            <a class="btn btn-info" href="#">리뷰</a>
            <li class="nav-item">
              <a class="nav-link text-dark" href="#">My 리뷰
                <br>
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-10">
          <div class="blockquote">
			<table class="table-striped table-hover">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						
					</colgroup>
					<tr>
						<td>번호</td>
						<td>상품</td>
						<td>설명</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>상품</td>
						<td>설명</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>상품</td>
						<td>설명</td>
						<td>상태</td>
					</tr>
			</table>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>