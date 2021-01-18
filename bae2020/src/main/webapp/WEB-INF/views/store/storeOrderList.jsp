<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav_mng.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script>
		function updateOrderByStateAjax(idx){
			var order={
				order_idx : idx	
			}
			
			$.ajax({
				url: "${contextPath}/order/updateOrderByStateAjax",
				type: "post",
				data: order,
				success:function(data){				
					alert("접수되었습니다.");
					location.reload();					
				}
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
			width: 800px;
			height: auto;
			border: 0px solid;
			margin-bottom: 5px;
			background-color: #fff;
		}
		
		table {
			margin: 0px auto;
			width: 700px;
			border: 1px solid #ccc;
			padding: 12px;
			border-collapse: collapse;
			table-layout: fixed;
		}
		
		th {
			text-align: center;
			width: 120px;
			border: 1px solid #ccc;
		}
		
		td {
			text-align: center;
			width: 120px;
			border: 1px solid #ccc;
			padding: 12px;
		}
		.opt_th {
			text-align: center;
			width: 300px;
			border: 1px solid #ccc;
		}
		.opt_td {
			width: 300px;
			border: 1px solid #ccc;
			padding: 12px;
			text-align: center;
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
					<h3 class="title">주문리스트</h3>
					<table>
						<tr>
							<th>주문시각</th>
							<th>총 가격</th>
							<th class="opt_th">결제수단</th>
							<th>거리</th>
							<th>요구사항</th>
						</tr>
						<c:forEach var="vo" items="${vos }">
							<tr id="tr">
								<td>${vo.create_dt}</td>
								<td>${vo.total }</td>
								<td class="opt_td">${vo.payment }</td>
								<td>${vo.distance  }</td>
								<td><button class="w3-round-xlarge btn_str" type="button" onclick="updateOrderByStateAjax('${vo.order_idx}')">접수</button></td>
							</tr>
						</c:forEach>	
					</table>
					<p></p>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>