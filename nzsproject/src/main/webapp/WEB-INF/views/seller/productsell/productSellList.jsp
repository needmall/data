<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
	$(function() {
		
		//pi_image, p_name, p_price, p_content, 
		
		/* 상품 등록 페이지 이동 */
		$("#reqProductBtn").click(function() {
			location.href = "/productsell/productinsert.do";
		});
		
	}); // End Jquery
</script>
<div>
	<div class="addTextRight">
			<button type="button" id="reqProductBtn" class="btn btn-danger addInline-block">상품등록</button>
	</div>
	<div id="addTableSizeA">
		<%-- 검색결과 --%>
		<table class="table table-striped">
			<thead>
				<tr class="addTextCenter">
					<th>번호</th>
					<th>이미지</th>
					<th>이름</th>
					<th>가격</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr class="addTextCenter new_item">
					<td colspan="5">상품을 검색 하십시요.</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>