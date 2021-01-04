<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	/* function toggleView(idx){
	  	var detail_div = document.getElementById("detail_"+idx);
	   	if(detail_div.style.display=="none"){
	   		 $("#detail_"+idx).show(); 
	   	}else{
	   		$("#detail_"+idx).css("height", "0px");
	   	} 
	}
	
	$(document).ready( function() {
        $( '#toggle_btn' ).click( function() {
          $( "#detail_42" ).toggle( 'slow' );
        });
      });
//출처: https://unabated.tistory.com/entry/displaynone-과-visibilityhidden-의-차이 [랄라라] */

	function deleteOrderAjax(idx){
		var res = confirm("주문을 취소하겠습니까?");
		if(!res){
			return;
		}
		else{
			var order = {
				order_idx : idx
			};
			
			$.ajax({
				url: "${contextPath}/order/deleteOrderAjax",
				type: "post",
				data: order,
				success:function(data){	
					alert("선택한 항목이 삭제 되었습니다.")
					$("#tr_"+idx).remove();	
				}
			});  
		}
	}

</script>

<style>
	body {
		background-color: #f6f6f6;
	}
	
	.main_title {
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
		margin: 0px auto;
		width: 650px;
		border: 1px solid #ccc;
		padding: 12px;
		border-collapse: collapse;
		table-layout: fixed;
	}
	
	th {
		text-align: center;
		width: 120px;
		border: 1px solid #ccc;
	}
	
	td {
		width: 410px;
		border: 1px solid #ccc;
		padding: 12px;
	}
	
	.opt_td {
		width: 120px;
		border: 1px solid #ccc;
		padding: 12px;
		text-align: center;
	}
	
	#bar_table {
		margin: 0px auto;
		width: 700px;
		padding: 12px;
		border-collapse: collapse;
		table-layout: fixed;
		text-align: center;
		border: none;
	}
	
	#bar_td {
		width: 350px;
		padding: 12px;
		border: none;
	}
	
	#bar_td {
		width: 350px;
		padding: 12px;
		border: none;
	}
	
	#bar_td_select {
		width: 350px;
		padding: 12px;
		border: none;
		background-color: #009223;
		color: #fff;
	}
	
	.title {
		margin: 5px auto;
		width: 650px;
		color: #666666;
	}
	
	.btn_str {
		background-color: #fff; /* Green */
		border: none;
		color: #009223;
	}
	
	.prod {
		font-weight: bold;
		font-size: 17px;
		padding: 10px 10px 10px 10px;
	}
	
	.opt {
		padding: 10px 10px 10px 10px;
	}
	
	
	
	.icon_btn {
		padding: 0;
		border: none;
		background: none;
		color: #009223;
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
					<h2>주문확인</h2>
					<p><br/><br/></p>
				</div>
				<div class="list_start">
					<div class="list_detail">
						<table id="bar_table">
							<tr>
								<td id="bar_td_select">진행중</td>
								<td id="bar_td" onclick="">완료</td>
							</tr>
						</table>
						<p><br/></p>
						<h3 class="title">주문내역</h3>
						<table>
							<c:forEach var="vo" items="${vos }">
								<tr id="tr_${vo.order_idx }">
									<td><font style="font-weight: bold; font-size: 20px;"> ${vo.product_name }</font>  <c:if test="${vo.cnt ne 1 }">외 ${vo.cnt-1 }개</c:if>
										<button class="icon_btn" disabled >
											<i class="fas fa-chevron-down"></i>
										</button>
										<p></p>
										<c:forEach var="voItem" items="${vosItem }">
											<c:if test="${vo.order_idx eq voItem.order_idx }">
												<div id="detail_${vo.order_idx }"  >
													<span class="w3-text-grey prod">${voItem.product_name }</span>
													<span class="w3-text-grey">${voItem.cnt }<fmt:formatNumber value="${voItem.price }" pattern="#,###" /></span><br/> 
													<span class="w3-text-grey opt">${voItem.options }</span><br/> 
													<p></p>
												</div>
											</c:if>
										</c:forEach>
									</td>
									<td class="opt_td"><fmt:formatNumber value="${vo.total }" pattern="#,###" /></td>
									<td class="opt_td">
										${vo.state_name } 
										<c:if test="${vo.state eq 'state0' }"><span><button class="btn_str" onclick="deleteOrderAjax(${vo.order_idx})">취소하기</button></span></c:if>
									</td>
								</tr>
							</c:forEach>	
						</table>
						<p></p>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>