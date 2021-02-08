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
	<script>
		var array = new Array();
		var array2 = new Array();
		$( document ).ready(function() {
	    	var store = {
	    		store : "${store}"	
	    	}
	    	$.ajax({
				url: "${contextPath}/store/findUserByStore",
				type: "post",
				data: store,
				success:function(data){
					array[0] = data[0].cnt;
					array[1] = data[1].cnt;
				}
			}); 
	    	
	    	$.ajax({
				url: "${contextPath}/store/findUserByOrderCnt",
				type: "post",
				data: store,
				success:function(data){
					
					for(var i=0; i<data.length; i++){
						array2[i] = data[i].mid+"/"+data[i].cnt+"/"+data[i].total;
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
		
		google.charts.load('current', {'packages':['corechart']});
    	google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
    	  	var data = new google.visualization.DataTable();
			//하단의 등록일을 표시해 줄 컬럼
			data.addColumn('string', '재주문율');
			//데이터값(그래프 수치)
			data.addColumn('number', '주문수');

			data.addRow(["재주문",Number(array[0])]);
			data.addRow(["첫주문",Number(array[1])]);
			
    	  	var options = {title:'주제 : 재주문율', 'width':700, 'height':400, is3D: true};
    	  	var chart = new google.visualization.PieChart(document.getElementById('chartView1'));
    	  	chart.draw(data, options);
        }
        
        google.charts.load('current', {'packages':['bar']});
        google.charts.setOnLoadCallback(drawChart2);
	    function drawChart2() {
	    	var data = new google.visualization.DataTable();
			//하단의 등록일을 표시해 줄 컬럼
			data.addColumn('string', '');
			//데이터값(그래프 수치)
			data.addColumn('number', '구매횟수'); 
			data.addColumn({type: 'string', role: 'annotation'}); 
			
			for(var i=0; i<array2.length; i++){
				var row = array2[i].split("/");
				data.addRow([row[0],Number(row[1]),'anno']);
			}
			
			var options = {'title':'주제 : 이용자 별 구매횟수','width':700, 'height':350,  bars: 'horizontal'};
			var chart = new google.charts.Bar(document.getElementById('chartView2'));
      		chart.draw(data, google.charts.Bar.convertOptions(options));
		}
        
	</script>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div>
			기간 : <span id="pre"></span>~<span id="cur"></span>
		</div>
		<div class="w3-row">
			<div class="w3-col s6" id="chartView1"></div>
			<div class="w3-col s6" id="chartView2"></div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>