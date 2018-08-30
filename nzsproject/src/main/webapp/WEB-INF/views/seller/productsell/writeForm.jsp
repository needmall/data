<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<link rel="stylesheet" type="text/css" href="/resources/include/css/productSellInsert.css" />
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {

	}); // End Jquery
</script>

<div>
	<div>
		<div id="addMarginCenter">
			<%-- 상품검색 --%>
			<form class="form-inline">
				<div class="form-group">
					<input type="text" id="p_name" class="form-control" name="p_name" placeholder="상품 검색" />
					<button type="button" id="searchBtn" class="btn btn-success">검색</button>
				</div>
			</form>
		</div>
		<div class="addTextRight">
			<button type="button" id="reqProductBtn" class="btn btn-danger addDisplayInline">상품등록 요청</button>
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
					<tr class="addTextCenter">
						<td colspan="5">상품을 검색 하십시요.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%-- 상품 선택정보 --%>
	<div class="">
		<div id="addTableSizeB" class="addDisplayInline addTextCenter">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th colspan="2">
							<div class="">
								<img alt="" src="" class="img-thumbnail">
							</div>
						</th>
					</tr>
					<tr>
						<td>
							<div class="">
								<p>상품명</p>
							</div>
						</td>
						<td>
							<div class="">
								<p>떡갈비 도시락</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="">
								<p>소비자 가격</p>
							</div>
						</td>
						<td>
							<div class="">
								<p>떡갈비 도시락</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="">
								<p>상품 설명<p>
							</div>
						</td>
						<td>
							<div class="">
								<p>떡갈비, 떡</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<%-- 판매 상품 정보 --%>
			<div>
				<form action="">
					<table>
						<tr>
							<td colspan="4"><input type="hidden" id="p_num" name="p_num" /></td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="form-group">
									<label class="control-label" for="ps_expiration">유통기한</label>
									<input type="datetime-local" id="ps_expiration" class="form-control" name="ps_expiration" min="" max="" aria-describedby="ps_expirationStatus" />
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_expirationStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="form-group">
									<label class="control-label" for="discount">할인율</label>
									<select id="discount" class="form-control" aria-describedby="discountStatus"></select>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="discountStatus" class="sr-only"></span>
								</div>
							</td>
							<td colspan="2">
								<div class="form-group">
									<label class="control-label" for="discount">판매 가격</label>
									<input type="text" id="ps_count" class="form-control" name="ps_count" aria-describedby="ps_countStatus"/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_countStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td colspan="4">
								<div class="form-group">
									<label class="control-label" for="ps_price">판매 수량</label>
									<input type="text" id="ps_price" class="form-control" name="ps_price" aria-describedby="ps_priceStatus"/>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<span id="ps_priceStatus" class="sr-only"></span>
								</div>
							</td>
						</tr>
						
					</table>
				</form>
			</div>
			<div>
				<button type="button" id="submitBtn" class="btn btn-primary btn-lg">등록</button>
				<button type="button" id="cancelBtn" class="btn btn-default btn-lg">취소</button>
			</div>
		</div>
	</div>
</div>
