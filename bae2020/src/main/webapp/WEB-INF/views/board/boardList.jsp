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

	function selectSearch(){
		var product = myform.product.value;
		var sort = myform.sort.value;
		location.href ="${contextPath }/board/viewBoardList?sort="+sort+"&product="+product;
	}

	function moreList(lastIdx){
		var product = myform.product.value;
		var sort = myform.sort.value;
	    $.ajax({
	        url :"${contextPath}/board/viewBoardListMore?sort="+sort+"&product="+product ,
	        type :"POST",
	        data :{
	        	lastIdx : lastIdx
	        },
	        success :function(data){
	            var content="";
	            for(var i=0; i<data.length; i++){
	                content +=
	                "<li class='w3-padding-16' onclick='location.href=\"${contextPath}/board/viewBoardContent?idx="+data[i].idx+"&sort=${sort }&product=${product }\"'>"+
						"<img src='${contextPath }/product/"+data[i].category_code+"/"+data[i].image+"' alt='Image' class='w3-left w3-margin-right' style='width: 100px'>"+
						"<span>작성자 : "+data[i].mid +"</span> <br>"+ 
						"<span>메뉴&nbsp;&nbsp;&nbsp;&nbsp; : "+data[i].product_name +"</span> <br>"+ 
						"<span>작성일 : "+data[i].create_dt +"</span> <br>"+ 
						"<span>좋아요 : "+data[i].good +"</span>"+
	                "</li>";
	            }
	            if(data.length < 5){
                	content+= "<p>마지막 글입니다</p>"
	            }
	            else{
		            content+= "<button class='w3-button w3-white w3-margin' style='width:100%;' id='addbtn' onclick='javascript:moreList("+(lastIdx+5)+")'>더보기</button>";	
	            	
	            }	
	            	            
	            $("#addbtn").remove();//remove btn
	            $(content).appendTo("#list");
	        }
	    });
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
		width: 900px;
		height: auto;
		border: 0px solid;
		margin-bottom: 5px;
		background-color: #fff;
		padding:30px;
	}
	.btn_str {
		background-color: #fff; 
		color: #009223;
		padding: 6px 15px;
		text-align: left;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 10px 0px;
		cursor: pointer;
		font-weight: bold;
		border-color: #009223;
		border-width: 3px;
		border-style: solid;
	}
</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="main_list">
			<!-- 상단 제목 -->
			<div class="main_title">
				<p></p>
				<h2>추천메뉴 게시판</h2>
				<p><br/><br/></p>
			</div>
			<div class="list_start">
				<div class="list_detail">
					<form if="myform" name="myform">
						<select id="product" size=1 onchange="selectSearch()">
							<option value="전체"  ${part=='전체' ? 'selected' :'' }>전체</option>
							<c:forEach var="vo" items="${vosP }">
								<option value="${vo.product_code }"  ${product==vo.product_code  ? 'selected' :'' }>${vo.product_name }</option>
							</c:forEach>
						</select>
						<select id="sort" size=1 onchange="selectSearch()">
							<option value="create_dt" ${sort=='create_dt' ? 'selected' :'' }>최신순</option>
							<option value="good" ${sort=='good' ? 'selected' :'' }>좋아요순</option>
						</select>
					</form>
					<button class="w3-round-xlarge btn_str w3-right" onclick="location.href ='${contextPath }/board/viewBoardInput'">글쓰기</button>
					<p><br/></p>                        
					<table class="w3-table w3-bordered">
						<ul class="w3-ul w3-white" id="list">
							<c:forEach var="vo" items="${vos }">
								<li class="w3-padding-16" onclick="location.href='${contextPath}/board/viewBoardContent?idx=${vo.idx }&sort=${sort }&product=${product }'">
									<img src="${contextPath }/product/${vo.category_code }/${vo.image}" alt="Image" class="w3-left w3-margin-right" style="width: 100px">
									<span>작성자 : ${vo.mid }</span> <br> 
									<span>메뉴&nbsp;&nbsp;&nbsp;&nbsp; : ${vo.product_name }</span> <br> 
									<span>작성일 : ${vo.create_dt }</span> <br> 
									<span>좋아요 : ${vo.good }</span>
								</li>
							</c:forEach>
						</ul>
						<button class="w3-button w3-white w3-margin" style="width:100%;" id="addbtn" onclick="moreList(${lastIdx})">더보기</button>
						<%-- <c:forEach var="vo" items="${vos }">
							<tr onclick="location.href='${contextPath}/board/viewBoardContent?idx=${vo.idx }'">
								<td>${vo.mid}</td>
								<td>${vo.product_name }</td>
								<td>${vo.create_dt }</td>
								<td>${vo.good}</td>
							</tr>
						</c:forEach> --%>	
					</table>	
					<p></p>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>