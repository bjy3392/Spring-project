<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${contextPath}/resources/js/woo.js"></script>
	<script>
		$(document).ready(function(){
		    $("#chk").change(function(){
		        if($("#chk").is(":checked")){
		        	var query = {
							mid : "${smid}"		
					}
					
					$.ajax({
						url : "${contextPath}/user/findUserAjax",
						type : "get",
						data : query,
						success : function(data){
							var tel = data.tel.split("-");
							$("#postcode").val(data.postcode); 
							$("#roadAddress").val(data.roadAddress); 
							$("#detailAddress").val(data.detailAddress); 
							$("#tel1").val(tel[0]); 
							$("#tel2").val(tel[1]); 
							$("#tel3").val(tel[2]); 
							
						}
					});
		        	
		        }else{
		        	$("#postcode").val(""); 
					$("#roadAddress").val(""); 
					$("#detailAddress").val(""); 
					$("#tel1").val(""); 
					$("#tel2").val(""); 
					$("#tel3").val(""); 
		        }
		    });
		    
		    
		    $("#chkStore").change(function(){
		        if($("#chkStore").is(":checked")){
		        	$("#postcode").val(""); 
					$("#roadAddress").val(""); 
					$("#detailAddress").val(""); 
		        	$("#postcode").attr('disabled', true);
					$("#roadAddress").attr('disabled', true);
					$("#detailAddress").attr('disabled', true);
					$("#btnPost").attr('disabled', true);
					$("#chk").prop('checked',false);
					$("#chk").attr('disabled', true);
		        	
		        	
		        }else{
		        	$("#postcode").attr('disabled', false);
					$("#roadAddress").attr('disabled', false);
					$("#detailAddress").attr('disabled', false);
					$("#btnPost").attr('disabled', false);
					$("#chk").attr('disabled', false);
		        	
		        }
		    });
		});
		
		
		function insertOrder(){
			var regExpTel = /^\d{2,3}-\d{3,4}-\d{4}$/;  // 전화번호체크
			var tel = myform.tel1.value + "-" + myform.tel2.value + "-" + myform.tel3.value;
	      
			if(!regExpTel.test(tel)) {
		    	alert("전화번호를 확인하세요.");
		    	myform.tel2.focus();
		    	return false;
		    }
			else if($("#payment option:selected").val().trim() == ""){
				alert("결제방법을 선택해주세요.");
				return false;
			} 
			
			
			if($("#chkStore").is(":checked")){
				myform.delivery.value = "픽업";
			}
			else{
			    if($("#postcode").val().trim() == ""){
					alert("주소를 입력해주세요.");
					return false;
				}
			    else if($("#total").val()<=15000){
					alert("15,000 이상 배달 가능합니다.");
					return false;
			    }
			}
			
			myform.tel.value = tel;
			myform.submit();
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
		    height: auto;
			border: 0px solid;
		    margin-bottom: 5px;
			background-color: #fff;
		}
		
		table {
	      margin : 0px auto;
	      width : 650px;
	      border : 1px solid #ccc;
	      padding: 12px;
	      border-collapse: collapse;
          table-layout: fixed;
	    }
	    th {
	      text-align:center;
	      width : 120px;
	      border : 1px solid #ccc;
	    }
        td{
	      width : 530px;
	      border : 1px solid #ccc;
	      padding: 12px;
        }
        #mid_td{
	      width : 410px;
	      border : 1px solid #ccc;
	      padding: 12px;
        
        }
        #end_td{
	      width : 120px;
	      border : 1px solid #ccc;
	      padding: 12px;
        }
        #prod_td{
	      width : 530px;
	      border : 1px solid #ccc;
	      padding: 12px;
        }
        #opt_td{
	      width : 120px;
	      border : 1px solid #ccc;
	      padding: 12px;
        }
        .title{
	      margin : 5px auto;
	      width : 650px;
          color: #666666;
        }
        
	    .btn {
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
        .btn_str{
        	background-color: #fff; /* Green */
			border: none;
			color: #009223;
        }
        #bottom_btn{
		    text-align: center; 
        	padding: 50px 0 50px;
        }
        #prod{
        	font-weight: bold; 
            font-size:17px;
            padding: 10px 10px 10px 10px;
        }
        #opt{
        	padding: 10px 10px 10px 10px;
        }
        select {
        	width : 100%;
        }
        #title_name{
            font-size:25px;
        }
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<form name="myform" method="post" action="${contextPath }/order/insertOrder/${route}">
			<div class="main_list">
				<!-- 상단 제목 -->
				<div class="main_title">
					<p></p>
					<h2>주문하기</h2>
					<p><br/><br/></p>
				</div>
				<div class="list_start">
					<div class="list_detail"> 
						<p></p>
                       	<div class="title"><span id="title_name">배달정보</span>&emsp;<input type="checkbox" id="chk"  />내 정보와 동일 <input type="checkbox" id="chkStore" />매장 픽업 </div>
						<table>
							<tr>
						  		<th>주소</th>
						  		<td>
								    <p><input class="w3-border" type="text" name="postcode" id="postcode" placeholder="우편번호" readonly required>
									<button class="w3-round-xlarge btn" id="btnPost" type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br/></p>
									<p><input class="w3-border" type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" size=50></p>
									<input class="w3-border" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" size=50>
								</td>
							</tr>
							<tr>
						  		<th>연락처</th>
						  		<td>
								    <input class="w3-border" type="text" id="tel1" name="tel1" size=4 maxlength=4 required/>-
								    <input class="w3-border" type="text" id="tel2" name="tel2" size=4 maxlength=4 required/>-
								    <input class="w3-border" type="text" id="tel3" name="tel3" size=4 maxlength=4 required/>
								</td>
							</tr>	
							<tr>
						  		<th>주문시 요청사항</th>
						  		<td>
						  			<input class="w3-border" type="text" name="demand" maxlength=100/>
						  			
						  		</td>
							</tr>
							<tr>
						  		<th>매장선택(가까운거리 순으로 검색 예정)</th>
						  		<td>
						  			<button class="w3-round-xlarge btn" id="" type="button" onclick="">매장검색</button>	
						  			<span><input name="store" class="w3-border" type="text" value="미정" readonly></span>					  			
						  		</td>
							</tr>
						</table>
                        <hr style="width:100%"/>
                       	<h3 class="title">할인방법 선택(예정)</h3>
						<table>
							<tr>
						  		<th>쿠폰</th>
						  		<td id="mid_td">
                                    <select id="coupon" name="coupon">
                                        <option value="0">쿠폰선택</option>
                                        <option value="coupon1">coupon1</option>
                                        <option value="coupon2">coupon2</option>
                                    </select>
						  		</td>
                                <td id="end_td"><button class="btn_str">적용하기</button></td>
							</tr>
                            <tr>
						  		<th>포인트</th>
						  		<td>
						  			<input class="w3-border" type="text" name="point" value="0"/> 보유포인트 : P
						  			
						  		</td>
                                <td><button class="btn_str">적용하기</button></td>
							</tr>
						</table>
						<hr style="width:100%"/>
                       	<h3 class="title">결제수단 선택</h3>
						<table>
							<tr>
						  		<th width="100px">결제수단</th>
						  		<td>
						  			<select id="payment" name="payment">
                                        <option value="">결제수단</option>
                                        <option value="card">만나서 카드결제</option>
                                        <option value="cash">만나서 현금결제</option>
                                    </select>
						  			
						  		</td>
							</tr>
						</table>
                        <hr style="width:100%"/>
                       	<h3 class="title">주문내역</h3>
						<table>
							<c:set var="total" value="0"/>
							<c:forEach var="vo" items="${vos }">
								<c:set var="total" value= "${total + ((vo.price+vo.price_add+vo.price_meat ) * vo.cnt) }"/>
								<tr>
							  		<td id="prod_td">
	                                 <span id="prod">${vo.product_name }</span><span class="w3-text-grey">${vo.cnt } 개</span><br/>
	                                 <span class="w3-text-grey" id="opt">옵션:${vo.option_unit }</span><br/>
	                                 <span class="w3-text-grey" id="opt">추가:${vo.add_unit }</span><br/>
	                                 <span class="w3-text-grey" id="opt">미트:${vo.meat_unit }</span><br/>
							  		</td>
	                                <td id="opt_td">
	                                 	<fmt:formatNumber value="${(vo.price+vo.price_add+vo.price_meat ) * vo.cnt }" pattern="#,###" />
							  		</td>
								</tr>
							</c:forEach>
						</table>
                        <hr style="width:100%"/>
                       	<h3 class="title">총 결제금액</h3>
						<table>
							<tr>
						  		<td>
                                 	총 결제 금액 : <fmt:formatNumber value="${total}" pattern="#,###" /> <br/>
                                 <span class="w3-text-grey" id="opt">할인내역을 적어준다</span>
						  		</td>
							</tr>
						</table>
                        <div id="bottom_btn">
                          <button class="w3-round-xlarg btn" type="button" onclick="location.href = '${contextPath}/order/viewProductList/PROD-001'">주문추가</button>
                          <button class="w3-round-xlarge btn" type="button" onclick="location.href = '${contextPath}/order/viewCartList'">장바구니</button>
                          <button class="w3-round-xlarge btn" type="button" onclick="javascript:insertOrder()">주문하기</button>
                    	</div>
					</div>
				</div>
			</div>
			<c:set var="addIdx" value="${fn:join(arrayIdx,'/')}" />
			<input type="hidden" name="addIdx" value="${addIdx }"/> 
  			<input type="hidden" name="tel"/>
  			<input type="hidden" name="delivery" />
  			<input type="hidden" id="total" name="total" value="${total }"/>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>
