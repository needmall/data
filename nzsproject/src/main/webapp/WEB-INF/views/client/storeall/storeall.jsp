<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<!-- 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services"></script>
<!-- services와 clusterer 라이브러리 불러오기 -->
<!-- clusterer: 마커를 클러스터링 할 수 있는 클러스터러 라이브러리 입니다.
      services: 장소 검색 과 주소-좌표 변환 을 할 수 있는 services 라이브러리 입니다.
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services,clusterer"></script> -->

<style type="text/css">
	*{
		margin: 0px;
		padding:0px;
	}
	
	label{
		padding: 10px;
	}
	#yourlocation{
		width: 300px !important;
		text-align: center;
	}
	#address{
		width: 400px !important;
	}

	.form-group{
		padding: 10px;
		margin-left: 30px;	
	}
	
	
	#storeList{		
		padding-left: 0px ;	
	}
	.listarea{
		border :  1px solid #efefef;
		height: 665px;
		width: 450px;
		overflow-y: scroll;
		float: left;
	}
	.text{
		padding-left : 10px;
	}
	
	.img{
		width: 80px;
		margin: auto;
	}
	
	.imgDiv{
		width: 90px;
		height: 90px;		
		float: left;			
	}
	
	#map{
		width: 665px;
		height: 665px;
	}
	
	.clearboth{clear: both;}
	/* 여기부터 제품 목록에 대한 css */
	
	#productsList{
		width:1100px;		
		margin-left: auto; 
		margin-right: auto;	
	}
	.align-center {
		text-align : center; 
	}

	.jb-th-1 {
		width : 70px;
		padding : 10px 0px;
	}
	.jb-th-2 {
		width : 30px;		
	}

	.fileImageLogo {
		width: 70px;
		height: 40px;
	}
	
	.fileImageProduct {
		width: 70px;
		height: 70px;
	}
	.review_num:before {
	  content: "|";
	  color: #d9d9d9;
	}
	.p_price {
		text-decoration : line-through;
	}
	ul {
		list-style-type : none;
	}
	tr {
		width: 520px;
		
	}
	td {	
		padding-left	: 7px;
		padding-right	: 7px; 
	}
	
	ul {
		padding	: 0px;
		margin	: 0px;
	}
	.col-md-6 {
		width: 530px;
		padding: 5px;
	}
	.contract{ 	
		margin: 10px;
	}
	h4{
		padding-top: 20px;
	}
	
</style>


<!-- 즐겨 찾기 매장 띄우기 -->
<jsp:include page="favStore.jsp"></jsp:include>
<!-- 당신의 위치 -->
<div class="form-inline clearboth">
	<div class="form-group">
		<label for="yourlocation"> 검색된 지역  </label>
		<input class="form-control" type="text" id="yourlocation" readonly="readonly">
	</div>
	<div class="form-group" >
		<label for="address">매장 검색 지역  </label>				
		<input class="form-control" type="text" id="address" name="address" placeholder="검색할 지역을 입력하세요(예, 성동구 도선동)">
		<input class="btn btn-default" type="button" id="search" value="변 경">
	</div>
	
</div>

<div class="container center-block">
	<!--  목록 영역   -->
	<div class="listarea">
		<ul id="storeList">			
		</ul>
	</div>
	
	<!-- 지도 영역 -->
	<div id="map"  ></div>
</div>	
<input type="hidden" name="c_lat" id="c_lat">
<input type="hidden" name="c_lon" id="c_lon"> 

<!-- 상품 영역 -->
<div id="productsList"></div>


