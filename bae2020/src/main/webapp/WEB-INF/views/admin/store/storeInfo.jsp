<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	</script>
	<style>
		body {
			background-color: #f6f6f6;
		}
		.main_title{
			text-align: center;
		}
		
		.main_list {
		    width: 600px;
		    margin: 0 auto;
		}
		
		.list_start {
		    text-align: center;
		}
		.list_detail {
			text-align: left;
			display: inline-block;
			width: 600px;
			height: auto;
			border: 0px solid;
			background-color: #fff;
		    margin: 0 auto;
		}
		
		table {
			margin: 20px;
			width: 450px;
			border: 1px solid #ccc;
			padding: 20px;
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
		#bottom_btn{
		    text-align: center; 
        	padding: 20px 0 20px 0;
        }
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 500px; margin-top:50px">
		<div class="main_list">
			<div class="main_title">
				<p></p>
				<h2>점포상세</h2>
				<p><br/></p>
			</div>
			<div class="list_start">
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
					<div id="bottom_btn">
						<button class="w3-round-xlarge btn_str" type="button" onclick="window.close();">닫기</button>		
	                </div>			
					<p></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>