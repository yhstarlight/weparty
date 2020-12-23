<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 공모전 관리</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/table.css" rel="stylesheet">
<style>
.Contest {background:#6BC7BF}
</style>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">공모전</span><br>
	<div class="MainDiv">
	<c:if test="${type eq 'all' }">
	<a href="/contest/allList.mdo"><img src="/resources/img/admin/all_click.png"></a>
	</c:if>
	<c:if test="${type ne 'all' }">
	<a href="/contest/allList.mdo"><img src="/resources/img/admin/all.png"></a>
	</c:if>
	<c:if test="${type eq 'approve' }">
	<a href="/contest/approveList.mdo"><img src="/resources/img/admin/contest_approve_click.png"></a>
	</c:if>
	<c:if test="${type ne 'approve' }">
	<a href="/contest/approveList.mdo"><img src="/resources/img/admin/contest_approve.png"></a>
	</c:if>
	<c:if test="${type eq 'wait' }">
	<a href="/contest/waitList.mdo"><img src="/resources/img/admin/wait_click.png"></a>
	</c:if>
	<c:if test="${type ne 'wait' }">
	<a href="/contest/waitList.mdo"><img src="/resources/img/admin/wait.png"></a>
	</c:if>
	<c:if test="${type eq 'cancel' }">
	<a href="/contest/cancelList.mdo"><img src="/resources/img/admin/contest_cancel_click.png"></a>
	</c:if>
	<c:if test="${type ne 'cancel' }">
	<a href="/contest/cancelList.mdo"><img src="/resources/img/admin/contest_cancel.png"></a>
	</c:if>
	<table class="MainTable">
		<tr>
			<th style="width:15%">분야</th>
			<th style="width:40%">공모전 이름</th>
			<th style="width:20%">접수 기간</th>
			<th style="width:15%">상태</th>
		</tr>
		<c:forEach var="l" items="${list}">
			<c:if test="${type eq 'all'}">
				<c:choose>
					<c:when test="${l.all_type eq '승인' }">
					<tr class="list" onclick="location.href='/contest/approve_content.mdo?approve_no=${l.all_no}'">
					</c:when>
					<c:when test="${l.all_type eq '대기' }">
					<tr class="list" onclick="location.href='/contest/wait_content.mdo?wait_no=${l.all_no}'">
					</c:when>
					<c:when test="${l.all_type eq '취소' }">
					<tr class="list" onclick="location.href='/contest/cancel_content.mdo?cancel_no=${l.all_no}'">
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
			</c:if>
			<c:if test="${type eq 'approve'}">
				<tr class="list" onclick="location.href='/contest/approve_content.mdo?approve_no=${l.approve_no}'">
				<td>${l.approve_field}</td>
				<td>${l.approve_title}</td>
				<td>20${l.approve_startdate} ~ 20${l.approve_enddate}</td>
				<td><span style="color:#6BC7BF">승인</span></td>
			</tr>
			</c:if>
			<c:if test="${type eq 'wait' }">
				<tr class="list" onclick="location.href='/contest/wait_content.mdo?wait_no=${l.wait_no}'">
				<td>${l.wait_field}</td>
				<td>${l.wait_title}</td>
				<td>20${l.wait_startdate} ~ 20${l.wait_enddate}</td>
				<td>대기</td>
			</tr>
			</c:if>
			<c:if test="${type eq 'cancel'}">
				<tr class="list" onclick="location.href='/contest/cancel_content.mdo?cancel_no=${l.cancel_no}'">
				<td>${l.cancel_field}</td>
				<td>${l.cancel_title}</td>
				<td>20${l.cancel_startdate} ~ 20${l.cancel_enddate}</td>
				<td><span style="color:#EBA5AE">취소</span></td>
			</tr>
			</c:if>
		</c:forEach>
		<tr>
			<td colspan="4" class="noneLine">
			<div class="PageNum">
			<c:if test="${page <= 1 }">
				<&nbsp;
				</c:if>
				
				<c:if test="${page >1 }">
					<c:if test="${type eq 'all' }">
						<a class="page" href="/contest/allList.mdo?page=${page-1 }"><</a>&nbsp;
					</c:if>
					<c:if test="${type eq 'approve' }">
						<a class="page" href="/contest/approveList.mdo?page=${page-1 }"><</a>&nbsp;
					</c:if>
					<c:if test="${type eq 'wait' }">
						<a class="page" href="/contest/waitList.mdo?page=${page-1 }"><</a>&nbsp;
					</c:if>
					<c:if test="${type eq 'cancel' }">
						<a class="page" href="/contest/cancelList.mdo?page=${page-1 }"><</a>&nbsp;
					</c:if>
				</c:if>
	
				<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
				<c:if test="${a == page }">
					<b>${a }</b>&nbsp;
				</c:if>
				<c:if test="${a != page }">
					<c:if test="${type eq 'all' }">
						<a class="page" href="/contest/allList.mdo?page=${a }">${a}</a>&nbsp;
					</c:if>
					<c:if test="${type eq 'approve' }">
						<a class="page" href="/contest/approveList.mdo?page=${a }">${a}</a>&nbsp;
					</c:if>
					<c:if test="${type eq 'wait' }">
						<a class="page" href="/contest/waitList.mdo?page=${a }">${a}</a>&nbsp;
					</c:if>
					<c:if test="${type eq 'cancel' }">
						<a class="page" href="/contest/cancelList.mdo?page=${a }">${a}</a>&nbsp;
					</c:if>
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage }">
				>
				</c:if>
				<c:if test="${page < maxpage }">
					<c:if test="${type eq 'all' }">
						<a class="page" href="/contest/allList.mdo?page=${page+1 }">></a>
					</c:if>
					<c:if test="${type eq 'approve' }">
						<a class="page" href="/contest/approveList.mdo?page=${page+1 }">></a>
					</c:if>
					<c:if test="${type eq 'wait' }">
						<a class="page" href="/contest/waitList.mdo?page=${page+1 }">></a>
					</c:if>
					<c:if test="${type eq 'cancel' }">
						<a class="page" href="/contest/cancelList.mdo?page=${page+1 }">></a>
					</c:if>
			</c:if>
			</div>
			</td>
		</tr>
	</table>
	</div>
	</div>
</body>
</html>