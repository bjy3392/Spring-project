<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		function view() {
			var detail_div = document.getElementById("detail_idx");
			if (detail_div.style.display == "none") {
				detail_div.style.display = "block";
			} else {
				detail_div.style.display = "none";
			}
		}
		
	</script>
	<style>
		body{
			background-color: #f6f6f6;
		}
		.main_title{
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
			width: 700px;
			height: auto;
			border: 0px solid;
			margin-bottom: 5px;
			background-color: #fff;
		}
		
		table {
			margin : 0px auto;
			width : 650px;
			border : 1px solid #ccc;
			padding: 12px;
			border-collapse: collapse;
			table-layout: fixed;
		}
		th {
			text-align:center;
			width : 120px;
			border : 1px solid #ccc;
		}
		td{
			width : 410px;
			border : 1px solid #ccc;
			padding: 12px;
		}
		.opt_td{
			width : 120px;
			border : 1px solid #ccc;
			padding: 12px;
			text-align:center;
		}
		#bar_table {
			margin : 0px auto;
			width : 700px;
			padding: 12px;
			border-collapse: collapse;
			table-layout: fixed;
			text-align:center;
			border: none;
		}
		#bar_td{
			width : 350px;
			padding: 12px;
			border: none;
		}
		#bar_td{
			width : 350px;
			padding: 12px;
			border: none;
		}
		#bar_td_select{
			width : 350px;
			padding: 12px;
			border: none;
			background-color: #009223;
			color: #fff;
		}
		.title{
			margin : 5px auto;
			width : 650px;
			color: #666666;
		}
		.btn_str{
			background-color: #fff; /* Green */
			border: none;
			color: #009223;
		}
		.prod{
			font-weight: bold;
			font-size:17px;
			padding: 10px 10px 10px 10px;
		}
		.opt{
			padding: 10px 10px 10px 10px;
		}
		#detail_idx{
			display:block ;
		}
		.icon_btn{
			padding: 0;
			border: none;
			background: none;
			color : #009223;
		}
	</style>

	
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<form name="myform">
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
								<td id="bar_td_select">진행중</td>
								<td id="bar_td" onclick="">완료</td>
							</tr>
						</table>
						<p><br/></p>
						<h3 class="title">주문내역</h3>
						<table>
							<c:forEach var="vo" items="${vos }">
								<tr> 
									<td> <span class="prod">${vo.product_name }</span><span class="w3-text-grey">외 ${vo.cnt } 개</span>
										<button class="icon_btn" onclick="javascript:view()">
										<i class="fas fa-chevron-down"></i>
										</button>
										<p></p>
										<div id="detail_idx">
											<c:forEach var="voItem" items="${vosItem }">
												<c:if test="${vo.order_idx eq voItem.order_idx }">
													<span class="w3-text-grey prod">${voItem.product_name }</span><span class="w3-text-grey">${voItem.cnt } ${voItem.price * voItem.cnt }</span><br />
													<span class="w3-text-grey opt">${voItem.options }</span><br/> 
													<p></p>
												</c:if>
											</c:forEach>
										</div>
									</td>
									<td class="opt_td">가격 SQL수정데이터 받아오기</td>
									<td class="opt_td">상태결제시간포함하기 SQL수정데이터 받아오기<span><button class="btn_str">접수중일때만 취소하기</button></span>
									</td>
								</tr>
							</c:forEach>
						</table><p></p></div>
				</div>
			</div>
		</form>
	</div>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>