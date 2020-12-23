<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티!</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/contest_content.css" rel="stylesheet" />
</head>
<body>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp" />

	<div style="width: max-width">
		<div style="width: 1050px; margin: 0 auto;">
			<table>
				<tr>
					<td style="height: 95px"><jsp:include
							page="/WEB-INF/views/client/main/login.jsp" /></td>
					<td style="vertical-align: top;" rowspan="3">
						<div class="l"
							style="width: 742px; height: max-height; margin-left: 20px; padding-left: 30px; padding-top: 30px; padding-bottom: 30px;">
							<c:if test="${type eq '대기'}">
							<img
								style="width: 300px; height: 400px; float: left; margin-right: 10px;"
								src="/resources${vo.wait_poster }">
							<div
								style="height: 400px; display: table-cell; vertical-align: middle;">
								<table class="t" style="width: 380px;">
									<tr>
										<th class="title" colspan="2">${vo.wait_title}</th>
									</tr>
									<tr>
										<th class="content">분야</th>
										<td>${vo.wait_field }</td>
									</tr>
									<tr>
										<th class="content">대상자</th>
										<td>${vo.wait_target }</td>
									</tr>
									<tr>
										<th class="content">주최사</th>
										<td>${vo.wait_host }</td>
									</tr>
									<tr>
										<th class="content">홈페이지 주소</th>
										<td>${vo.wait_homepage }</td>
									</tr>
									<tr>
										<th class="content">접수기간</th>
										<td>20${vo.wait_startdate}~ 20${vo.wait_enddate }
										<br>
										<span style="font-weight:bold; color:#EBA5AE; font-size:20px">D-${dday}</span></td>
									</tr>
								</table>
							</div>
							<br> <span
								style="font-size: 22px; font-weight: bold; color: #6BC7BF">상세 내용</span> <br>
							<div style="margin-right:30px;">
							<hr style="border: 1px solid #6BC7BF;">
							${vo.wait_content }
							<br><br>
							<hr>
							</div>
							</c:if>
							<c:if test="${type eq '취소'}">
							<img
								style="width: 300px; height: 400px; float: left; margin-right: 10px;"
								src="/resources${vo.cancel_poster}">
							<div
								style="height: 400px; display: table-cell; vertical-align: middle;">
								<table class="t" style="width: 380px;">
									<tr>
										<th class="title" colspan="2">${vo.cancel_title }</th>
									</tr>
									<tr>
										<th class="content">분야</th>
										<td>${vo.cancel_field }</td>
									</tr>
									<tr>
										<th class="content">대상자</th>
										<td>}${vo.cancel_target }</td>
									</tr>
									<tr>
										<th class="content">주최사</th>
										<td>${vo.cancel_host }</td>
									</tr>
									<tr>
										<th class="content">홈페이지 주소</th>
										<td>${vo.cancel_homepage }</td>
									</tr>
									<tr>
										<th class="content">접수기간</th>
										<td>20${vo.cancel_startdate} ~ 20${vo.cancel_enddate }
										<br>
										<span style="font-weight:bold; color:#EBA5AE; font-size:20px">D-${dday}</span></td>
									</tr>
								</table>
							</div>
							<br> <span style="font-size: 22px; font-weight: bold; color: #6BC7BF">상세 내용</span><br>
							<div style="margin-right:30px;">
							<hr style="border: 1px solid #6BC7BF;">
							${vo.cancel_content }
							<br>
							<br> <span style="font-size: 22px; font-weight: bold; color: #EBA5AE">취소 사유</span><br>
							<hr style="border: 1px solid #EBA5AE;">
							${vo.cancel_reason }
							<br><br>
							<hr>
							</div>
							</c:if>
							<div style="width: max-width; text-align: right; margin-right:30px;">
								<button type="button" onclick="history.back(-1);" style="width:50px; height:30px;">뒤로</button>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align: top"><jsp:include
							page="/WEB-INF/views/client/main/con_menu.jsp" /></td>
				</tr>
			</table>
			
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/client/include/footer.jsp" />
</body>
</html>