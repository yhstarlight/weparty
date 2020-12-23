<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 회원가입을 축하합니다</title>
<style type="text/css">
	html { overflow-y:scroll; }
	
	.l {
	padding-bottom: 100px;
	padding-top:100px; text-align:center; width:850px;
	}
	
	button {
	width:120px; height:30px;
	}
	
</style>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width;">
		<div class="l">
			<span style="color:gray;"> 회원가입을 축하합니다!<br></span>
			<br><br>
			<button onclick="location.href='/home.do'">메인 화면으로</button>
		</div>
	</div>
	 
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>
</body>
</html>