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
<style>
.QA {background:#6BC7BF}
.qa {font-weight: bold;}
</style>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">고객센터</span><br>
	<div class="MainDiv">
	<div style="margin-left:5px; margin-bottom: 15px"><a class="qa" href="/QA/allList.mdo">답변 관리</a> ｜ 
	<a href="/QA/typeList.mdo">문의 유형 관리</a></div>
	
	<c:if test="${state eq 'all'}">
	<a href="/QA/allList.mdo"><img src="/resources/img/admin/all_click.png"></a>
	</c:if>
	<c:if test="${state ne 'all'}">
	<a href="/QA/allList.mdo"><img src="/resources/img/admin/all.png"></a>
	</c:if>
	<c:if test="${state eq 'y'}">
	<a href="/QA/answerList.mdo"><img src="/resources/img/admin/answer_ok_click.png"></a>
	</c:if>
	<c:if test="${state ne 'y'}">
	<a href="/QA/answerList.mdo"><img src="/resources/img/admin/answer_ok.png"></a>
	</c:if>
	<c:if test="${state eq 'n'}">
	<a href="/QA/waitList.mdo"><img src="/resources/img/admin/wait_click.png"></a>
	</c:if>
	<c:if test="${state ne 'n'}">
	<a href="/QA/waitList.mdo"><img src="/resources/img/admin/wait.png"></a>
	</c:if>
	<table class="MainTable">
		<tr>
			<th style="width:150px">문의 유형</th>
			<th style="width:475px">제목</th>
			<th style="width:150px">상태</th>
		</tr>
		<c:forEach items="${list}" var="l">
			<tr class="list" onclick="location.href='/QA/content.mdo?question_no=${l.question_no}&state=${l.question_state}'">
				<td>${l.question_type}</td>
				<td>${l.question_title}</td>
				<c:if test="${l.question_state eq 'n'}">
				<td>대기</td>
				</c:if>	
				<c:if test="${l.question_state eq 'y'}">
				<td><span style="color:#6BC7BF">답변 완료</span></td>
				</c:if>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" class="noneLine">
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