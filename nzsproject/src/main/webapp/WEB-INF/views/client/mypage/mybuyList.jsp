<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%--<%@ page isElgnored="true"%> --%>
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
	<script type="text/javascript" src="/resources/include/js/jquery.paging.js"></script>
	
	<style type="text/css">

	</style>
	
	<script type="text/javascript">
		$(function() {
			
			
			var value =${value};
			var total = parseInt(value/10);
			console.log(total);
		
			jQuery('#document_navi').jaPageNavigator({
				page_row : "10" // 보여질 게시물 목록 수
			  	, page_link : total // 보여질 페이지 링크 수
			  	, total_count : "${value}" // 게시물 총 수
			  	, url :"/mypage/mypageList.do"
			  	
			}); 
			$(".goDetail td :not(:nth-last-child(1),:nth-last-child(2),:nth-last-child(3),:nth-last-child(4))").click(function() {					 //, :nth-last-child(2))
				var ps_num = $(this).parents("tr").attr("data-num");				
				location.href="/productdetail/productdetailmain.do?ps_num="+ps_num;	
			});	
		

			
			$(".btn_confirm").click(function() {
				if(confirm("정말 수령 하시겠습니까?")){
					
					var b2_num = $(this).parents("tr").attr("data-b2_num");
					console.log("b2_num" + b2_num)
					$.ajax({
						url :"/mypage/cartConfirmUpdate.do",
						type: "post",
						data: "b_confirm="+1+"&b2_num="+b2_num,
						dataType: "text",
						success: function() {
							console.log("성공");
						}
					})
				}
			})

		})
	</script>
</head>
<body>
	<div class="item_succes"><span>구매 성공 내역</span></div>
	<hr/>
	<div style="text-align: right ;"><input type="date"></div>
		<table class="table table-striped table-hover">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="50%">
				<col width="5%">
				<col width="8%">
				<col width="8%">
				<col width="7%">
				<col width="7%">
			</colgroup>
			<tbody>
				<tr>
					<td>번호</td>
					<td>물품명</td>
					<td>물품설명</td>
					<td>수량</td>
					<td>가격</td>
					<td>구입일</td>
					<td>리 뷰</td>
					<td>수령확인</td>
				</tr>
				
				<c:choose>
					<c:when test="${not empty buylist}">
							<c:forEach var="buy" items="${buylist}" varStatus="status">
								<tr class="tr_list goDetail" data-num ="${buy.ps_num}" data-b2_num = "${buy.b2_num}" data-p_num ="${buy.p_num}" data-s_num ="${buy.s_num}">
									<td><div class="list_td">${status.count}</div> </td>
									<td><div ><img class="img-thumbnail" src="/uploadStorage/product/${buy.pi_image }" width="70px" height="50px;"/></div></td>
									<td><div class="list_td2" style="text-align: left;"><p><label>${buy.p_name}</label></p>${buy.p_content}</div></td>
									<td ><div class="list_td">${buy.b_count }개</div></td>
									<td>
										<div class="list_td3">
											<span class="span_count format-money" style="text-decoration: line-through;"> ${buy.original_multiply_count}</span>원<br/>
											<span class="span_count format-money"> ${buy.multiply_count}</span>원
										</div>
									</td>
									<td><div class="list_td">${buy.b1_date} </div>
									<td>
										<div class="list_td3">
											<button type="button" class="btn btn-default" id="btn_serviceR" data-toggle="modal" data-target="#galleryModal" data-whatever="@mdo">서비스 리뷰</button>
											<button type="button" class="btn btn-default" id="btn_sellerR" data-toggle="modal" data-target="#galleryModal" data-whatever="@mdo">판매자 리뷰</button>
										</div>
									</td>
									<td>
										<div class="list_td">
											<c:if test="${buy.b_confirm==0 }">
												<input type="button" class="btn_confirm" name="btn_confirm" value="수령">
											</c:if>
											
											<c:if test="${buy.b_confirm==1 }">
												<span class="label label-danger">수령</span>
											</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<th colspan="5" class="tac">구매하신 물품이 존재하지않습니다.</th>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	<div id="document_navi">
	  <a class="start" href="#">&nbsp;처음</a>
	  <a class="prev" href="#">&nbsp;이전&nbsp;({page_link})</a>
	  <a class="prevpage" href="#">이전&nbsp;</a>
	
	  <!-- 페이지 번호 링크가 노출되는 영역 -->
	  <span class="pageaction"></span>
	  <!-- 페이지 번호 링크 태그 -->
	  <a class="num" href="">{page}</a>
	  <!-- 현재 페이지 번호 태그 -->
	  <strong class="now">{page}</strong>
	  <!-- 페이지 링크 구분 태그 -->
	  <span class="div">&nbsp;</span>
	
	  <a class="nextpage" href="#">다음&nbsp;</a>
<!-- 					  <a class="next" href="#">다음&nbsp;({page_link})&nbsp;</a> -->
	  <a class="end" href="#">끝&nbsp;</a>
	</div>
		         	<%-- 갤러리 등록 화면 영역(modal) --%>
	<div class="modal fade" id="galleryModal" tabindex="-1" role="dialog" aria-labelledby="galleryModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="galleryModalLabel">title</h4>
	      </div>
	      <div class="modal-body">
	        <form id="f_writeForm" name="f_writeForm">
	          <div class="form-group">
	            <label for="g_name" class="control-label">작성자</label>
	            <input type="text" class="form-control" name="g_name" id="g_name" maxlength="5" />
	          </div>
	        
		      <div class="form-group">
		            <label for="g_content" class="control-label">글내용</label>
		            <textarea class="form-control" name="g_content" id="g_content" ></textarea>
		      </div>
		      <div class="form-group">
		            <label for="file" class="control-label">이미지</label>
		            <input type="file" name="file" id="file" />
		      </div>
	      	</form>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal" >닫기</button>
	      	<button type="button" class="btn btn-primary" id="galleryInsertBtn" >등록</button>	
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>