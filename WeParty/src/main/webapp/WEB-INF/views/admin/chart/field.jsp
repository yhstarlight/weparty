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
	<canvas id="contestField_chart" height="500px" width="650px"></canvas>
</div>
<script>
var contestFieldLabels = [];
var contestFieldData = [];

$.getJSON("/chart/fieldList.mdo",
		function(data){
	$.each(data, function(inx, obj){
		contestFieldLabels.push(obj.contest_field_name);
		contestFieldData.push(obj.contest_field_count);
	});
	
	createContestFieldChart();
});

var contestFieldChartData = {
		labels : contestFieldLabels,
		datasets :[
			{
				label : "등록된 공모전 분야 수",
				borderColor:"#fff",
				backgroundColor: "rgba(235,165,174,0.5)",
				data : contestFieldData
			}
		]
}

function createContestFieldChart(){
	new Chart(document.getElementById("contestField_chart"),{
		type : 'horizontalBar',
		data : contestFieldChartData,
		options :{
			scales:{
				xAxes:[{
					ticks:{
						min:0,
						stepSize:1
					}
				}]
			}
		}
	})
}
</script>


</body>
</html>