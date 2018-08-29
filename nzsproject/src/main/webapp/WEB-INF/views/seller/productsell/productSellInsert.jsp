<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {

	}); // End Jquery
</script>

<div>
	<div>
		<div>
			<%-- 상품검색 --%>
			<form>
				<input type="text" id="p_name" name="p_name" />
				<button type="button" id="searchBtn">검색</button>
			</form>
		</div>
		<div>
			<button type="button">상품등록 요청</button>
		</div>
		<div>
			<%-- 검색결과 --%>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>이미지</th>
						<th>이름</th>
						<th>가격</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<%-- 상품 선택정보 --%>
	<div class="">
		<div class="">
			<table>
				<tbody>
					<tr>
						<th colspan="2">
							<div class="">
								<img alt="" src="">
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
							<td>유통기한</td>
							<td colspan="3"><input type="date" id="ps_expiration" name="ps_expiration" /></td>
						</tr>
						<tr>
							<td>할인율</td>
							<td><select id="discount"></select></td>
							<td>소비자 가격</td>
							<td><input type="text" id="ps_count" name="ps_count" /></td>
						</tr>
						<tr>
							<td>판매 수량</td>
							<td colspan="3"><input type="text" id="ps_price" name="ps_price" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div>
				<button type="button" id="submitBtn">등록</button>
				<button type="button" id="cancelBtn">취소</button>
			</div>
		</div>
	</div>
</div>
