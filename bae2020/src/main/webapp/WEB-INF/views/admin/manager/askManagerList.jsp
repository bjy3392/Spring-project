<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script>
		function updateAskManagerAjax(idx,yn,mid){
			
			var ask ={
				ask_idx : idx,
				pass_yn : yn,
				mid: mid
		    };
			
			$.ajax({
				url: "${contextPath}/admin/updateAskManagerAjax",
				type: "post",
				data: ask,
				success:function(data){
					alert("처리되었습니다.");
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
			width: 900px;
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
			width: 150px;
			border: 1px solid #ccc;
		}
		
		td {
			width: 150px;
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
			width: 450px;
			border: none;
			cursor: pointer;
		}
		
		#bar_td_select {
			width: 450px;
			border: none;
			background-color: #009223;
			color: #fff;
		}
		.opt_th {
			text-align: center;
			width: 120px;
			border: 1px solid #ccc;
		}
		.opt_td {
			width: 120px;
			border: 1px solid #ccc;
			padding: 12px;
			text-align: center;
		}
		.title {
			margin: 10px 30px;
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
			margin: 5px 0px;
			cursor: pointer;
			font-weight: bold;
			border-color: #009223;
			border-width: 3px;
			border-style: solid;
		}
		.btn_cancel {
			background-color: #fff; 
			color: #f00;
			padding: 6px 15px;
			text-align: left;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 5px 0px;
			cursor: pointer;
			font-weight: bold;
			border-color: #f00;
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
				<h2>신청내역</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<table id="bar_table">
						<tr>
							<td id="bar_td" onclick="location.href='${contextPath}/admin/viewManagerList'">매니저 리스트</td>
							<td id="bar_td_select">신청대기중</td>
						</tr>
					</table>
					<p><br/></p>
					<h3 class="title">신청 리스트</h3>
					<table>
						<tr>
							<th class="opt_th">요청번호</th>
							<th>신청자</th>
							<th>신청자 ID</th>
							<th>전화번호</th>
							<th>메세지</th>
							<th>수락/거절</th>
						</tr>
						<c:forEach var="vo" items="${vos }">
							<tr id="tr">
								<td class="opt_td">${vo.ask_idx}</td>
								<td>${vo.name }</td>
								<td>${vo.mid }</td>
								<td>${vo.tel }</td>
								<td>
									<button class="w3-round-xlarge btn_str" type="button" onclick="">메세지보기</button>
								</td>
								<td>
									<span><button class="w3-round-xlarge btn_str" type="button" onclick="updateAskManagerAjax(${vo.ask_idx},'y','${vo.mid }')">수락</button></span>
									<button class="w3-round-xlarge btn_cancel" type="button" onclick="updateAskManagerAjax(${vo.ask_idx},'n','${vo.mid }')">거절</button></span>
								</td>
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