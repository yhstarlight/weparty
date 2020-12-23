<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function LogoutCheck(){
		if(confirm('로그아웃 하시겠습니까?')){
			alert('로그아웃 되었습니다.');
			location.href="/logout.mdo";
		}
	}
	
	function NoticeAuthorityCheck(){
		if("${mlogin_authority}".indexOf('1') == -1 && "${mlogin_authority}" != "super"){
			alert('해당 권한이 없습니다.');
		} else {
			location.href='/notice/list.mdo';
		}
	}
	
	function ContestAuthorityCheck(){
		if("${mlogin_contest}".indexOf('2') == -1 && "${mlogin_authority}" != "super"){
			alert('해당 권한이 없습니다.');
		} else {
			location.href='/contest/allList.mdo';
		}
	}
	
	function QAAuthorityCheck(){
		if("${mlogin_contest}".indexOf('3') == -1 && "${mlogin_authority}" != "super"){
			alert('해당 권한이 없습니다.');
		} else {
			location.href='/QA/allList.mdo';
		}
	}
	
	function UserAuthorityCheck(){
		if("${mlogin_contest}".indexOf('4') == -1 && "${mlogin_authority}" != "super"){
			alert('해당 권한이 없습니다.');
		} else {
			location.href='/user/list.mdo';
		}
	}
	
	function DisplayAuthorityCheck(){
		if("${mlogin_contest}".indexOf('5') == -1 && "${mlogin_authority}" != "super"){
			alert('해당 권한이 없습니다.');
		} else {
			location.href='/display/main.mdo';
		}
	}
</script>
</head>
<body>
		<div style="margin-left:40px;"><span class="We">W E</span><span class="Party"> P A R T Y</span></div>
		<hr>
		<div class="MenuText DashBoard" onclick="location.href='/dashboard.mdo'"><img src="/resources/img/admin/dashboard.png">&nbsp; 대시보드</div>
		<div class="MenuText Notice" onclick="NoticeAuthorityCheck()"><img src="/resources/img/admin/notice.png">&nbsp; 공지사항</div>
		<div class="MenuText Contest" onclick="ContestAuthorityCheck()"><img src="/resources/img/admin/contest.png">&nbsp; 공모전</div>
		<div class="MenuText QA" onclick="QAAuthorityCheck()"><img src="/resources/img/admin/qa.png">&nbsp; 고객센터</div>
		<div class="MenuText User" onclick="UserAuthorityCheck()"><img src="/resources/img/admin/user.png">&nbsp; 회원 관리</div>
		<div class="MenuText Display" onclick="DisplayAuthorityCheck()"><img src="/resources/img/admin/pc.png">&nbsp; 화면</div>
		<div class="MenuText Chart" onclick="location.href='/chart.mdo'"><img src="/resources/img/admin/graph.png">&nbsp; 통계</div>
		<c:if test="${mlogin_id eq 'super'}">
		<div class="MenuText Manager" onclick="location.href='/manager/list.mdo'"><img src="/resources/img/admin/manager.png">&nbsp; 관리자</div>
		</c:if>
		<div class="MenuText MyPage" onclick="location.href='/mypage.mdo'"><img src="/resources/img/admin/myInfo.png">&nbsp; 내 정보</div>		
		<div class="MenuText" onclick="LogoutCheck()"><img src="/resources/img/admin/logout.png">&nbsp; 로그아웃</div>		
</body>
</html>