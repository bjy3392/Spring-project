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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac95c27acc45476a2c2bc9417405e7f6&libraries=services"></script>
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
		
		//roadAddress변경 시 calcLength() 실행하기 위해서 trigger 사용
		$(document).ready(function(){
		    var $input = $("#roadAddress"); // readonly inputBox  
		        $("#roadAddress").on('input', function() {
		        	calcLength();
		    });
		});		
		(function ($) {
		    var originalVal = $.fn.val;
		    $.fn.val = function (value) {
		        var res = originalVal.apply(this, arguments);
		 
		        if (this.is('input:text') && arguments.length >= 1) {
		            // this is input type=text setter
		            this.trigger("input");
		        }
		 
		        return res;
		    };
		})(jQuery);
		
		
		function resetAddress(){
			$("#detailAddress").val(""); 
			execDaumPostcode();
		}
		
		function calcLength(){
			if($("#chkStore").is(":checked")){
		    	$('#mlon').val(0);
				$('#mlat').val(0);
		    	$('#vlon').val(0);
				$('#vlat').val(0);
			}
			else{
				var geocoder = new kakao.maps.services.Geocoder();
	
				var store = '${storeVo.roadAddress}';
				var arrival = $('#roadAddress').val();
				
				var coords1 = geocoder.addressSearch(store, function(result, status) { 
					if (status === kakao.maps.services.Status.OK){
				    	$('#mlon').val(result[0].y);
						$('#mlat').val(result[0].x);
				    }
				}); 
				
				geocoder.addressSearch(arrival, function(result, status) {
				    if (status === kakao.maps.services.Status.OK){
				    	$('#vlon').val(result[0].y);
						$('#vlat').val(result[0].x);
				    }
				}); 
			}
		}
		
		
		
		function insertOrder(){
			var regExpTel = /^\d{2,3}-\d{3,4}-\d{4}$/;  // 전화번호체크
			var tel = myform.tel1.value + "-" + myform.tel2.value + "-" + myform.tel3.value;
	      
			if(!regExpTel.test(tel)) {
		    	alert("전화번호를 확인하세요.");
		    	myform.tel1.focus();
		    	return false;
		    }
			else if($("#payment option:selected").val().trim() == ""){
				alert("결제방법을 선택해주세요.");
				return false;
			} 
			
			
			if($("#chkStore").is(":checked")){
				myform.delivery.value = "픽업";
				myform.distance.value = "0";	
			}
			else{
			    if($("#postcode").val().trim() == ""){
					alert("주소를 입력해주세요.");
			    	myform.btnPost.focus();
					return false;
				}
			    else if($("#detailAddress").val().trim() == ""){
					alert("상세주소를 입력해주세요.");
			    	myform.detailAddress.focus();
					return false;
				}
			    else if($("#total").val()<15000){
					alert("15,000 이상 배달 가능합니다.");
					return false;
			    }
			    else{
			    	var mlon=$('#mlon').val();
					var mlat=$('#mlat').val();
					var vlon=$('#vlon').val();
					var vlat=$('#vlat').val();
			    	
					var polyline=new daum.maps.Polyline({
						path : [
							new daum.maps.LatLng(mlon,mlat),
							new daum.maps.LatLng(vlon,vlat)
						]
					});
					
					var distance =( polyline.getLength() / 1000 ).toFixed(2);	
					if(distance > 2.0){
						alert("거리가 2km이내만 배달가능합니다.");
						return false;
					}
					else{
						myform.distance.value = distance;
					}
			    }
			}
			//console.log("길이"+myform.distance.value);
			myform.tel.value = tel;
			myform.submit();
		}
		
		function calcPoint(){
			var usePoint = $('#usePoint').val();
			var myPoint = $('#myPoint').val();
			
			var regExpNum=/^[0-9]*$/;
			if(usePoint == ""){
				alert("시용할 포인트 입력하세요.");
				$('#usePoint').focus();
				return false;
			}
			else if(!regExpNum.test(usePoint)){
				alert("숫자만 입력하세요.");
				$("#usePoint").val("");
				return false;
			}
			else if($('#total').val() < parseInt(usePoint)){
				alert("상품금액을 초과할 수 없습니다.");
				$("#usePoint").val("");
				return false;				
			}
			else if(parseInt(usePoint) > parseInt(myPoint)){
				alert("보유금액을 초과하였습니다.");
				$("#usePoint").val("");
				return false;
			}
			else{
				var calcPrice =  $('#calcPrice').val() - usePoint;
				
				applyPoint = addComma(usePoint);
				calcPrice = addComma(calcPrice);
				
				$("#point").val(usePoint);
				$("#totalView").html(calcPrice);
				$("#applyPoint").html(applyPoint);
			}
		};
		
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
        #stock{
        	padding: 0 0 0 25px;
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
									<button class="w3-round-xlarge btn" id="btnPost" type="button" onclick="resetAddress()">우편번호 찾기</button><br/></p>
									<p><input class="w3-border" type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" size=50 readonly></p>
									<input class="w3-border" type="text" name="detailAddress" id="detailAddress" onchange="calcLength()" placeholder="상세주소" size=50 required>
									<input type="hidden" id="mlon">
									<input type="hidden" id="mlat">
									<input type="hidden" id="vlon">
									<input type="hidden" id="vlat">
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
						  			<input class="w3-border" type="text" name="demand" maxlength=50/>
						  		</td>
							</tr>
							<tr>
						  		<th>선택매장</th>
						  		<td>${storeVo.store_name }</td>
							</tr>
						</table>
                        <hr style="width:100%"/>
                       	<h3 class="title">할인방법 선택(예정)</h3>
						<table>
                            <tr>
						  		<th>포인트</th>
						  		<td id="mid_td">
						  			<input class="w3-border" type="text" id="usePoint" name="usePoint" value="" <c:if test="${point==null}">disabled</c:if>/> 보유포인트 : <c:if test="${point!=null}"><fmt:formatNumber value="${point}" pattern="#,###" /></c:if> <c:if test="${point==null}">0</c:if>  P
						  			<c:if test="${point!=null}"><c:set var="myPoint" value="${point }" /></c:if> 
						  			<c:if test="${point==null}"><c:set var="myPoint" value="0" /></c:if> 	
  									<input type="hidden" id="myPoint" value="${myPoint }">
						  			
						  		</td>
                                <td id="end_td"><button type="button" class="btn_str" onclick="calcPoint()" <c:if test="${point==null}">disabled</c:if>>적용하기</button></td>
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
                       	<c:if test="${fn:length(stockVos) != 0 }">
	                       	<div id="stock">
	                       		<font color='red'>재고 수량을 초과하였습니다.</font>
	                       		<c:forEach var="stock" items="${stockVos}">
	                       			<c:if test="${stock.quantity !=0 }">
	                       				<br/>주문제품 : ${stock.option_name } /주문수량 : ${stock.cnt } /재고수량 : ${stock.quantity }
	                       			</c:if>
	                       		</c:forEach>
	                       	</div>
                       	</c:if>
						<table>
							<c:set var="total" value="0"/>
							<c:set var="quantity" value= "ok"/>
							<c:forEach var="vo" items="${vos }">
								<c:set var="total" value= "${total + ((vo.price+vo.price_add+vo.price_meat ) * vo.cnt) }"/>
								<tr>
							  		<td id="prod_td">
	                                 <span id="prod">${vo.product_name }</span><span class="w3-text-grey">${vo.cnt } 개</span><br/>
	                                 <c:if test="${vo.quantity <=0 }"><font color='red'>품절 상품을 포함하고 있습니다.</font><br/>
	                                 	<c:set var="quantity" value= "no"/>
	                                 </c:if>
	                                 <c:if test="${vo.option_unit !=''}"><span class="w3-text-grey" id="opt">옵션:${vo.option_unit }</span><br/></c:if>
	                                 <c:if test="${vo.add_unit !=''}"><span class="w3-text-grey" id="opt">추가:${vo.add_unit }</span><br/></c:if>
	                                 <c:if test="${vo.meat_unit !=''}"><span class="w3-text-grey" id="opt">미트:${vo.meat_unit }</span><br/></c:if>
							  		</td>
	                                <td id="opt_td">
	                                 	<fmt:formatNumber value="${(vo.price+vo.price_add+vo.price_meat ) * vo.cnt }" pattern="#,###" />
							  		</td>
								</tr>
								<c:if test="${route == 'direct' }">
					  				<input type="hidden" name="product" value="${vo.product }"/>
					  				<input type="hidden" name="option_unit" value="${vo.option_unit }"/>
					  				<input type="hidden" name="add_unit" value="${vo.add_unit }"/>
					  				<input type="hidden" name="meat_unit" value="${vo.meat_unit }"/>
					  				<input type="hidden" name="price" value="${vo.price }"/>
					  				<input type="hidden" name="price_add" value="${vo.price_add }"/>
					  				<input type="hidden" name="price_meat" value="${vo.price_meat }"/>
					  			</c:if>
							</c:forEach>
						</table>
                        <hr style="width:100%"/>
                       	<h3 class="title">총 결제금액</h3>
						<table>
							<tr>
						  		<td>
                                 	총 결제 금액 : <span id="totalView"><fmt:formatNumber value="${total}" pattern="#,###" /></span><br/>(10,000원이상 결제시 결제금액의 10%를 적립. 포인트 사용시 적립되지 않습니다.)<br/>
                                 	<input type="hidden" id="calcPrice" value="${total }">
                                 <span class="w3-text-grey" id="opt_sale">
                                 	+<fmt:formatNumber value="${total}" pattern="#,###" /><br/>
                                 	- <span id="applyPoint">0</span> P
                                 </span>
						  		</td>
							</tr>
						</table>
                        <div id="bottom_btn">
                          <button class="w3-round-xlarg btn" type="button" onclick="location.href = '${contextPath}/order/setStore?store=${storeVo.store_code }'">메뉴선택</button>
                          <button class="w3-round-xlarge btn" type="button" onclick="location.href = '${contextPath}/order/viewCartList'">장바구니</button>
                          <button class="w3-round-xlarge btn" type="button" onclick="javascript:insertOrder()" <c:if test="${quantity == 'no'  || fn:length(stockVos) != 0}">disabled</c:if> >주문하기</button>
                    	</div>
					</div>
				</div>
			</div>
			<c:set var="addIdx" value="${fn:join(arrayIdx,'/')}" />
			<input type="hidden" name="addIdx" value="${addIdx }"/> 
  			<input type="hidden" name="tel"/>
  			<input type="hidden" name="reorder_idx" value="${reorder_idx }"/>
  			<input type="hidden" name="store" value=${storeVo.store_code } />
  			<input type="hidden" name="delivery" />
  			<input type="hidden" name="distance" />
  			<input type="hidden" id="total" name="total" value="${total }"/>
  			<input type="hidden" id="point" name="point" value="0">
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>
