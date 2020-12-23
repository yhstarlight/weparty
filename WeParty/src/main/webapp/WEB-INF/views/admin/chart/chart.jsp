<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 통계</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<style>
.Chart {background:#6BC7BF}
</style>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">통계</span><br>
	<div class="MainDiv">
	<div style="width:1280px; overflow: hidden; padding:10px">
	
		<div style="width: 400px; margin-left:90px ;float: left; margin-bottom:15px;">
		<jsp:include page="/WEB-INF/views/admin/chart/visit.jsp"></jsp:include>
		</div>
	
		<div style="width: 400px; float: left; margin-left:85px">
		<jsp:include page="/WEB-INF/views/admin/chart/regdate.jsp"></jsp:include>
		</div>

		<div style="width: 480px; float: left; clear:both; margin-bottom:10px;">
		<jsp:include page="/WEB-INF/views/admin/chart/interest.jsp"></jsp:include>
		</div>
		
		<div style="width: 480px;  float: left">
		<jsp:include page="/WEB-INF/views/admin/chart/field.jsp"></jsp:include>
		</div>
		
		<div style="width: 390px; float: left; clear:both; margin-left:90px; margin-top:20px">
		<jsp:include page="/WEB-INF/views/admin/chart/gender.jsp"></jsp:include>
		</div>
		
		<div style="width: 420px; float: left; margin-left:90px; text-align: center">
		<span style="font-size:12px">회원 연령 분포</span>
		<jsp:include page="/WEB-INF/views/admin/chart/age.jsp"></jsp:include>
		</div>
		
	</div>

	</div>
	</div>
</body>
</html>