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
<script>
	

</script>
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
	/* .bar{ 
		position: absolute;
	    left: 50%;
	    transform: translatex(-50%);
	    background-color: #fff;
	}
	.bar{ 
		position: absolute;
	    left: 50%;
	    transform: translatex(-50%);
	    background-color: #fff;
	} */
	#nav_top{
	    background-color: #fff;
	}

	#admin_bar{
	    background-color: #009223;
	}
	
	#mobile{
		display: none;
	}
	
	@media(max-width: 576px){
		#mobile{
			 display: block;
		}
	}
</style>

<!-- Navbar -->
<div class="w3-top" style="height:100px; text-align:center;">
	<div style="height:100%; line-height:100px; vertical-align:middle;">
		<img id="subway" src="${contextPath }/resources/images/SUBWAY.jpg" onclick="location.href='${contextPath }'" style="width:150px;">
	</div>
	<nav class="navbar navbar-expand-sm bg-white justify-content-center w3-mobile">
  		<ul class="navbar-nav" >
    		<li class="nav-item">
		      	<a href="${contextPath }" class="w3-bar-item w3-button w3-padding-large">HOME</a>
		    </li>
		    <li class="nav-item">
		      	<a href="${contextPath }/order/viewOrderStoreList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ORDER</a>
		    </li>
		    <li class="nav-item">
		       	<a href="${contextPath }/order/viewCartList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CART</a>
		    </li>
		    <li class="nav-item">
		      	<a href="${contextPath }/board/viewBoardList?sort=create_dt" class="w3-bar-item w3-button w3-padding-large w3-hide-small">BORAD</a>
		    </li>
		    <li class="w3-dropdown-hover w3-hide-small">
		      	<button  class="w3-padding-large w3-button" title="More" style="background-color:#fff">MY PAGE<i class="fa fa-caret-down"></i></button>     
					<div class="w3-dropdown-content w3-bar-block w3-card-4">
						<a href="${contextPath }/user/viewPasswordCheck" class="w3-bar-item w3-button">정보수정</a>
						<a href="${contextPath }/user/viewPointList?month=1" class="w3-bar-item w3-button">포인트</a>
						<a href="${contextPath }/order/viewOrderList" class="w3-bar-item w3-button">주문확인</a>
					</div>
    		</li>
    		<c:if test="${empty slevel }">
	    		<li class="nav-item">
			      	<a href="${contextPath }/user/userLogin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOGIN</a>
			    </li>
		    </c:if>
		    <c:if test="${!empty slevel }">
			    <li>
			      	<a href="${contextPath }/user/userLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOGOUT</a>
	    			${sname} 님 반갑습니다.
			    </li>
    		</c:if>	    
  		</ul>
	</nav>	
	<c:if test="${slevel eq 'level-06' }">
		<nav class="navbar navbar-expand-sm justify-content-center" id="admin_bar">
			<div class="navbar-brand" >관리자 메뉴</div>
	  		<ul class="navbar-nav" >
	    		<li class="nav-item">
			      	<a href="${contextPath }/admin/viewCategoryEdit" class="w3-bar-item w3-button w3-padding-large">제품관리</a>
			    </li>
			    <li class="nav-item">
			      	<a href="${contextPath }/admin/viewUserList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회원관리</a>
			    </li>
			    <li class="nav-item">
			      	<a href="${contextPath }/admin/viewManagerList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">매니저관리</a>
			    </li>
			    <li class="nav-item">
			      	<a href="${contextPath }/admin/viewStoreList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">점포관리</a>
			    </li>
			    <li class="nav-item">
			       	<a href="${contextPath }/admin/viewBoardAdminList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">게시판관리</a>
			    </li>
	  		</ul>
		</nav>
	</c:if>
	<c:if test="${slevel eq 'level-05' }">
		<nav class="navbar navbar-expand-sm justify-content-center" id="admin_bar">
			<div class="navbar-brand" >매니저 메뉴</div>
	  		<ul class="navbar-nav" >
	  			<li class="nav-item">
			      	<a href="${contextPath }/store/viewStoreOrderList/state-01" class="w3-bar-item w3-button w3-padding-large w3-hide-small">주문현황</a>
			    </li>
	    		<li class="nav-item">
			      	<a href="${contextPath }/store/viewStockEdit" class="w3-bar-item w3-button w3-padding-large">재고관리</a>
			    </li>
			    <li class="nav-item">
			      	<a href="${contextPath }/store/viewSalesCalendar" class="w3-bar-item w3-button w3-padding-large w3-hide-small">매출관리</a>
			    </li>
			    <li class="nav-item">
			      	<a href="${contextPath }/store/viewUserChart" class="w3-bar-item w3-button w3-padding-large w3-hide-small">고객관리</a>
			    </li>
			    <%-- <li class="nav-item">
			       	<a href="${contextPath }/order/viewCartList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">쿠폰관리</a>
			    </li> --%>
	  		</ul>
		</nav>
	</c:if>
	<div class="w3-white" id="mobile" >
		<c:if test="${empty slevel }">
			<a href="${contextPath }/user/userLogin">LOGIN</a>
	    </c:if>
	</div>
	<c:if test="${slevel eq 'level-07' }">
		<nav class="navbar navbar-expand-sm justify-content-center" id="admin_bar">
	  		<ul class="navbar-nav" >
	  			<li>
			      	<a class="nav-link" href="${contextPath }/user/userLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOGOUT</a>
			    </li>	    
	  			<li class="nav-item">
			      	<a class="nav-link" href="${contextPath }/delivery/viewDeliveryList/state-03" >배달현황</a>
			    </li>
			</ul>
		</nav>
	</c:if>
</div>




