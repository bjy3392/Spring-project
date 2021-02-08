<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>passwordCheck.jsp</title>
	<style>
		body{
			background-color: #f6f6f6;
		}
		.main{
	      	width : 300px;
	      	text-align:center;
	      	margin : 0px auto;
	      	color: #009223;
		}
		
		.btn {
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
	<p><br/></p>
	<p><br/></p>
	<p><br/></p>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px;">
		<div class="main">
			<h2 class="w3-wide w3-center">Password Check</h2>
			<p><br/></p>
			<form method="post"  action="${contextPath }/user/passwordCheck">
		          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
		          	<input class="w3-input w3-border" type="password" placeholder="Password" autofocus name="pwd">
		          </div>
		          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
		         	<button class="w3-round-xlarge btn" type="submit">정보수정</button>   
		          </div>   
		     </form>
		</div>
	</div>
	<p><br/></p>
	<p><br/></p>
	<p><br/></p>
	<p><br/></p>
	<p><br/></p>	
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>