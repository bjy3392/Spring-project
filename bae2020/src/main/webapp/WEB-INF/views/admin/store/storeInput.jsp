<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${contextPath}/resources/js/woo.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		//이름 유효성 검사
		function nameValidate(){
			var regExpName = /^[가-힣\s]+$/;   // 이름은 한글이름만 가능
			if(!check(regExpName,myform.name,nameVal)){
				return false;
			}
			else{
				$('#nameVal').text("");
			}
		} 
		
		//유효성검사 function
		function check(re, what,where) {
			if(re.test(what.value)) {
			    return true;
			}
			$(where).html("<font color='red'>유효하지 않은 입력입니다.</font>");
			what.focus();
			//return false;
		}
		
		function fCheck() {
		      var regExpName = /^[가-힣\s]+$/;   // 이름은 한글이름만 가능 
		      var regExpTel = /^\d{2,3}-\d{3,4}-\d{4}$/;  // 전화번호체크
		      
		      var tel = myform.tel1.value + "-" + myform.tel2.value + "-" + myform.tel3.value;
		      var name = myform.name.value;
		      
		      if(!regExpName.test(name)) {
		    	  alert("매장명은 한글만 가능합니다.");
		    	  myform.name.focus();
		    	  return false;
		      }
		      else if(!regExpTel.test(tel)) {
		    	  alert("전화번호를 확인하세요.");
		    	  myform.tel2.focus();
		    	  return false;
		      }
		      else if($("#postcode").val().trim() == ""){
					alert("주소를 입력해주세요.");
					return false;
		      }
		      else {
		    	  myform.tel.value = tel;
		    	  
		    	  myform.submit();	    	  
		      }
		    }
	</script>
	<style>
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
    </style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<form name="myform" method="post" action="${contextPath }/admin/insertStore">
			<table>
			    <tr>
			    	<td class="w3-input w3-border" style="text-align:center; border:none;"><h2>점 포 등 록</h2></td>
			    </tr>
			</table>
			<table>
				<tr>
			  		<th>매장 명</th>
			  		<td>
			  			<input class="w3-border" type="text" name="store_name" id="name" onkeyup="nameValidate()" required/>
			  			<div id="nameVal"></div>
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
			  		<th>주소</th>
			  		<td>
					    <input class="w3-border" type="text" name="postcode" id="postcode" placeholder="우편번호" readonly required>
						<button class="w3-round-xlarge btn" type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br/>
						<p><input class="w3-border" type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" size=50></p>
						<input class="w3-border" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" size=50>
					</td>
				</tr>
				<tr>
			  		<th colspan=2 style="text-align:center">
						<button class="w3-round-xlarge btn" type="button" onclick="fCheck()">등록하기</button>
			        	<button class="w3-round-xlarge btn" type="reset">다시입력</button>
			      	</th>
			    </tr>
			</table>
  			<input type="hidden" name="tel"/>
		</form>	
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>