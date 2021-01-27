<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script>
		function insertCancelAjax(idx){
			if($("#sel").val()=="" || ($("#sel").val()=="기타" && $("#message").val()=="") ){
				alert("취소사유를 입력하세요.");
				return false;
			}
			var cancel = myform.sel.value + "/" + myform.message.value;
			
			var cancelForm = {
					order_idx:idx,
					cancel:cancel
			}
			
			$.ajax({
				url: "${contextPath}/store/insertCancel",
				type: "post",
				data: cancelForm,
				success:function(data){
					window.opener.location.reload(false);
					window.close();	
				}
			}); 
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
        .btn {
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
		}
         .title{
	      margin : 20px;
	      width : 650px;
          color: #666666;
        }
        select, textarea {
        	width : 100%;
        }
        #bottom_btn{
		    text-align: center; 
        	padding: 50px 0 50px;
        }
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 50px">
		<div class="main_list">
			<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>취소하기</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail"> 
					<h3 class="title">취소사유 입력하기</h3>
					<form id="myform" method="post" action="${contextPath }/store/insertCancel">
						<table>
							<tr>
								<td>
									<select id="sel" name="sel">
										<option value="" selected>-- 선택 --</option>
										<option value="재료소진">재료소진</option>
										<option value="영업종료">영업종료</option>
										<option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<textarea rows="2" id="message" name="message" maxlength="50"></textarea>
								</td>
							</tr>
						</table>
					</form>
					<div id="bottom_btn">
						<button class="w3-round-xlarge btn" type="button" onclick="insertCancelAjax('${order_idx }')">주문취소</button>
			        	<button class="w3-round-xlarge btn" type="reset" >다시입력</button>
		        	</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>