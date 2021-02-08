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
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script type="text/javascript">
		
		var array = new Array();
		var array2 = new Array();
		var array3 = new Array(4);
		var array4 = new Array();
		for (var i = 0; i < array3.length; i++) {
			array3[i] = new Array(2);
		}
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
	    	
	    	$.ajax({
				url: "${contextPath}/store/findChartByCategory",
				type: "post",
				data: store,
				success:function(data){
					
					for(var i=0; i<data.length; i++){
						array2[i] = data[i].title+"/"+data[i].sum1+"/"+data[i].sum2+"/"+data[i].sum3+"/"+data[i].sum4
					}
					//alert(map[0].get("title"))
				}
			}); 
	    	
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
	    google.charts.setOnLoadCallback(drawChart1);
	    function drawChart1() {
	    	var data = new google.visualization.DataTable();
			//하단의 등록일을 표시해 줄 컬럼
			data.addColumn('string', '시간대 별');
			//데이터값(그래프 수치)
			data.addColumn('number', '판매량');  
			for(var i=0; i<array.length; i++){
				var row = array[i].split("/");
				data.addRow([row[0],Number(row[1])]);
			}
			
			var options = {'title':'주제 : 시간대 별 판매량', 'width':1000, 'height':350};
			var chart = new google.charts.Bar(document.getElementById('chartView'));
      		chart.draw(data, google.charts.Bar.convertOptions(options));
		}
		
	    google.charts.load("current", {packages:['bar']});
	    google.charts.setOnLoadCallback(drawChart2);
	    function drawChart2() {
	     	var data = new google.visualization.DataTable();
			//하단의 등록일을 표시해 줄 컬럼
			data.addColumn('string', '시간대 카테고리 별');
			//데이터값(그래프 수치)
			data.addColumn('number', '샌드위치');  
			data.addColumn('number', '찹샐러드');  
			data.addColumn('number', '쿠키');  
			data.addColumn('number', '랩');  
			
			for(var i=0; i<array2.length; i++){
				var row = array2[i].split("/");
				data.addRow([row[0],Number(row[1]),Number(row[2]),Number(row[3]),Number(row[4])]);
			}
			
			var options = {'title':'주제 : 시간대 카테고리 별', 'width':1000, 'height':350};
			var chart = new google.charts.Bar(document.getElementById('chartViewByCategory'));
			
	      	chart.draw(data, google.charts.Bar.convertOptions(options));
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
		
		  	var options = {title:'주제 : 제품별', 'width':700, 'height':400};
		  	var chart = new google.visualization.PieChart(document.getElementById('chartViewByProduct'));
		  	chart.draw(data, options);
		  	google.visualization.events.addListener(chart, 'select', selectHandler);
		  	
		  	function selectHandler(e) {
		    	var selectedItem = chart.getSelection()[0];
		        if (selectedItem) {
		            var value = data.getValue(selectedItem.row, 0);
		            var category ={
		            		store : "${store}",
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
		        	  	array4 = new Array();
		            }
		        }
		    }
		} 
		
	</script>
	<style type="text/css">
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
	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<button type="button" class="w3-round-xlarge icon_btn" id="back" onclick="window.history.back()"><i class="fas fa-reply"></i></button><label for="back">뒤로가기</label>
		<div>
			기간 : <span id="pre"></span>~<span id="cur"></span>
		</div>
		<div id="chartView"></div>
		<div id="chartViewByCategory"></div>
		<div class="w3-row">
			<div class="w3-col s6" id="chartViewByProduct"></div>
			<div class="w3-col s6" id="sub"></div>
		</div>
		
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>