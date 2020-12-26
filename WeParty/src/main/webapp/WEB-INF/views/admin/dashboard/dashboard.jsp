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
<script src="/resources/js/jquery.js"></script>
<style>
.DashBoard {background:#6BC7BF}
.dashboard_img {border-radius: 10px}
.img_div {float:left; margin-right:5px; width:250px; height: 150px; border-radius: 10px}
.wrap{margin:10px; float:left}
.img_content{padding:20px}
.count {font-size:32px; color:white; font-weight: bold}
.count_name {font-size: 15px; color:white}
.count_field {font-size: 14px; color:white}
.detail_div {margin-top:20px; text-align: center}
.detail_span {color:white; font-size: 14px}
.MainTable {font-size:14px;}
.line2 {width:500px;margin:0;border:3px solid #ECECEC;height:320px}
.line3 {width:1020px;margin:0;border:3px solid #ECECEC;height:320px}
.more {display: inline-block; text-align: right; font-weight: bold; color:#6BC7BF}
td {text-align: center !important;}
.verticalM td{vertical-align: middle !important;}
</style>
</head>
<body>
	
	<c:if test="${empty mlogin_id}">
		<script>
			history.back(-1);
		</script>
		</c:if>
		
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">대시보드</span><br>
	<div class="MainDiv" style="overflow: hidden;">
	
	<div class="wrap">
	<div class="img_div" style="background-image: url('/resources/img/admin/contest_dashboard.png')">
		<div class="img_content">
			<span class="count">${contestTotalCount}</span> <span class="count_name">개</span><br><br>
			<span class="count_field">공모전</span>
			<div class="detail_div">
				<a class="detail_span" href="/contest/allList.mdo">자세히 ></a>
			</div>
		</div> 
		
	</div>
	<div class="img_div" style="background-image: url('/resources/img/admin/user_dashboard.png')">
		<div class="img_content">
			<span class="count">${userTotalCount}</span> <span class="count_name">명</span><br><br>
			<span class="count_field">회원</span>
			<div class="detail_div">
				<a class="detail_span" href="/user/list.mdo">자세히 ></a>
			</div>
		</div> 
	</div>
	<div class="img_div" style="background-image: url('/resources/img/admin/qa_dashboard.png')">
		<div class="img_content">
			<span class="count">${waitQuestionTotalCount}</span> <span class="count_name">개</span><br><br>
			<span class="count_field">문의</span>
			<div class="detail_div">
				<a class="detail_span" href="QA/allList.mdo">자세히 ></a>
			</div>
		</div> 
	</div>
	<div class="img_div" style="background-image: url('/resources/img/admin/visit_dashboard.png')">
		<div class="img_content">
			<span class="count">${visitTotalCount}</span> <span class="count_name">번</span><br><br>
			<span class="count_field">방문</span>
			<div class="detail_div">
				<a class="detail_span" href="/chart.mdo">자세히 ></a>
			</div>
		</div> 
	</div>
	</div>
	<div class="wrap" style="clear:both;">
		<table class="ContentTable2 line2">
			<tr height="20px">
				<td>
					<span>대기중인 공모전 ${waitCountestTotalCount}개</span>	
					<a href="/contest/waitList.mdo" class="more" style="width:320px; ">more</a>
				</td>
			</tr>
			<tr>
				<td>
					<table class="MainTable" style="margin:5px 5px 5px 0">
						<tr>
							<th style="width:18%">분야</th>
							<th style="width:40%">공모전 이름</th>
						</tr>
						<c:forEach var="l" items="${waitContestList}">
							<tr class="list" onclick="location.href='/contest/wait_content.mdo?wait_no=${l.wait_no}'">
								<td>${l.wait_field}</td>
								<td>${l.wait_title}</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div class="wrap">
		<table class="ContentTable2 line2">
			<tr height="20px">
				<td>		
					<span>신규 문의 ${waitQuestionTotalCount}개</span>	
					<a href="/QA/waitList.mdo"  class="more" style="width:367px; ">more</a>
				</td>
			</tr>
			<tr>
				<td>
					<table class="MainTable" style="margin:5px 5px 5px 0">
						<tr>
							<th style="width:150px">문의 유형</th>
							<th style="width:475px">제목</th>
						</tr>
						<c:forEach items="${questionList}" var="l">
							<tr class="list" onclick="location.href='/QA/content.mdo?question_no=${l.question_no}&state=wait'">
								<td>${l.question_type}</td>
								<td>${l.question_title}</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div class="wrap" style="clear:both">
		<table class="ContentTable2 line3">
			<tr height="20px">
				<td>		
					<span>최근 승인된 공모전</span>	
					<a href="/contest/approveList.mdo"  class="more" style="width:847px; ">more</a>
				</td>
			</tr>
			<tr>
				<td>
					<table class="MainTable verticalM" style="margin:5px 5px 5px 0;">
						<tr>
							<th width=200px>포스터</th>
							<th width=150px>분야</th>
							<th width=450px>공모전 이름</th>
							<th width=200px>접수 기간</th>
						</tr>
							<c:forEach var="l" items="${approveContestList}">
							<tr class="list" onclick="location.href='/contest/approve_content.mdo?approve_no=${l.approve_no}'">
								<td><img src="/resources${l.approve_poster}" style="width:150px; height:180px"></td>
								<td>${l.approve_field}</td>
								<td>${l.approve_title}</td>
								<td>20${l.approve_startdate} ~ 20${l.approve_enddate}</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
</div>
</body>
</html>