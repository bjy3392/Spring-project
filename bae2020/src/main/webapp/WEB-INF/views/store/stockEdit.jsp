<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script>
		
		function updateStockAjax(idx,code, store){
			
			var res = confirm("적용하시겠습니까?");
			if(!res){
				location.reload();
			}
			else{
				var add = $('#add_quantity_'+idx).val();
				var regExpNum=/^[0-9]*$/;
				
				if(!regExpNum.test(add) || add==""){
					alert("잘못된 입력입니다..");
					return false;
				}
				
				var stock = {
						quantity: add,
						option_code :code,
						store : store
				}
			
				$("#fileEx_"+idx).val("true"); 
				var formData = new FormData($('#myform_'+idx)[0]);
				
				$.ajax({
					url: "${contextPath}/store/updateStockAjax",
					type: "post",
					data: stock, 
					success:function(data){	
						alert("적용 되었습니다.");
						location.reload();
					}
				});   
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
		    width: 1000px;
		    height: auto;
			border: 0px solid;
		    margin-bottom: 5px;
			background-color: #fff;
		}
        table {
	      margin : 0px auto;
	      width : 900px;
	      border-collapse: collapse;
          table-layout: fixed;
	    }
	    th {
	      text-align:center;
	      padding: 5px;
	    }
        td{
	      padding: 5px;
	      text-align:center;
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
		#btn_str {
			background-color: #fff; 
			color: #009223;
			padding: 6px 15px;
			text-align: left;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 0px 5px;
			cursor: pointer;
			font-weight: bold;
			border-color: #009223;
			border-width: 3px;
			border-style: solid;
		}
        #content_input{
        	padding: 20px 20px 20px 50px;
        }
        input{
        	width: 180px;
        }
        .icon_btn{
			padding: 0;
			font-size: 30px;
			margin: 0px 0px 0 0;
			padding: 6px 15px;
			cursor: pointer;
			font-weight: bold;
			border: none;
			background: none; 
			color:#009223;
		}
		#span_right{
			text-align: right;
			background-color:#009223;
		}
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="main_list" >
		 	<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>옵션</h2>
				<p><br/><br/></p>
			</div>
            <div class="list_start">
              	<div class="list_detail">
              		<p></p>
              		<button type="button" class="w3-round-xlarge icon_btn" id="back" onclick="window.history.back()"><i class="fas fa-reply"></i></button><label for="back">뒤로가기</label>
                  	<div id="content_input">
                    	<table>
                        	<tr>
                              	<th>이름</th>
                              	<th>수량</th>
                              	<th>추가수량</th>
                              	<th>추가하기</th>
                            </tr>
                            <c:forEach var="vo" items="${vos }" varStatus="status">
	                          	<tr>
	                              	<td><input type="text" value="${vo.option_name }" maxlength="50" disabled></td>
	                              	<td><input type="text" value="${vo.quantity }" disabled></td>
	                              	<td><input type="text" id="add_quantity_${status.count}" name="add_quantity"></td>
	                              	<td>
	                              		<button type="button" class="w3-round-xlarge" id="btn_str" onclick="updateStockAjax(${status.count},'${vo.option_code}', '${vo.store }')">수량추가</button>
	                              	</td>
	                          	</tr>
                          	</c:forEach>
                        </table>
                  	</div>
                </div>
            </div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>