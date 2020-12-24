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
		//아이디, 닉네임 중복검사 여부
		var idKey = 0;
		
		 //아이디 유효성 확인
		function idValidate(){
			idKey = 0;
			var regExpId = /^[a-z|A-Z|0-9|_]*$/; 
			if(!check(regExpId,mid,idVal)){
				$("#idCheck").prop("disabled", true);
				return false;
			}
			else{
				$("#idCheck").prop("disabled", false);
				$('#idVal').text('');
			}
		}
		
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
		
  		//아이디 중복 처리(aJax 처리)	
		$(document).ready(function(){			
			$("#idCheck").click(function() {
				if($("#mid").val().trim() == ""){
					alert("아이디를 입력하세요.");
					$("#mid").focus();
					return false;
				}
				else if($("#mid").val().length<4 || $("#mid").val().length>20){
					alert("아이디는 4이상 20자이하 입니다.");
					$("#mid").focus();
					return false;
				}
				var query = {
					mid : $("#mid").val()		
				}
				
				$.ajax({
					url : "${contextPath}/user/idCheck",
					type : "get",
					data : query,
					success : function(data){
						if(data == 1 ){
							alert("사용중인 ID입니다.");
							$("#mid").focus();
						}
						else {
							alert("사용가능한 ID입니다.");
							idKey = 1
							$("#pwd").focus();
						}
					}
				}); //ajax 종료
			}); //$("#idCheck").click 종료			 
		});  //$(document).ready 종료
		
		
		
		
		function fCheck() {
		  if(idKey == 0){
			  alert("ID중복체크를 해주세요");
			  return false;
		  }
		 
	      var regExpId = /^[a-z|A-Z|0-9|_]*$/; //아이디 체크
	      var regExpName = /^[가-힣]+$/;   // 이름은 한글이름만 가능 
	      var regExpTel = /^\d{2,3}-\d{3,4}-\d{4}$/;  // 전화번호체크
	      
	      var mid = myform.mid.value;
	      var pwd = myform.pwd.value;
	      var tel = myform.tel1.value + "-" + myform.tel2.value + "-" + myform.tel3.value;
	      var name = myform.name.value;
	      
	      if(mid.length<4 || mid.length>20 || !regExpId.test(mid)) {
	    	  alert("아이디는 영문/숫자 조합, 4~20자 이내로 작성하세요!");
	    	  myform.mid.focus();
	    	  return false;
	      }
	      else if(pwd.length < 4 || pwd.length > 20) {
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
		button {
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
		<form name="myform" method="post">
			<table>
			    <tr>
			    	<td class="w3-input w3-border" style="text-align:center; border:none;"><h2>회 원 가 입</h2></td>
			    </tr>
			</table>
			<table>
			    <tr>
			    	<th>아이디</th>
			      	<td>
			        	<input class="w3-border" type="text" name="mid" id="mid" onkeyup="idValidate()" autofocus required/>
			    		<button class="w3-round-xlarge" type="button" id="idCheck" >아이디중복체크</button>
			    		<div id="idVal"></div>
			  		</td>
				</tr>
				<tr>
			  		<th>비밀번호</th>
			  		<td><input class="w3-border"  type="password" name="pwd" id="pwd" required/></td>
				</tr>
				<tr>
			  		<th>성명</th>
			  		<td>
			  			<input class="w3-border" type="text" name="name" id="name" onkeyup="nameValidate()" required/>
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
						<button class="w3-round-xlarge" type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br/>
						<p><input class="w3-border" type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" size=50></p>
						<input class="w3-border" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" size=50>
					</td>
				</tr>
				<tr>
			  		<th colspan=2 style="text-align:center">
						<button class="w3-round-xlarge" type="button" id="subm" onclick="fCheck()">회원가입</button>
			        	<button class="w3-round-xlarge" type="reset">다시입력</button>
			      	</th>
			    </tr>
			</table>
  			<input type="hidden" name="tel"/>
  			<input type="hidden" name="hobby"/>
		</form>	
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>