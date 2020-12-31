<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script>
		//소스 선택  개수 제한
		function count_ck(obj){
			var chkbox = document.getElementsByName("sauce");
			var chkCnt = 0;
			for(var i=0;i<chkbox.length; i++){
				if(chkbox[i].checked){
					chkCnt++;
				}
			}
			if(chkCnt>1){
				alert("1개이상 선택할 수 없습니다.");
				obj.checked = false;
				return false;
			}
		}
		//출처: https://hyunssssss.tistory.com/259 [현's 블로그]
	
		
		//추가메뉴 선택시 가격 계산
		function calcPrice(price) {
	        var check_count = document.getElementsByName("addMenu").length;
	 		var calcVal = ${prod.price}
	        for (var i=0; i<check_count; i++) {
	            if (document.getElementsByName("addMenu")[i].checked == true) {
	            	var price = document.getElementsByName("addMenu")[i].value;
	            	price = price.split("/")[0];
	            	calcVal+= Number(price);
	            }
	        }
	        totPrice.innerHTML = calcVal +"원";
	    	myform.totPriceVal.value = calcVal;
		}

		
		
		//장바구니에 넣기
		function insertCartAjax(){
			if ( $("#myform").find('[name=bread]:checked').length < 1 ) {
			     alert("빵은 필수 선택입니다.");
			     return false;
			}
			
			var product = myform.product.value;
			var totPrice = myform.totPriceVal.value;
			var options =""
			var count = document.getElementsByName("bread").length;
			
	        for (var i=0; i<count; i++) {
	            if (document.getElementsByName("bread")[i].checked == true) {
	            	options += document.getElementsByName("bread")[i].value +"/";
	            }
	        }
	        count = document.getElementsByName("vegetable").length;
	        for (var i=0; i<count; i++) {
	            if (document.getElementsByName("vegetable")[i].checked == true) {
	            	options += document.getElementsByName("vegetable")[i].value  +"/";
	            }
	        }
	        count = document.getElementsByName("sauce").length;
	        for (var i=0; i<count; i++) {
	            if (document.getElementsByName("sauce")[i].checked == true) {
	            	options += document.getElementsByName("sauce")[i].value  +"/";
	            }
	        }
	        count = document.getElementsByName("addMenu").length;
	        for (var i=0; i<count; i++) {
	            if (document.getElementsByName("addMenu")[i].checked == true) {
	            	var price = document.getElementsByName("addMenu")[i].value;
	            	code = price.split("/")[1];
	            	options += code  +"/";
	            }
	        }
	        var order ={
	        		product: product,
	        		options : options,
	        		price : totPrice
	        }
	        
	        $.ajax({
				url: "${contextPath}/order/insertCartAjax",
				type: "post",
				data: order,
				success:function(data){
					var res = confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
					if(!res){
						location.href = "${contextPath}/order/viewProductList";
					}
					else{
						location.href = "${contextPath}/order/viewCartList";
					}
				}
			}); 
			
		}
		
		
		$(document).ready(function() { 
			$("input:checkbox").on('click', function() { 
				if ( $(this).prop('checked') ) { 
					$(this).addClass("selected"); } 
				else { $(this).removeClass("selected"); 
				} 
				}); 
			});

		//출처: https://cocosoft.kr/397 [코코소프트]
		
	</script>
	<style>
		.selected{text-decoration:line-through;font-weight:700;color:red}
		/* 출처: https://cocosoft.kr/397 [코코소프트] */
		
		/* input[type='checkbox']{
       	display: none;
       	} */
       	.order_con{
       		width:1000px;
       		align: center;
       	}
       	
		#menuImg {
		  margin: 0;
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		}
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
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="order_con">
			<form id="myform" method="post">
				<table class="table table-bordered">
				    <tbody>
					    <tr>
					    	<td>
				    			${prod.product_name }
					    	</td>
					    </tr>
				    	<tr>
				    		<td>
				    			<c:forEach var="vo" items="${vosB }">
				    				<input type="radio" name="bread" id="bread" class="input-hidden" value="${vo.option_name }" required/>
									<label for="bread">
										<img src="${contextPath }/content/${vo.image}" style="width:100px;"> &nbsp; ${vo.option_name }&emsp;&emsp;
									</label>
				    			</c:forEach>
				     		</td> 
				     	</tr>
				    	<tr>
				    		<td>
				    			<c:forEach var="vo" items="${vosV }">
						        	<input type="checkbox" name="vegetable" id="vegetable" class="input-hidden" value="${vo.option_name }"/>
									<label for="vegetable">
										<img src="${contextPath }/content/${vo.image}" style="width:100px;"> &nbsp; ${vo.option_name }&emsp;&emsp;
									</label>
								</c:forEach>
				     		</td> 
				     	</tr>
				    	<tr>
				    		<td>
				    			<c:forEach var="vo" items="${vosS }">
						        	<input type="checkbox" name="sauce" id="sauce" class="input-hidden" value="${vo.option_name }" onclick="count_ck(this)"/>
									<label for="sauce">
										<img src="${contextPath }/content/${vo.image}" style="width:100px;"> &nbsp; ${vo.option_name }&emsp;&emsp;
									</label>
				    			</c:forEach>
				     		</td> 
				     	</tr>
				    	<tr>
				    		<td>
				    			<c:forEach var="vo" items="${vosA }">
									<label for="addMenu">
						        	<input type="checkbox" name="addMenu" id="addMenu" class="input-hidden" value="${vo.price }/${vo.option_name}" onclick="calcPrice(${vo.price})"/>
										<img src="${contextPath }/content/${vo.image}" style="width:100px;"> &nbsp; ${vo.option_name }&emsp;${vo.price} &emsp;
									</label>
				    			</c:forEach>
				     		</td> 
				     	</tr>
				    </tbody>  
			  	</table>	
			  	총 결제 금액 : <div id="totPrice">${prod.price }원</div>
			  	<button class="w3-round-xlarge" type="button" onclick="javascript:insertCartAjax()">주문하기</button> 
			  	<button class="w3-round-xlarge" type="button" onclick="javascript:insertCartAjax()">장바구니</button> 
			  	<input name="product" type="hidden" value="${prod.product_code }"/>
			  	<input name="totPriceVal" type="hidden" value="${prod.price }"/>
		  	</form>
		</div>
			
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>