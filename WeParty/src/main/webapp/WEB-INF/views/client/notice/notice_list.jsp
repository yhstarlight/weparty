<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/client/basic.css" rel="stylesheet" />
<link href="../resources/css/client/board_list.css" rel="stylesheet" />
</head>
<body>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td rowspan="3">
						<div class="l" style="margin-top:21px; width:722px; height:max-height; margin-left:20px; padding-left:50px; padding-bottom:50px;">
							<div style="margin-top:50px; font-size:24px; width:672px; text-align:left; color:#6BC7BF">
							<b>공지사항</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<form>
							<table style="margin-left:405px;">
								<tr>
									<td>
									<input style="height:23px; width:200px;" type="text" name="searchKeyword">
									</td>
									<td>
									<button style="height:28px; width:40px;" onclick="location.href='/community/freeboard_list.do'">검색</button>
									</td>
								</tr>
							</table>
							</form>
							<table class="comTable" style="width:652px; margin-top:5px">
								<tr>
									<th style="width:30px;"></th>
									<th>제목</th>
									<th style="width:50px;">조회수</th>
								</tr>
								<c:forEach items="${list}" var="l">
									<tr>
										<td>${l.notice_no}</td>
										<td class="title"><a class="name" href="/notice/notice_content.do?notice_no=${l.notice_no}">${l.notice_title}</a></td>
										<td>${l.notice_hit}</td>
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
					<td rowspan="2" style="vertical-align:top"> </td>
				</tr>						
			</table>		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>

</body>
</html>

