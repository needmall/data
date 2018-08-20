<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<!-- 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a"></script>
<!-- services와 clusterer 라이브러리 불러오기 -->
<!-- clusterer: 마커를 클러스터링 할 수 있는 클러스터러 라이브러리 입니다.
      services: 장소 검색 과 주소-좌표 변환 을 할 수 있는 services 라이브러리 입니다.
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services,clusterer"></script> -->

<!--  목록 영역   -->
<div id="storeList">
	<ul>
		<c:choose>
			<c:when test="${not empty storeList}">
				<c:forEach var="store" items="${storeList}" varStatus="status">
					<li data-num="${store.st_num}">					
						<a data-lat= "${store.st_lat}" data-lon="${store.st_lon}" href="javascript:panTo()">
								
								<img src=""/>
								<span>${store.st_name }<br>
								${store.st_address }<br>
								${store.distance } M ${store.st_lat}</span>										
						</a>
					</li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</ul>
</div>

<!-- 지도 영역 -->
<div id="map" style="width: 500px; height: 400px;"></div>
<button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button>


<script type="text/javascript">
		/* 지도를 띄우는 코드 */
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new daum.maps.LatLng(37.562176, 127.035180), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};
		var selectedMarker = null;  //선택된 마커

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

		//현위치 마커 이미지 만들기
		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
    	imageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
    	imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    	       
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
    	
    	
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				
				// 지도 중심좌표를 접속위치로 변경합니다
				map.setCenter(locPosition);
				// 현위치 마커 표시
				imgmarker(locPosition, '대략적인 고객님 위치(기준점)',markerImage );
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new daum.maps.LatLng(37.562176, 127.035180); // 없을 경우 이동 좌표  일단, 미래능력 교육 개발원
			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
			// 현위치 마커 표시
			imgmarker(locPosition, '대략적인 고객님 위치(기준점)',markerImage );
		}

		//여러개 출력시
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markers = [];
		// 마커 하나를 지도위에 표시합니다 
		 var list = "${storeList}";
		/* $(list).each(function() {
			var st_lat = $(this).st_lat;
			var st_lon = $(this).st_lon;
			var st_name = $(this).st_name;			
			addMarker(new daum.maps.LatLng(st_lat, st_lon), st_name);
		});  */
		
		
		    	
    	// 마커를 생성하고 지도위에 표시하는 함수입니다
		function imgmarker(position, title, img) {

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position : position,
				title : title,
				image : img
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 생성된 마커를 배열에 추가합니다
			markers.push(marker);
		}
    	
		// 마커를 생성하고 지도위에 표시하는 함수입니다
		function addMarker(position, title) {

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position : position,
				title : title
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 생성된 마커를 배열에 추가합니다
			markers.push(marker);
		}
		
	
		function panTo() {
			var st_lat = $(this).attr("data-lat");
			var st_lon = $(this).attr("data-lon");
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new daum.maps.LatLng(st_lat, st_lon);
			
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
		
		//// 목록을 클릭 했을 때   마커 전부 지우고 클릭한 마커 이미지만 다르게 등록 필요 , 아니면 마커에 이벤트를 걸어야 하는데 
		    
	
	</script>







<%-- //스토어 리스트 출력
		function listAll() {
			$("#storeList").html(""); //초기화 작업	
			var list = "${storeList}";
			list.each(function() {
					var st_num = this.st_num;
					var si_image = this.si_image;
					var st_name = this.st_name;
					var st_address = this.st_address;										
					var distance = this.distance;
					addNewItem(st_num, si_image, st_name, st_address, distance);
				});
					
		}
		
		//아래 함수 addNewItem(이미지, 상호, 주소, 거리)
		function addNewItem(st_num,si_image, st_name, st_address, distance) {
			// 새로운 store가 추가될 li태그 객체
			var new_li =$("<li>");
			new_li.attr("data-num",st_num);
			new_li.addClass("new_li");
			
			var new_a = $("<a>");
			new_a.attr("href","javascript:mapchange()")
			new_a.addClass("new_a");
			
			// 이미지가 들어갈  <img>태그
			var store_img=$("<img>");
			new_li.attr("src",si_image);
			store_img.addClass("store_img");
			
			// 상호가 들어갈 <p>태그
			var store_name = $("<p>");
			store_name.html(st_name);
			store_name.addClass("store_name");
			
			
			// 주소가 들어갈 <p>태그
			var store_address =$("<p>");
			store_address.html(st_address);
			store_address.addClass("store_address");
			
			
			// 거리가 들어갈 <p>태크
			var store_distance =$("<p>");
			store_distance.html(distance+"M");
			store_distance.addClass("store_distance");
			
			
			//조립하기			
			new_a.append(store_img).append(store_name).append(store_address).append(store_distance);
			new_li.append(new_a);
			$("#storeList").append(new_li);
		} --%>
<!-- <!-- 

					매장 리스트
					<ul class="list">
<form name="search" method="post" action="javascript:search()">
				<div class="shopSch">
					<div class="selType02" style="width:156px;">
						<select id="sido1" class="selectCus" title="시/도 선택">
							<option value="0">시/도</option>
						</select>
					</div>
					<div class="selType02" style="width:156px;">
						<select id="sido2" class="selectCus" title="시/군/구 선택">
							<option value="0">시/군/구</option>
						</select>
					</div>
					<input type="text" id="txt_search" title="매장명 입력" placeholder="매장명 입력" value="" />&nbsp;
					<input type="text" id="txt_search" title="매장명 입력" placeholder="매장명 입력" value="" />&nbsp;
					<a href="javascript:search();" class="bs btn red faqSchBtn">검색</a>
				</div>
				</form>

				 -->

