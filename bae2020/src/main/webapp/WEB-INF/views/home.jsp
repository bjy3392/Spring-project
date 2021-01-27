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
	<style>
		body {
			font-family: "Lato", sans-serif;
			background-color: #f6f6f6;
		}
		.mySlides {
			display: none
			}
		.main_list {
			width: 1000px;
			margin: 0 auto;
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
			cursor: pointer;
		}
		#history{
			background-color: #fff;
		}
	</style>
	<body>
	<!-- Page content -->
	<div class="w3-content" style="max-width:2000px;margin-top:160px">
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
		<div id="history">
		<div class="main_list">
			<div>
				<div>
					<br/>
					<img src="${contextPath }/resources/images/name.PNG" style="width:30%">
					<div class="">
						<c:forEach var="voC" items="${vosC }">
							<ul>
								<li onclick="findProductByCategoryAjax('${voC.category_code }')">${voC.category_name }&nbsp;||&nbsp;</li>
							</ul>
						</c:forEach>
					</div>
					<div class="w3-content w3-display-container">
							<div class="menuSlides">
								<c:forEach  var="vo" items="${vos }">
									<img  src="${contextPath }/product/${vo.category_code }/${vo.image}" style="width:25%">
								</c:forEach>
							</div>
					
					  	<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
					  	<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
					</div>
				</div>
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
		
		var slideIndex = 1;
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
		}
	</script>
</body>
</html>

 <%@ include file="./include/footer.jsp" %> 