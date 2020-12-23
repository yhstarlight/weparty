<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 답변관리</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/table.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<style>
.Notice {background:#6BC7BF}
</style>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">공지사항</span><br>
	<div class="MainDiv">
	
	<form action="/notice/list.mdo">
	<table style="margin-bottom: 5px">
		<tr>
			<td style="width:300px; text-align: left">
			&nbsp;
			<button type="button" class="approve" style="width:50px; height:35px" onclick="location.href='/notice/insert.mdo'">작성</button></td>
			<td style="width:538px; text-align: right">
			<input type="text" name="searchKeyword" style="height: 22px; padding-top:2px"> 
			<button class="classic" style="height: 30px;">검색</button>
			</td>
		</tr>
	</table>
	</form>
	<table style="margin-top:5px" class="MainTable">
		<tr>
			<th style="width:600px;">제목</th>
			<th style="width:215px;">등록일</th>
		</tr>
		<c:forEach var="l" items="${list }">
			<tr class="list" onclick="location.href='/notice/content.mdo?notice_no=${l.notice_no}'">
				<td>${l.notice_title }</td>
				<td>${l.notice_regdate }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2" class="noneLine" style="text-align: right">
			
			</td>
		</tr>
		<tr>
			<td colspan="2" class="noneLine">
			<div class="PageNum">
			<c:if test="${page <= 1 }">
				<&nbsp;
				</c:if>
				
				<c:if test="${page >1 }">
				<a class="page" href="/contest/allList.mdo?page=${page-1 }"><</a>
				&nbsp;
				</c:if>
	
				<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
				<c:if test="${a ==page }">
					<b>${a }</b>&nbsp;
				</c:if>
				<c:if test="${a != page }">
				<a class="page" href="/contest/allList.mdo?page=${a }">${a}</a>
				&nbsp;
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage }">
				>
				</c:if>
				<c:if test="${page < maxpage }">
				<a class="page" href="/contest/allList.mdo?page=${page+1 }">></a>
			</c:if>
			</div>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>