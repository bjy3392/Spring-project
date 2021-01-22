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
		function insertProductAjax(){
			var res = confirm("추가하시겠습니까?");
			if(!res){
				return;
			}
			else{
				var str = checkFile(''); 
				if(!str){
					return false;
				}
				else if(str="checkOk"){
					var formData = new FormData($('#myform')[0]);
					
					$.ajax({
						url: "${contextPath}/admin/insertProductAjax",
						enctype: "multipart/form-data",
						type: "post",
						data: formData, 
						processData: false, 
						contentType: false, 
						success:function(data){	
							alert("입력 되었습니다.");
							location.reload();
						}
					});   
				}
			}
		} 
		
		function editProduct(idx,code){
		
			$("#product_name_"+idx).prop("disabled", false);
			$("#price_"+idx).prop("disabled", false);
			$("#file_"+idx).attr("type", "file");
			$("#fileSpan_"+idx).html("") 
			$("#span_"+idx).html("<button class='w3-round-xlarge' id='btn_str' onclick='updateProductAjax("+idx+")'>적용</button>"+
					"<button class='w3-round-xlarge' id='btn_str' onclick='cancelEdit("+idx+",\""+code+"\")'>취소</button>");
		}
		
		function cancelEdit(idx,code){
			$("#product_name_"+idx).prop("disabled", true);
			$("#price_"+idx).prop("disabled", true);
			$("#file_"+idx).attr("type", "hidden");
			$("#fileSpan_"+idx).html("<button type='button' class='w3-round-xlarge' id='btn_str' onclick='viewImageShow(\""+code+"\")'>미리보기</button>")
			$("#span_"+idx).html("<button type='button' class='w3-round-xlarge' id='btn_str' onclick='editProduct("+idx+",\""+code+"\")'>편집</button>"+
      							  "<button type='button' class='w3-round-xlarge' id='btn_str'>삭제</button>");
		}
		
		function updateProductAjax(idx){
			var file_name = "#file_"+idx;
			var file = $(file_name).val();
			
			var res = confirm("적용하시겠습니까?");
			if(!res){
				location.reload();
			}
			else{
				if(file == ""){
					var product_name = "#product_name_"+idx;
					var price = "#price_"+idx;
					 $("#fileEx_"+idx).val("false"); 
					 
					var regExpNum=/^[0-9]*$/;
					if($(product_name).val().trim() == ""){
						alert("상품명을 입력하세요.");
						$(product_name).focus();
						return false;
					}
					else if($(price).val().trim() == ""){
						alert("가격을 입력하세요.");
						$(price).focus();
						return false;
					}
					else if(!regExpNum.test($(price).val())){
						alert("숫자만 입력하세요.");
						return false;
					}
					
					var formData = new FormData($('#myform_'+idx)[0]);
					
					$.ajax({
						url: "${contextPath}/admin/updateProductAjax",
						enctype: "multipart/form-data",
						type: "post",
						data: formData, 
						processData: false, 
						contentType: false, 
						success:function(data){	
							alert("적용 되었습니다.");
							location.reload();
						}
					});   
				}
				else{
					var str = checkFile(idx); 
					if(!str){
						return false;
					}
					else if(str="checkOk"){
						$("#fileEx_"+idx).val("true"); 
						var formData = new FormData($('#myform_'+idx)[0]);
						
						$.ajax({
							url: "${contextPath}/admin/updateProductAjax",
							enctype: "multipart/form-data",
							type: "post",
							data: formData, 
							processData: false, 
							contentType: false, 
							success:function(data){	
								alert("적용 되었습니다.");
								location.reload();
							}
						});   
					}
				}
			}
		}
		
		function deleteProductAjax(idx){
			var res = confirm("삭제하시겠습니까?");
			if(!res){
				return ;
			}
			else{
				var product_code = $("#product_code_"+idx).val();
				
				var product={
					product_code : product_code
				}
				
				 $.ajax({
					url: "${contextPath}/admin/deleteProductAjax",
					type: "post",
					data: product,
					success:function(data){	
						alert("삭제 되었습니다.");
						location.reload();
					}
				});  
			}
		}
		
		
		function checkFile(idx){
			if(idx==''){
				var file = myform.file.value; 
				var file_name = "#file";
				var product_name = "#product_name";
				var price ="#price";
			}
			else{
				var file_name = "#file_"+idx;
				var file = $(file_name).val(); 
				var product_name = "#product_name_"+idx;
				var price = "#price_"+idx
			}
			var ext = file.substring(file.lastIndexOf(".")+1); //확장자 발췌
			var uExt = ext.toUpperCase(); //확장자를 대문자로
			var maxSize = 1024*1024*10; //최대 10MByte
			
			if($(product_name).val().trim() == ""){
				alert("상품명을 입력하세요.");
				$(product_name).focus();
				return false;
			}
			else if($(price).val().trim() == ""){
				alert("가격을 입력하세요.");
				$(price).focus();
				return false;
			}
			else if(file == ""){
				alert("업로드할 파일을 선택하세요.");
				$(file_name).focus();
				return false;
			}
			
			var regExpNum=/^[0-9]*$/;
			if(idx==''){
				var fileSize = document.getElementById("file").files[0].size;			
			}
			else{
				var fileSize = document.getElementById("file_"+idx).files[0].size;			
			}
			
			if(uExt != "ZIP" && uExt !="JPG" && uExt !="JPG" && uExt !="GIF" && uExt !="PNG"){
				alert("업로드 가능한 파일은 zip/jpg/gif/png 입니다.");
				return false;
			}
			else if(fileSize > maxSize){
				alert("업로드 가능한 파일의 최대 용량은 10MByte입니다.");
				return false;
			}
			else if(file.indexOf(" ") != -1){
				alert("파일명에는 공백을 포함 할 수 없습니다.");
				return false;
			}
			else if(!regExpNum.test($(price).val())){
				alert("숫자만 입력하세요.");
				return false;
			}
			else{
				return "checkOk";
			}
		}
		
		function viewImageShow(product){
			var url = "${contextPath}/admin/viewImageShow?code="+product+"&classify=prod";
			window.open(url,"nwin","width=300px, height=300px");
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
				<h2>제품</h2>
				<p><br/><br/></p>
			</div>
            <div class="list_start">
              	<div class="list_detail">
              		<p></p>
              		<button type="button" class="w3-round-xlarge icon_btn" id="back" onclick="window.history.back()"><i class="fas fa-reply"></i></button><label for="back">뒤로가기</label>
              		<c:if test="${category_code=='PROD-001' || category_code=='PROD-003'}">
              			<span class="w3-right"><label for="option">옵션관리</label><button type="button" class="w3-round-xlarge icon_btn" id="option" onclick="location.href='${contextPath}/admin/viewSubcategoryEdit?category_code=${category_code }'"><i class="fas fa-share"></i></button></span>
              		</c:if>
                  	<div id="content_input">
	                    	<table>
	                        	<tr>
	                              	<th>이름</th>
	                              	<th>가격</th>
	                              	<th>사진</th>
	                              	<th>수정/삭제</th>
	                            </tr>
	                            <c:forEach var="vo" items="${vos }" varStatus="status">
		                          	<tr>
		                          		<form id="myform_${status.count}" method="post"  enctype="multipart/form-data">
			                              	<td><input type="text" id="product_name_${status.count}" name="product_name" value="${vo.product_name }" maxlength="50" disabled></td>
			                              	<td><input type="text" id="price_${status.count}" name="price" value="${vo.price }" disabled></td>
			                              	<td>
			                              	<input type="hidden" id='file_${status.count}' name='file' accept='.zip,.jpg,.gif,.png,.jpeg'>
			                              	<input type="hidden" id='fileEx_${status.count}' name='fileEx' >
			                              	<span id="fileSpan_${status.count}"><button type="button" class="w3-round-xlarge" id="btn_str" onclick="viewImageShow('${vo.product_code}')">미리보기</button></span></td>
			                              	<td>
			                              		<span id="span_${status.count}"><button type="button" class="w3-round-xlarge" id="btn_str" onclick="editProduct(${status.count},'${vo.product_code}')">편집</button>
			                              		<button type="button" class="w3-round-xlarge" id="btn_str" onclick="deleteProductAjax(${status.count})">삭제</button></span>
			                              	</td>
			                              	<input type="hidden" name="category_code" value="${category_code }"/>
			                              	<input type="hidden" id="product_code_${status.count}" name="product_code" value="${vo.product_code }"/>
				                 		</form>
		                          	</tr>
	                          	</c:forEach>
	                          	<tr>
	                  				<form id="myform" method="post"  enctype="multipart/form-data">
		                           		<td><input type="text" id="product_name" name="product_name" maxlength="50"></td>
		                           		<td><input type="text" id="price" name="price"></td>
		                              	<td><input type="file" id="file" name="file" accept=".zip,.jpg,.gif,.png,.jpeg"></td>
		                          		<td><button type="button" class="w3-round-xlarge" onclick="insertProductAjax()" id="btn">추가</button>
		                          		</td>
										<input type="hidden" name="category_code" value="${category_code }"/>
				                 	</form>   
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