<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 비밀번호 확인</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<style type="text/css">
.del {font-weight:bold;}
</style>
<script>
function delCheck(){
	
	if($("input[name=pw]").val()==''){
		alert('비밀번호를 입력해주세요.');
		return false;
	}
	
	if(confirm('정말 회원 탈퇴를 하시겠습니까?')){
		return true;
	}
	return false;
}

</script>
</head>
<body>

	<c:if test="${empty login_id}">
		<script>location.href="/home.do"</script>
	</c:if>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td rowspan="3" style="vertical-align: top;">
						<div class="l" style="margin-top:20px; width:722px; height:max-height; margin-left:20px; padding-left:50px; padding-bottom:50px;">
							<div style="margin-top:50px; font-size:24px; width:672px; text-align:left; color:#6BC7BF">
							<b>회원 탈퇴</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<form action="/mypage/delete_user.do" method="post" onsubmit="return delCheck();">
							<div style="padding:50px 50px 10px 0px; text-align: center;">
							<span style="font-size:14px;">비밀번호를 입력해주세요.</span><br>
							<input type="password" name="pw" style="margin-top:10px; margin-bottom:20px; height:20px;"> <br>
							<button style="width:50px; height:30px;">확인</button>
							</div>
							</form>
						</div>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align:top"><jsp:include
							page="/WEB-INF/views/client/main/con_menu3.jsp" /></td>
				</tr>						
			</table>		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>

</body>
</html>