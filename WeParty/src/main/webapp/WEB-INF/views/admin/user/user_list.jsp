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
.User {background:#6BC7BF}
</style>
<script>
function UserBan(id){
	var user_id=id;
	if(confirm('해당 회원을 활동 정지 시키겠습니까?')){
		alert('활동 정지 처리되었습니다.');
		location.href="/user/userBan.mdo?user_id="+user_id;
	}
}

function UserBanDel(id){
	var user_id=id;
	if(confirm('해당 회원의 활동 정지를 취소 시키겠습니까?')){
		alert('활동 정치 취소 처리되었습니다.');
		location.href="/user/userBanDel.mdo?user_id="+user_id;
	}
}
</script>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">회원 관리</span><br>
	<div class="MainDiv">
	
	<div style="width:1280px; text-align: right;">
	<form action="/user/list.mdo">
	<select name="searchCondition" style="height: 30px;">
		<option value="id">아이디</option>
		<option value="name">이름</option>
		<option value="nick">닉네임</option>
		<option value="email">이메일</option>
	</select>
	<input name="searchKeyword" style="height: 25px; width:200px;" type="text">
	<button type="submit" class="classic" style="width: 50px; height: 30px;">검색</button>
	</form>
	</div>
	
	<table style="margin-top:10px" class="MainTable">
		<tr>
			<th style="width:130px">아이디</th>
			<th style="width:130px">이름</th>
			<th style="width:130px">닉네임</th>
			<th style="width:250px">이메일</th>
			<th style="width:200px">가입 날짜</th>
			<th style="width:250px">활동</th>
			<th style="width:100px">상태</th>		
		</tr>
		<c:forEach items="${list }" var="l">
			<tr class="list">
				<td>${l.user_id }</td>
				<td>${l.user_name}</td>
				<td>${l.user_nick }</td>
				<td>${l.user_email }</td>
				<td>${l.user_regdate }</td>
				<td><button onclick="location.href='/user/contest.mdo?id=${l.user_id}'">공모전</button>
				<button onclick="location.href='/user/community.mdo?id=${l.user_id}'">커뮤니티</button>
				<button onclick="location.href='/user/reply.mdo?id=${l.user_id}'">댓글</button></td>
				<c:if test="${l.user_ban eq 'n'.charAt(0) }">
					<td><button class="approve" onclick="UserBan('${l.user_id}');">활동 중</button></td>				
				</c:if>
				<c:if test="${l.user_ban eq 'y'.charAt(0) }">
					<td><button class="cancel" onclick="UserBanDel('${l.user_id}');">활동 정지</button></td>				
				</c:if>
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