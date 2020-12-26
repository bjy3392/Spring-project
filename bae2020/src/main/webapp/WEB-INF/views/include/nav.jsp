<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	}
	.bar{ 
		position: absolute;
	    left: 50%;
	    transform: translatex(-50%);
	    background-color: #fff;
	}
	.nav_top{
		wdith:100%;
	    background-color: #fff ;
	}

</style>

<!-- Navbar -->
<div class="w3-top" style="height:100px; text-align:center;">
	<div style="height:100%; line-height:100px; vertical-align:middle;">
		<img id="subway" src="${contextPath }/resources/images/SUBWAY.jpg" style="width:150px;">
	</div>
	<div id="nav_top">
	  	<div class="bar" style="text-align:center;">
		    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
		    <a href="${contextPath }" class="w3-bar-item w3-button w3-padding-large">HOME</a>
		    <a href="${contextPath }/order/productList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ORDER</a>
		    <a href="${contextPath }/order/cartList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CART</a>
		    <a href="" class="w3-bar-item w3-button w3-padding-large w3-hide-small">BORAD</a>
		    <div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-padding-large w3-button" title="More">MY PAGE<i class="fa fa-caret-down"></i></button>     
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
				    <a href="${contextPath }/member/mList" class="w3-bar-item w3-button">회원조회</a>
					<a href="${contextPath }/member/mPassCheck" class="w3-bar-item w3-button">정보수정</a>
					<a href="#" class="w3-bar-item w3-button">회원탈퇴</a>
					<a href="${contextPath }/admin/adminMenu" class="w3-bar-item w3-button">관리자</a>
				</div>
			</div>
	    
	    <c:if test="${empty slevel }">
	    	<a href="${contextPath }/user/userLogin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOGIN</a>
	    </c:if>
	    <c:if test="${!empty slevel }">
	    	<a href="${contextPath }/user/userLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOGOUT</a>
	    	<a class="w3-bar-item w3-padding-large w3-hide-small">${smid} 님 반갑습니다.</a>
	    </c:if>
	  </div>
  </div>
</div>




