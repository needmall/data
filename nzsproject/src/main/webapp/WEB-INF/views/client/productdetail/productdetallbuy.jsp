<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- Modal -->
		<div class="modal fade bs-example-modal-lg"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" style="width: 1500px;" >
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">상품 구매 페이지</h4>
		      </div>
		      <div class="modal-body">
		       	 <div class="container-fluid">
<!-- 		       	 이것은 상품 및 가격///////////////////////////////////////////////////////////////// -->
					<div class="row">
						<div class="col-md-4" style="width: 20%">
			            	<label>상품이름</label>
			                <img src="/uploadStorage/product/product_1532500063152_9A0D35E8009C43C09C47A06F9B2AFD65.jpg" width="150px" height="150px;">
			            </div>
		
			             <div class="col-xs-4 col-sm-6" style="padding-top: 50px; width: 65%">
			             	<label style="width: 85%">상품정보z: 하절기 프리미엄 보양식 민물장어 5만개 한정운영 구성:민물장어  인삼밥 수삼 장어 밑반찬 : 마늘절임, 초생강, 양파절임, 장어소스2종+매콤불고기</label>
			             </div>
		
			            <div class=".col-md-4 .col-md-offset-4" style="padding-top: 50px;">
							 <label>가격 : 100,000원 // 개수:5개</label>
							 <p>유통기한 2018-08-24:00:00:00 </p>
						</div>
			        </div>
			                <!-- 		 이것은 동적 버튼 4개당 하나씩 if(4개+1 이면 )버튼 하나 추가///////////////////////////////////////////////////////////////// -->
		
					<div class="col-xs-4 col-sm-6" style="text-align: center; width: 100%; padding-bottom: -150px; padding-top: -150px">
		            	<button>2</button>
		            </div>						
				    
				    <br/><hr/>
			                
					<div class="row">
						<div class=".col-xs-8 .col-sm-6 .col-md-offset-4" style="width: 100%; text-align: right;">
						<label class="bg-info">총 가격 : 100,000,00원 // 총 개수  : 502개</label>

						</div>
					</div>
					
				<!-- 					//커트라인 -->
				</div>
			</div>
			<!-- 		밑에 버튼 ///////////////////////////////////////////////////////////////// -->
          
		    <div class="modal-footer">
		      	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		      	<button type="button" class="btn btn-primary">결제</button>
		    </div>
			<!-- 		끝 ///////////////////////////////////////////////////////////////// -->
		    </div>
		  </div>
		</div>