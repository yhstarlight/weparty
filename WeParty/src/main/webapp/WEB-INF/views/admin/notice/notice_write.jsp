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
input:focus {outline:none;}
textarea:focus {outline:none;}
.text{ font-family: sans-serif; }
</style>
<script>
 function insertCheck(){
	if($("#title").val()==""){
		alert("제목을 입력해주세요.");
		return false;
	} else if($("#content").val()==""){
		alert("내용을 입력해주세요.");
		return false;
	} else {
		if(confirm('공지사항을 작성하시겠습니까?')){
			 alert('작성되었습니다.');
			 return true;
		 }
		return false;
	}
 }
</script>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">공지사항</span><br>
	<div class="MainDiv">
	<span>&nbsp;작성</span>
	<form action="/notice/insert_success.mdo" enctype="multipart/form-data" method="post" onsubmit="return insertCheck();">
	<table style="margin-top:10px" class="ContentTable2">
		<tr>
			<th width="150px">제목</th>
			<td width="600px"><input type="text" name="notice_title" id="title" style="width:580px; border: 0"></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td><input type="file" name="file"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="text" cols="82" rows="20" style="border: 0;" name="notice_content" id="content"></textarea></td>
		</tr>
	</table>
	<div>
		<button class="approve" style="margin-left:360px; width:50px;">작성</button>
		<button style="width:50px;" onclick="history.back(-1)"> 뒤로</button>
	</div>
	</form>
</div>
</div>
</body>
</html>