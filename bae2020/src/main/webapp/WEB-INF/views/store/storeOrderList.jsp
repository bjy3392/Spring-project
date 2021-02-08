<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script>
		function updateOrderByStateAjax(idx, state){
			var order={
				order_idx : idx,
				state : state
			}
			
			$.ajax({
				url: "${contextPath}/store/updateOrderByStateAjax",
				type: "post",
				data: order,
				success:function(data){				
					alert("변경되었습니다.");
					location.reload();					
				}
			});   	
		}
		
		function updateStoreByOpenAjax(store_code, yn){
			var store={
					store_code : store_code,
					open_yn : yn
				}
				
				$.ajax({
					url: "${contextPath}/store/updateStoreByOpenAjax",
					type: "post",
					data: store,
					success:function(data){				
						alert("변경되었습니다.");
						location.reload();					
					}
				});   	
			
		}
		
		function viewCancelInput(idx) {
			var url = "${contextPath}/store/viewCancelInput?order_idx="+idx;
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
			text-align: center;
			width: 100px;
			border: 1px solid #ccc;
			padding: 12px;
		}
		.opt_th {
			text-align: center;
			width: 200px;
			border: 1px solid #ccc;
		}
		.opt_td {
			width: 200px;
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
				<c:if test="${open != 'y' }">
					영업을 시작합니다.
					<button class="w3-round-xlarge btn_str" type="button" onclick="updateStoreByOpenAjax('${store}','y')">오픈하기</button>
				</c:if>
				<c:if test="${open == 'y' }">
					<div class="list_detail">
						<table id="bar_table">
							<c:if test="${state == 'state-01'}">
								<tr>
									<td id="bar_td_select">주문접수 중</td>
									<td id="bar_td" onclick="location.href='${contextPath}/store/viewStoreOrderList/state-02'">준비중</td>
									<td id="bar_td" onclick="location.href='${contextPath}/store/viewDeliveryOrderList'">배달현황</td>
								</tr>
							</c:if>
							<c:if test="${state == 'state-02'}">
								<tr>
									<td id="bar_td" onclick="location.href='${contextPath}/store/viewStoreOrderList/state-01'">주문접수 중</td>
									<td id="bar_td_select" >준비중</td>
									<td id="bar_td" onclick="location.href='${contextPath}/store/viewDeliveryOrderList'">배달현황</td>
								</tr>
							</c:if>	
						</table> 
						<h3 class="title">주문리스트</h3>
						<button class="w3-round-xlarge btn_str w3-right w3-margin" type="button" onclick="updateStoreByOpenAjax('${store}','n')">영업종료</button>
						<table>
							<tr>
								<th>주문시각</th>
								<th>총 가격</th>
								<th>결제수단</th>
								<th>거리</th>
								<th>요구사항</th>
								<th>주문접수</th>
							</tr>
							<c:forEach var="vo" items="${vos }">
								<tr id="tr">
									<td>${vo.create_dt}</td>
									<td><fmt:formatNumber value="${vo.total }" pattern="#,###" /></td>
									<td>${vo.payment }</td>
									<td>${vo.distance  }</td>
									<td>${vo.demand  }</td>
									<td rowspan="2">
										<c:if test="${state == 'state-01'}">
											<button class="w3-round-xlarge btn_str" type="button" onclick="updateOrderByStateAjax('${vo.order_idx}','state-02')">접수</button>
											<button class="w3-round-xlarge btn_str" type="button" onclick="viewCancelInput('${vo.order_idx}')">취소</button>
										</c:if>
										<c:if test="${state == 'state-02'}">
											<button class="w3-round-xlarge btn_str" type="button" onclick="updateOrderByStateAjax('${vo.order_idx}','state-03')">준비완료</button>
										</c:if>	
									</td>
								</tr>
								<tr>
									<td colspan="5">
			                       		<c:forEach var="stock" items="${stockVos}">
											<c:if test="${vo.order_idx == stock.order_idx && state == 'state-01'}">
												<c:if test="${stock.quantity !=0 }">
													<font color='red'>재고 수량을 초과하였습니다.</font><br/>
					                       			주문제품 : ${stock.option_name } /주문수량 : ${stock.cnt } /재고수량 : ${stock.quantity }<br/>
				                       			</c:if>
											</c:if> 
			                       		</c:forEach>
										<font style="font-weight: bold; font-size: 20px;"> ${vo.product_name }</font>  <c:if test="${vo.cnt ne 1 }">외 ${vo.cnt-1 }개</c:if>
										<c:forEach var="voItem" items="${vosItem }">
											<c:if test="${vo.order_idx eq voItem.order_idx }">
												<div id="detail_${vo.order_idx }"  >
													<span class="w3-text-grey prod">${voItem.product_name }</span>
													<span class="w3-text-grey">${voItem.cnt }개&nbsp;<fmt:formatNumber value="${(voItem.price+voItem.price_add+voItem.price_meat) * voItem.cnt }" pattern="#,###" /></span><br/>
													<c:if test="${voItem.quantity ==0 && state == 'state-01'}"><font color='red'>품절 상품을 포함하고 있습니다.</font><br/></c:if> 
													<span class="w3-text-grey opt">옵션:${voItem.option_unit }</span><br/>
													<span class="w3-text-grey opt">추가:${voItem.add_unit }</span><br/> 
													<span class="w3-text-grey opt">미트:${voItem.meat_unit }</span><br/>  
													<p></p>
												</div>
											</c:if>
										</c:forEach>
									</td>
								</tr>
							</c:forEach>	
						</table>
						<p></p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>