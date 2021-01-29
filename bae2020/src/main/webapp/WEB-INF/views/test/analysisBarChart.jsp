<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>analysisPieChart.jsp</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<script type="text/javascript">
		
		var array = new Array();
	    $( document ).ready(function() {
	    	$.ajax({
				url: "${contextPath}/test/findChartTest",
				type: "post",
				success:function(data){
					
					for(var i=0; i<data.length; i++){
						array[i] = data[i].title+"/"+data[i].cnt
					}
					//alert(map[0].get("title"))
				}
			});  
	    });
	    
	    google.charts.load('current', {'packages':['bar']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	    	var data = new google.visualization.DataTable();
			//하단의 등록일을 표시해 줄 컬럼
			data.addColumn('string', '시간대 별');
			//데이터값(그래프 수치)
			data.addColumn('number', '판매량');  
			for(var i=0; i<array.length; i++){
				var row = array[i].split("/");
				data.addRow([row[0],Number(row[1])]);
			}
			
			var options = {'title':'주제 : ${pVo.title}', 'width':640, 'height':350};
			var chart = new google.charts.Bar(document.getElementById('chartView'));
      		chart.draw(data, google.charts.Bar.convertOptions(options));
		}
		
		
		function changeChart() {
			var chartFlag = myform.choiceChart.value;
			//location.href="${contextPath}/vote/chartAnalysis?idx=${vos.get(0).popularIdx}&chartFlag="+chartFlag;
		}
		
	</script>
</head>
<body>
<div class="container">
  - 주제명 : ${pVo.title}<br/>
  - 투표 참여인원 : 총 ${voteTotCnt}명
  <form name="myform">
    <p>선택 :
    <%-- 
    <select name="choiceChart" onchange="changeChart()">
      <option value="0" <c:if test="${flag==0}"> selected </c:if>>항목별 투표결과</option>
      <option value="1">연령별 투표결과</option>
      <option value="2">지역별 투표결과</option>
      <option value="3">성별 투표결과</option>
    </select>
     --%>
    <select name="choiceChart" onchange="changeChart()">
      <option value="pie" <c:if test="${chartFlag=='pie'}"> selected </c:if>>원형차트보기</option>
      <option value="bar" <c:if test="${chartFlag=='bar'}"> selected </c:if>>막대차트보기</option>
    </select>
  </form>
  <div id="chartView"></div>
</div>
</body>
</html>