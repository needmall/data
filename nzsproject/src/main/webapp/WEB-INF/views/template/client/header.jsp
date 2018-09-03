<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="container"> 
  <!-- Static navbar -->
    <nav class="navbar navbar-default navbar-static-top"> <!-- navbar-default  -->
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarup" aria-expanded="false" aria-controls="navbarup">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span>
		    <span class="icon-bar"></span>
		    <span class="icon-bar"></span>
		    <span class="icon-bar"></span>
		  </button>
          <a class="navbar-brand" href="#">Need Mall</a>
        </div>
        <div id="navbarup" class="navbar-collapse collapse">
          <c:choose>
          <c:when test="${login.c_id != null and login.c_id != ''}">
          	<ul class="nav navbar-nav navbar-right">
	            <li><a href="#"><strong>[고객]${login.c_name}</strong></a></li>
	            <li><a href="/member/logout.do">로그아웃</a></li>
	            <li><a href="#">고객센터</a></li>            
	            <li><a href="/productsell/list.do">셀러오피스</a></li>
	            <li><a href="#"> </a></li>
          	</ul>
          </c:when>
          <c:when test="${login.s_id != null and login.s_id != ''}">
          	<ul class="nav navbar-nav navbar-right">
	            <li><a href="#"><strong>[판매자]${login.s_name}</strong></a></li>
	            <li><a href="/member/logout.do">로그아웃</a></li>
	            <li><a href="#">고객센터</a></li>            
	            <li><a href="/productsell/list.do">셀러오피스</a></li>
	            <li><a href="#"> </a></li>
          	</ul>
          </c:when>
          <c:otherwise>
          	<ul class="nav navbar-nav navbar-right">
	            <li><a href="/member/login.do">로그인</a></li>
	            <li><a href="/member/join_select.do">회원가입</a></li>
	            <li><a href="#">고객센터</a></li>            
	            <li><a href="/productsell/list.do">셀러오피스</a></li>
	            <li><a href="#"> </a></li>
          	</ul>
          </c:otherwise>
          </c:choose>
          
          
        </div><!--/.nav-collapse -->
	  </div>
	  <div><img src="/resources/images/needmall.png" height="90px" />
		<!-- <input type="text" value="검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   " ><input type="button" value="나의정보"><input type="button" value="장바구니"> -->	 
	  <img src="/resources/images/search.png" height="90px" />
	  </div>
	  
	  <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
      <li><a href="/productall/productList.do">전체 상품</a></li>
      <li><a href="/storeall/storeall.do">전체 스토어</a></li>
      <li><a href="/mypage /mypageList.do">이벤트</a></li>
    </ul>
    </nav> 
</div>