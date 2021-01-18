<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	.w3-top{
		background-color: #fff;
	}
	#subway {
	  	margin: 0;
	  	position: absolute;
	  	top: 50%;
	  	left: 50%;
	  	transform: translate(-50%, -50%);
		cursor: pointer;
	}
	#nav_top{
	    background-color: #fff;
	}

	#admin_bar{
	    background-color: #009223;
	}
</style>

<!-- Navbar -->
<div class="w3-top" style="height:100px; text-align:center;">
	<div>
	<nav class="navbar navbar-expand-sm bg-white justify-content-center">
  		<ul class="navbar-nav" >
  			<li class="nav-item">
		      	<a href="${contextPath }" class="w3-bar-item w3-button w3-padding-large">정보수정</a>
		    </li>
    		<c:if test="${empty slevel }">
	    		<li class="nav-item">
			      	<a href="${contextPath }/user/userLogin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOGIN</a>
			    </li>
		    </c:if>
		    <c:if test="${!empty slevel }">
			    <li class="nav-item">
			      	<a href="${contextPath }/user/userLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOGOUT</a>
	    			${sname} 님 반갑습니다.
			    </li>
    		 </c:if>	    
  		</ul>
	</nav>
	
	<c:if test="${slevel eq 'level-05' }">
		<nav class="navbar navbar-expand-sm justify-content-center" id="admin_bar">
			<div class="navbar-brand" >매니저 메뉴</div>
	  		<ul class="navbar-nav" >
	  			<li class="nav-item">
			      	<a href="${contextPath }/store/viewStoreOrderList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">주문현황</a>
			    </li>
	    		<li class="nav-item">
			      	<a href="${contextPath }/admin/viewCategoryEdit" class="w3-bar-item w3-button w3-padding-large">재고관리</a>
			    </li>
			    <li class="nav-item">
			      	<a href="${contextPath }/order/viewProductList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">매출관리</a>
			    </li>
			    <li class="nav-item">
			      	<a href="${contextPath }/admin/viewManagerList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">고객관리</a>
			    </li>
			    <li class="nav-item">
			       	<a href="${contextPath }/order/viewCartList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">쿠폰관리</a>
			    </li>
	  		</ul>
		</nav>
	</c:if>  
	 
	</div>
</div>




