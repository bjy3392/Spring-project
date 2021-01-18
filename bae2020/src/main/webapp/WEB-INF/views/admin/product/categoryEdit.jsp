<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script>
		function insertCategoryAjax(){
			if($('#first_code').val().trim() == ""){
				alert("코드를 입력하세요.");
				$("#first_code").focus();
				return false;
			}
			
			if($('#category_name').val().trim() == ""){
				alert("이름을 입력하세요.");
				$("#category_name").focus();
				return false;
			}
			
			var res = confirm("추가하시겠습니까?");
			if(!res){
				return;
			}
			else{
				var first_code = $('#first_code').val();
				var category_name = $('#category_name').val();
				
				
				var category={
					first_code : first_code,
					category_name : category_name
				}
				
				 $.ajax({
					url: "${contextPath}/admin/insertCategoryAjax",
					type: "post",
					data: category,
					success:function(data){	
						alert("입력 되었습니다.");
						location.reload();
					}
				});  
			}
		}
		
		function editCategory(idx){
			$("#first_code_"+idx).prop("disabled", false);
			$("#category_name_"+idx).prop("disabled", false);
			$("#span_"+idx).html("<button class='w3-round-xlarge' id='btn_str' onclick='javascript: updateCategoryAjax("+idx+")'>적용</button>"+
					"<button class='w3-round-xlarge' id='btn_str' onclick='cancelEdit("+idx+")'>취소</button>");
		}
		
		function cancelEdit(idx){
			$("#first_code_"+idx).prop("disabled", true);
			$("#category_name_"+idx).prop("disabled", true);
			$("#span_"+idx).html("<button class='w3-round-xlarge' id='btn_str' onclick='editCategory("+idx+")'>편집</button>"+
        						  "<button class='w3-round-xlarge' id='btn_str' onclick='deleteCategoryAjax("+idx+")'>삭제</button>");
		}
		
		
		function updateCategoryAjax(idx){
			if($('#first_code_'+idx).val().trim() == ""){
				alert("코드를 입력하세요.");
				$('#first_code_'+idx).focus();
				return false;
			}
			
			if($('#category_name_'+idx).val().trim() == ""){
				alert("이름을 입력하세요.");
				$('#category_name_'+idx).focus();
				return false;
			}
			
			var res = confirm("적용하시겠습니까?");
			if(!res){
				location.reload();
			}
			else{
				var first_code = $("#first_code_"+idx).val();
				var category_name = $("#category_name_"+idx).val();
				var category_code = $("#category_code_"+idx).val();
				
				var category={
					first_code : first_code,
					category_name : category_name,
					category_code : category_code
				}
				
				 $.ajax({
					url: "${contextPath}/admin/updateCategoryAjax",
					type: "post",
					data: category,
					success:function(data){	
						alert("적용 되었습니다.");
						location.reload();
					}
				});  
			}
		}
		
		function deleteCategoryAjax(idx){
			var res = confirm("삭제하시겠습니까?");
			if(!res){
				return ;
			}
			else{
				var category_code = $("#category_code_"+idx).val();
				
				var category={
					category_code : category_code
				}
				
				 $.ajax({
					url: "${contextPath}/admin/deleteCategoryAjax",
					type: "post",
					data: category,
					success:function(data){	
						alert("삭제 되었습니다.");
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
	      width : 850px;
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
        	width: 200px;
        }
        .bar_click{
			background-color: #009223; 
        }
        #icon_btn{
			padding: 0;
			border: none;
			background: none; 
			color:#009223;
		}
        #bar_table {
			margin: 0px auto;
			width: 1000px;
			padding: 12px;
			border-collapse: collapse;
			table-layout: fixed;
			text-align: center;
			border: none;
		}
		#bar_td {
			width: 500px;
			border: none;
			cursor: pointer;
			padding: 12px;
		}
		
		#bar_td_select {
			width: 500px;
			border: none;
			background-color: #009223;
			color: #fff;
			padding: 12px;
		}
	</style>
	
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px; ">
		<div class="main_list" >
		 	<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>카테고리</h2>
				<p><br/><br/></p>
			</div>

            <div class="list_start">
              	<div class="list_detail">
                 	<%-- <table id="bar_table">
						<tr>
							<td id="bar_td_select" >제품</td>
							<td id="bar_td" onclick="location.href='${contextPath}/order/viewOrderList'">옵션</td>
						</tr>
					</table>
					<p><br/></p> --%>
                  	<div id="content_input">
                    	<table>
                        	<tr>
                                <th>제품항목 시작 Code</th>
                                <th>제품 명</th>
                                <th>수정/삭제</th>
                                <th>상세항목 관리</th>
                            </tr>
                            <c:forEach var="vo" items="${vos }" varStatus="status">
	                            <tr>
	                                <td><input type="text" id="first_code_${status.count}" value="${vo.first_code }" maxlength="10" disabled></td>
	                                <td><input type="text" id="category_name_${status.count}" value="${vo.category_name }" maxlength="20" disabled></td>
	                                <td>
	                                	<span id="span_${status.count}"><button class="w3-round-xlarge" id="btn_str" onclick="editCategory(${status.count})">편집</button>
	                                	<button class="w3-round-xlarge" id="btn_str" onclick="deleteCategoryAjax(${status.count})">삭제</button></span>
	                                </td>
	                                <td>
	                                	<button id="icon_btn" onclick="location.href='${contextPath}/admin/viewProductEdit?category_code=${vo.category_code }'"><i class="fas fa-arrow-circle-right"></i>${vo.category_name }항목관리</button>
	                                </td>
	                            </tr>
	                            <input type="hidden" id="category_code_${status.count}" value="${vo.category_code }">
                            </c:forEach>
                            <tr>
                            	<td><input type="text" id="first_code" maxlength="10"></td>
                            	<td><input type="text" id="category_name" maxlength="20"></td>
                          		<td><button class="w3-round-xlarge" onclick="insertCategoryAjax()" id="btn">추가</button></td>
                          	</tr>
                      	</table>
                  	</div>
                </div>
            </div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>