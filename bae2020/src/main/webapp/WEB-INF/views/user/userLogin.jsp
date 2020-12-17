<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<style>
		button {
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
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 300px; margin-top: 100px">
		<h2 class="w3-wide w3-center">LOGIN</h2>
		<form method="post">
	          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
	              <input class="w3-input w3-border" type="text" placeholder="ID" required name="mid">
	          </div>
	          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
	          	<input class="w3-input w3-border" type="password" placeholder="Password" required name="pwd">
	          </div>
	          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
	         	<button class="w3-round-xlarge" type="submit">LOGIN</button>  
	         	<button class="w3-round-xlarge" type="button" onclick="location.href='${contextPath}/user/userInput'">JOIN</button>  
	          </div>   
	     </form>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>