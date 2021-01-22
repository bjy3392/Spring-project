<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac95c27acc45476a2c2bc9417405e7f6&libraries=services"></script>
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac95c27acc45476a2c2bc9417405e7f6"></script> -->
	<script>
		$(document).ready(function(){
			
			//var map = new kakao.maps.Map(container, options);
			
			var geocoder = new kakao.maps.services.Geocoder();
			
			var coords1 = geocoder.addressSearch('충북 청주시 흥덕구 복대로162번길', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     /* if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">충북대점</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } */ 
				if (status === kakao.maps.services.Status.OK){
			    	$('#mlon').val(result[0].y);
					$('#mlat').val(result[0].x);
			    }
			}); 
			
			
			geocoder.addressSearch('충북 청주시 흥덕구 풍산로 15', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     /* if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">충북대점</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } */ 
			    if (status === kakao.maps.services.Status.OK){
			    	$('#vlon').val(result[0].y);
					$('#vlat').val(result[0].x);
			    }
			}); 
			
			
			
			/* var geocoder = new kakao.maps.services.Geocoder();

			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log(result);
			    }
			};

			geocoder.addressSearch('해남군 송지면', callback); */
			
		});
		
	/* 	var mlon=$('#mlon').val();
		var mlat=$('#mlat').val();
		var vlon=$('#vlon'+no).val();
		var vlat=$('#vlat'+no).val();

		var polyline=new daum.maps.Polyline({
			path : [
			new daum.maps.LatLng(mlon,mlat),
			new daum.maps.LatLng(vlon,vlat)
			],
		 strokeWeight: 2,
		 strokeColor: '#FF00FF',
		 strokeOpacity: 0.8,
		 strokeStyle: 'dashed'
		});

		//return getTimeHTML(polyline.getLength());//미터단위로 길이 반환;
		console.log("길이"+polyline.getLength());
		return polyline.getLength(); */
		
		function testfunction(){
			var mlon=$('#mlon').val();
			var mlat=$('#mlat').val();
			var vlon=$('#vlon').val();
			var vlat=$('#vlat').val();

			console.log("값"+$('#vlon').val());
	    	
			var polyline=new daum.maps.Polyline({
				path : [
					new daum.maps.LatLng(mlon,mlat),
					new daum.maps.LatLng(vlon,vlat)
				],
			 strokeWeight: 2,
			 strokeColor: '#FF00FF',
			 strokeOpacity: 0.8,
			 strokeStyle: 'dashed'
			});

			//return getTimeHTML(polyline.getLength());//미터단위로 길이 반환;
			console.log("길이"+polyline.getLength());
		}
		
	</script>

</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px; ">
		<div id="map" style="width:500px;height:400px;"></div>
		<form>
			<input type="text" id="mlon">
			<input type="text" id="mlat">
			<input type="text" id="vlon">
			<input type="text" id="vlat">
		</form>
		<button type="button" onclick="testfunction()">테스트</button>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>