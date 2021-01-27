<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!-- Footer -->
<p><br/></p>
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-medium" style="background-color:#292929; color:#666666;">
	<a href="${contextPath }/user/viewUserDelete">회원탈퇴</a>
	<a href="${contextPath }/user/viewManagerInput">매니저신청</a>
	<a href="${contextPath }/user/viewManagerPassOk">매니저신청결과</a>
 	<p class="w3-medium">서울시 서초구 강남대로 535 프린스빌딩 15층 대표 : 콜린클락 전화 : 02-797-0000 사업자등록번호 : 101-84-04143<br/>
  	SUBWAY® is a Registered Trademark of Subway IP LLC. © 2021 Subway IP LLC. All Rights Reserved.</p>
</footer>