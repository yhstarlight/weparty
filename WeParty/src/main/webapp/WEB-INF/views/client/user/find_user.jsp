<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 아이디/비밀번호 찾기</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/find_user.css" rel="stylesheet" />
<style type="text/css">
</style>
<script type="text/javascript">
var popupX=(window.screen.width/2)-(400/2);
var popupY=(window.screen.height/2)-(200/2);

function findId(){
	window.open("","idFindPop","width=400, height=180, left="+ popupX + ", top="+ popupY);
	document.find_id.method="post";
	document.find_id.action="/user/find_id.do";
	document.find_id.target="idFindPop"
	document.find_id.submit();
}

function findPassword(){
	window.open("","pwFindPop","width=400, height=180, left="+ popupX + ", top="+ popupY);
	document.find_pw.method="post";
	document.find_pw.action="/user/find_password.do";
	document.find_pw.target="pwFindPop"
	document.find_pw.submit();
}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	<div style="width:max-width; text-align:left">
		<div class="l" style="width:850px;">
			<table style="width:750px; margin-left:45px;">
				<tr>
					<td style="width:335px; padding-left:30px; padding-right:20px">
						<span class="title">아이디 찾기</span>
						<hr class="hrFInd">
						<form name="find_id">
							<table style="width:250px; margin-left:30px;">
								<tr style="text-align:left">
									<td>이름 </td>
									<td><input class="inputFind" type="text" name="user_name"></td>
								</tr>
								<tr style="text-align:left">
									<td>이메일 </td>
									<td><input class="inputFind" type="email" name="user_email"></td>
								</tr>
								<tr>
									<td colspan="2"><button type="submit" class="btnFind" onclick="findId()">확인</button></td>
								</tr>
								<tr>
									<td style="height:23px;">
									</td>
								</tr>				
							</table>
						</form>
					</td>
					<td style="width:335px; padding-left:20px; padding-right:20px">
						<span class="title">비밀번호 찾기</span>
						<hr class="hrFInd">
							<form name="find_pw">
							<table style="width:250px; margin-left:30px;">
								<tr style="text-align:left">
									<td>아이디 </td>
									<td><input class="inputFind" type="text" name="user_id"></td>
								</tr>
								<tr style="text-align:left">
									<td>이름 </td>
									<td><input class="inputFind" type="text" name="user_name"></td>
								</tr>
								<tr style="text-align:left">
									<td>이메일 </td>
									<td><input class="inputFind" type="text" name="user_email"></td>
								</tr>
								<tr>
									<td colspan="2"><button class="btnFind" onclick="findPassword()">확인</button></td>
								</tr>					
							</table>
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>

</body>
</html>