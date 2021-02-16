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
		function deleteBoard(board_idx){
			var res = confirm("삭제하시겠습니까?");
			if(!res){
				return false;
			}
			else{
				var board ={
						idx: board_idx
				}
				
				$.ajax({
					url: "${contextPath}/admin/deleteBoard",
					type: "post",
					data: board,
					success:function(data){	
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
			width: 1200px;
			margin: 0 auto;
		}
		
		.list_start {
			text-align: center;
		}
		
		.list_detail {
			text-align: left;
			display: inline-block;
			width: 1200px;
			height: auto;
			border: 0px solid;
			margin-bottom: 5px;
			background-color: #fff;
		}
		
		table {
			margin: 0px auto;
			width: 1000px;
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
			text-align: center;
			width: 200px;
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
				<h2>게시글리스트</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<h3 class="title">게시글리스트</h3>  
					<p><br/></p>                        
					<table>
						<tr>
							<th>작성자</th>
							<th>메뉴</th>
							<th>옵션</th>
							<th>작성일</th>
							<th>삭제</th>
						</tr>
						<c:forEach var="vo" items="${vos }">
							<tr>
								<td>${vo.mid}</td>
								<td>${vo.product_name }</td>
								<td>${vo.options }</td>
								<td>${vo.create_dt }</td>
								<td><button class="w3-round-xlarge btn_str" onclick="deleteBoard('${vo.idx}')">삭제</button></td>
							</tr>
						</c:forEach>	
					</table>	
					<p><br/></p>
					<!-- 아래로 블록페이징 처리 -->
					<div class="container">
					  	<c:set var="pageSize" value="${pageSize}"/>
					   	<c:set var="blockSize" value="${blockSize}"/>
					  	<c:set var="pag" value="${pag}"/>
					  	<c:set var="totPage" value="${totPage}"/>
					  	<c:set var="startPageNum" value="${pag - (pag-1)%blockSize}"/>
					  	<ul class="pagination justify-content-center pagination-sm">
					    <c:if test="${pag != 1}">
					      	<li class="page-item"><a href="${contextPath }/admin/viewBoardAdminList?pag=1" class="page-link" style="color:#777">첫페이지</a></li>
					      	<li class="page-item"><a href="${contextPath }/admin/viewBoardAdminList?pag=${pag-1}" class="page-link" style="color:#777">이전</a></li>
					    </c:if>
					    <c:forEach var="i" begin="0" end="2">  <!-- 하나의 블록페이지의 갯수를 3개로 지정함. -->
					      	<c:if test="${(startPageNum+i) <= totPage}">
						        <c:if test="${pag == (startPageNum+i)}">
						          	<li class="page-item"><a href="${contextPath }/admin/viewBoardAdminList?pag=${startPageNum+i}" class="page-link btn btn-secondary active" style="color:#fff">${startPageNum+i}</a></li>
						        </c:if>
						        <c:if test="${pag != (startPageNum+i)}">
						          	<li class="page-item"><a href="${contextPath }/admin/viewBoardAdminList?pag=${startPageNum+i}" class="page-link" style="color:#777">${startPageNum+i}</a></li>
						        </c:if>
					     	</c:if>
					    </c:forEach>
					    <c:if test="${pag != totPage}">
					      	<li class="page-item"><a href="${contextPath }/admin/viewBoardAdminList?pag=${pag+1}" class="page-link" style="color:#777">다음</a></li>
					      	<li class="page-item"><a href="${contextPath }/admin/viewBoardAdminList?pag=${totPage}" class="page-link" style="color:#777">마지막페이지</a></li>
					    </c:if>
					  </ul>
					</div>
					<!-- 여기까지 블록페이징 처리 -->	
					<p></p>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>