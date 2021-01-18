<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script>
		function updateUserByLevelAjax(mid){
			var res = confirm("권한을 취소하시겠습니까?");
			if(!res){
				return false;
			}
			else{
				var user ={
					mid: mid
				};
				
				$.ajax({
					url: "${contextPath}/admin/updateUserByLevelAjax",
					type: "post",
					data: user,
					success:function(data){
						alert("처리되었습니다.");
						location.reload();
					}
				}); 
			}
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
			width: 200px;
			border: 1px solid #ccc;
		}
		
		td {
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
		.title {
			margin: 10px 30px;
			width: 780px;
			color: #666666;
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
				<h2>매니저 관리</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<table id="bar_table">
						<tr>
							<td id="bar_td_select">매니저 리스트</td>
							<td id="bar_td" onclick="location.href='${contextPath}/admin/viewAskManagerList'">신청대기중</td>
						</tr>
					</table>
					<p><br/></p>
					<h3 class="title">리스트</h3>
					<table>
						<tr>
							<th>매니저 ID</th>
							<th>매니저 명</th>
							<th>매니저 번호</th>
							<th>권한</th>
						</tr>
						<c:forEach var="vo" items="${vos }">
							<tr>
								<td>${vo.mid}</td>
								<td>${vo.name }</td>
								<td>${vo.tel  }</td>
								<td>
									<button class="w3-round-xlarge btn_cancel" type="button" onclick="updateUserByLevelAjax('${vo.mid}')">권한삭제</button></span>
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