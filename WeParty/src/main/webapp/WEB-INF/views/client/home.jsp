<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>위파티!</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<style>
 a.notice{ color: gray; text-decoration: none;}
 a.notice:hover{font-weight: bold}
 
 table.new_contest th { background-color: #6BC7BF; color:white; }
 table.new_contest {text-align: center; border-spacing: 1px;}
 table.new_contest td {border-bottom: 1px solid #BBBBBB; height: 50px}
 table.new_contest tr:hover {background-color: #E6EFEB}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px; line-height: 21px;"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>

					<td rowspan="3">
						<div
						style="width: 350; height: 490px; margin-top: 20px;
						margin-top:20px; margin-left:20px">
						<jsp:include page="/WEB-INF/views/client/main/slideshow.jsp"/>
						</div>
					</td>
					<td rowspan="3">
						<div
						style="width: 400; height: 490px; margin-top: 20px; margin-left:20px">
							<div style="border:1px solid; border-color: #BBBBBB; height:280px; border-radius: 10px 10px 10px 10px; position:relative">
								<div style="width:150px; height: 50px; position: absolute;
								margin-top:50px; left:50%; transform: translate(-50%,-50%);">
								<img src="/resources/img/client/not.png">
								</div>
								<div style="position:absolute; width:300px; height:150px;
								margin-top:165px; left:50%; transform: translate(-50%,-50%);">
								<c:forEach items="${noticeList}" var="notice_list">
									<div style="margin-bottom: 5px">
									<span style="color:gray; font-size:14px;">
									<a class="notice" href="/notice/notice_content.do?notice_no=${notice_list.notice_no}">· ${notice_list.notice_title}</a>
									</span>
									</div>	
								</c:forEach>							
								</div>
							</div>
							<div style="height:210px; position: relative;">
								<div style="margin-top:20px; position: absolute;">
								<a href="/contest/contest_register.do"><img style="width: 200px; height:180px;" src="/resources/img/client/click1.png"></a></div>
								<div style="margin-top:20px; position: absolute; left:200px;">
								<a href="/contest/contest_list.do?field=all"><img style="width: 200px; height:180px;" src="/resources/img/client/click2.png"></a> </div>
							</div>
						</div>						
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align:top"><jsp:include page="/WEB-INF/views/client/main/con_menu.jsp"/></td>
				</tr>
				<tr>
					
				<tr>
					<td>
					</td>
					<td colspan="2">
						<div style="margin-left:20px; margin-top:20px; margin-bottom:5px; font-weight: bold; font-size:26; color:#6BC7BF">신규 공모전</div>
						<div style="margin-left:20px; width:max-width; height:600px;">
							<table class="new_contest">
								<tr>
									<th width="150px;">분야</th>
									<th width="360px">공모전 이름</th>
									<th width="180px">날짜</th>
									<th width="80px">조회수</th>
								</tr>
								<c:forEach items="${contestList}" var="contest_list">
								<tr onclick="location.href='/contest/contest_content.do?contest_no=${contest_list.approve_no}'">
									<td>${contest_list.approve_field}</td>
									<td>${contest_list.approve_title}</td>
									<td>20${contest_list.approve_startdate} ~ 20${contest_list.approve_enddate}</td>
									<td>${contest_list.approve_hit}</td>
								</tr>
							</c:forEach>
							</table>
						</div>
					</td>
				</tr>
			</table>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"></jsp:include>
</body>
</html>
