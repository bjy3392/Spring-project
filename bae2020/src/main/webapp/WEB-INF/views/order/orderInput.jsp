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
		    height: 1000px;
			border: 0px solid;
		    margin-bottom: 5px;
			background-color: #fff;
		}
		
		table, th, td {
	      margin : 0px auto;
	      width : 650px;
	      border : 1px solid #ccc;
	      padding: 12px;
	      border-collapse: collapse;
	    }
	    th {
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
						<p><br/><br/></p>
						<table>
							<tr>
						  		<th>주소</th>
						  		<td>
								    <p><input class="w3-border" type="text" name="postcode" id="postcode" placeholder="우편번호" readonly required>
									<button class="w3-round-xlarge" id="btn" type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br/></p>
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
						  			<input class="w3-border" type="text" name="rest" id="rest" onkeyup="nameValidate()" required/>
						  			
						  		</td>
							</tr>
						</table>
						<hr style="width:100%"/>
						<table>
								
							<tr>
						  		<th>결제수단</th>
						  		<td>
						  			<input class="w3-border" type="text" name="rest" id="rest" onkeyup="nameValidate()" required/>
						  			
						  		</td>
							</tr>
						</table>
					</div>
					
				
				</div>
				<!-- <input type="text" class="form-control" placeholder="Title" name="title"> -->
				
			</div>
			<%-- <div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">Name</span></div>
				<input type="text" class="form-control" value="${snickname}" name="name">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">E-mail</span></div>
				<input type="text" class="form-control" value="${vo.email}" name="email">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">Home page</span></div>
				<c:if test="${!empty homepage }"><input type="text" class="form-control" value="http://${homepage}" name="homepage"></c:if>
				<c:if test="${empty homepage }"><input type="text" class="form-control" value="http://" name="homepage"></c:if> 							
			</div>

			<div class="form-group">
				<label for="comment">Content:</label>
				<textarea class="form-control" rows="5" name="content"></textarea>
			</div>
			<div class="input-group mb-3" >
				<div class="input-group-prepend"><span class="input-group-text">비밀번호</span></div>
				<input type="password" class="form-control" name="pwd" />
			</div>
			
			<input type="button" class="btn btn-outline-secondary" value="글올리기" onclick="fCheck()" /> 
			<input type="reset"  class="btn btn-outline-secondary" value="다시쓰기" /> 
			<input type="button"  class="btn btn-outline-secondary" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/bList.bo';" />
			<input type="hidden" name="hostip" value="<%=request.getRemoteAddr()%>"/> --%>
		</form>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>