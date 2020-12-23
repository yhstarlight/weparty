<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 권한 수정</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/admin/edit_password.js"></script>
<style>
input {height: 20px}

#popup_err1{width:230px; height:50px; background:#fff; border: solid 1px #666666; 
position:fixed; top:137%; left:82%; margin:-250px 0 0 -250px; z-index:9999; display:none;}
#popup_err2, #popup_err3, #popup_err4 {width:270px; height:75px; background:#fff; border: solid 1px #666666; 
position:fixed; top:132%; left:78%; margin:-250px 0 0 -250px; z-index:9999; display:none;}
#popup_err5,#popup_success {width:250px; height:50px; background:#fff; border: solid 1px #666666; 
position:fixed; top:137%; left:80%; margin:-250px 0 0 -250px; z-index:9999; display:none;}
#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat;
top:0; left:0; z-index:999; display:none;}
</style>

<script>
$(document).ready(function(){
	
	var stat= "${stat}";
	
	if(stat=="err1"){
		$("#popup_err1").css("display", "block");
		$("#mask").css("display", "block");
	}
	
	if(stat=="success"){
		$("#popup_success").css("display", "block");
		$("#mask").css("display", "block");
	}

});

</script>
</head>
<body>
<div style="background-color: #EFF4F4; padding:20px; text-align:center; ">
<span style="font-size: 16px; font-weight: bold">비밀번호 변경</span>
<form action="/mypage/password_edit_success.mdo" onsubmit="return editPasswordCheck();">
<input type="hidden" value="${mlogin_id}" id="id">
<div style="margin-top:15px; border-radius: 5px; background-color: white;
	color: gray; padding: 5px; font-size: 14px; margin-bottom: 15px;" >
	<table style="margin:10px 0 10px 20px; text-align: left">
		<tr>
			<td width=115px;>현재 비밀번호</td>
			<td><input type="password" name="old_pw"></td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
			<td><input type="password" name="new_pw" id="new_pw"></td>
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
			<td><input type="password" name="new_pw_check" id="new_pw_check"></td>
		</tr>
	</table>
</div>
<div>
	<button style="height: 30px">변경</button>
</div>
</form>
<div id="popup_err1" style="padding-top:10px; border:4px solid #6BC7BF">
	<div class="popup_content">
		<span style="font-size:14px; font-weight: bold">현재 비밀번호가 맞지 않습니다.</span><br>
		<a href="#" style="font-size: 11px" onclick="errPopupClose()">닫기Ⅹ</a>	
	</div>
</div>
<div id="popup_err2" style="padding-top:10px; border:4px solid #6BC7BF">
	<div class="popup_content">
		<span style="font-size:14px; font-weight: bold">숫자+영문자+특수문자 조합으로<br>8자리 이상 사용해야 합니다.</span><br>
		<a href="#" style="font-size: 11px" onclick="errPopupClose()">닫기Ⅹ</a>	
	</div>
</div>
<div id="popup_err3" style="padding-top:10px; border:4px solid #6BC7BF">
	<div class="popup_content">
		<span style="font-size:14px; font-weight: bold">비밀번호에 같은 문자를<br>4번 이상 사용하실 수 없습니다.</span><br>
		<a href="#" style="font-size: 11px" onclick="errPopupClose()">닫기Ⅹ</a>	
	</div>
</div>
<div id="popup_err4" style="padding-top:10px; border:4px solid #6BC7BF">
	<div class="popup_content">
		<span style="font-size:14px; font-weight: bold">비밀번호에 아이디가<br>포함되지 않도록 해주세요.</span><br>
		<a href="#" style="font-size: 11px" onclick="errPopupClose()">닫기Ⅹ</a>	
	</div>
</div>
<div id="popup_err5" style="padding-top:10px; border:4px solid #6BC7BF">
	<div class="popup_content">
		<span style="font-size:14px; font-weight: bold">새 비밀번호가 일치하지 않습니다.</span><br>
		<a href="#" style="font-size: 11px" onclick="errPopupClose()">닫기Ⅹ</a>	
	</div>
</div>
<div id="popup_success" style="padding-top:10px; border:4px solid #6BC7BF">
	<div class="popup_content">
		<span style="font-size:14px; font-weight: bold">비밀번호가 변경 되었습니다.</span><br>
		<a href="#" style="font-size: 11px" onclick="successPopupClose()">닫기Ⅹ</a>	
	</div>
</div>
<div id="mask"></div>
</div>
</body>
</html>