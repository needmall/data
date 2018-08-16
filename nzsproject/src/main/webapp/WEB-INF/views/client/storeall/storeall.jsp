<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<div>목록영역</div>

<!-- 아래부터 지도 영역  -->
<!-- 지도 영역 -->
	<div id="map" style="width: 500px; height: 400px;"></div>
	
<div>
<!-- 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a"></script>
<!-- services와 clusterer 라이브러리 불러오기 -->
<!-- clusterer: 마커를 클러스터링 할 수 있는 클러스터러 라이브러리 입니다.
      services: 장소 검색 과 주소-좌표 변환 을 할 수 있는 services 라이브러리 입니다.
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b262aa5fd1eb6fa9c51a3235fa41046a&libraries=services,clusterer"></script> -->

	

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
		addMarker(new daum.maps.LatLng(37.562176, 127.035180), '미래 능력 교육 개발원');
		addMarker(new daum.maps.LatLng(37.562377, 127.035178), 'GS25');
		addMarker(new daum.maps.LatLng(37.562516, 127.034824), 'CU');
		
		    	
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
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new daum.maps.LatLng(37.562176, 127.034824);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
		
		//// 목록을 클릭 했을 때   마커 전부 지우고 클릭한 마커 이미지만 다르게 등록 필요 , 아니면 마커에 이벤트를 걸어야 하는데 
		    
	</script>
	<button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button>
</div>
