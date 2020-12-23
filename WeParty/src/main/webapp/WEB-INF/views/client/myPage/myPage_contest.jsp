<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 공모전 관리</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<style type="text/css">
.contest {font-weight:bold;}
a {color:gray; text-decoration: none;}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td rowspan="3" style="vertical-align: top;">
						<div class="l" style="margin-top:20px; width:722px; height:max-height; margin-left:20px; padding-left:50px; padding-bottom:50px;">
							<div style="margin-top:50px; font-size:24px; width:672px; text-align:left; color:#6BC7BF">
							<b>공모전 관리</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<table class="comTable" style="width:650px">
								<tr>
									<th style="width:120px;">분야</th>
									<th style="width:350px;">공모전 이름</th>
									<th style="width:80px;">승인 여부</th>
								</tr>
							<c:forEach var="list" items="${allList}">
									<tr>
										<td>${list.all_field}</td>
										<c:if test="${list.all_type eq '대기'}">
										<td style="text-align: left; padding-left:10px;">
										<a href="/mypage/myPage_contest_content.do?all_no=${list.all_no}&type=${list.all_type}">${list.all_title }</a></td>
										</c:if>
										<c:if test="${list.all_type eq '승인' }">
										<td style="text-align: left; padding-left:10px;">
										<a href="/contest/contest_content.do?contest_no=${list.all_no}">${list.all_title }</a></td>
										</c:if>
										<c:if test="${list.all_type eq '취소' }">
										<td style="text-align: left; padding-left:10px;">
										<a href="/mypage/myPage_contest_content.do?all_no=${list.all_no}&type=${list.all_type}">${list.all_title }</a></td>
										</c:if>
										<td>
										<c:if test="${list.all_type eq '승인'}">
										<span style="color:#6BC7BF">승인</span>
										</c:if>
										<c:if test="${list.all_type eq '취소'}">
										<span style="color:#EBA5AE">취소</span>
										</c:if>
										<c:if test="${list.all_type eq '대기'}">
										<span>대기</span>
										</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
							<table style="margin:auto; font-size:14px; margin-top:5px;">
								<tr>
									<td colspan=3>
									<c:if test="${page <= 1 }">
									<&nbsp;
									</c:if>
									
									<c:if test="${page >1 }">
									<a class="page" href="/community/freeboard_list.do?page=${page-1 }"><</a>
									&nbsp;
									</c:if>
	
									<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
									<c:if test="${a ==page }">
										<b>${a }</b>&nbsp;
									</c:if>
									<c:if test="${a != page }">
									<a class="page" href="/community/freeboard_list.do?page=${a }">${a}</a>
									&nbsp;
									</c:if>
									</c:forEach>
									
									<c:if test="${page >= maxpage }">
									>
									</c:if>
									<c:if test="${page < maxpage }">
									<a class="page" href="/community/freeboard_list.do?page=${page+1 }">></a>
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