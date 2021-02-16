<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/nav.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
	<title>SUBWAY</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script>
		function findProductByCategoryAjax(category) {
			$.ajax({
				url: "${contextPath}/findProductByCategoryAjax",
				type: "post",
				success:function(data){		
					location.reload();			
				}
			});   
		}
	</script>
	<style>
		#content{
			max-width:2000px;
			margin-top:160px;
		}
		body {
			font-family: "Lato", sans-serif;
			background-color: #f6f6f6;
		}
		.mySlides {
			display: none
		}
		.menu {
			width: 1000px;
			margin: 0 auto;
			background-color: #f6f6f6;
		}
		.main_list {
			width: 1000px;
			margin: 0 auto;
			background-color: #f6f6f6;
		}
		ul {
		   list-style:none;
		   margin:0;
		   padding:0;
		}
		
		li {
		    margin: 0 0 0 0;
		    padding: 0 0 0 0;
		    border : 0;
		    float: left;
		}
		#history{
			background-color: #fff;
		}
		.menuBar{
			cursor: pointer;
		}
		@media(max-width: 576px){
			.menu {
				width: 300px;
				margin: 0 auto;
				background-color: #fff;
			}
			.main_list {
				width: 300px;
				margin: 0 auto;
				background-color: #f6f6f6;
			}
			#content{
				max-width:2000px;
				margin-top:300px;
			}
    	}
	</style>
	<body>
	<!-- Page content -->
	<div class="w3-content"  id="content">
		<div class="mySlides w3-display-container w3-center">
		    <img src="${contextPath }/resources/images/subway1.jpg" style="width:100%">
		</div>
		  	<div class="mySlides w3-display-container w3-center">
		    <img src="${contextPath }/resources/images/subway2.jpg" style="width:100%">
		</div>
		<div class="mySlides w3-display-container w3-center">
		    <img src="${contextPath }/resources/images/subway3.jpg" style="width:100%">
		</div>
		<div class="mySlides w3-display-container w3-center">
		    <img src="${contextPath }/resources/images/main.jpg" style="width:100%">
		</div>
		<br/>
		<div class="menu">
			<div>
				<img src="${contextPath }/resources/images/name.PNG" style="width:30%">
				<div class="menuSlides w3-display-container w3-center">
				    <img src="${contextPath }/resources/images/menu1.PNG" style="width:100%">
				</div>
				  <div class="menuSlides w3-display-container w3-center">
				    <img src="${contextPath }/resources/images/menu2.PNG" style="width:100%">
				</div>
				<div class="menuSlides w3-display-container w3-center">
				    <img src="${contextPath }/resources/images/menu3.PNG" style="width:100%">
				</div>
			</div>
	  	</div>
  		<p><br></p>
  		<div class="main_list">
			<img src="${contextPath }/resources/images/fresh.jpg" style="width:30%">
			<img class="w3-right" src="${contextPath }/resources/images/his.png" style="width:60%">
			<p><br></p>
			<img src="${contextPath }/resources/images/core.PNG" style="width:100%">
			<img src="${contextPath }/resources/images/smart.PNG" style="width:100%">
		</div>
		
	<!-- End Page Content -->
	</div>


	<script>
		// Automatic Slideshow - change image every 3 seconds
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
		  setTimeout(carousel, 3000);    
		}
		
		var menuIndex = 0;
		menuCarousel();
		
		function menuCarousel() {
		  var i;
		  var x = document.getElementsByClassName("menuSlides");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";  
		  }
		  menuIndex++;
		  if (menuIndex > x.length) {menuIndex = 1}    
		  x[menuIndex-1].style.display = "block";  
		  setTimeout(menuCarousel, 3000);    
		}
		
		/* var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
		  	showDivs(slideIndex += n);
		}

		function showDivs(n) {
		  	var i;
		  	var x = document.getElementsByClassName("menuSlides");
		  	if (n > x.length) {slideIndex = 1}
		  	if (n < 1) {slideIndex = x.length}
		  	for (i = 0; i < x.length; i++) {
		    	x[i].style.display = "none";  
		  	}
		  	x[slideIndex-1].style.display = "block";  
		}
		
		
		function findProductByCategoryAjax(category){
				var ctg ={
					category_code : category
			    };
				
				$.ajax({
					url: "${contextPath}/findProductByCategoryAjax",
					type: "post",
					data: ctg,
					success:function(data){
						location.reload();
					}
				});   	
		} */
	</script>
</body>
</html>

 <%@ include file="./include/footer.jsp" %> 