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
 function deleteNotice(no){
	 if(confirm('해당 공지사항을 삭제하시겠습니까?')){
		alert('삭제되었습니다.');
		location.href="/notice/delete.mdo?notice_no="+no;
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
	<span>&nbsp;상세 정보</span>
	<table style="margin-top:10px" class="ContentTable2">
		<tr>
			<th width="150px">제목</th>
			<td class="content" width="600px">${vo.notice_title}</td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<c:if test="${empty vo.notice_file}">
			<td></td>
			</c:if>
			<c:if test="${!empty vo.notice_file}">
			<td class="content"><a href="/notice/downLoadFile.mdo?notice_no=${vo.notice_no}">${vo.notice_file_origin }</a></td>
			</c:if>
		</tr>
		<tr>
			<th>내용</th>
			<td class="content" height="400px">${vo.notice_content}</td>
		</tr>
	</table>
	<div>
		<button class="approve" style="margin-left:330px; width:50px;" onclick="location.href='/notice/edit.mdo?notice_no=${vo.notice_no}'">수정</button>
		<button class="cancel" style="width:50px;" onclick="deleteNotice(${vo.notice_no})"> 삭제</button>
		<button style="width:50px;" onclick="history.back(-1)"> 뒤로</button>
	</div>
</div>
</div>
</body>
</html>