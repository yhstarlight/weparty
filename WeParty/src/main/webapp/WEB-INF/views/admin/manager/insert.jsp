<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 내 정보</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/table.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/admin/insert.js"></script>
<style>
.Manager {background:#6BC7BF}
input:focus {outline:none;}
input {border: 0}
</style>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">관리자</span><br>
	<div class="MainDiv">
	<form action="/manager/insert_success.mdo" onsubmit="return registCheck();">
	<table class="MainTable">
		<tr>
			<th width="150">아이디</th>
			<td><input type="text" style="text-align: center" name="manager_id" id="id" ></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" style="text-align: center" name="manager_pw" id="pw"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" style="text-align: center" id="pwCheck"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" style="text-align: center" name="manager_name" id="name"></td>
		</tr>
		<tr>
			<th>권한</th>
			<td>
			<div style="font-size: 14px">
			<table class="classic">
			<tr style="text-align: left">
				<td class="noneLine"><input type="checkbox" name="authorityList" value="1">공지사항</td>
				<td class="noneLine"><input type="checkbox" name="authorityList" value="2">공모전</td>
			</tr>
			<tr style="text-align: left">
				<td class="noneLine"><input type="checkbox" name="authorityList" value="3">고객센터</td>
				<td class="noneLine"><input type="checkbox" name="authorityList" value="4">회원 관리</td>
			</tr>
			<tr style="text-align: left">
				<td class="noneLine"><input type="checkbox" name="authorityList" value="5">화면</td>
				<td class="noneLine"></td>
			</tr>
			</table>
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="noneLine"><button class="approve" style="width:50px; margin-top:10px;">추가</button></td>
		</tr>
	</table>
	</form>
	
</div>
</div>
</body>
</html>