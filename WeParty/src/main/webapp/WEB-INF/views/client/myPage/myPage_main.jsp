<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 마이페이지</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<style type="text/css">
ul, li {padding:0; margin-left:10px;}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td rowspan="3">
						<div class="l" style="display:table; width:722px; height:max-height; margin-left:20px; padding-left:50px; padding-bottom:50px;">
							<div style="margin-top:50px; font-size:24px; width:672px; text-align:left; color:#6BC7BF">
							<b>마이 페이지</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<div class="l" style="width:300px;height:max-height; float:left; padding:20px; font-size:14px; margin-right:20px">
							<span style="font-size:16px; margin-left:115px;"><b>회원 정보</b></span>
							<br><br>
							아이디 : <hr>
							닉네임 : <hr>
							이름 : <hr>
							이메일 : <hr>
							나이 : <hr>
							성별 : <hr>
							관심 분야 :
							</div>
							<div class="l" style="width:290px; height: max-height; float:left; font-size:14px; padding:20px;">
							<span style="font-size:16px; margin-left:115px;"><b>알림판</b></span>
							<br><br>
							<ul>
								<li>"첫번째 게시글입니다"에 댓글이 달렸습니다.</li>
							</ul>
						</div>
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