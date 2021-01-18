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
		function findUserByNameAjax(){
			var name = myform.name.value;
			
			var user={
				name : name
			};
			
								
			$.ajax({
				url: "${contextPath}/admin/findUserByNameAjax",
				type: "post",
				data: user,
				success:function(data){
					var table = document.getElementById("searchTable");
					var str= "";
			    	table.innerHTML = ""; // 기존 테이블의 내용을 클리어~
			    	for(var i=0; i<data.length; i++){
						str += "<tr ondblclick='updateStoreAjax(\""+data[i].mid+"\",\""+data[i].name+"\")'>";
						str += "<td>"+data[i].mid+"</td>";
						str += "<td>"+data[i].name+"</td>";
						str += "<td>"+data[i].tel+"</td>";
						str += "</tr>";
					}
			    	$("#searchTable").html(str)
				}
			}); 
		}
		
		function updateStoreAjax(mid,name){
			var user = {
				column  : "manager",
				condition : mid,
				store_code : "${store_code}"
			}
			
			var res = confirm(name+"을/를 매니저로 등록하시겠습니까?")
			if(!res){
				return false;
			}
			else{
				$.ajax({
					url: "${contextPath}/admin/updateStore",
					type: "post",
					data: user,
					success:function(data){
						window.opener.location.reload(false);
						window.close();
					}
				}); 
			}
			
		}
		
	</script>
	<style>
		body {
			background-color: #f6f6f6;
		}
		
		.list_detail {
			text-align: left;
			display: inline-block;
			width: 500px;
			height: auto;
			border: 0px solid;
			margin : 0px auto;
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
		.search{
			margin: 10px 10px;
			text-align: center;
		}
		#name{
			height:20px;
			font-size:15px;
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 500px; margin-top:50px">
				<div class="list_detail">
					<div class="search">
						<form id="myform">
			        		<input type="text" name="name" id="name" placeholder="이름을 검색해주세요." autofocus onkeyup="findUserByNameAjax()"/>
						</form>
			        </div>
					<table>
						<tr>
							<th>매니저 ID</th>
							<th>매니저 명</th>
							<th>매니저 번호</th>
						</tr>
						<tbody id="searchTable">
							<c:forEach var="vo" items="${vos }">
								<tr ondblclick="updateStoreAjax('${vo.mid }','${vo.name }')">
									<td>${vo.mid}</td>
									<td>${vo.name }</td>
									<td>${vo.tel  }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<p></p>
				</div>
	</div>
</body>
</html>