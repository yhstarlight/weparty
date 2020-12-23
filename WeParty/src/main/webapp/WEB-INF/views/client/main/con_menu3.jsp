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
		height: auto; margin-top: 20px; border-radius: 10px 10px 10px 10px; 
		float:left; padding: 15px 15px 0px 15px;">
		
		<p class="text3">마이 페이지</p>
		<hr style="border:solid 0.5px #6BC7BF">
		<p class="text2">	
			<a>작성 글 관리</a><br>
			<a class="m contest" href="/mypage/myPage_contest.do">- 공모전</a><br>
			<a class="m comm" href="/mypage/myPage_community.do">- 커뮤니티</a><br>
			<a class="m qa" href="/mypage/myPage_QA.do">Q&A</a><br>
			<a class="m edit" href="/mypage/myPage_edit.do">회원 정보 수정</a><br>
			<a class="m del" href="/mypage/myPage_del.do">회원 탈퇴</a><br>
		</p>
	</div>
</body>
</html>