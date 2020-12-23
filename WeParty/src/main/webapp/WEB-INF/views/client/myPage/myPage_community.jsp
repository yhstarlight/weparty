<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 커뮤니티 관리</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<style type="text/css">
.comm {font-weight:bold;}

a { color: gray; text-decoration: none;}

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
						<div class="l" style="margin-top:20px; width:672px; height:max-height; margin-left:20px; padding: 0 50px 50px 50px">
							<div style="margin-top:50px; font-size:24px; width:672px; text-align:left; color:#6BC7BF">
							<b>커뮤니티 관리</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<table class="comTable" style="width:650px">
								<tr>
									<th style="width:150px;">게시판</th>
									<th style="width:450px;">게시글 제목</th>
									<th style="width:100px;">조회수</th>
								</tr>
								<c:forEach var="list" items="${allList}">
									<tr>
										<td>${list.board_type}</td>
										<c:if test="${list.board_type eq '자유 게시판'}">
										<td style="text-align: left; padding-left:10px;">
										<a href="/community/freeboard_content.do?free_board_no=${list.board_no}">${list.board_title }
										<c:if test="${list.board_reply_cnt != 0}">
										(${list.board_reply_cnt})
										</c:if></a></td>
										</c:if>
										<c:if test="${list.board_type eq '정보 나눔터' }">
										<td style="text-align: left; padding-left:10px;">
										<a href="/community/infoboard_content.do?info_board_no=${list.board_no}">${list.board_title }
										<c:if test="${list.board_reply_cnt != 0}">
										(${list.board_reply_cnt})
										</c:if></a></td>
										</c:if>
										<td>${list.board_hit }</td>
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