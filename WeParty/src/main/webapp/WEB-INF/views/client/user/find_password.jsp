<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<style type="text/css">
.l{
	margin-left:20px; margin-right:20px; margin-botton:20px;
	height:155px;
}
</style>
</head>
<body>
	<div class="l">
	<c:if test="${success eq 'y'}">
	<div style="margin-top:32px; text-align:center; color:gray">
	<span style="font-size:14px;">이메일로 임시 비밀번호를 전송했습니다.<br>
	로그인 후 비밀번호를 변경해주세요.</span>
	<br>
	<br>
	<button style="width:40px; height:30px;" onclick="window.close()">닫기</button>
	</div>
	</c:if>
	
	<c:if test="${success eq 'n'}"	>
	<div style="margin-top:30px; text-align:center; color:gray">
	<span style="font-size:14px;">입력하신 정보가 일치하지 않습니다.<br>
	다시 입력해주세요.</span>
	<br>
	<br>
	<button style="width:40px; height:30px;" onclick="window.close()">닫기</button>
	</div>
	</c:if>
	</div>

</body>
</html>