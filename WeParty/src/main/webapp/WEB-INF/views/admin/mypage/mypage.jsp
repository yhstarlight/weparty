<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 내 정보</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<script>
var popupX=(window.screen.width/2)-(400/2);
var popupY=(window.screen.height/2)-(400/2);

</script>
<style>
.MyPage {background:#6BC7BF}
</style>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">내 정보</span><br>
	<div class="MainDiv">
	
	<table style="text-align: left; color:gray; margin-left:10px; margin-bottom: 15px">
		<tr>
			<th width=60px; height="50px">아이디</th>
			<td width=80px>${vo.manager_id}</td>
			<th width=80px>비밀번호</th>
			<td><button style="height: 30px" onclick="window.open('/mypage/password_edit.mdo?manager_id=${vo.manager_id}'
			,'managerPasswordEditPop','width=400, height=214, left='+ popupX + ', top='+ popupY);">변경</button></td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${vo.manager_name }</td>
			<th>권한</th>
			<td>
			<c:choose>
			<c:when test="${vo.manager_authority eq 'super'}">
			최고 관리자
			</c:when>
			<c:when test="${fn:contains(vo.manager_authority,'1')}">
				공지사항
					<c:if test="${fn:contains(vo.manager_authority,'2')}">
					, 공모전
					</c:if>
					<c:if test="${fn:contains(vo.manager_authority,'3')}">
					, 고객센터
					</c:if>
					<c:if test="${fn:contains(vo.manager_authority,'4')}">
					, 회원관리
					</c:if>
					<c:if test="${fn:contains(vo.manager_authority,'5')}">
					, 화면
					</c:if>
				</c:when>
				<c:when test="${fn:contains(vo.manager_authority,'2')}">
				공모전
					<c:if test="${fn:contains(vo.manager_authority,'3')}">
					, 고객센터
					</c:if>
					<c:if test="${fn:contains(vo.manager_authority,'4')}">
					, 회원관리
					</c:if>
					<c:if test="${fn:contains(vo.manager_authority,'5')}">
					, 화면
					</c:if>
				</c:when>
				<c:when test="${fn:contains(vo.manager_authority,'3')}">
				고객센터
					<c:if test="${fn:contains(vo.manager_authority,'4')}">
					, 회원관리
					</c:if>
					<c:if test="${fn:contains(vo.manager_authority,'5')}">
					, 화면
					</c:if>
				</c:when>
				<c:when test="${fn:contains(vo.manager_authority,'4')}">
				회원관리
					<c:if test="${fn:contains(vo.manager_authority,'5')}">
					, 화면
					</c:if>
				</c:when>
				<c:otherwise>화면</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>