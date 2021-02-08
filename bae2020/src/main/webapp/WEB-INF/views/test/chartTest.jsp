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
	var array3 = new Array(4);
	var array4 = new Array();
	
	for (var i = 0; i < array3.length; i++) {
		array3[i] = new Array(2);
	}
    $( document ).ready(function() {
    	var store = {
    		store : "STORE-002"	
    	}
    	$.ajax({
			url: "${contextPath}/store/findPieChart",
			type: "post",
			data: store,
			success:function(data){
				
				for(var i=0; i<data.length; i++){
					array3[i][0] = data[i].category_name;
					array3[i][1] = data[i].cnt;
				}
			}
		}); 
    	
    	var currDate = new Date(); // 현재 날짜
    	var prevDate = new Date(new Date().setMonth(new Date().getMonth()-1)); // 한달전 날짜
    	
    	// YYYY-MM-DD로 형식변환
    	/* var prevMon = dateToYYYYMMDD(prevDate);
    	var currMon = dateToYYYYMMDD(currDate);

    	let date = new Date();
    	$("#cur").html(currMon); 
    	$("#pre").html(prevMon) ; */
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
	google.charts.setOnLoadCallback(drawChart3);
	
    function drawChart3() {
		var data = google.visualization.arrayToDataTable([
			  ['제품', '수량'],
			  [array3[0][0], Number(array3[0][1])],
			  [array3[1][0], Number(array3[1][1])],
			  [array3[2][0], Number(array3[2][1])],
			  [array3[3][0], Number(array3[3][1])]
		]); 
	
	  	var options = {title:'주제 : 제품별', 'width':700, 'height':400, is3D: true};
	  	var chart = new google.visualization.PieChart(document.getElementById('chartViewByCategory'));
	  	chart.draw(data, options);
	  	google.visualization.events.addListener(chart, 'select', selectHandler);

	    function selectHandler(e) {
	    	var selectedItem = chart.getSelection()[0];
	        if (selectedItem) {
	            var value = data.getValue(selectedItem.row, 0);
	            var category ={
	            		category : value
	            }
	            
	            $.ajax({
	    			url: "${contextPath}/store/findOrderGroupByProduct",
	    			type: "post",
	    			data: category,
	    			async:false,  //비동기식으로 진행
	    			success:function(aa){
	    				for(var i=0; i<aa.length; i++){
	    					array4[i] = aa[i].product_name+"/"+aa[i].cnt
	    				}
	    			}
	    		}); 
	            
	            google.charts.load('current', {'packages':['corechart']});
	        	google.charts.setOnLoadCallback(drawChart4);

	            function drawChart4() {
	            	
	        	  	var dataProd = new google.visualization.DataTable();
	    			//하단의 등록일을 표시해 줄 컬럼
	    			dataProd.addColumn('string', '시간대 별');
	    			//데이터값(그래프 수치)
	    			dataProd.addColumn('number', '판매량');   
	    			for(var i=0; i<array4.length; i++){
	    				var row = array4[i].split("/");
	    				
	    				dataProd.addRow([row[0],Number(row[1])]);
	    			}
	        	  	
	        	  	
	        	  	var options = {title:'주제 : 가장인기있는 메뉴', 'width':700, 'height':400, is3D: true};
	        	  	var chart = new google.visualization.PieChart(document.getElementById('sub'));
	        	  	chart.draw(dataProd, options);
	            }
	        }
	    }
	} 
   
	
  </script>
	
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div id="chartViewByCategory"></div>
		<div id="sub"></div>
		<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>