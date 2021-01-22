<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
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
			width: 1200px;
			height: auto;
			border: 0px solid;
			margin-bottom: 5px;
			background-color: #fff;
		}
		
		table {
			margin: 0px auto;
			width: 700px;
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
			text-align: center;
			width: 120px;
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
				<h2>회원리스트</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<h3 class="title">회원 리스트</h3>  
					<p><br/></p>                        
					<table>
						<tr>
							<th>회원 아이디</th>
							<th>이름</th>
							<th>전화번호</th>
							<th class="opt_th">주소</th>
							<th>가입날짜</th>
							<th>등급</th>
							<th>탈퇴여부</th>
						</tr>
						<c:forEach var="vo" items="${vos }">
							<tr>
								<td>${vo.mid}</td>
								<td>${vo.name }</td>
								<td>${vo.tel }</td>
								<td class="opt_td">
									${vo.roadAddress}<br/> &nbsp;${vo.detailAddress }
								</td>
								<td>${vo.join_dt  }</td>
								<td>${vo.level_name }</td>
								<td>
									<c:if test="${vo.use_yn == 'y'}">가입</c:if>
									<c:if test="${vo.use_yn == 'n'}">탈퇴예정</c:if>
								</td>
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
					      	<li class="page-item"><a href="${contextPath }/admin/viewUserList?pag=1" class="page-link" style="color:#777">첫페이지</a></li>
					      	<li class="page-item"><a href="${contextPath }/admin/viewUserList?pag=${pag-1}" class="page-link" style="color:#777">이전</a></li>
					    </c:if>
					    <c:forEach var="i" begin="0" end="2">  <!-- 하나의 블록페이지의 갯수를 3개로 지정함. -->
					      	<c:if test="${(startPageNum+i) <= totPage}">
						        <c:if test="${pag == (startPageNum+i)}">
						          	<li class="page-item"><a href="${contextPath }/admin/viewUserList?pag=${startPageNum+i}" class="page-link btn btn-secondary active" style="color:#fff">${startPageNum+i}</a></li>
						        </c:if>
						        <c:if test="${pag != (startPageNum+i)}">
						          	<li class="page-item"><a href="${contextPath }/admin/viewUserList?pag=${startPageNum+i}" class="page-link" style="color:#777">${startPageNum+i}</a></li>
						        </c:if>
					     	</c:if>
					    </c:forEach>
					    <c:if test="${pag != totPage}">
					      	<li class="page-item"><a href="${contextPath }/admin/viewUserList?pag=${pag+1}" class="page-link" style="color:#777">다음</a></li>
					      	<li class="page-item"><a href="${contextPath }/admin/viewUserList?pag=${totPage}" class="page-link" style="color:#777">마지막페이지</a></li>
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