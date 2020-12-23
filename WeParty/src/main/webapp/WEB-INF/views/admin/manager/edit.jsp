<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 권한 수정</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<script>
 function editSuccess(){
	 window.close();
	 return true;
 }
</script>
</head>
<body onresize="parent.resizeTo(250px,252px)" onload="parent.resizeTo(250px,252px)">
<div style="background-color: #EFF4F4; padding:20px">
<span style="font-size: 14px">${vo.manager_id}</span><br>
<span style="font-size: 16px; font-weight: bold">관리자 권한 수정</span>
<form action="/manager/edit_success.mdo">
<div style="margin-top:10px; border-radius: 5px; background-color: white;
	color: gray; padding: 5px; font-size: 14px; margin-bottom: 15px" >
<div>
<input type="hidden" name="manager_id" value="${vo.manager_id}">
<table>
	<tr>
		<td width="90px" height="30px">
		<c:choose>
		<c:when test="${fn:contains(vo.manager_authority,'1')}">
		<input type="checkbox" checked="checked" name="authorityList" value="1">공지사항
		</c:when>
		<c:otherwise>
		<input type="checkbox" id="notice" name="authorityList" value="1">공지사항
		</c:otherwise>
		</c:choose>
		</td>
		<td width="90px" height="30px">
		<c:choose>
		<c:when test="${fn:contains(vo.manager_authority,'2')}">
		<input type="checkbox" checked="checked" name="authorityList" value="2">공모전
		</c:when>
		<c:otherwise>
		<input type="checkbox" name="authorityList" value="2">공모전
		</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td width="90px" height="30px">
		<c:choose>
		<c:when test="${fn:contains(vo.manager_authority,'3')}">
		<input type="checkbox" checked="checked" name="authorityList" value="3">고객센터
		</c:when>
		<c:otherwise>
		<input type="checkbox" name="authorityList" value="3">고객센터
		</c:otherwise>
		</c:choose>
		</td>
		<td width="90px" height="30px">
		<c:choose>
		<c:when test="${fn:contains(vo.manager_authority,'4')}">
		<input type="checkbox" checked="checked" name="authorityList" value="4">회원관리
		</c:when>
		<c:otherwise>
		<input type="checkbox" name="authorityList" value="4">회원관리
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
	<tr>
		<td width="90px" height="30px">
		<c:choose>
		<c:when test="${fn:contains(vo.manager_authority,'5')}">
		<input type="checkbox" checked="checked" name="authorityList" value="5">화면
		</c:when>
		<c:otherwise>
		<input type="checkbox" name="authorityList" value="5">화면
		</c:otherwise>
		</c:choose>
		</td>
		<td></td>
	</tr>
</table>
</div>
</div>
<div style="text-align: center;">
<button style="height:30px">수정</button>
</div>
</form>
</div>
</body>
</html>