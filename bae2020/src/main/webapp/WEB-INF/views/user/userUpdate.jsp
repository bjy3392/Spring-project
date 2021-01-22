<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		//비밀번호 변경 여부 확인
		var pwdKey= 0;
		
		//이름 유효성 검사
		function nameValidate(){
			var regExpName = /^[가-힣]+$/;  // 이름은 한글이름만 가능
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
		
		function pwdCheckFn(){
			$("#pwdChangeBtn").prop("disabled", true);
			var pwd= $('#pwd').val();
			var pwdchk= $('#pwdCheck').val();
			if(pwd!=pwdchk){
				$("#pwdVal").text("비밀번호가 일치하지 않습니다.");
			}
			else if(pwd==pwdchk && pwd!=""){			
				$("#pwdVal").text("");	
				$("#pwdChangeBtn").prop("disabled", false);
			}
		}
		
		function pwdChange(){
			 pwdKey= 1; //패스워드 변경
			 myform.pwd.value = $('#pwd').val();
			 document.getElementById('pwdModal').style.display='none'
		}
		
		
		function fCheck() {
	      var regExpName = /^[가-힣]+$/;   // 이름은 한글이름만 가능 
	      var regExpTel = /^\d{2,3}-\d{3,4}-\d{4}$/;  // 전화번호체크
	      
	      var pwd = myform.pwd.value;
	      var tel = myform.tel1.value + "-" + myform.tel2.value + "-" + myform.tel3.value;
	      var name = myform.name.value;
	      
	      if(pwdKey ==1 && pwd.length < 4 || pwd.length > 20) {
	    	  alert("비밀번호는 4~20자 이내로 작성하세요");
	    	  myform.pwd.focus();
	    	  return false;
	      }
	      else if(!regExpName.test(name)) {
	    	  alert("성명은 한글만 가능합니다.");
	    	  myform.name.focus();
	    	  return false;
	      }
	      else if(!regExpTel.test(tel)) {
	    	  alert("전화번호를 확인하세요.");
	    	  myform.tel2.focus();
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
		<form name="myform" method="post" action="${contextPath }/user/updateUser">
			<table>
			    <tr>
			    	<td class="w3-input w3-border" style="text-align:center; border:none;"><h2>회 원 정 보 수 정</h2></td>
			    </tr>
			</table>
			<table>
			    <tr>
			    	<th>아이디</th>
				    <td>${vo.mid }</td>
				</tr>
				<tr>
			  		<th>비밀번호</th>
			  		<td>
			  			<button class="w3-round-xlarge btn" type="button" id="pwdChange" onclick="document.getElementById('pwdModal').style.display='block'">비밀번호 변경</button>
			    	</td>
				</tr>
				<tr>
			  		<th>성명</th>
			  		<td>
			  			<input class="w3-border" type="text" name="name" id="name" value="${vo.name }" onkeyup="nameValidate()" required/>
			  			<div id="nameVal"></div>
			  		</td>
				</tr>
				<tr>
			  		<th>연락처</th>
			  		<td>
						<c:set var="tel1" value="${fn:split(vo.tel,'-')[0] }"/>
						<c:set var="tel2" value="${fn:split(vo.tel,'-')[1] }"/>
						<c:set var="tel3" value="${fn:split(vo.tel,'-')[2] }"/>
					    <input class="w3-border" type="text" name="tel1" size=4 maxlength=4 value="${tel1 }" required/>-
					    <input class="w3-border" type="text" name="tel2" size=4 maxlength=4 value="${tel2 }" required/>-
					    <input class="w3-border" type="text" name="tel3" size=4 maxlength=4 value="${tel3 }" required/>
					</td>
				</tr>
				<tr>
			  		<th>주소</th>
			  		<td>
					    <input class="w3-border" type="text" name="postcode" id="postcode" value="${vo.postcode }" placeholder="우편번호" readonly required>
						<button class="w3-round-xlarge btn" type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br/>
						<p><input class="w3-border" type="text" name="roadAddress" id="roadAddress" value="${vo.roadAddress }" readonly size=50></p>
						<input class="w3-border" type="text" name="detailAddress" id="detailAddress"value="${vo.detailAddress }" size=50>
					</td>
				</tr>
				<tr>
			  		<th colspan=2 style="text-align:center">
						<button class="w3-round-xlarge btn" type="button"  onclick="fCheck()">정보수정</button>
			        	<button class="w3-round-xlarge btn" type="reset" >다시입력</button>
			      	</th>
			    </tr>
			</table>
			<input type="hidden" name="mid" value="${vo.mid }"/>
			<input type="hidden" name="pwd"  value=""/>
  			<input type="hidden" name="tel"/>
		</form>	
	</div>
	
	<div id="pwdModal" class="w3-modal">
	    <div class="w3-modal-content w3-animate-top w3-card-4">
	      <header class="w3-container w3-center w3-padding-32" style="background-color:#ffce32"> 
	        <span onclick="document.getElementById('pwdModal').style.display='none'" 
	         class="w3-button w3-xlarge w3-display-topright" style="background-color:#ffce32">×</span>
	        <h2 class="w3-wide"><i class="fa fa-unlock-alt w3-margin-right"></i>Password</h2>
	      </header>
	      <div class="w3-container">
	        <p><label><i class="fa fa-unlock-alt"></i> Password 입력</label></p>
	        <input class="w3-input w3-border" type="password" id="pwd" onkeyup="pwdCheckFn()" value="" placeholder="Password">
	        <p><label><i class="fa fa-unlock-alt"></i> Password 확인</label></p>
	        <input class="w3-input w3-border" type="password" id="pwdCheck" onkeyup="pwdCheckFn()" value="" placeholder="Password Check">
	      	<div id="pwdVal"></div>
	        <button class="w3-button w3-block w3-padding-16 w3-section w3-right" id="pwdChangeBtn" onclick="javascript:pwdChange()" disabled="disabled" style="background-color:#ffce32">변경하기 <i class="fa fa-check"></i></button>
	        <button class="w3-round-xlarge btn w3-section" onclick="document.getElementById('pwdModal').style.display='none'">Close <i class="fa fa-remove"></i></button>
	      </div>
	    </div>
	</div>
	
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>