<script type="text/javascript">
		// 맵 변수
		var map;
	
		// 선택된 마커를 담을 변수
		var selectedmarker;		
		
		// 선택된 마커 이미지
		var selectedmarkerImage;
		
		
		$(function() {
			/* 즐겨찾기 매장 클릭하면 리스트 출력 */
			$(document).on("click",".selectStore",function(){
				var stnum=$(this).attr("data-num");
				var stname=$(this).find(".stname").html();
				//목록 선택되면 실행
				var url = "/storeall/storeProducts.do?st_num="+stnum;
				
				/* 상품 초기화 */
				$("#productsList").html("");
				$("#productsList").append("<h4 class='h4color selectedstname'>판매 제품 목록: "+stname+"</h4>");
				
				
				$.getJSON(url, function(data) {
					
					if(data == ""){
						$("#productsList").html("<h4>해당 매장에서 판매중인 상품이 없습니다.</h4>");
					}else{
						$(data).each(function() {					
							var ps_num = this.ps_num;
							var si_image = this.si_image;
							var st_name = this.st_name.replace(/\s/, "<br>");
							var pi_image = this.pi_image;
							var p_name = this.p_name;
							var p_price = this.p_price;
							var ps_expiration = this.ps_expiration;
							var ps_count = this.ps_count;
							var ps_price = this.ps_price;
							var prv_count = this.prv_count;
							var prv_scope = this.prv_scope;
							var distance = this.distance;					
							
							/* 목록 생성 */
							addProducts(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope);
							
						});
					}
				}).fail(function() {
					alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				});
			});
			
			getlist();
			/* 지도를 띄우는 코드 */
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new daum.maps.LatLng(37.562307, 127.035154), //지도의 중심좌표.(기본 위치는 회사위치)
				level : 3
			//지도의 레벨(확대, 축소 정도)
			};
			map = new daum.maps.Map(container, options); //지도 생성 및   객체 리턴
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			
			//여러개 출력시
			// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
			var markers = [];
			
			//현위치 마커 이미지 만들기
			var imageSrc = '/resources/images/imgmarker0.png', // 마커이미지의 주소입니다    
			imageSize = new daum.maps.Size(37, 50), // 마커이미지의 크기입니다
			imageOption = {
				//offset : new daum.maps.Point(27, 69)
				offset : new daum.maps.Point(17, 43)
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);			

			// 선택된  마커 이미지 만들기
			var selectedimageSrc = '/resources/images/imgmarker.png'; // 마커이미지의 주소입니다	
			// 선택된 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			selectedmarkerImage = new daum.maps.MarkerImage(selectedimageSrc, imageSize, imageOption); 
		
									
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				 navigator.geolocation.getCurrentPosition(function (position) {					 
					var lat = position.coords.latitude;
					var lon = position.coords.longitude;
					 $("#c_lat").val(lat);
					 $("#c_lon").val(lon);
					 
					// 이동
					panTo(lat, lon);
					
					// 행정동 표시
					// 좌표로 행정동 주소 정보를 요청합니다
					geocoder.coord2RegionCode(lon, lat, getAddress);
					$("#yourlocation").show();
					
					var url = "/storeall/storelist.do?c_lat="+lat+"&c_lon="+lon;
					$.getJSON(url, function(data) {
						$("#storeList").html("");  // 목록 초기화
																		
						// 이미지 마커를 생성합니다
						var marker = new daum.maps.Marker({
							position :  new daum.maps.LatLng(lat, lon),
							title : '매장 검색 기준',
							image : markerImage
						});
						//  이미지 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
																						
						// 이미지 생성된 마커를 배열에 추가합니다
						markers.push(marker);
												
											
						//불러온 데이터 처리
						$(data).each(function() {
							var st_num = this.st_num;
							var st_lat = this.st_lat;
							var st_lon = this.st_lon;
							var si_image = this.si_image;
							var st_name = this.st_name;
							var st_address = this.st_address;
							var distance = this.distance+"m";
													
							//목록 생성
							addNewItem(st_num, st_lat, st_lon,si_image, st_name, st_address, distance, map);
							
							// 마커들을 지도위에 표시합니다																				
							// 마커를 생성합니다
							var marker = new daum.maps.Marker({
								position : new daum.maps.LatLng(st_lat, st_lon),
								title :st_name
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
																							
							// 생성된 마커를 배열에 추가합니다
							markers.push(marker);
							
						});
						}).fail(function() {
							alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
					});
					 
				});				
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다	
								
			}
			
						
			// 검색해서 해당 위치로 이동, 목록 , 마커 생성
			$("#search").click(function() {						
				
				//마커 초기화
				for ( var i = 0; i < markers.length; i++ ) {
					   markers[i].setMap(null);
					 } 
					 markers = [];
					 
				// 주소로  위도 경도 찍기
				geocoder.addressSearch($("#address").val(), function (result, status) { // 주소 검색으로 나오는 첫번째 결과를  위도 경도로 받아오기
				
					if (status === daum.maps.services.Status.OK) {						
						var lat = result[0].address.y
						var lon = result[0].address.x						
						$("#c_lat").val(lat);
						$("#c_lon").val(lon);
						
						// 이동
						panTo(lat, lon);
						
						// 행정동 표시
						// 좌표로 행정동 주소 정보를 요청합니다
						geocoder.coord2RegionCode(lon, lat, getAddress);
						$("#yourlocation").show();
						
						var url = "/storeall/storelist.do?c_lat="+lat+"&c_lon="+lon;
						$.getJSON(url, function(data) {
							$("#storeList").html("");  // 목록 초기화
														
							// 이미지 마커를 생성합니다
							var marker = new daum.maps.Marker({
								position :  new daum.maps.LatLng(lat, lon),								
								title : '매장 검색 기준',
								image : markerImage
							});
							//  이미지 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
																							
							// 이미지 생성된 마커를 배열에 추가합니다
							markers.push(marker);
				
							//불러온 데이터 처리
							$(data).each(function() {
								var st_num = this.st_num;
								var st_lat = this.st_lat;
								var st_lon = this.st_lon;
								var si_image = this.si_image;
								var st_name = this.st_name;
								var st_address = this.st_address;
								var distance = this.distance+"m";
														
								//목록 생성
								addNewItem(st_num, st_lat, st_lon,si_image, st_name, st_address, distance, map);
								
								// 마커들을 지도위에 표시합니다																				
								// 마커를 생성합니다
								var marker = new daum.maps.Marker({
									position : new daum.maps.LatLng(st_lat, st_lon),
									title :st_name
								});

								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
																								
								// 생성된 마커를 배열에 추가합니다
								markers.push(marker);
								
							});
														
						}).fail(function() {
							alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
						});
											
					}
				
					// 주소 초기화
					$("#address").val("");
				});		
				
			});	//검색해서 해당 위치로 이동, 목록 , 마커 생성 마지막		
			
			
			
					
		}); // 최상위 마지막
		
		// 해당 위도경도 위치로 이동
		function panTo(st_lat, st_lon) {					
			
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new daum.maps.LatLng(st_lat, st_lon);
			
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}	
		
		// 매장 목록 추가하기 함수
		function addNewItem(st_num, st_lat, st_lon,si_image, st_name, st_address, distance) {
					
			// 새로운 글이 추가될 li태그 객체
			var new_li =$("<li>");
			new_li.attr("data-st_num",st_num);
			new_li.addClass("list-group-item");
			
			// 클릭하기 위한 a태그
			var new_a = $("<a>");
			new_a.attr("href","javascript:selectList("+st_lat+","+st_lon+","+st_num+",'"+st_name+"')");
			new_a.addClass("list-group-item");
			
			// 전체 div
			var new_div = $("<div>");
			new_div.addClass("listDiv");
			
			// img Div
			var img_div =$("<div>");
			img_div.addClass("imgDiv");
			
			// img 생성
			var img = $("<img>");
			img.attr("src","/uploadStorage/store/"+si_image);
			img.addClass("img");
			
			// 내용 div
			var condiv = $("<div>");
			condiv.addClass("text");
			
			// 상호 <p>
			var name = $("<p>");
			name.html(st_name);
			
			// 주소 <p>
			var address = $("<p>");
			address.html(st_address);
			
			// 거리 <p>
			var m = $("<p>");
			m.html("거리 :"+distance.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
				
			//조립하기
			condiv.append(name).append(address).append(m);
			img_div.append(img);
			new_div.append(img_div).append(condiv);
			new_a.append(new_div);
			new_li.append(new_a);		
			$("#storeList").append(new_li);
			
		}
		
		// 목록 선택이 이동, 선택된 마커 오버레이
		function selectList(st_lat, st_lon,st_num, st_name) {					
			// 선택된 마커를 담을 변수 삭제하기
			if(selectedmarker!=null)selectedmarker.setMap(null);
				
			
			// 이미지 마커를 생성합니다
			selectedmarker = new daum.maps.Marker({
				position :  new daum.maps.LatLng(st_lat, st_lon),
				title : st_name,
				image : selectedmarkerImage
			});
			
			
			//  이미지 마커가 지도 위에 표시되도록 설정합니다
			selectedmarker.setMap(map);
		
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new daum.maps.LatLng(st_lat, st_lon);
			
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
			
			//목록 선택되면 실행
			var url = "/storeall/storeProducts.do?st_num="+st_num;
			
			/* 상품 초기화 */
			$("#productsList").html("");
			$("#productsList").append("<h4 class='h4color selectedstname'>판매 제품 목록: "+st_name+"</h4>");
			
			
			$.getJSON(url, function(data) {
				
				if(data == ""){
					$("#productsList").html("<h4>해당 매장에서 판매중인 상품이 없습니다.</h4>");
				}else{
					$(data).each(function() {					
						var ps_num = this.ps_num;
						var si_image = this.si_image;
						var st_name = this.st_name.replace(/\s/, "<br>");
						var pi_image = this.pi_image;
						var p_name = this.p_name;
						var p_price = this.p_price;
						var ps_expiration = this.ps_expiration;
						var ps_count = this.ps_count;
						var ps_price = this.ps_price;
						var prv_count = this.prv_count;
						var prv_scope = this.prv_scope;
						var distance = this.distance;					
						
						/* 목록 생성 */
						addProducts(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope);
						
					});
				}
			}).fail(function() {
				alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
			});
		}	
	
		
		//목록이 선택되면 매장 뿌려주기
		/* 주소 검색 주변매장 동적 생성 */
	function addProducts(ps_num, si_image, st_name, pi_image, p_name, p_price, ps_expiration, ps_count, ps_price, prv_count, prv_scope, distance) {
		/* 상품 할인율 계산 */					
		var disRate = Math.round((p_price - ps_price) / p_price * 100);			
		var new_div_contract = $("<div>");
		new_div_contract.addClass("col-md-6 list-group-item contract discount");

		var new_a_clearfix = $("<a>");
		new_a_clearfix.attr("href","/productdetail/productdetailmain.do?ps_num="+ps_num);
		new_a_clearfix.addClass("list-group-item");

		var new_table = $("<table>");
		var new_tbody = $("<tbody>");
		

		var new_tr = $("<tr>");
		new_tr.attr("data-num", ps_num);
		
		var new_td_si = $("<td>");
		new_td_si.addClass("jb-th-1");
		var new_div_logo = $("<div>");
		
		var new_img_si = $("<img>");
		new_img_si.attr("src", "/uploadStorage/store/" + si_image);
		new_img_si.addClass("fileImageLogo");

		var new_p_name = $("<p>");
		new_p_name.html(st_name);
		new_p_name.addClass("stname align-center");

		var new_td_pi = $("<td>");
		new_td_pi.addClass("jb-th-1");
		var new_div_product = $("<div>");

		var new_img_pi = $("<img>");
		new_img_pi.attr("src", "/uploadStorage/product/" + pi_image);
		new_img_pi.addClass("fileImageProduct");

		var new_td_p = $("<td>");
		var new_div_name = $("<div>");
		new_div_name.addClass("restaurants-info");
		var new_div_expiration = $("<div>");
		new_div_expiration.attr("title", p_name);
		new_div_expiration.html(p_name);

		var new_div_scope = $("<div>");
		new_div_scope.attr("title", ps_expiration);
		new_div_scope.html(ps_expiration);

		var new_div_stars = $("<div>");
		new_div_stars.addClass("stars");
		var new_span_scope = $("<span>");
		new_span_scope.addClass("ico-star1 ng-binding glyphicon glyphicon-star");
		new_span_scope.html(prv_scope);
		var new_span_count_prv = $("<span>");
		new_span_count_prv.addClass("review_num");
		new_span_count_prv.html("리뷰 " + prv_count);

		var new_td_ps = $("<td>");
		var new_div_txt = $("<div>");
		new_div_txt.addClass("align-center");
		var new_span_txt = $("<span>");		
		new_span_txt.html("남은수량");
		var new_div_space = $("<div>");
		var new_span_count_ps = $("<span>");
		new_span_count_ps.html(ps_count + "개");

		var new_td_discount = $("<td>");
		new_td_discount.addClass("jb-th-2");
		var new_div_discount = $("<div>");
		var new_ul_txt = $("<ul>");
		var new_li_txt = $("<li>");		
		var new_span_discount = $("<span>");
		new_span_discount.html(disRate);
		var new_span_text = $("<span>");
		new_span_text.html("%");

		var new_td_p_ps = $("<td>");
		var new_div_price = $("<div>");
		new_div_price.addClass("align-center");
		var new_ul_price = $("<ul>");
		var new_li_price = $("<li>");		
		var new_span_price = $("<span>");
		new_span_price.addClass("p_price");
		new_span_price.html(p_price+"원");
		var new_li_ps_price = $("<li>");	
		var new_span_price_ps = $("<span>");
		new_span_price_ps.addClass("ps_price");
		new_span_price_ps.html(ps_price+"원");
		

		new_div_logo.append(new_img_si).append(new_p_name);
		new_td_si.append(new_div_logo);
		new_tr.append(new_td_si);

		new_div_product.append(new_img_pi);
		new_td_pi.append(new_div_product)
		new_tr.append(new_td_pi);

		new_div_stars.append(new_span_scope).append(new_span_count_prv);
		new_div_scope.append(new_div_stars);
		new_div_expiration.append(new_div_scope);
		new_div_name.append(new_div_expiration);
		new_td_p.append(new_div_name);
		new_tr.append(new_td_p);

		new_div_txt.append(new_span_txt).append(new_div_space).append(new_span_count_ps);
		new_td_ps.append(new_div_txt);
		new_tr.append(new_td_ps);

		new_li_txt.append(new_span_discount).append(new_span_text);
		new_ul_txt.append(new_li_txt);
		new_div_discount.append(new_ul_txt)
		new_td_discount.append(new_div_discount);
		new_tr.append(new_td_discount);
		
		new_li_price.append(new_span_price);
		new_ul_price.append(new_li_price);
		new_li_ps_price.append(new_span_price_ps);
		new_ul_price.append(new_li_ps_price);
		
		new_div_price.append(new_ul_price);
		new_td_p_ps.append(new_div_price)
		new_tr.append(new_td_p_ps);

		new_table.append(new_tbody).append(new_tr);
		new_a_clearfix.append(new_table);
		new_div_contract.append(new_a_clearfix);

		$("#productsList").append(new_div_contract);

		return new_div_contract;
	}
		
		
		// 맵의 가운데 위도 경도를 행정주소로 반환
		function getAddress (result, status) {  
			if (status === daum.maps.services.Status.OK) {
				var nowlocation = result[0].address_name;
				$("#yourlocation").val( nowlocation);
			}
		}; 	
		
		function getlist(){
			var url = "/storeall/storelist.do?c_lat=37.562307&c_lon=127.035154"; //회사위치 기준
			$("#storeList").html("");  // 목록 초기화
			$.getJSON(url, function(data) {			
				
				//불러온 데이터 처리
				$(data).each(function() {
					var st_num = this.st_num;
					var st_lat = this.st_lat;
					var st_lon = this.st_lon;
					var si_image = this.si_image;
					var st_name = this.st_name;
					var st_address = this.st_address;
					var distance = "미확인";
											
					//목록 생성
					addNewItem(st_num, st_lat, st_lon,si_image, st_name, st_address, distance, map);
					
					// 마커들을 지도위에 표시합니다																				
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						position : new daum.maps.LatLng(st_lat, st_lon),
						title :st_name
					});
				});
				}).fail(function() {
					alert("매장 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
			});
		}
		
		/* // 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);	  */
</script>


