<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 100px">
		<div class="w3-white w3-margin">
			
		 <button class="w3-button w3-black w3-margin-bottom" onclick="location.href='${contextPath}/guest/gInput'">write</button>
			<div class="w3-container w3-padding w3-black">
				<h4>Guest</h4>
			</div>
			<ul class="w3-ul w3-white" id="list">
				<c:forEach var="vo" items="${vos }">
					<li class="w3-padding-16"><img src="${contextPath }/resources/images/kakao.jpg" alt="Image" class="w3-left w3-margin-right" style="width: 50px">
						<span class="w3-large">${vo.name }</span> <br> 
						<span>${vo.content }</span>
					</li>
				</c:forEach>
			</ul>
			<button class="w3-button w3-white w3-margin" style="width:100%;" id="addbtn" onclick="javascript:moreList(${num})">더보기</button>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>