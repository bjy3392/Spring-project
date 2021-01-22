<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
</head>
<body>
	<c:if test="${classify =='prod' }">
		<img src="${contextPath }/product/${vo.category_code }/${vo.image}" style="width:200px;">
	</c:if>
	<c:if test="${classify =='opt' }">
		<img src="${contextPath }/option/${vo.subcategory_code }/${vo.image}" style="width:200px;">
	</c:if>
</body>
</html>