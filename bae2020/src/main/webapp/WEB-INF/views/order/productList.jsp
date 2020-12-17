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
		<div class="order_con">
			<table class="table table-bordered">
			    <tbody>
			    	<c:forEach var="vo" items="${vos }">
				    	<tr>
					        <td><img src="${contextPath }/content/${vo.image}" style="width:100px;"></td>
					        <td>${vo.product_name }</td>
					        <td>${vo.price }</td>
					        <td><button onclick="location.href='${contextPath}/order/productOrder?image=${vo.image}&product_name=${vo.product_name }&price=${vo.price }'">주문하기</button></td>
				     	 </tr>
			    	</c:forEach>
			    </tbody>  
		  	</table>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>