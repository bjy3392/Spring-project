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
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="${contextPath }" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="${contextPath }/order/productList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ORDER</a>
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
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>


<div class="w3-content" style="max-width:2000px;margin-top:46px">
  	<!-- Automatic Slideshow Images -->
  	<div class="mySlides w3-display-container w3-center">
	    <img src="${contextPath }/resources/images/subway1.jpg" style="width:100%; height:30%">
	</div>
	<div class="mySlides w3-display-container w3-center">
	    <img src="${contextPath }/resources/images/subway2.jpg" style="width:100%; height:30%">
	</div>
	<div class="mySlides w3-display-container w3-center">
	   	<img src="${contextPath }/resources/images/subway3.jpg" style="width:100%; height:30%">
	</div>
</div>

<script>
	// Automatic Slideshow - change image every 4 seconds
	var myIndex = 0;
	carousel();
	
	function carousel() {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  myIndex++;
	  if (myIndex > x.length) {myIndex = 1}    
	  x[myIndex-1].style.display = "block";  
	  setTimeout(carousel, 4000);    
	}

</script>


