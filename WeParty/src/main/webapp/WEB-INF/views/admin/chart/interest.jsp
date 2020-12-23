<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script>
var a = "${interestList.web_count}";
</script>
</head>
<body>
<div>
	<canvas id="userInterest_chart" height="500px" width="650px"></canvas>
	
</div>
<script>
var userInterestChartLabels = ["건축","게임","과학","글/문학","사진/UCC","서포터즈/대외활동","웹/모바일"];
var userInterestData = [];

$.getJSON("/chart/interestList.mdo",
		function(data){
		userInterestData.push(data.architecture_count);
		userInterestData.push(data.game_count);
		userInterestData.push(data.science_count);
		userInterestData.push(data.scenario_count);
		userInterestData.push(data.ucc_count);
		userInterestData.push(data.supporters_count);
		userInterestData.push(data.web_count);

		createUserInterestChart();
});

var userInterestChartData = {
		labels : userInterestChartLabels,
		datasets :[
			{
				label : "공모전 분야 선호 수",
				borderColor:"#fff",
				backgroundColor: "rgba(107,199,191,0.5)",
				data : userInterestData
			}
		]
}

function createUserInterestChart(){
	new Chart(document.getElementById("userInterest_chart"),{
		type : 'horizontalBar',
		data : userInterestChartData,
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