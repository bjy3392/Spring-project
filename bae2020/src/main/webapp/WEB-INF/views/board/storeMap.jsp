<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac95c27acc45476a2c2bc9417405e7f6&libraries=services"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script>
		$(document).ready(function(){
			
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴			
		}); 
		
		function selectStore(tr,code,name,address){			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

					var route = "${route}";
			        
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0; color:black">'+name+'</div>'
		    			+'<button class="w3-round-xlarge" id="btn" onclick="sendChildValue(\''+route+'\',\''+code+'\')">선택하기</button>' 
			        });
			        infowindow.open(map, marker);
			        
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			        
			    } 
			});    
		}
		
		function sendChildValue(route,store){
			opener.setChildValue(route,store);

			window.close();

		}
			//출처: https://multifrontgarden.tistory.com/5 [우리집앞마당]
			
	</script>
	
	<style>
		body {
			background-color: #f6f6f6;
		}
		
		.main_title {
			text-align: center;
		}
		
		.main_list {
			width: 1000px;
			margin: 0 auto;
		}
		
		.list_start {
			text-align: center;
		}
		
		.list_detail {
			text-align: left;
			display: inline-block;
			width: 800px;
			height: auto;
			border: 0px solid;
			margin-bottom: 5px;
			background-color: #8ccd31;
		}
		
		table {
			margin: 0px auto;
			width: 150px;
			padding: 12px;
			border-collapse: collapse;
			table-layout: fixed;
			cursor: pointer;
		}
		
		td {
			text-align: center;
			width: 150px;
			padding: 12px;
			font-weight: bold;
			color: #666666;
			font-size: 18px;
		} 
		.title {
			margin: 10px 30px;
			width: 780px;
			color: #666666;
		}
		#btn {
			background-color: #009223; /* Green */
			border: none;
			color: #ffce32;
			padding: 10px 18px;
			text-align: left;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 10px 20px;
			cursor: pointer;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 100px">
		<div class="main_list">
			<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>매장선택</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<div class="w3-row">
						<div class="w3-col s3">
							<img src="${contextPath }/resources/images/store.PNG" style="width:100%">
							
							<table>
								<c:forEach var="vo" items="${vos }" varStatus="status">
									<c:if test="${vo.open_yn == 'y' }">
										<tr id="tr_${status.count}" onclick = "selectStore('tr_${status.count}','${vo.store_code }','${vo.store_name }','${vo.roadAddress}')">
											<td>${vo.store_name }</td>
										</tr>
									</c:if>
								</c:forEach>	
							</table>
							<input type="hidden" id="store" name="store">
							<p></p>
						</div>
						<div class="w3-col s9 w3-dark-grey w3-center">
				  			<div id="map" style="width:100%;height:400px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>