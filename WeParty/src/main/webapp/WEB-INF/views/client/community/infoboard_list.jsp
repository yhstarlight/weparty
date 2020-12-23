<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 정보나눔터</title>
<link href="../resources/css/client/basic.css" rel="stylesheet" />
<link href="../resources/css/client/board_list.css" rel="stylesheet" />
<style type="text/css">
a.i {font-weight:bold;}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td rowspan="3">
						<div class="l" style="margin-top:21px;  width:672px; height:max-height; margin-left:20px; padding: 0 50px 50px 50px">
							<div style="margin-top:50px; font-size:24px; width:672px;  text-align:left; color:#6BC7BF">
							<b>정보 나눔터</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<form>
							<table style="margin-left:340px;">
								<tr>
									<td>
									<select name="searchCondition" style="height:30px;">
									<option value="title">제목</option>
									<option value='writer'>작성자</option>
									</select>
									</td>
									<td>
									<input style="height:23px; width:200px;" type="text" name="searchKeyword">
									</td>
									<td>
									<button style="height:28px; width:40px;" onclick="location.href='/community/freeboard_list.do'">검색</button>
									</td>
								</tr>
							</table>
							</form>
							<table class="comTable" style="width:652px; margin-top:5px; margin-bottom:5px;">
								<tr>
									<th style="width:50px;"></th>
									<th>제목</th>
									<th style="width:120px;">작성자</th>
									<th style="width:50px;">조회수</th>
								</tr>
								<c:forEach var="list" items="${boardList }">
									<tr>
										<td>${list.info_board_no}</td>
										<td class="title"><a class="name" href="/community/infoboard_content.do?info_board_no=${list.info_board_no}">${list.info_board_title}</a>
										<c:if test="${list.info_board_reply_cnt != 0 }">
										(${list.info_board_reply_cnt})
										</c:if>
										</td>
										<td>${list.info_board_writer_nick}</td>
										<td>${list.info_board_hit}</td>
									</tr>
								</c:forEach>		
							</table>
							<div style="width:max-width; text-align: right; padding-right:10px;">
							<button type="button" style="width:60px; height:30px;" onclick="location.href='/community/infoboard_write.do'">글쓰기</button>
							</div> 
							<table style="margin:auto; font-size:14px; margin-top:5px;">
								<tr>
									<td colspan="5">
									
									<c:if test="${page <= 1 }">
									<&nbsp;
									</c:if>
									
									<c:if test="${page >1 }">
									<a class="page" href="/community/freeboard_list.do?page=${page-1 }"><</a>
									&nbsp;
									</c:if>
	
									<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
									<c:if test="${a ==page }">
										<b>${a }</b>&nbsp;
									</c:if>
									<c:if test="${a != page }">
									<a class="page" href="/community/freeboard_list.do?page=${a }">${a}</a>
									&nbsp;
									</c:if>
									</c:forEach>
									
									<c:if test="${page >= maxpage }">
									>
									</c:if>
									<c:if test="${page < maxpage }">
									<a class="page" href="/community/freeboard_list.do?page=${page+1 }">></a>
									</c:if>
									</td>
								</tr>
							</table>	
						</div>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align:top"><jsp:include
							page="/WEB-INF/views/client/main/con_menu2.jsp" /></td>
				</tr>						
			</table>		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>
</body>
</html>