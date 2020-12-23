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
<link href="/resources/css/admin/table.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<style>
.Manager {background:#6BC7BF}
</style>
<script>
	function deleteManager(manager_id){
		if(confirm('해당 관리자를 삭제하시겠습니까?')){
			alert('삭제 되었습니다.');
			location.href="/manager/delete.mdo?manager_id="+manager_id;
		}
	}
	
	var popupX=(window.screen.width/2)-(250/2);
	var popupY=(window.screen.height/2)-(400/2);
</script>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">관리자</span><br>
	<div class="MainDiv">
	<c:if test="${mlogin_id eq 'super'}">
	<div style="padding-left:10px;"><button style="width:50px; height:35px"class="approve" onclick="location.href='/manager/insert.mdo'">추가</button></div>
	</c:if>
	<table class="MainTable" style="margin-top:5px">
		<tr>
		<th width="130">아이디</th>
		<th width="130">이름</th>
		<th width="350">권한</th>
		<th width="130">생성 날짜</th>
		<c:if test="${mlogin_id eq 'super' }">
		<th width="70"></th>
		<th width="70"></th>
		</c:if>
		</tr>
		<c:forEach var="l" items="${list}">
			<c:if test="${l.manager_id ne 'super' }">
			<tr>
				<td>${l.manager_id}</td>
				<td>${l.manager_name }</td>
				<td>
				<c:choose>
				<c:when test="${fn:contains(l.manager_authority,'1')}">
				공지사항
					<c:if test="${fn:contains(l.manager_authority,'2')}">
					, 공모전
					</c:if>
					<c:if test="${fn:contains(l.manager_authority,'3')}">
					, 고객센터
					</c:if>
					<c:if test="${fn:contains(l.manager_authority,'4')}">
					, 회원관리
					</c:if>
					<c:if test="${fn:contains(l.manager_authority,'5')}">
					, 화면
					</c:if>
				</c:when>
				<c:when test="${fn:contains(l.manager_authority,'2')}">
				공모전
					<c:if test="${fn:contains(l.manager_authority,'3')}">
					, 고객센터
					</c:if>
					<c:if test="${fn:contains(l.manager_authority,'4')}">
					, 회원관리
					</c:if>
					<c:if test="${fn:contains(l.manager_authority,'5')}">
					, 화면
					</c:if>
				</c:when>
				<c:when test="${fn:contains(l.manager_authority,'3')}">
				고객센터
					<c:if test="${fn:contains(l.manager_authority,'4')}">
					, 회원관리
					</c:if>
					<c:if test="${fn:contains(l.manager_authority,'5')}">
					, 화면
					</c:if>
				</c:when>
				<c:when test="${fn:contains(l.manager_authority,'4')}">
				회원관리
					<c:if test="${fn:contains(l.manager_authority,'5')}">
					, 화면
					</c:if>
				</c:when>
				<c:otherwise>화면</c:otherwise>
				</c:choose>
				</td>
				<td>${l.manager_regdate }</td>
				<c:if test="${mlogin_id eq 'super' }">
				<td><button style="width:50px;" onclick="window.open('/manager/edit.mdo?manager_id=${l.manager_id}'
							,'managerEditPop','width=250, height=223, left='+ popupX + ', top='+ popupY);">수정</button></td>
				<td><button style="width:50px;" class="cancel" onclick="deleteManager('${l.manager_id}');">삭제</button></td>
				</c:if>
			</tr>
			</c:if>
		</c:forEach>
	</table>
	
</div>
</div>
</body>
</html>