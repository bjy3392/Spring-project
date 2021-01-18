<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	</script>
	<style>
		body {
			background-color: #f6f6f6;
		}
		.main_list {
			margin: 0 auto;
		}
		.list_detail {
			text-align: left;
			display: inline-block;
			width: 530px;
			height: auto;
			border: 0px solid;
			margin : 10px 10px;
			background-color: #fff;
		}
		
		table {
			margin: 0px auto;
			width: 450px;
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
		.title {
			margin: 10px 10px;
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
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 500px; margin-top:50px">
		<div class="main_list">
			<div class="list_detail">
				<table>
					<tr>
						<td>${vo.store_code}</td>
						<td>${vo.store_name }</td>
						<td>${vo.tel  }</td>
					</tr>
					<tr>
						<td>${vo.manager_name}</td>
						<td colspan="2">${vo.manager_tel }</td>
					</tr>
					<tr>
						<td>${vo.postcode}</td>
						<td colspan="2">${vo.roadAddress }</td>
					</tr>
					<tr>
						<td colspan="3">${vo.detailAddress }</td>
					</tr>
					<tr>
						<td colspan="3">
							<c:if test="${vo.open_yn == 'x' }">폐점</c:if>
							<c:if test="${vo.open_yn != 'x' }">운영중</c:if>
						</td>
					</tr>
				</table>
				<button class="w3-round-xlarge btn_str" type="button" onclick="window.close();">닫기</button>					
				<p></p>
			</div>
		</div>
	</div>
</body>
</html>