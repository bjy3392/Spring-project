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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		function checkAll(){
		      if( $("#all_select").is(':checked') ){
		        $("input[type=checkbox]").prop("checked", true);
		      }else{
		        $("input[type=checkbox]").prop("checked", false);
		      }
		      calcPrice();
		}
		
		 function checkEach(){
		      if($("#chkProd").is(':checked')){
		      }else{
			        $("input[id=all_select]").prop("checked", false);
		      }
		      calcPrice();
		} 
		
		 // "+" 버큰 클릭시
		function insertOrderAjax(idx) {
			if($("#cnt_"+idx).val() >= 5){
				alert("5개 이상 주문 할 수 없습니다.");
				return;
			}
			
			var price = $("#price_"+idx).val();
			var cnt = parseInt( $("#cnt_"+idx).val()) +1 ;
			
			var cart ={
				cart_idx : idx,
				purpose : "1"	
		    };
			
			$.ajax({
				url: "${contextPath}/order/updateCartAjax",
				type: "post",
				data: cart,
				success:function(data){
					changeValue(idx,price,cnt);
				}
			});   
		}

		// "-" 버큰 클릭시
		function deleteOrderAjax(idx) {
			if($("#cnt_"+idx).val() <= 1){
				alert("1개이하는 선택할 수 없습니다.");
				return;
			}
			
			var price = $("#price_"+idx).val();
			var cnt = parseInt( $("#cnt_"+idx).val())-1;
			
			var cart ={
				cart_idx : idx,
				purpose : "-1"	
		    };
			
			$.ajax({
				url: "${contextPath}/order/updateCartAjax",
				type: "post",
				data: cart,
				success:function(data){					
					changeValue(idx,price,cnt);
				}
			});   
		}
		
		//삭제버튼 클릭시
		function deleteCartAjax(idx){
			if(count_ck()){
				var res = confirm("선택한 항목을 삭제하시겠습니까?");
				if(!res){
					return;
				}
				else{
					var count = document.getElementsByName("chkProd").length;
					var arrayCartIdx = [];
			        for (var i=0; i<count; i++) {
			            if (document.getElementsByName("chkProd")[i].checked == true) {
			            	var chkProd = document.getElementsByName("chkProd")[i].value;
			            	chkProd = chkProd.split("/")[1];
			            	arrayCartIdx.push(chkProd);
			            }
			        }
			        
			        var cart ={
			        		arrayCartIdx: arrayCartIdx
					    };
			        
			       $.ajax({
						url: "${contextPath}/order/deleteCartAjax",
						type: "post",
						data: cart,
						success:function(data){	
							alert("선택한 항목이 삭제 되었습니다.")
							for(var idx in arrayCartIdx){
								$("#cart_"+arrayCartIdx[idx]).remove();					
							}
							calcPrice();
						}
					});  
				}
			}
			else{
				return false;
			}
		}
		
		//개수가 변할때 화면에 보이는 가격과 개수를 변경해준다.
		function changeValue(idx,price,cnt){
			var totPrice= parseInt(price) * (cnt);;
			$("#chkProd_"+idx).val(totPrice+"/"+idx) ;
			
			totPrice = addComma(totPrice);
			
			$("#txtCnt_"+idx).html(cnt);
			$("#totPrice_"+idx).html(totPrice);
			$("#cnt_"+idx).val(cnt); 
			calcPrice();
		}
		
		//천단위 콤마 펑션
        function addComma(num){
        	var len, point, str; 
            num = num + ""; 
            point = num.length % 3 ;
            len = num.length; 
            str = num.substring(0, point); 
            while (point < len) { 
                if (str != "") str += ","; 
                str += num.substring(point, point + 3); 
                point += 3; 
            } 
            return str;
		    /*  출처: https://fruitdev.tistory.com/160 [과일가게 개발자] */
	    }

		//총액 계산
		function calcPrice(){
			var count = document.getElementsByName("chkProd").length;
			var price = 0;
	        for (var i=0; i<count; i++) {
	            if (document.getElementsByName("chkProd")[i].checked == true) {
	            	var chkProd = document.getElementsByName("chkProd")[i].value;
	            	chkProd = chkProd.split("/")[0];
	            	price += parseInt(chkProd); 
	            }
	        }
			$("#totPriceAll").html(addComma(price));
		}
		
		//주문하기
		function viewOrder(){
			if(count_ck()){
				var count = document.getElementsByName("chkProd").length;
				var arrayCartIdx = [];
				
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("chkProd")[i].checked == true) {
		            	var chkProd = document.getElementsByName("chkProd")[i].value;
		            	chkProd = chkProd.split("/")[1];
		            	arrayCartIdx.push(chkProd);
		            }
		        }
		        $("#arrayIdx").val(arrayCartIdx); 
		        myform.submit();
			}
			else{
				return false;
			}
			
		}
		
		//제품을 한개 이상 선택
		function count_ck(){
			var chkbox = document.getElementsByName("chkProd");
			var chkCnt = 0;
			for(var i=0;i<chkbox.length; i++){
				if(chkbox[i].checked){
					chkCnt++;
				}
			}
			if(chkCnt<1){
				alert("1개이상 선택해주세요.");
				return false;
			}
			else{
				return true;
			}
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
		#btn_del {
			background-color: #fff; 
			color: #009223;
			padding: 6px 15px;
			text-align: left;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 0px 0px;
			cursor: pointer;
			font-weight: bold;
			border-color: #009223;
			border-width: 3px;
			border-style: solid;
		}
		#icon_btn{
			padding: 0;
			border: none;
			background: none; 
			color:#009223;
		}
		#storeInfo{
			padding: 15px 15px;
			font-size: 18px;
			font-weight: bold;
		}
		#storeDiv{
			background: #ffce32; 
			text-align:left;
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px; ">
		<div class="main_list" >
		 	<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>장바구니</h2>
				<p><br/><br/></p>
			</div>
			<c:if test="${empty vos}">
				<div class="list_start">
					<div class="w3-row w3-padding-10 w3-white" style="text-align:left">
						<div class="w3-row w3-padding-large">
							<img src="${contextPath }/resources/images/cart.PNG" style="width:100%">
						</div>
					</div>
					
				</div>
			</c:if>
			<c:if test="${not empty vos}">
				<div class="list_start">
					<div class="w3-panel w3-round-xlarge" id="storeDiv">
						<div id="storeInfo">
							${storeVo.store_name } :${storeVo.roadAddress }
						</div>
					</div>
					<div class="w3-row w3-padding-10 w3-white" style="text-align:left">
						<div class="w3-row w3-padding-large" >
							<input type="checkbox" id="all_select" onclick="checkAll();">&nbsp;&nbsp;<font style="font-weight: bold; font-size: 20px;">전체선택</font>
							<button class="w3-round-xlarge w3-right" id="btn_del" onclick="javascript:deleteCartAjax('${vo.cart_idx }')">선택삭제</button>
						</div>
					</div>
					<p></p>
					<c:forEach var="vo" items="${vos }">
					  	<div class="w3-row w3-padding-10 w3-white" id="cart_${vo.cart_idx }">
				    		<div class="w3-col l6 w3-padding-large">
				    			<p></p>
				      			<input type="checkbox" id="chkProd_${vo.cart_idx }" name="chkProd" value="${(vo.price+vo.price_add+vo.price_meat ) * vo.cnt }/${vo.cart_idx }" onclick="checkEach();" style="float:left;"><h2 class="w3-center">${vo.product_name }</h2><br>
				      			<p class="w3-text-grey">옵션: ${vo.option_unit }</p>
				      			<p class="w3-text-grey">추가: ${vo.add_unit }</p>
				      			<p class="w3-text-grey">미트: ${vo.meat_unit }</p><br/>
				      			<div style="font-size: 30px; color:#009223; width:200px; ">
							      	<button id="icon_btn" onclick="deleteOrderAjax('${vo.cart_idx }');"><i class="fas fa-minus-circle"></i></button>
							      	<span id="txtCnt_${vo.cart_idx }">${vo.cnt }</span>
							      	<button id="icon_btn" onclick="insertOrderAjax('${vo.cart_idx }');"><i class="fas fa-plus-circle"></i></button> 
							    </div>
					      	</div>
				    		<div class="w3-col l6 w3-padding-large">
				      			<img src="${contextPath }/product/${vo.category_code }/${vo.image}" class="w3-round w3-image" alt="Menu" style="width: 300px">
				    		</div>
				    		<div class="w3-col" style="padding:0px; margin:0px; line-height:0">
				    			<hr style="width:80%; text-align:center; padding:0px; margin: 0px auto;"/>
				    		</div>
				    		<div class="w3-col l6 w3-padding-small">
				    		</div>
				    		<div class="w3-col l6 w3-padding-small" >
				    			(추가:<fmt:formatNumber value="${vo.price_add }" pattern="#,###" />, 미트:<fmt:formatNumber value="${vo.price_meat }" pattern="#,###" />)
						      	주문 금액 <strong style="font-size: 40px; color:#ff8300"><span id="totPrice_${vo.cart_idx }"><fmt:formatNumber value="${(vo.price+vo.price_add+vo.price_meat )* vo.cnt }" pattern="#,###" /></span></strong> 원
						    </div>
					    	<input type="hidden" id="price_${vo.cart_idx }" name="price_${vo.cart_idx }" value="${vo.price+vo.price_add+vo.price_meat}"/>
					    	<input type="hidden" id="cnt_${vo.cart_idx }" name="cnt_${vo.cart_idx }" value="${vo.cnt}"/>
				    	</div>    					
				  		<p></p>
				    </c:forEach>
				    <div class="w3-row w3-padding-10 w3-white">
			    		<div class="w3-col l6 w3-padding-small">
			    		 	총 주문 금액 <strong style="font-size: 40px; color:#ff8300"><span id="totPriceAll">0</span></strong> 원
			    		</div>
			    		<div class="w3-col l6 w3-padding-small" >
			    			<button class="w3-round-xlarge" id="btn" onclick="location.href='${contextPath}/order/setStore?store=${storeVo.store_code }'">추가하기</button>
							<button class="w3-round-xlarge" id="btn" onclick="javascript:viewOrder()">주문하기</button>
					   		<form id="myform" method="post" action="${contextPath }/order/viewOrderInput/cart">
						    	<input type="hidden" id="arrayIdx" name="arrayIdx[]" value=""/>
						    	<input type="hidden" id="store" name="store" value="${storeVo.store_code }"/>
						    </form> 
					    </div>
					    
				    </div>
				</div>
			</c:if>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>