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
							<table class="comTable" style="width:650px">
								<tr>
									<th style="width:150px">유형</th>
									<th style="width:400px;">제목</th>
									<th style="width:100px;">상태</th>
								</tr>
								<c:forEach var="list" items="${questionList}" >
									<tr>
										<td>${list.question_type}</td>
										<td style="text-align: left; padding-left:10px; padding-right:10px;">
										<a href="/mypage/QA_content.do?no=${list.question_no}">${list.question_title }</a></td>
										<c:if test="${list.question_state eq 'n'}">
											<td>대기중</td>
										</c:if>
										<c:if test="${list.question_state eq 'y' }">
											<td style="color:#6BC7BF; font-weight: bold;">답변 완료</td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
							<table style="margin:auto; font-size:14px; margin-top:5px;">
								<tr>
									<td colspan="5">
									<c:if test="${page <= 1 }">
									<&nbsp;
									</c:if>
									
									<c:if test="${page >1 }">
									<a class="page" href="/mypage/myPage_QA.do?page=${page-1 }"><</a>
									&nbsp;
									</c:if>
	
									<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
									<c:if test="${a ==page }">
										<b>${a }</b>&nbsp;
									</c:if>
									<c:if test="${a != page }">
									<a class="page" href="/mypage/myPage_QA.do?page=${a }">${a}</a>
									&nbsp;
									</c:if>
									</c:forEach>
									
									<c:if test="${page >= maxpage }">
									>
									</c:if>
									<c:if test="${page < maxpage }">
									<a class="page" href="/mypage/myPage_QA.do?page=${page+1 }">></a>
									</c:if>
									</td>
								</tr>
							</table>		
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