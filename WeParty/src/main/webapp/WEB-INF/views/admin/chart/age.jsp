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
	<canvas id="userAge_chart" height="480px" width="500px"></canvas>
</div>
<script>
var userAgeChartLabels = [];
var userAgeData = [];

$.getJSON("/chart/ageList.mdo",
		function(data){
	$.each(data, function(inx, obj){
		if(obj.user_age==60){
			userAgeChartLabels.push("그 외");
		} else {
			userAgeChartLabels.push(obj.user_age+"대");
		}
		userAgeData.push(obj.user_age_count);
	});
	
	createUserAgeChart();
});

var userAgeChartData = {
		labels : userAgeChartLabels,
		datasets :[
			{
				backgroundColor: ["rgba(235,165,174,0.5)","rgba(107,199,191,0.5)",
					"rgba(255,255,143,0.5)", "rgba(191,160,237,0.5)", "rgba(133,176,255,0.5)"],
				data : userAgeData
			}
		]
}

function createUserAgeChart(){
	new Chart(document.getElementById("userAge_chart"),{
		type : 'doughnut',
		data : userAgeChartData
	})
}
</script>


</body>
</html>