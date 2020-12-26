<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${contextPath}/resources/js/woo.js"></script>
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
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<form name="myform">
			<div class="main_list">
				<!-- 상단 제목 -->
				<div class="main_title">
					<p></p>
					<h2>결제하기</h2>
					<p><br/><br/></p>
				</div>
				<div class="list_start">
					<div class="list_detail"> 
						<p></p>
						<table>
                        	<h3 class="title">배달정보</h3>
							<tr>
						  		<th>주소</th>
						  		<td>
								    <p><input class="w3-border" type="text" name="postcode" id="postcode" placeholder="우편번호" readonly required>
									<button class="w3-round-xlarge btn" type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br/></p>
									<p><input class="w3-border" type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" size=50></p>
									<input class="w3-border" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" size=50>
								</td>
							</tr>
							<tr>
						  		<th>연락처</th>
						  		<td>
								    <input class="w3-border" type="text" name="tel1" size=4 maxlength=4 required/>-
								    <input class="w3-border" type="text" name="tel2" size=4 maxlength=4 required/>-
								    <input class="w3-border" type="text" name="tel3" size=4 maxlength=4 required/>
								</td>
							</tr>	
							<tr>
						  		<th>주문시 요청사항</th>
						  		<td>
						  			<input class="w3-border" type="text" required/>
						  			
						  		</td>
							</tr>
						</table>
                        <hr style="width:100%"/>
						<table>
                        	<h3 class="title">할인방법 선택(예정)</h3>
							<tr>
						  		<th>쿠폰</th>
						  		<td id="mid_td">
                                    <select name="coupon">
                                        <option value="">쿠폰선택</option>
                                        <option value="coupon1">coupon1</option>
                                        <option value="coupon1">coupon1</option>
                                    </select>
						  		</td>
                                <td id="end_td"><button class="btn_str">적용하기</button></td>
							</tr>
                            <tr>
						  		<th>포인트</th>
						  		<td>
						  			<input class="w3-border" type="text" required/> 보유포인트 : P
						  			
						  		</td>
                                <td><button class="btn_str">적용하기</button></td>
							</tr>
						</table>
						<hr style="width:100%"/>
						<table>
                        	<h3 class="title">결제수단 선택</h3>
							<tr>
						  		<th width="100px">결제수단</th>
						  		<td>
						  			<select name="payment">
                                        <option value="">결제수단</option>
                                        <option value="1">만나서 카드결제</option>
                                        <option value="2">만나서 현금결제</option>
                                    </select>
						  			
						  		</td>
							</tr>
						</table>
                        <hr style="width:100%"/>
						<table>
                        	<h3 class="title">주문내역</h3>
							<tr>
						  		<td id="prod_td">
                                 <span id="prod">터키베이컨 아보카도</span><span class="w3-text-grey">개수</span><br/>
                                 <span class="w3-text-grey" id="opt">여기에는 옵션을 적어준다.</span>
						  		</td>
                                <td id="opt_td">
                                 가격
						  		</td>
							</tr>
                            <tr>
						  		<td id="prod_td">
                                 <span id="prod">터키베이컨 아보카도</span><span class="w3-text-grey">개수</span><br/>
                                 <span class="w3-text-grey" id="opt">여기에는 옵션을 적어준다.</span>
						  		</td>
                                <td id="opt_td">
                                 가격
						  		</td>
							</tr>
						</table>
                        <hr style="width:100%"/>
						<table>
                        	<h3 class="title">총 결제금액</h3>
							<tr>
						  		<td>
                                 할인쿠폰 포인트 계산해서 총결제 금액을 표시<br/>
                                 <span class="w3-text-grey" id="opt">할인내역을 적어준다</span>
						  		</td>
							</tr>
						</table>
                        <div id="bottom_btn">
                          <button class="w3-round-xlarge btn">주문추가</button>
                          <button class="w3-round-xlarge btn">장바구니</button>
                          <button class="w3-round-xlarge btn">결제하기</button>
                    	</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>
