<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac95c27acc45476a2c2bc9417405e7f6&libraries=services"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('ac95c27acc45476a2c2bc9417405e7f6');
        console.log(Kakao.isInitialized());
		
		function updateOrderByStateAjax(idx, state, road, detail){
			var order={
				order_idx : idx,
				state : state
			}
			
			$.ajax({
				url: "${contextPath}/store/updateOrderByStateAjax",
				type: "post",
				data: order,
				success:function(data){		
					if(state=='state-04'){
						var geocoder = new kakao.maps.services.Geocoder();
						var address = road;
						
						var coords1 = geocoder.addressSearch(address, function(result, status) { 
							if (status === kakao.maps.services.Status.OK){
						    	$('#xGeocoder').val(result[0].x);
								$('#yGeocoder').val(result[0].y);
								$('#detail').val(detail);
								navi();
						    }
						}); 
					}
					else{
						location.reload();							
					}
				}
			});   	
		}
		
		function navi() {
			var xGeo = Number($('#xGeocoder').val());
			var yGeo = Number($('#yGeocoder').val());
			var address = $('#detail').val();
						
		    Kakao.Navi.start({
		      	name: address,
		      	x: xGeo,
		      	y: yGeo,
		      	coordType: 'wgs84'
		    });
		}
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
			width: 900px;
			height: auto;
			border: 0px solid;
			margin-bottom: 5px;
			background-color: #fff;
		}
		
		table {
			margin: 0px auto;
			width: 800px;
			border: 1px solid #ccc;
			padding: 12px;
			border-collapse: collapse;
			table-layout: fixed;
		}
		
		th {
			text-align: center;
			width: 100px;
			border: 1px solid #ccc;
		}
		
		td {
			text-align: center;
			width: 100px;
			border: 1px solid #ccc;
			padding: 12px;
		}
		#bar_table {
			margin: 0px auto;
			width: 900px;
			padding: 12px;
			border-collapse: collapse;
			table-layout: fixed;
			text-align: center;
			border: none;
		}
		#bar_td {
			width: 300px;
			border: none;
			cursor: pointer;
		}
		
		#bar_td_select {
			width: 300px;
			border: none;
			background-color: #009223;
			color: #fff;
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
			margin: 0px 30px 30px;
			cursor: pointer;
			font-weight: bold;
		}
		.btn_str {
			background-color: #fff; 
			color: #009223;
			padding: 6px 15px;
			text-align: left;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 5px 0px;
			cursor: pointer;
			font-weight: bold;
			border-color: #009223;
			border-width: 3px;
			border-style: solid;
		}
		
		@media(max-width: 576px){
			body {
				background-color: #f6f6f6;
			}
			
			.main_title {
				text-align: center;
			}
			
			.main_list {
				width: 400px;
				margin: 0 auto;
			}
			
			.list_start {
				text-align: center;
			}
			
			.list_detail {
				text-align: left;
				display: inline-block;
				width: 400px;
				height: auto;
				border: 0px solid;
				margin-bottom: 5px;
				background-color: #fff;
			}
			
			table {
				margin: 0px auto;
				width: 400px;
				border: 1px solid #ccc;
				padding: 12px;
				border-collapse: collapse;
				table-layout: fixed;
			}
			
			th {
				text-align: center;
				width: 400px;
				border: 1px solid #ccc;
			}
			
			td {
				text-align: center;
				width: 400px;
				border: 1px solid #ccc;
				padding: 12px;
			} 
			#bar_table {
				margin: 0px auto;
				width: 400px;
				padding: 12px;
				border-collapse: collapse;
				table-layout: fixed;
				text-align: center;
				border: none;
			}
			#bar_td {
				width: 200px;
				border: none;
				cursor: pointer;
			}
			
			#bar_td_select {
				width: 200px;
				border: none;
				background-color: #009223;
				color: #fff;
			}
    	}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="main_list">
			<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>주문현황</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<table id="bar_table">
						<c:if test="${state == 'state-03'}">
							<tr>
								<td id="bar_td_select">배달대기</td>
								<td id="bar_td" onclick="location.href='${contextPath}/delivery/viewDeliveryList/state-04'">배달 중</td>
							</tr>
						</c:if>
						<c:if test="${state == 'state-04'}">
							<tr>
								<td id="bar_td" onclick="location.href='${contextPath}/delivery/viewDeliveryList/state-03'">배달대기</td>
								<td id="bar_td_select" onclick="location.href='${contextPath}/delivery/viewDeliveryList/state-04'">배달 중</td>
							</tr>
						</c:if>
					</table> 
					<h3 class="title">대기리스트</h3>
					<c:forEach var="vo" items="${vos }">
						<table>
							<tr>
								<td colspan=3>${vo.create_dt}</td>
							</tr>	
							<tr>
								<td><fmt:formatNumber value="${vo.total }" pattern="#,###" /></td>
								<td>${vo.payment }</td>
								<td>${vo.distance  }</td>
							</tr>		
							<tr>
								<td colspan=3>요구사항 : ${vo.demand  }</td>
							</tr>	
							<tr>
								<td colspan=3>배달원 : ${vo.name  }</td>
							</tr>
							<tr>
								<td colspan=3>지점 : ${vo.store_name  }</td>
							</tr>	
							<tr>
								<td colspan=3>
									<c:if test="${state == 'state-03'}">
										모바일에서 실행해주세요
										<button class="w3-round-xlarge btn_str" type="button" onclick="updateOrderByStateAjax('${vo.order_idx}','state-04','${vo.roadAddress }','${vo.detailAddress }')">배달지로 출발</button>
									</c:if>
									<c:if test="${state == 'state-04'}">
										<button class="w3-round-xlarge btn_str" type="button" onclick="updateOrderByStateAjax('${vo.order_idx}','state-05','','')">결제완료</button>
									</c:if>
								</td>
							</tr>	
							<tr>
								<td colspan=2>
									${vo.roadAddress }
								</td>
								<td>
									${vo.detailAddress }
								</td>
							</tr>
						</table>
						<br/>
					</c:forEach>	
					<p></p>
					<form>
						<input type="hidden" id="xGeocoder">
						<input type="hidden" id="yGeocoder">
						<input type="hidden" id="detail">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
