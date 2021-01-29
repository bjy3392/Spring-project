<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		
		var array = new Array();
	    $( document ).ready(function() {
	    	var store = {
	    		store : "${store}"	
	    	}
	    	$.ajax({
				url: "${contextPath}/store/findChart",
				type: "post",
				data: store,
				success:function(data){
					
					for(var i=0; i<data.length; i++){
						array[i] = data[i].title+"/"+data[i].cnt
					}
					//alert(map[0].get("title"))
				}
			}); 
	    	
	    	var currDate = new Date(); // 현재 날짜
	    	var prevDate = new Date(new Date().setMonth(new Date().getMonth()-1)); // 한달전 날짜
	    	
	    	// YYYY-MM-DD로 형식변환
	    	var prevMon = dateToYYYYMMDD(prevDate);
	    	var currMon = dateToYYYYMMDD(currDate);

	    	let date = new Date();
	    	$("#cur").html(currMon); 
	    	$("#pre").html(prevMon) ;
	    });
	    
	    function dateToYYYYMMDD(date)
	    {
	        function pad(num) {
	            num = num + '';
	            return num.length < 2 ? '0' + num : num;
	        }
	        return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
	    }
	    //출처: https://zenobi.tistory.com/40 [Open Reference]
	    
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
			
			var options = {'title':'주제 : 시간대 별 판매량', 'width':640, 'height':350};
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
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div>
			기간 : <span id="pre"></span>~<span id="cur"></span>
		</div>
		<div id="chartView"></div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>