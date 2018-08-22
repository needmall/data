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
		border :  1px solid gray;
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
	
</style>


<!-- 당신의 위치 -->
<div class="form-inline">
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

<script type="text/javascript">
		// 맵 변수
		var map;
	
		// 선택된 마커를 담을 변수
		var selectedmarker;		
		
		// 선택된 마커 이미지
		var selectedmarkerImage;
		
		
		$(function() {		
			/* 지도를 띄우는 코드 */
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new daum.maps.LatLng(37.562176, 127.035180), //지도의 중심좌표.(기본 위치는 회사위치)
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
							var distance = this.distance;
													
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
				alert("지역을 검색하여 주세요 (예, 성동구 도선동 )");
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
								var distance = this.distance;
														
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
			new_a.attr("href","javascript:selectList("+st_lat+","+st_lon+",'"+st_name+"')");
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
			m.html("거리 :"+ distance + "m");
				
			//조립하기
			condiv.append(name).append(address).append(m);
			img_div.append(img);
			new_div.append(img_div).append(condiv);
			new_a.append(new_div);
			new_li.append(new_a);		
			$("#storeList").append(new_li);
			
		}
		
		// 목록 선택이 이동, 선택된 마커 오버레이
		function selectList(st_lat, st_lon, st_name) {					
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
		}	
		
		// 맵의 가운데 위도 경도를 행정주소로 반환
		function getAddress (result, status) {  
			if (status === daum.maps.services.Status.OK) {
				var nowlocation = result[0].address_name;
				$("#yourlocation").val( nowlocation);
			}
		}; 	
		
		
		/* // 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);	  */
</script>


