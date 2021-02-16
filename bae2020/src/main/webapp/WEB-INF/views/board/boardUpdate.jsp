<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		function selectProduct(){
			
		}
		//소스 선택  개수 제한
		function count_ck(obj,sub){
			var chkbox = document.getElementsByName(sub);
			var chkCnt = 0;
			for(var i=0;i<chkbox.length; i++){
				if(chkbox[i].checked){
					chkCnt++;
				}
			}
			if(chkCnt>2){
				alert("2개이상 선택할 수 없습니다.");
				obj.checked = false;
				return false;
			}
			else{
				return true;
			}
		} 
		//출처: https://hyunssssss.tistory.com/259 [현's 블로그]
		
		
		function myAccFunc(first) {
		  	var x = document.getElementById(first);
		  	if (x.className.indexOf("w3-show") == -1) {
		    	x.className += " w3-show";
		  	} else { 
		    	x.className = x.className.replace(" w3-show", " w3-hide");
		    	
		  	}
		}
		
		//추가메뉴 선택시 가격 계산
		function calcPrice(obj,sub) {
			if(!count_ck(obj,sub)){
				return false;
			}	
			else{			
		        var check_count = document.getElementsByName('add').length;
		        var addVal = 0;
		        for (var i=0; i<check_count; i++) {
		            if (document.getElementsByName('add')[i].checked == true) {
		            	var price = document.getElementsByName('add')[i].value;
		            	price = price.split("/")[1];
		            	addVal+= Number(price);
		            }
		        }
		        var check_count = document.getElementsByName('meat').length;
		        var meatVal = 0;
		        for (var i=0; i<check_count; i++) {
		            if (document.getElementsByName('meat')[i].checked == true) {
		            	var price = document.getElementsByName('meat')[i].value;
		            	price = price.split("/")[1];
		            	meatVal+= Number(price);
		            }
		        }
		  			
		       	$("#price_add").val(addVal);
		       	$("#price_meat").val(meatVal);
			}
	       	
		}
		
		function unionItem(){
			if(!$(':input:radio[name=product]:checked').val()) {   
				   alert("메뉴는 필수 선택입니다.");
				   return false;
			}
			else if(!$(':input:radio[name=bread]:checked').val()) {   
				   alert("빵은 필수 선택입니다.");
				   return false;
			}
			else{			
				var option_unit =""
				var add_unit =""
				var meat_unit =""
				
				var count = document.getElementsByName("product").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("product")[i].checked == true) {
		            	var product = document.getElementsByName("product")[i].value;
		            	product = product.split("/");
		            	myform.product.value = product[0];
		            	myform.price.value = product[1];
		            }
		        }
				count = document.getElementsByName("bread").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("bread")[i].checked == true) {
		            	option_unit += document.getElementsByName("bread")[i].value +"/";
		            }
		        }
		        count = document.getElementsByName("veggie").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("veggie")[i].checked == true) {
		            	option_unit += document.getElementsByName("veggie")[i].value  +"/";
		            }
		        }
		        count = document.getElementsByName("cheese").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("cheese")[i].checked == true) {
		            	option_unit += document.getElementsByName("cheese")[i].value  +"/";
		            }
		        }
		        count = document.getElementsByName("sauce").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("sauce")[i].checked == true) {
		            	option_unit += document.getElementsByName("sauce")[i].value  +"/";
		            }
		        }
		        count = document.getElementsByName("add").length;
		        for (var i=0; i<count; i++) {
		            if (document.getElementsByName("add")[i].checked == true) {
		            	var name = document.getElementsByName("add")[i].value;
		            	name = name.split("/")[0];
		            	add_unit += name  +"/";
		            }
		        }
		        count = document.getElementsByName("meat").length;
		        for (var i=0; i<count; i++) {
		        	if (document.getElementsByName("meat")[i].checked == true) {
		            	var name = document.getElementsByName("meat")[i].value;
		            	name = name.split("/")[0];
		            	meat_unit += name  +"/";
		            }
		        }

		        myform.option_unit.value = option_unit;
		        myform.add_unit.value = add_unit;
		        myform.meat_unit.value = meat_unit;
		        myform.submit();
			}
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
		
		.main_title{
		text-align: center;
		}
		
		.main_list {
		    width: 1100px;
		    margin: 0 auto;
		}
		
		.list_start {
		    text-align: center;
		}
		
		.list_detail {
		    text-align: center;
		    display: inline-block;
		    width: 170px;
		    height:170px;
		    margin-top: 5px;
		    margin-bottom: 5px;
		    padding-top : 15px;
		}
        .list_detail:hover {
		    background-color: #ffce32;
		}
        #subcategory{
		    text-align: center;
		    width: 150px;
		    height:150px;
        }
        
		#btn {
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
		 #icon_btn{
			padding: 0;
			border: none;
			background: none; 
			color:#009223;
			cursor: pointer;
			font-weight: bold;
		}
		#a{
			background-color: #ffce32; 
			border: 2px hidden ;
		}
		#a_list_detail:hover{
			border: 1px solid ;
			border-color:#f6f6f6;
		}
		#prod{
			font-size: 25px; 
			color:#ff8300;
		}
		#prod_div{
		    text-align: center;
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="main_list" >
			<!-- 상단 제목 -->
			<div class="main_title">
			</div>
			<!-- 리스트 -->
			<div class="w3-row">
				<div class="w3-col l2" id="subcategory" >
					<p><br/><br/></p>메뉴
                </div>
          		<div class="w3-col l10">
          			<c:forEach var="vo" items="${vosP }"  varStatus="status">
	               		<div class="list_detail" id="list_detail">
	               			<input type="radio" name="product" id="${vo.product_code }" class="input-hidden" value="${vo.product_code }/${vo.price}" <c:if test="${boardVo.product==vo.product_code }">checked</c:if> />
	                 		<label for="${vo.product_code }">
	                   			<img src="${contextPath }/product/PROD-001/${vo.image }" style="width:100px;"><p>${vo.product_name }</p>
	                 		</label>
	                	</div>
		       		</c:forEach>               		
              	</div>														
			</div>
			<div class="w3-row" id="a">
				<div class="w3-col l2" id="subcategory" >
					<p><br/><br/></p>빵
                </div>
          		<div class="w3-col l10">
          			<c:forEach var="vo" items="${BREADvos }"  varStatus="status">
	               		<div class="list_detail" id="a_list_detail">
	               			<input type="radio" name="bread" id="${vo.option_code }" class="input-hidden" value="${vo.option_name }" <c:if test="${fn:contains(boardVo.option_unit,vo.option_name) }">checked</c:if> />
	                 		<label for="${vo.option_code }">
	                   			<img src="${contextPath }/option/${vo.subcategory_code }/${vo.image }" style="width:100px;"><p>${vo.option_name }</p>
	                 		</label>
	                	</div>
		       		</c:forEach>               		
              	</div>														
			</div>
            <div class="w3-row">
               	<div class="w3-col l2" id="subcategory">
                    <p><br/><br/></p>야채
                </div>
                <div class="w3-col l10">
                	<c:forEach var="vo" items="${VEGGIEvos }" >
	                	<div class="list_detail">
	                      	<input type="checkbox" name="veggie" id="${vo.option_code }" class="input-hidden" value="${vo.option_name }" <c:if test="${fn:contains(boardVo.option_unit, vo.option_name) }">checked</c:if> />
	                       	<label for="${vo.option_code }">
	                          	<img src="${contextPath }/option/${vo.subcategory_code }/${vo.image }" style="width:100px;"><p>${vo.option_name }</p>
	                       	</label>
	                    </div>
		       		</c:forEach>   
                </div>
			</div>
			<div class="w3-row" id="a">
               	<div class="w3-col l2" id="subcategory">
                    <p><br/><br/></p>치즈
                </div>
                <div class="w3-col l10">
                	<c:forEach var="vo" items="${CHEESEvos }"  varStatus="status">
	                	<div class="list_detail" id="a_list_detail">
	                      	<input type="radio" name="cheese" id="${vo.option_code }" class="input-hidden" value="${vo.option_name }" <c:if test="${fn:contains(boardVo.option_unit, vo.option_name) }">checked</c:if> />
	                       	<label for="${vo.option_code }">
	                          	<img src="${contextPath }/option/${vo.subcategory_code }/${vo.image }" style="width:100px;"><p>${vo.option_name }</p>
	                       	</label>
	                    </div>
		       		</c:forEach>   
                </div>
			</div>
			<div class="w3-row">
               	<div class="w3-col l2" id="subcategory">
                    <p><br/><br/></p>소스
                </div>
                <div class="w3-col l10">
                	<c:forEach var="vo" items="${SAUCEvos }" >
	                	<div class="list_detail">
	                      	<input type="checkbox" name="sauce" id="${vo.option_code }" class="input-hidden" value="${vo.option_name }" onclick="count_ck(this,'sauce')" <c:if test="${fn:contains(boardVo.option_unit, vo.option_name) }">checked</c:if>/>
	                       	<label for="${vo.option_code }">
	                          	<img src="${contextPath }/option/${vo.subcategory_code }/${vo.image }" style="width:100px;"><p>${vo.option_name }</p>
	                       	</label>
	                    </div>
		       		</c:forEach>   
                </div>
			</div>
            <div class="w3-row" id="a">
				<div class="w3-col l2" id="subcategory">
					<p><br/><br/></p>추가
				</div>
				<div class="w3-col l10" id="add">
					<c:forEach var="vo" items="${ADDvos }" >
						<div class="list_detail" id="a_list_detail">
				     		<input type="checkbox" name="add" id="${vo.option_code }" class="input-hidden" value="${vo.option_name }/${vo.price}" onclick="calcPrice(this,'add')" <c:if test="${fn:contains(boardVo.add_unit, vo.option_name) }">checked</c:if> />
							<label for="${vo.option_code }">
								<img src="${contextPath }/option/${vo.subcategory_code }/${vo.image }" style="width:100px;">
								<p>${vo.option_name }<fmt:formatNumber value="${vo.price}" pattern="#,###" /></p>
				   			</label>
						</div>
					</c:forEach>   
				</div>
			</div>
            <div class="w3-row">
				<div class="w3-col l2" id="subcategory">
					<p><br/><br/></p>미트
				</div>
				<div class="w3-col l10" id="meat">
					<c:forEach var="vo" items="${MEATvos }" >
						<div class="list_detail">
				     		<input type="checkbox" name="meat" id="${vo.option_code }" class="input-hidden" value="${vo.option_name }/${vo.price}" onclick="calcPrice(this,'meat')" <c:if test="${fn:contains(boardVo.meat_unit, vo.option_name) }">checked</c:if>/>
							<label for="${vo.option_code }">
								<img src="${contextPath }/option/${vo.subcategory_code }/${vo.image }" style="width:100px;">
								<p>${vo.option_name }<fmt:formatNumber value="${vo.price}" pattern="#,###" /></p>
				   			</label>
						</div>
					</c:forEach>   
				</div>
			</div> 
			<div class="w3-row w3-padding-10 w3-white">
			    <div class="w3-padding-small" >
					<button class="w3-round-xlarge w3-right" id="btn" type="reset">다시선택</button>
					<button class="w3-round-xlarge w3-right" id="btn" type="button" onclick="unionItem()">수정하기</button> 
				</div>
	        </div>
	        <form id="myform" method="post" action="${contextPath }/board/updateBoard?idx=${boardVo.idx}&sort=${sort }&prod=${product }">
				<input type="hidden" id="product" name="product" value=""/>
				<input type="hidden" name="option_unit" value=""/>
				<input type="hidden" name="add_unit" value=""/>
				<input type="hidden" name="meat_unit" value=""/>
				<input type="hidden" id="price" name="price" value=""/>
				<input type="hidden" id="price_add" name="price_add" value="0"/>
				<input type="hidden" id="price_meat" name="price_meat" value="0"/>
        	</form>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>