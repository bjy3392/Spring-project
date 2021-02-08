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

	function selectSearch(){
		var product = myform.product.value;
		var sort = myform.sort.value;
		location.href ="${contextPath }/board/viewBoardList?startIdx=0&sort="+sort+"&product="+product;
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
		padding:30px;
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
</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="main_list">
			<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>추천메뉴 게시판</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<form if="myform" name="myform">
						<select id="product" size=1 onchange="selectSearch()">
							<option value="전체"  ${part=='전체' ? 'selected' :'' }>전체</option>
							<c:forEach var="vo" items="${vosP }">
								<option value="${vo.product_code }"  ${product==vo.product_code  ? 'selected' :'' }>${vo.product_name }</option>
							</c:forEach>
						</select>
						<select id="sort" size=1 onchange="selectSearch()">
							<option value="create_dt" ${sort=='create_dt' ? 'selected' :'' }>최신순</option>
							<option value="good" ${sort=='good' ? 'selected' :'' }>좋아요순</option>
						</select>
					</form>
					<button class="w3-round-xlarge btn_str w3-right" onclick="location.href ='${contextPath }/board/viewBoardInput'">글쓰기</button>
					<p><br/></p>                        
					<table class="w3-table w3-bordered">
						<tr>
							<th>글쓴이</th>
							<th>메뉴</th>
							<th>날짜</th>
							<th>좋아요</th>
						</tr>
						<c:forEach var="vo" items="${vos }">
							<tr onclick="location.href='${contextPath}/board/viewBoardContent?idx=${vo.idx }'">
								<td>${vo.mid}</td>
								<td>${vo.product_name }</td>
								<td>${vo.create_dt }</td>
								<td>${vo.good}</td>
							</tr>
						</c:forEach>	
					</table>	
					<p></p>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>