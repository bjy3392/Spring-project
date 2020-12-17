<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
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
	 		var calcVal = ${vo.price}
	        for (var i=0; i<check_count; i++) {
	            if (document.getElementsByName("addMenu")[i].checked == true) {
	            	var price = document.getElementsByName("addMenu")[i].value;
	            	price = price.split("/")[0];
	            	calcVal+= Number(price);
	            }
	        }
	        totPrice.innerHTML = calcVal +"원";
	    	myform.price.value = calcVal;
		}

		//주문하기
		function orderCheck(){
			var res = confirm("장바구니에 추가되었습니다. 계속 주문하시겠습니까?");
			if(res){
				location.href = "${contextPath}/order/productList";
			}
			else{
				var option =""
				var count = document.getElementsByName("bread").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("bread")[i].checked == true) {
		            	option += document.getElementsByName("bread")[i].value +"/";
		            }
		        }
		        count = document.getElementsByName("vegetable").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("vegetable")[i].checked == true) {
		            	option += document.getElementsByName("vegetable")[i].value  +"/";
		            }
		        }
		        count = document.getElementsByName("sauce").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("sauce")[i].checked == true) {
		            	option += document.getElementsByName("sauce")[i].value  +"/";
		            }
		        }
		        count = document.getElementsByName("addMenu").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("addMenu")[i].checked == true) {
		            	var price = document.getElementsByName("addMenu")[i].value;
		            	code = price.split("/")[1];
		            	option += code  +"/";
		            }
		        }
		        myform.option.value = option; 
		        
				myform.submit();	
			}
		}
		
	</script>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 100px">
		<div class="order_con">
			<form id="myform" method="post">
				<img src="${contextPath }/content/${vo.image}" style="width:500px;">
				<font size="10">${vo.product_name }</font>			
				<table class="table table-bordered">
				    <tbody>
				    	<tr>
				    		<td>
				    			<c:forEach var="vo" items="${vosB }">
				    				<input type="radio" name="bread" id="bread" class="input-hidden" value="${vo.option_code }" required/>
									<label for="bread">
										<img src="${contextPath }/content/${vo.image}" style="width:100px;"> &nbsp; ${vo.option_name }&emsp;&emsp;
									</label>
				    			</c:forEach>
				     		</td> 
				     	</tr>
				    	<tr>
				    		<td>
				    			<c:forEach var="vo" items="${vosV }">
						        	<input type="checkbox" name="vegetable" id="vegetable" class="input-hidden" value="${vo.option_code }"/>
									<label for="vegetable">
										<img src="${contextPath }/content/${vo.image}" style="width:100px;"> &nbsp; ${vo.option_name }&emsp;&emsp;
									</label>
								</c:forEach>
				     		</td> 
				     	</tr>
				    	<tr>
				    		<td>
				    			<c:forEach var="vo" items="${vosS }">
						        	<input type="checkbox" name="sauce" id="sauce" class="input-hidden" value="${vo.option_code }" onclick="count_ck(this)"/>
									<label for="sauce">
										<img src="${contextPath }/content/${vo.image}" style="width:100px;"> &nbsp; ${vo.option_name }&emsp;&emsp;
									</label>
				    			</c:forEach>
				     		</td> 
				     	</tr>
				    	<tr>
				    		<td>
				    			<c:forEach var="vo" items="${vosA }">
						        	<input type="checkbox" name="addMenu" id="addMenu" class="input-hidden" value="${vo.price }/${vo.option_code}" onclick="calcPrice(${vo.price})"/>
									<label for="addMenu">
										<img src="${contextPath }/content/${vo.image}" style="width:100px;"> &nbsp; ${vo.option_name }&emsp;${vo.price} &emsp;
									</label>
				    			</c:forEach>
				     		</td> 
				     	</tr>
				    </tbody>  
			  	</table>	
			  	총 결제 금액 : <div id="totPrice">${vo.price }원</div>
			  	<button >주문하기</button> 
			  	<button type="button" onclick="javascript:orderCheck()">장바구니</button> 
			  	<input name="menu" type="hidden" value="${vo.product_code}"/>
			  	<input name="option" type="hidden" />
			  	<input name="price" type="hidden" />
		  	</form>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>