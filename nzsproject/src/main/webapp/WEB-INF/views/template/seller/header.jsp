<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>

<div class="container">	
  <!-- Static navbar -->
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarup" aria-expanded="false" aria-controls="navbarup">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Need Mall</a>
        </div>
        <div id="navbarup" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">로그인</a></li>
            <li><a href="#">회원가입</a></li>
            <li><a href="#">고객센터</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">셀러오피스 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">셀러존</a></li>
                <li><a href="#">스토어 관리</a></li>        
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav> 
  
  <div><img src="/resources/images/needmall.png" height="140px" /><input type="text" value="검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   검색창 위치   " ><input type="button" value="나의정보"><input type="button" value="장바구니"></div>
   <div class="navbar-header">    
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
  </div>
  <div id="navbar" class="collapse navbar-collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
      <li><a href="#">전체 상품</a></li>
      <li><a href="#">전체 스토어</a></li>
      <li><a href="#">이벤트</a></li>    
    </ul>
  </div><!--/.nav-collapse -->
</div>