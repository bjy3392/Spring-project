<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script>
		function formSubmit(){

		    var reason = myform.reason.value;
		    var message = myform.message.value;
		    
			if(reason == "") {
		    	  alert("탈퇴사유를 선택해주세요.");
		    	  myform.reason.focus();
		    	  return false;
		    }
			else if(reason == '기타' && message==""){
		    	  alert("기타 : 세부사항을 작성해주세요.");
		    	  myform.message.focus();
		    	  return false;
			}
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
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="main_list">
			<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>탈퇴하기</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail"> 
					<h3 class="title">회원 탈퇴하기</h3>
					<form id="myform" method="post" action="${contextPath }/user/deleteUser">
						<table>
							<tr>
								<th>탈퇴사유</th>
								<td>
									<select id="reason" name="reason">
									  	<option value="" selected>-- 선택 --</option>
									  	<option value="타 어플사용 예정">타 어플사용 예정</option>
									  	<option value="서비스가 불편해서">서비스가 불편해서</option>
									  	<option value="서브웨이 이용 계획이 없음">서브웨이 이용 계획이 없음</option>
									  	<option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th width="100px">Message</th>
								<td>
									<textarea rows="5" id="message" name="message"></textarea>
								</td>
							</tr>
						</table>
  						<input type="hidden" name="mid" value="${smid }"/>
					</form>
					<div id="bottom_btn">
						<button class="w3-round-xlarge btn" type="button" onclick="formSubmit()">탈퇴하기</button>
			        	<button class="w3-round-xlarge btn" type="reset" >다시입력</button>
		        	</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>