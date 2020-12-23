<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
</head>
<body>
<div>
	<canvas id="visit_chart" height="450px" width="500px"></canvas>
</div>
<script>
var visitChartLabels = [];
var visitData = [];

$.getJSON("/chart/visitList.mdo",
		function(data){
	$.each(data, function(inx, obj){
		visitChartLabels.push(obj.visit_date);
		visitData.push(obj.visit_count);
	});
	
	createVisitChart();
});

var visitChartData = {
		labels : visitChartLabels,
		datasets :[
			{
				label : "방문자 수",
				backgroundColor: "rgba(107,199,191,0.5)",
				data : visitData
			}
		]
}

function createVisitChart(){
	new Chart(document.getElementById("visit_chart"),{
		type : 'line',
		data : visitChartData,
		options :{
			scales:{
				yAxes:[{
					ticks:{
						stepSize:10
					}
				}]
			}
		}
	})
}
</script>


</body>
</html>