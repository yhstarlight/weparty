<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="/resources/css/client/header.css" rel="stylesheet" />

</head>
<body>
	<div style="position: relative; text-align:center; margin-top:15px">
		<form action="/contest/contest_list.do">
		<div>
		<a href="/home.do">
		<img style="margin-top:25px; margin-bottom:25px;" src="/resources/img/wp.png"></a>
		<img style="margin-top:25px; margin-bottom:25px;" src="/resources/img/client/search.png">
		</div>
		<div style="left:50%; transform: translate(-50%,-50%); top:85px; position: absolute">
		<input style="height:40px; width:450px; border:0; font-size:18px" type="text" name="searchKeyword" />
		<input type="hidden" value="all" name="field">
		</div>
		</form>
	</div>
	<div class="menubar" style="">
		<a class="t" href="/contest/contest_list.do?field=all">공모전</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="t" href="/contest/contest_register.do">공모전 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="t" href="/notice/notice_list.do">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="t" href="/community/freeboard_list.do">커뮤니티</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="t" href="/QA/send_question.do">고객센터</a>
	</div>
</body>
</html>