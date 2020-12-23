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
	<canvas id="userRegDate_chart" height="450px" width="500px"></canvas>
</div>
<script>
var userRegDateChartLabels = [];
var userRegDateData = [];

$.getJSON("/chart/regdateList.mdo",
		function(data){
	$.each(data, function(inx, obj){
		userRegDateChartLabels.push(obj.user_regdate);
		userRegDateData.push(obj.user_regdate_count);
	});
	
	createUserRegDateChart();
});

var userRegDateChartData = {
		labels : userRegDateChartLabels,
		datasets :[
			{
				label : "회원 가입 날짜",
				backgroundColor: "rgba(235,165,174,0.5)",
				data : userRegDateData
			}
		]
}

function createUserRegDateChart(){
	new Chart(document.getElementById("userRegDate_chart"),{
		type : 'line',
		data : userRegDateChartData,
		options :{
			scales:{
				yAxes:[{
					ticks:{
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