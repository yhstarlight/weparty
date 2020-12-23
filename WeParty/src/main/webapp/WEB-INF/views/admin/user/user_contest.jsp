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
<style>
.User {background:#6BC7BF}
</style>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">회원 관리</span><br>
	<div class="MainDiv">
	<div >
	&nbsp;&nbsp;<img style="cursor:pointer; width:18px; height:15px; vertical-align: middle;" onclick="history.back(-1)" src="/resources/img/admin/back.png">
	<span style="vertical-align: middle;">공모전 : ${id}</span>
	</div>
	
	<table style="margin-top:10px" class="MainTable">
		<tr>
			<th style="width:15%">분야</th>
			<th style="width:40%">공모전 이름</th>
			<th style="width:20%">접수 기간</th>
			<th style="width:15%">상태</th>	
		</tr>
			<c:forEach items="${list}" var="l">
			<c:choose>
				<c:when test="${l.all_type eq '승인' }">
				<tr class="list" onclick="window.open('about:black').location.href='/contest/approve_content.mdo?approve_no=${l.all_no}'">
				</c:when>
				<c:when test="${l.all_type eq '대기' }">
				<tr class="list" onclick="window.open('about:black').location.href='/contest/wait_content.mdo?wait_no=${l.all_no}'">
				</c:when>
				<c:when test="${l.all_type eq '취소' }">
				<tr class="list" onclick="window.open('about:black').location.href='/contest/cancel_content.mdo?cancel_no=${l.all_no}'">
				</c:when>
			</c:choose>
				<td>${l.all_field}</td>
				<td>${l.all_title}</td>
				<td>20${l.all_startdate} ~ 20${l.all_enddate}</td>
				<td>
				<c:choose>
					<c:when test="${l.all_type eq '승인' }">
					<span style="color:#6BC7BF">${l.all_type }</span>
					</c:when>
					<c:when test="${l.all_type eq '대기' }">
					<span>${l.all_type }</span>
					</c:when>
					<c:when test="${l.all_type eq '취소' }">
					<span style="color:#EBA5AE">${l.all_type }</span>
					</c:when>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7" class="noneLine">
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