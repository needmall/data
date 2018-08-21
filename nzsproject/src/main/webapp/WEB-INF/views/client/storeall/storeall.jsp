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
.storeimg {
	width: 50px;
</style>
<!-- 당신의 위치 -->
<div>
	<input type="text" id="address" name="address" ><input type="button" id="search" value="검색">
</div>
<div>
	<h3 id="yourlocation"></h3>
	<h3 id="nolocation"></h3>
</div>
<!--  목록 영역   -->
<%-- <div id="storeList">
	<ul>
		<c:choose>
			<c:when test="${not empty storeList}">
				<c:forEach var="store" items="${storeList}" varStatus="status">
					<li data-num="${store.st_num}">
						<a	href="javascript:panTo(${store.st_lat},${store.st_lon})">
							<div class="imgarea">						
								<img src="/uploadStorage/store/${store.si_image}" class="storeimg" />
							</div>
							<div class="conarea">
								<span>${store.st_name }<br> 
								${store.st_address }<br>
								거리 : ${store.distance }m</span>						
							</div>
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
</div> --%>

<!-- 지도 영역 -->
<div id="map" style="width: 500px; height: 400px;"></div>

<script type="text/javascript">
		$(function() {   
			
			var lat=0;
			var lon=0;
						
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				 navigator.geolocation.getCurrentPosition(function (position) {					 
					 lat = position.coords.latitude;
					 lon = position.coords.longitude;
					 console.log("안 lat:"+lat+", lon:" +lon);
					});			
				 console.log("lat:"+lat+", lon:" +lon);
				
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다			
				// 검색을 유도하는 안내문 작성
			}
// 			// 주소로  위도 경도 찍기
// 			geocoder.addressSearch('성동구 사근동', 	function (result, status) { // 주소 검색으로 나오는 첫번째 결과를  위도 경도로 받아오기
// 				if (status === daum.maps.services.Status.OK) {						
// 					lat = result[0].address.y
// 					lon = result[0].address.x						
// 					}
// 			});
			
			/* 지도를 띄우는 코드 */
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new daum.maps.LatLng(lat, lon), //지도의 중심좌표.
				level : 3
			//지도의 레벨(확대, 축소 정도)
			};
			var selectedMarker = null; //선택된 마커

			var map = new daum.maps.Map(container, options); //지도 생성 및   객체 리턴
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			
			//현위치 마커 이미지 만들기
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
			imageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
			imageOption = {
				offset : new daum.maps.Point(27, 69)
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
			
					
			//여러개 출력시
			// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
			var markers = [];
						
			// 이미지 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position :  new daum.maps.LatLng(lat, lon),
				title : '매장 검색 기준',
				image : markerImage
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 생성된 마커를 배열에 추가합니다
			markers.push(marker);
			
			// 좌표로 행정동 주소 정보를 요청합니다
			if(lon!=0){
				geocoder.coord2RegionCode(lon, lat, getAddress);
				$("#yourlocation").show();
			}
			
			// 마커들을 지도위에 표시합니다 
			<c:forEach var="store" items="${storeList}" varStatus="status">
				var st_lat = "${store.st_lat }";
				var st_lon = "${store.st_lon }";
				var st_name = "${store.st_name }";
				
				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
					position : new daum.maps.LatLng(st_lat, st_lon),
					title :st_name
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				// 생성된 마커를 배열에 추가합니다
				markers.push(marker);
			</c:forEach>
			
		});
				
		function getAddress (result, status) {  // 맵의 가운데 위도 경도를 행정주소로 반환
			if (status === daum.maps.services.Status.OK) {
				var nowlocation = result[0].address_name;
				$("#yourlocation").html("매장 검색 위치 :" + nowlocation);
			}
		}; 
		
		// 해당 위도경도 위치로 이동
		function panTo(st_lat, st_lon, map) {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new daum.maps.LatLng(st_lat, st_lon);
		
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		
		
		/* // 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);	  */
</script>


