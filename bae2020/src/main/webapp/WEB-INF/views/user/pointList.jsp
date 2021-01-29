<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	function viewOrderInfo(order_idx){
		var url = "${contextPath}/order/viewOrderInfo?order_idx="+order_idx;
		window.open(url,"nwin","width=1100px, height=600px");
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
		width: 100px;
		border: 1px solid #ccc;
		padding: 12px;
	}
	
	.opt_td {
		width: 120px;
		border: 1px solid #ccc;
		padding: 12px;
		text-align: center;
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
		margin: 5px auto;
		width: 780px;
		color: #666666;
	}
	.btn_str {
		background-color: #fff; 
		color: #009223;
		padding: 6px 15px;
		text-align: left;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
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
				<h2>주문확인</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<table id="bar_table">
						<tr>
							<td id="<c:if test="${month == 1}">bar_td_select</c:if><c:if test="${month != 1}">bar_td</c:if>"  onclick="location.href='${contextPath}/user/viewPointList?month=1'">1개월</td>
							<td id="<c:if test="${month == 2}">bar_td_select</c:if><c:if test="${month != 2}">bar_td</c:if>" onclick="location.href='${contextPath}/user/viewPointList?month=2'">2개월</td>
							<td id="<c:if test="${month == 3}">bar_td_select</c:if><c:if test="${month != 3}">bar_td</c:if>" onclick="location.href='${contextPath}/user/viewPointList?month=3'">3개월</td>
						</tr>
					</table>
					<p><br/></p>
					<c:if test="${empty vos}">
						<div class="list_start">
							<div class="w3-row w3-padding-10 w3-white" style="text-align:left">
								<div class="w3-row w3-padding-large">
									거래 내역이 없습니다.
								</div>
							</div>
							
						</div>
					</c:if>
					<c:if test="${not empty vos}">
						<h3 class="title">거래내역</h3>
						<p></p>
						<table>
							<tr>
								<td>포인트 잔액</td>
								<td><fmt:formatNumber value="${point }" pattern="#,###" /> P</td>
							</tr>
							<tr>
								<td>만료 예정 포인트</td>
								<td><fmt:formatNumber value="${voP.amount }" pattern="#,###" /> P (${voP.expiry_dt })</td>
							</tr>
						</table>
						<p></p>
						<table>
							<c:forEach var="vo" items="${vos }">
								<tr>
									<td>${vo.event_dt }</td>
									<td>${vo.way }</td>
									<td><fmt:formatNumber value="${vo.amount }" pattern="#,###" /></td>
									<td>
									<c:if test="${vo.way != '유효기간 만료' }"><button class="w3-round-xlarge btn_str" onclick="viewOrderInfo('${vo.order_idx}')">주문내역</button></c:if>
									</td>
								</tr>
							</c:forEach>	
						</table>
						<p></p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>