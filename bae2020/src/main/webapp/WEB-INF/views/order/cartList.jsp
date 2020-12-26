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
			var prod_code = $("#prod_code_"+idx).val();
			var options = $("#options_"+idx).val();
			var price = $("#price_"+idx).val();
			var cnt = parseInt( $("#cnt_"+idx).val()) +1 ;
			var order ={
				orderId	: "${orderId}",	
        		prod_code: prod_code,
        		options : options,
        		price : price,
        		mid : "${smid}"
		    };
			$.ajax({
				url: "${contextPath}/order/insertOrderAjax",
				type: "post",
				data: order,
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
			var prod_code = $("#prod_code_"+idx).val();
			var options = $("#options_"+idx).val();
			var price = $("#price_"+idx).val();
			var cnt = parseInt( $("#cnt_"+idx).val())-1;
			
			var order ={
				orderId	: "${orderId}",	
        		prod_code: prod_code,
        		options : options,
        		price : price,
        		mid : "${smid}"
		    };
			$.ajax({
				url: "${contextPath}/order/deleteOrderAjax",
				type: "post",
				data: order,
				success:function(data){					
					changeValue(idx,price,cnt);
				}
			});   
		}
		
		//개수가 변할때 화면에 보이는 가격과 개수를 변경해준다.
		function changeValue(idx,price,cnt){
			var totPrice= parseInt(price) * (cnt);;
			$("#chkProd_"+idx).val(totPrice) ;
			
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
	            	price += parseInt(document.getElementsByName("chkProd")[i].value); 
	            }
	        }
			$("#totPriceAll").html(addComma(price));
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
							장바구니가 비었습니다.
						</div>
					</div>
					
				</div>
			</c:if>
			<c:if test="${not empty vos}">
				<div class="list_start">
					<div class="w3-row w3-padding-10 w3-white" style="text-align:left">
						<div class="w3-row w3-padding-large" >
							<input type="checkbox" id="all_select" onclick="checkAll();">&nbsp;&nbsp;<font style="font-weight: bold; font-size: 20px;">전체선택</font>
							<button class="w3-round-xlarge w3-right" id="btn_del" onclick="location.href='${contextPath}/order/productList'">선택삭제</button>
						</div>
					</div>
					<p></p>
					<c:forEach var="vo" items="${vos }">
					  	<div class="w3-row w3-padding-10 w3-white" id="menu">
				    		<div class="w3-col l6 w3-padding-large">
				    			<p></p>
				      			<input type="checkbox" id="chkProd_${vo.order_detail_id }" name="chkProd" value="${vo.price * vo.cnt }/" onclick="checkEach();" style="float:left;"><h2 class="w3-center">${vo.product_name }</h2><br>
				      			<p class="w3-text-grey">옵션: ${vo.options }</p><br>
				      			<div style="font-size: 30px; color:#009223; width:200px; align:center;">
							      	<button id="icon_btn" onclick="deleteOrderAjax('${vo.order_detail_id }');"><i class="fas fa-minus-circle"></i></button>
							      	<span id="txtCnt_${vo.order_detail_id }" name="cnt">${vo.cnt }</span>
							      	<button id="icon_btn" onclick="insertOrderAjax('${vo.order_detail_id }');"><i class="fas fa-plus-circle"></i></button> 
							    </div>
					      	</div>
				    		<div class="w3-col l6 w3-padding-large">
				      			<img src="${contextPath }/content/${vo.product_code}.jpg" class="w3-round w3-image" alt="Menu" style="width: 300px">
				    		</div>
				    		<div class="w3-col" style="padding:0px; margin:0px; line-height:0">
				    			<hr style="width:80%; text-align:center; padding:0px; margin: 0px auto;"/>
				    		</div>
				    		<div class="w3-col l6 w3-padding-small">
				    		</div>
				    		<div class="w3-col l6 w3-padding-small" >
						      	주문 금액 <strong style="font-size: 40px; color:#ff8300"><span id="totPrice_${vo.order_detail_id }"><fmt:formatNumber value="${vo.price * vo.cnt }" pattern="#,###" /></span></strong> 원
						    </div>
						    <form id="myform_${vo.order_detail_id }">
						    	<input type="hidden" id="prod_code_${vo.order_detail_id }" name="prod_code+${vo.order_detail_id }" value="${vo.product_code}"/>
						    	<input type="hidden" id="options_${vo.order_detail_id }" name="options_${vo.order_detail_id }" value="${vo.options}"/>
						    	<input type="hidden" id="price_${vo.order_detail_id }" name="price_${vo.order_detail_id }" value="${vo.price}"/>
						    <%-- 	<input type="hidden" id="totPriceValue_${vo.order_detail_id }" name="totPriceValue_${vo.order_detail_id }" value="${vo.price*vo.cnt}"/> --%>
						    	<input type="hidden" id="cnt_${vo.order_detail_id }" name="cnt_${vo.order_detail_id }" value="${vo.cnt}"/>
						    </form>
				    	</div>    					
				  		<p></p>
				    </c:forEach>
				    <div class="w3-row w3-padding-10 w3-white" id="menu">
			    		<div class="w3-col l6 w3-padding-small">
			    		 	총 주문 금액 <strong style="font-size: 40px; color:#ff8300"><span id="totPriceAll">0</span></strong> 원
			    		</div>
			    		<div class="w3-col l6 w3-padding-small" >
			    			<button class="w3-round-xlarge" id="btn" onclick="location.href='${contextPath}/order/productList'">추가하기</button>
							<button class="w3-round-xlarge" id="btn" onclick="location.href='${contextPath}/order/orderInput'">주문하기</button>
					    </div>
				    </div>
				</div>
			</c:if>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>