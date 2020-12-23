<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 회원가입</title>
<link href="/resources/css/client/register.css" rel="stylesheet" />
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/client/register.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width;">
		<form action="/user/register_success.do" name="reigst" method="post" onsubmit="return checkInfo();" >
			<div class="l" style="width:850px;" >
				<p align="center" style="margin-top:30px; color:gray; font-weight:bold">회원 가입</p>
				<input type="hidden" id="idCheck" value="false">
				<input type="hidden" id="emailCheck" value="false">
				<table style="margin-left:150px; margin-top:30px; vertical-align: middle">
					<tr>
						<td class="fontA">아이디</td>
						<td><input class="in" type="text" id="user_id" name="user_id"/></td>
						<td><button type="button" 
						onclick="window.open('/user/id_check.do?user_id='
							+document.reigst.user_id.value,'idCheckPop','width=400, height=180, left='+ popupX + ', top='+ popupY);">
						중복 확인</button></td>
					</tr>		
					<tr>
						<td class="fontA">비밀번호</td>
						<td><input class="in pw" type="password" id="user_pw" name="user_pw"/></td>
						<td class="fontB">&nbsp;영문,숫자,특수문자를 포함해 8자리 이상입력해주세요.</td>
					</tr>
					<tr>
						<td class="fontA">비밀번호 확인 &nbsp;</td>
						<td><input class="in pw" type="password" id="pwCheck"/></td>
						<td class="fontC">&nbsp;비밀번호를 확인해주세요.</td>
					</tr>
					<tr>
						<td class="fontA">이름</td>
						<td><input class="in" type="text" id="user_name" name="user_name"/></td>
					</tr>
					<tr>
						<td class="fontA">닉네임</td>
						<td><input class="in" type="text" id="user_nick" name="user_nick"/></td>
					</tr>
					<tr>
						<td class="fontA">이메일</td>
						<td><input class="in" type="email" id="user_email" name="user_email"/></td>
						<td><button type="button" style="width:90px; height:28px;" 
						onclick="window.open('/user/email_check.do?email='
							+document.reigst.user_email.value,'emailCheckPop','width=400, height=200, left='+ popupX + ', top='+ popupY);">
						이메일 인증</button></td>
					</tr>
					<tr>
						<td class="fontA">나이</td>
						<td>
							<select name="user_age" style="height:30px;">
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">그외</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="fontA">성별</td>
						<td>
							<input type="radio" name="user_gender" value="f"><span style="font-size:14px;">여자</span>
							<input type="radio" name="user_gender" value="m"><span style="font-size:14px;">남자</span>
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<br><br><b>관심 분야</b><br><hr>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<table style="width:560px"> 
								<tr>
									<td class="checkBox"><input type="checkbox" name="interest" value="web"><span>웹/모바일</span>
									<td class="checkBox"><input type="checkbox" name="interest" value="scenario"><span>글/문학</span>
									<td class="checkBox"><input type="checkbox" name="interest" value="ucc"><span>사진/UCC</span>
									<td class="checkBox"><input type="checkbox" name="interest" value="science"><span>과학</span>
								</tr>
								<tr>
									<td class="checkBox"><input type="checkbox" name="interest" value="game"><span>게임</span>
									<td class="checkBox"><input type="checkbox" name="interest" value="architecture"><span>건축</span>
									<td class="checkBox"><input type="checkbox" name="interest" value="supporters"><span>서포터즈/대외활동</span>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
						<br><input class="regist" type="submit" value="확인"/>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
	<script>
	$('.pw').focusout(function(){
		var pwd1 = $("#user_pw").val();
		var pwd2 = $("#pwCheck").val();
		if ( pwd1 != '' && pwd2 == '' ) {
	           null;
	     } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	            	$('.fontC').css('display', 'none');
	            } else {
	                $('.fontC').css('display', 'inline-block');
	            }
	        }
	    });
	
	$("#user_id").change(function(){
	    document.getElementById("idCheck").value='false';
	});
	
	$("#emailCheck").change(function(){
	    document.getElementById("emailCheck").value='false';
	});
	 
	</script>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>
</body>
</html>