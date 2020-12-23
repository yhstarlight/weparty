<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style type="text/css">
.text3{font-size:14px; font-weight: bold; color:#6BC7BF; margin:0px;}
.text2{font-size:12px; color:gray; margin-top:10px}

 a.m, 
 a.m:link { color: gray; text-decoration: none;}
 a.m:visited { color: gray; text-decoration: none;}
 a.m:hover { color: gray; font-weight:bold; text-decoration: none;}
 a.m:active { color: gray; text-decoration: none; }
 a.m { line-height:200% }
 
</style>
</head>
<body>
	<div
		style="border: 1px solid; border-color: #6BC7BF; width: 185px; 
		height: 230px; margin-top: 20px; border-radius: 10px 10px 10px 10px; 
		float:left; padding: 15px;">
		
		<p class="text3">분야</p>
		<hr style="border:solid 0.5px #6BC7BF">
		<p class="text2">
			<a class="m al" href="/contest/contest_list.do?field=all">전체</a><br>
			<a class="m w" href="/contest/contest_list.do?field=web">웹/모바일</a><br>
			<a class="m s" href="/contest/contest_list.do?field=scenario">글/문학</a><br>
			<a class="m p" href="/contest/contest_list.do?field=ucc">사진/UCC</a><br>
			<a class="m c" href="/contest/contest_list.do?field=science">과학</a><br>
			<a class="m g" href="/contest/contest_list.do?field=game">게임</a><br>
			<a class="m r" href="/contest/contest_list.do?field=architecture">건축</a><br>
			<a class="m t" href="/contest/contest_list.do?field=supporters">서포터즈/대외활동</a>
		</p>
	</div>
</body>
</html>