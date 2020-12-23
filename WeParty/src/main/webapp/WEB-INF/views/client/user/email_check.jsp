<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<style type="text/css">
.l{
	margin-left:20px; margin-right:20px; margin-botton:20px;
	height:175px;
}
</style>

<script type="text/javascript">

function emailCheck(){

		var dice = ${dice};
		
		if(document.getElementById("checkEmail").value == dice){
			opener.document.getElementById("emailCheck").value='true';
			window.close();
		} else {
			$('.emailFalse').css('display', 'inline-block');
			$('.checkEmail').css('margin-top', '5px;');
		}
}

function exit(){
	opener.document.getElementById("user_email").value='';
	opener.document.getElementById("user_email").focus();
	window.close();
}

</script>
</head>
<body>
	
	<div class="l">
	<div style="margin-top:30px; text-align:center; color:gray">
	<c:if test="${success eq 'y'}">
	<span style="font-size:14px;">
	인증번호가 발송되었습니다<br>
	인증번호를 입력해주세요.<br></span>
	<input type="text" style="margin-top:10px;" id="checkEmail"><br>
	<span class="emailFalse" style="font-size:12px; color:red; display:none;">인증번호가 다릅니다. 다시 입력해주세요.</span><br>
	<button class="checkEmail" style="margin-top:10px; width:40px; height:30px;" onclick="emailCheck()">인증</button>
	</c:if>
	
	<c:if test="${success eq 'n' }">
	<span style="font-size:14px;">
	<br>중복된 이메일입니다.<br>
	다른 이메일을 입력해주세요.<br><br></span>
	<button style="margin-top:10px; width:40px; height:30px;" onclick="exit()">닫기</button>
	</c:if>
	</div>
	</div>

</body>
</html>