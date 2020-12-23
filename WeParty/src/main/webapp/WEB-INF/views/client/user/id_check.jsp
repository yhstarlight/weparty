<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<style type="text/css">
.l{
	margin-left:20px; margin-right:20px; margin-botton:20px;
	height:155px;
}
</style>

<script type="text/javascript">
function idCheckFalse(){
	opener.document.getElementById("idCheck").value='false';
	window.close();
	opener.document.getElementById("user_id").focus();
	opener.document.getElementById("user_id").value = '';
}

function idChekTrue(){
	opener.document.getElementById("idCheck").value='true';
	window.close();
}
</script>

</head>
<body>
	<div class="l">
	<c:if test="${success eq 'y'}">
	<div style="margin-top:45px; text-align:center; color:gray">
	<span style="font-size:14px;">아이디 사용이 <b>가능</b>합니다.</span>
	<br>
	<br>
	<button style="width:40px; height:30px;" onclick="idChekTrue()">닫기</button>
	</div>
	</c:if>
	
	<c:if test="${success eq 'n'}"	>
	<div style="margin-top:30px; text-align:center; color:gray">
	<span style="font-size:14px;">아이디 사용이 <b>불가능</b>합니다.<br>
	다시 입력해주세요.</span>
	<br>
	<br>
	<button style="width:40px; height:30px;" onclick="idCheckFalse()">닫기</button>
	</div>
	</c:if>
	
	<c:if test="${success eq 'f'}"	>
	<div style="margin-top:30px; text-align:center; color:gray">
	<span style="font-size:14px;">아이디는 <b>5</b>에서 <b>15</b>자리수만 가능합니다.<br>
	다시 입력해주세요.</span>
	<br>
	<br>
	<button style="width:40px; height:30px;" onclick="idCheckFalse()">닫기</button>
	</div>
	</c:if>
	
	</div>
</body>
</html>