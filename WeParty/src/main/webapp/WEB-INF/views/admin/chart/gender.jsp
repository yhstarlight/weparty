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
	<canvas id="userGender_chart" height="540px" width="500px"></canvas>
</div>
<script>
var userGenderChartLabels = [];
var userGenderData = [];

$.getJSON("/chart/genderList.mdo",
		function(data){
	$.each(data, function(inx, obj){
		userGenderChartLabels.push(obj.user_gender);
		userGenderData.push(obj.user_genderCount);
	});
	
	createUserGenderChart();
});

var userGenderChartData = {
		labels : userGenderChartLabels,
		datasets :[
			{
				label : "성별 회원 수",
				borderColor:"#fff",
				backgroundColor: ["rgba(235,165,174,0.5)","rgba(107,199,191,0.5)"],
				data : userGenderData
			}
		]
}

function createUserGenderChart(){
	new Chart(document.getElementById("userGender_chart"),{
		type : 'bar',
		data : userGenderChartData,
		options :{
			scales:{
				yAxes:[{
					ticks:{
						min:0,
						stepSize:5
					}
				}]
			}
		}
	})
}
</script>


</body>
</html>