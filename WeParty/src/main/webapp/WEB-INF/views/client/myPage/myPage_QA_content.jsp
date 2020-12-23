<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : Q&A</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<style type="text/css">
.qa {font-weight:bold;}
a {color:gray; text-decoration: none;}
.comTable tr td{padding-left:10px;}
</style>
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
							<b>Q&A</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<table class="comTable" style="width:650px; margin-bottom:10px;">
								<tr>
									<th style="width:130px;">문의 유형</th>
									<td style="text-align: left;">${question.question_type}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td style="text-align: left;">${question.question_title}</td>
								</tr>
								<tr>
									<th>내용</th>
									<td style="text-align: left;">${question.question_content}</td>
								</tr>
								<tr>
									<th colspan="2">답변</th>
								</tr>
								<tr>
									<td colspan="2" style="text-align: left;">${answer}</td>
								</tr>
							</table>
							<div style="text-align: right; padding-right:60px;">
							<button style="width:50px; height:30px" onclick="history.back(-1);">뒤로</button>		
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