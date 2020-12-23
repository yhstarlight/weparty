<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style type="text/css">

 a.a, a.t:link { color: gray; text-decoration: none;}
 a.a:visited { color: gray; text-decoration: none;}
 a.a:hover { color: #6BC7BF; text-decoration: none;}
 a.a:active { color: gray; text-decoration: none; }
 
 input.log { 
 width:130px; height:30px; !important;
 }
 
</style>

<script>

function logout(){	
	if(confirm('정말 로그아웃 하시겠습니까?')){
		alert('로그아웃 되었습니다.');
		location.href="/user/user_logout.do";
	}
}

</script>

</head>
<body>
	<div
		style="border: 1px solid; border-color: #6BC7BF; width: 185px; 
		height: 95px; margin-top:20px; border-radius: 10px 10px 10px 10px; 
		padding: 15px;">
		
		<c:if test="${empty login_id}">
		<form action="/user/user_login.do" method="post">
		<table style="margin-top:5px;">
			<tr>
				<td><input type="text" name="user_id" class="log"
					placeholder="&nbsp;아이디"></td>
				<td rowspan="2"><input type="submit" value="login"
					style="width: 48px; height: 63px; background:#6BC7BF; color:white;
					border:0; outline:0" /></td>
			</tr>
			<tr>
				<td><input type="password" name="user_pw" class="log"
					placeholder="&nbsp;비밀번호"></td>
			</tr>
		</table>	
		<div 
			style="text-align:center">
			<a class="a" href="/user/find_user.do" style="font-size:12px">아이디/비밀번호 찾기&nbsp;&nbsp;</a>
			<a class="a" href="/user/register.do" style="font-size:12px">회원가입</a>
		</div>
		</form>
		</c:if>
		
		<c:if test="${not empty login_id}">
		<div style="text-align:center; width:max-width; margin-top:8px; height:60px;">
		<span style="font-size:14px; color:#6BC7BF"><b>${login_nick}(${login_id})</b></span>
		<span style="font-size:14px; color:gray">님 <br> 반갑습니다!</span>
		</div>
		
		<div 
			style="text-align:center;">
			<img src="/resources/img/client/mypageBtn.png">
			<a class="a" href="/mypage/myPage_contest.do" style="font-size:12px">마이 페이지&nbsp;&nbsp;</a>
			<a class="a" onclick="logout()" style="font-size:12px">로그아웃</a>
		</div>
		</c:if>
		
	</div>

</body>
</html>