<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
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
		    width: 800px;
		    height: auto;
			border: 0px solid;
		    margin-bottom: 5px;
			background-color: #fff;
		    margin: 0 auto;
		}
		
		table {
	      margin : 0px auto;
	      width : 700px;
	      border : 1px solid #ccc;
	      padding: 12px;
	      border-collapse: collapse;
          table-layout: fixed;
	    }
        td{
	      width : 530px;
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
	      width : 700px;
          color: #666666;
	      padding : 10px 0 0 0;
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
            padding: 10px 10px 10px 5px;
        }
        #opt{
        	padding: 10px 10px 10px 10px;
        }
        #title_name{
            font-size:25px;
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
		#bottom_btn{
		    text-align: center; 
        	padding: 20px 0 20px 0;
        }
        #cancel{
	      padding: 50px;
	    }
        
	</style>
</head>
<body>
	<div class="" style="max-width: 500px; margin-top:50px">
		<div class="main_list">
			<div class="main_title">
				<p></p>
				<h2>주문상세</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<h3 class="title">주문내역</h3>
					<c:if test="${orderVo.state =='state-06'}"><span id="cancel"><font color='red'>취소사유:${orderVo.cancel }</font></span><br/></c:if>
					<table>
						<c:set var="total" value="0"/>
						<c:forEach var="vo" items="${vos }">
							<tr>
						  		<td id="prod_td">
	                                <span id="prod">${vo.product_name }</span><span class="w3-text-grey">${vo.cnt } 개</span><br/>
	                                <c:if test="${vo.option_unit !=''}"><span class="w3-text-grey" id="opt">옵션:${vo.option_unit }</span><br/></c:if>
	                                <c:if test="${vo.add_unit !=''}"><span class="w3-text-grey" id="opt">추가:${vo.add_unit }</span><br/></c:if>
	                                <c:if test="${vo.meat_unit !=''}"><span class="w3-text-grey" id="opt">미트:${vo.meat_unit }</span><br/></c:if>
						  		</td>
	                            <td id="opt_td">
	                             	합계:<fmt:formatNumber value="${(vo.price+vo.price_add+vo.price_meat ) * vo.cnt }" pattern="#,###" /><br/>
	                             	메뉴:<fmt:formatNumber value="${vo.price }" pattern="#,###" /><br/>
	                             	<c:if test="${vo.add_unit !=''}">추가:<fmt:formatNumber value="${vo.price_add }" pattern="#,###" /><br/></c:if>
	                             	<c:if test="${vo.meat_unit !=''}">미트:<fmt:formatNumber value="${vo.price_meat }" pattern="#,###" /><br/></c:if>
						  		</td>
							</tr>
						</c:forEach>
					</table>
					<p></p>
					<hr style="width:90%"/>
	                <h3 class="title">총 결제금액</h3>
					<table>
						<tr>
					  		<td>
	                           	<span id="prod">총 결제 금액 : <fmt:formatNumber value="${orderVo.total - orderVo.point}" pattern="#,###" />원<br/></span>
	                           	<span class="w3-text-grey" id="opt_sale">
                                 	+<fmt:formatNumber value="${orderVo.total}" pattern="#,###" />원<br/>
                                 	-<fmt:formatNumber value="${orderVo.point}" pattern="#,###" /> P
                                 </span>
					  		</td>
						</tr>
					</table>
					<hr style="width:90%"/>
					<h3 class="title">주문자정보</h3>
					<table>
						<tr>
					  		<td>
	                           	<c:if test="${orderVo.delivery != '픽업' }">주소 : ${orderVo.roadAddress } &nbsp; ${orderVo.detailAddress }</c:if>
	                            <c:if test="${orderVo.delivery == '픽업' }">픽업</c:if>
					  		</td>
					  	</tr>
					  	<tr>
					  		<td>전화번호: ${orderVo.tel }</td>
					  	</tr>
					  	<tr>	
					  		<td>
					  			요구사항:
					  			<c:if test="${orderVo.demand != '' }">${orderVo.demand }</c:if>
	                            <c:if test="${orderVo.demand == '' }">(없음)</c:if>
					  		</td>
						</tr>
					</table>
					<p></p>
					<div id="bottom_btn">
						<button class="w3-round-xlarge" id="btn" type="button" onclick="window.close();">닫기</button>	
                    </div>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>