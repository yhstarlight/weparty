<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 전체 공모전</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<style type="text/css">
a {color:gray; text-decoration: none;}
</style>
<script>
$(function(){
	if("${field}"=="all"){
		$('.al').css("font-weight","bold");
	}
	if("${field}"=="web"){
		$('.w').css("font-weight","bold");
	}
	if("${field}"=="scenario"){
		$('.s').css("font-weight","bold");
	}
	if("${field}"=="ucc"){
		$('.p').css("font-weight","bold");
	}
	if("${field}"=="science"){
		$('.c').css("font-weight","bold");
	}
	if("${field}"=="game"){
		$('.g').css("font-weight","bold");
	}
	if("${field}"=="architecture"){
		$('.r').css("font-weight","bold");
	}
	if("${field}"=="supporters"){
		$('.t').css("font-weight","bold");
	}
})
</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td style="vertical-align: top;" rowspan="3">
						<div class="l" style="width:722px; height:max-height; margin-left:20px; padding-left:50px; padding-bottom:50px;">
							<div style="margin-top:50px; font-size:24px; width:672px; text-align:left; color:#6BC7BF">
							<b>
							<c:if test="${field eq 'all'}">전체 
							</c:if>
							<c:if test="${field eq 'web'}">웹/모바일 
							</c:if>
							<c:if test="${field eq 'scenario'}">글/문학
							</c:if>
							<c:if test="${field eq 'ucc'}">사진/UCC 
							</c:if>
							<c:if test="${field eq 'science'}">과학
							</c:if>
							<c:if test="${field eq 'game'}">게임 
							</c:if>
							<c:if test="${field eq 'architecture'}">건축 
							</c:if>
							<c:if test="${field eq 'supporters'}">서포터즈/대외활동 
							</c:if>
							공모전
							</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<form action='/contest/contest_list.do'>
							<table style="margin-left:405px;">
								<tr>
									<td>
									<input style="height:23px; width:200px;" type="text" name="searchKeyword">
									<input type="hidden" value="${field}" name="field">
									</td>
									<td>
									<button style="height:28px; width:40px;">검색</button>
									</td>
								</tr>
							</table>
							</form>
							<table class="comTable" style="width:652px; margin-top:5px">
								<tr>
									<th>이름</th>
									<th style="width:200px">날짜</th>
									<th style="width:50px;">조회수</th>
								</tr>
								<c:forEach items="${contestList }" var="contest_list">
								<tr>
									<td class="n" style="text-align: left"><a class="name" href="/contest/contest_content.do?contest_no=${contest_list.approve_no}">${contest_list.approve_title}</a></td>
									<td>20${contest_list.approve_startdate } ~ 20${contest_list.approve_enddate }</td>
									<td>${contest_list.approve_hit }</td>
								</tr>
								</c:forEach>
							</table>
							<table style="margin:auto; font-size:14px; margin-top:5px;">
								<tr>
									<td colspan="5">
									<c:if test="${page <= 1 }">
									<&nbsp;
									</c:if>
									
									<c:if test="${page >1 }">
									<a class="page" href="/contest/contest_list.do?field=all&page=${page-1 }"><</a>
									&nbsp;
									</c:if>
	
									<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
									<c:if test="${a ==page }">
										<b>${a }</b>&nbsp;
									</c:if>
									<c:if test="${a != page }">
									<a class="page" href="/contest/contest_list.do?field=all&page=${a }">${a}</a>
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
							page="/WEB-INF/views/client/main/con_menu.jsp" /></td>
				</tr>						
			</table>		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>

</body>
</html>