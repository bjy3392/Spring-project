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

/* 	function findItemForReOrderAjax(idx){
		var order = {
				order_idx : idx
		};
		
		var isSubmit = false;
		var arrayIdx = [];
		
		$.ajax({
			url: "${contextPath}/order/findItemForReOrderAjax",
			type: "post",
			data: order,
			success:function(data){	
				for (i in data) {
					arrayIdx.push(data[i].name);
	            }
				
				$("#arrayIdx").val(arrayIdx); 
				
				isSubmit = true;
			}
		}); 
		
		
		$("#myform_"+idx).submit();
	} */
	
	
	function formSubmit(idx){
		$("#myform_"+idx).submit();
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
		width: 650px;
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
		width: 410px;
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
		width: 800px;
		padding: 12px;
		border-collapse: collapse;
		table-layout: fixed;
		text-align: center;
		border: none;
	}
	#bar_td {
		width: 400px;
		border: none;
		cursor: pointer;
	}
	
	#bar_td_select {
		width: 400px;
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
		margin: 10px 0px;
		cursor: pointer;
		font-weight: bold;
		border-color: #009223;
		border-width: 3px;
		border-style: solid;
	}
	.prod {
		font-weight: bold;
		font-size: 17px;
		padding: 10px 10px 10px 10px;
	}
	.opt {
		padding: 10px 10px 10px 10px;
	}
	.icon_btn {
		padding: 0;
		border: none;
		background: none;
		color: #009223;
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
							<td id="bar_td" onclick="location.href='${contextPath}/order/viewOrderList'">진행중</td>
							<td id="bar_td_select">완료</td>
						</tr>
					</table>
					<p><br/></p>
					<c:if test="${empty vos}">
						<div class="list_start">
							<div class="w3-row w3-padding-10 w3-white" style="text-align:left">
								<div class="w3-row w3-padding-large">
									주문내역이 없습니다.
								</div>
							</div>
							
						</div>
					</c:if>
					<c:if test="${not empty vos}">
						<h3 class="title">주문내역</h3>
						<table>
							<c:forEach var="vo" items="${vos }">
								<tr id="tr_${vo.order_idx }">
									<td class="opt_td">${vo.update_dt }</td>
									<td><font style="font-weight: bold; font-size: 20px;"> ${vo.product_name }</font>  <c:if test="${vo.cnt ne 1 }">외 ${vo.cnt-1 }개</c:if>
										지점정보 추가하기
									</td>
									<td class="opt_td">
										<fmt:formatNumber value="${vo.total }" pattern="#,###" />
										<button class="w3-round-xlarge btn_str">상세</button>
										
									</td>
									<td class="opt_td">
										<button class="w3-round-xlarge btn_str" type="button" onclick="formSubmit(${vo.order_idx })">재주문</button>
										<form id="myform_${vo.order_idx }" method="post" action="${contextPath }/order/viewOrderInput/order">
									    	<input type="hidden" id="order_idx" name="order_idx" value="${vo.order_idx }"/>
									    </form>
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