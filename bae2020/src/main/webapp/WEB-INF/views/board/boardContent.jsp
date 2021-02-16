<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script>
		function deleteBoard(idx){
			var res = confirm("삭제하시겠습니까?");
			if(!res){
				return false;
			}
			else{
				location.href = "${contextPath}/board/deleteBoard?idx="+idx;
			}
		}
		
		function updateBoardByGoodAjax(board_idx){
			var board ={
					idx: board_idx
			}
			
			$.ajax({
				url: "${contextPath}/board/updateBoardByGood",
				type: "post",
				data: board,
				success:function(data){	
					location.reload();
				}
			});  
		}
		
		function findCartStoreByMidAjax(){
			$.ajax({
				url: "${contextPath}/order/findCartStoreByMidAjax",
				type: "post",
				success:function(data){
					if(data!=''){
						$("#store").val(data);
						insertCartAjax();
					}
					else{
						viewStoreMap('cart');
					}
				}
			});  
		} 
		
		function viewStoreMap(route){
			var url = "${contextPath}/board/viewStoreMap?route="+route;
			window.open(url,"nwin","width=1000px, height=700px");
		}
		
		function setChildValue(route,store){
			$("#store").val(store);
			if(route=='cart'){
				insertCartAjax();
			}
			else{
				$("#myform").submit();
			}
		}
		//출처: https://multifrontgarden.tistory.com/5 [우리집앞마당]
		
		function insertCartAjax(){			
			var formData = new FormData($('#myform')[0]);
		        
         	$.ajax({
				url: "${contextPath}/order/insertCart",
				type: "post",
				data: formData,
				processData: false, 
				contentType: false, 
				success:function(data){
					var res = confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
					if(!res){
						return false;
					}
					else{
						location.href = "${contextPath}/order/viewCartList";
					}
				}
			});  
		} 
		
		function directOrder(){
			viewStoreMap();
		}
		
	</script>
	<style>
		body{
			background-color: #f6f6f6;
		}
		.main_title{
			text-align: center;
		}
		
		.main_list {
		    width: 1000px;
		    margin: 0 auto;
		}
		
		.list_start {
		    text-align: center;
		}
		
		.list_detail {
		   	text-align: left; 
		    display: inline-block;
		    width: 700px;
		    height: 210px;
			border: 0px solid;
		    margin-bottom: 5px;
			background-color: #fff;
		}
		input[type=checkbox] {
			transform : scale(1.5);
		}
		#btn {
			background-color: #009223; /* Green */
			border: none;
			color: #ffce32;
			padding: 10px 18px;
			text-align: left;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			cursor: pointer;
			font-weight: bold;
		}
		.icon_btn{
			padding: 0;
			font-size: 30px;
			margin: 0px 0px 0 0;
			padding: 6px 15px;
			cursor: pointer;
			font-weight: bold;
			border: none;
			background: none; 
			color:#009223;
		}
		#btn_div{
			padding: 15px 15px;
		}
		#icon_btn_good{
			padding: 0;
			font-size: 30px;
			margin: 0px 0px 0 0;
			padding: 6px 15px;
			cursor: pointer;
			font-weight: bold;
			border: none;
			background: none; 
			color:red;
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px; ">
		<div class="main_list" >
		 	<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>추천메뉴 게시판</h2>
				<p><br/><br/></p>
			</div>
			<button type="button" class="w3-round-xlarge icon_btn" id="back" onclick="location.href='${contextPath }/board/viewBoardList?sort=${sort }&product=${product }'"><i class="fas fa-reply"></i></button><label for="back">목록</label>
			<div class="list_start">
				<div class="w3-row w3-padding-10 w3-white" style="text-align:left">
					<div class="w3-row w3-padding-large" >
						<table class="w3-table w3-bordered">
							<tr>
								<th>글쓴이</th>
								<th>메뉴</th>
								<th>날짜</th>
								<th>좋아요</th>
							</tr>
							<tr>
								<td>${vo.mid}</td>
								<td>${vo.product_name }</td>
								<td>${vo.create_dt }</td>
								<td>${vo.good}</td>
							</tr>
						</table>	
					</div>
				</div>
				<p></p>
				<div class="w3-row w3-padding-10 w3-white">
		    		<div class="w3-col l6 w3-padding-large">
		    			<p></p>
		    			<h2 class="w3-center">${vo.product_name }</h2><br>
		      			<p class="w3-text-grey">옵션: ${vo.option_unit }</p>
		      			<p class="w3-text-grey">추가: ${vo.add_unit }</p>
		      			<p class="w3-text-grey">미트: ${vo.meat_unit }</p><br/>
			      	</div>
		    		<div class="w3-col l6 w3-padding-large">
		      			<img src="${contextPath }/product/${vo.category_code }/${vo.image}" class="w3-round w3-image" style="width: 300px">
		    		</div>
		    		<div class="w3-col" style="padding:0px; margin:0px; line-height:0">
		    			<hr style="width:80%; text-align:center; padding:0px; margin: 0px auto;"/>
		    		</div>
		    		<div class="w3-col l6 w3-padding-small">
		    		</div>
		    		<div class="w3-col l6 w3-padding-small" >
		    			(추가:<fmt:formatNumber value="${vo.price_add }" pattern="#,###" />, 미트:<fmt:formatNumber value="${vo.price_meat }" pattern="#,###" />)
				      	주문 금액 <strong style="font-size: 40px; color:#ff8300"><fmt:formatNumber value="${vo.price+vo.price_add+vo.price_meat }" pattern="#,###" /></strong> 원
				    </div>
		    	</div>    					
		  		<p></p>
		  		<div class="w3-row w3-padding-10 w3-white" id="btn_div">
		  			<c:if test="${vo.mid == smid }">
		  				<button class="w3-round-xlarge" id="btn" onclick="location.href='${contextPath}/board/viewBoardUpdate?idx=${vo.idx }&sort=${sort }&product=${product }'">수정</button>
						<button class="w3-round-xlarge" id="btn" onclick="deleteBoard('${vo.idx }')">삭제</button>
		  			</c:if>
		    		<button class="w3-round-xlarge" id="btn" onclick="findCartStoreByMidAjax()">장바구니추가</button>
					<button class="w3-round-xlarge" id="btn" onclick="directOrder()">주문하기</button>
		  			<button type="button" class="w3-round-xlarge" id="icon_btn_good" onclick="updateBoardByGoodAjax('${vo.idx }')"><i class="far fa-grin-hearts"></i></button>
			    </div>
			    <form id="myform" method="post" action="${contextPath }/order/viewOrderInput/direct">
					<input type="hidden" name="product" value="${vo.product }"/>
					<input type="hidden" name="option_unit" value="${vo.option_unit }"/>
					<input type="hidden" name="add_unit" value="${vo.add_unit }"/>
					<input type="hidden" name="meat_unit" value="${vo.add_unit }"/>
					<input type="hidden" id="price" name="price" value="${vo.price }"/>
					<input type="hidden" id="price_add" name="price_add" value="${vo.price_add }"/>
					<input type="hidden" id="price_meat" name="price_meat" value="${vo.price_meat }"/>
					<input type="hidden" id="store" name="store" value=""/>
        		</form>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>