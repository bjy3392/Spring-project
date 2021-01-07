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
	    display: inline-block;
	    width: 280px;
	    height: 280px;
		border: 0px solid;
	    margin-bottom: 5px;
	    padding : 15px 15px 15px 15px;
	}
	.list_detail:hover {
	    background-color: #ffce32;
	}
	#btn {
			background-color: #009223; /* Green */
			border: none;
			color: #ffce32;
			padding: 7px 15px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			cursor: pointer;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="main_list" >
			<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>메뉴선택</h2>
				<p></p>
			</div>
			<!-- 리스트 -->
			<div class="list_start">
				<c:forEach var="vo" items="${vos }">
					<div class="list_detail">
						<p></p>
						<img src="${contextPath }/content/${vo.image}" style="width:200px;">
						<p>${vo.product_name }<br/>${vo.price }</p>
						<button class="w3-round-xlarge" id="btn" onclick="location.href='${contextPath}/order/viewOptionList?product_code=${vo.product_code }'">주문하기</button>
					</div>
					    	
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>