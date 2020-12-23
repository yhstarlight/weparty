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
.User {background:#6BC7BF}
</style>
<script>
$( document ).ready( function() {
  $( '.check-all' ).click( function() {
    $( '.check-box' ).prop( 'checked', this.checked );
  } );
  
  $("#delete").on("click",function(){
	  var param="";
	  $(".check-box:checked").each(function(){  
		  if(param==""){
			  param="board_no="+$(this).val();
		  } else {
			  param = param + "&board_no="+$(this).val();
		  }
		  
		  param = param + "&board_type=" + $(this).parent().children("#board_type").val();	  
	  });
	  
	  $.ajax({
	      url: '/user/community_delete.mdo'
	      , type: 'post'
	      , dataType: 'text'
	      , data: param
	  });

  });
} );

</script>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">회원 관리</span><br>
	<div class="MainDiv">
	<div >
	&nbsp;&nbsp;<img style="cursor:pointer; width:18px; height:15px; vertical-align: middle;" onclick="history.back(-1)" src="/resources/img/admin/back.png">
	<span style="vertical-align: middle;">커뮤니티 : ${id}</span>
	</div>
	
	<table style="margin-top:10px" class="MainTable">
		<tr>
			<th style="width:50px"><input type="checkbox" class="check-all"></th>
			<th style="width:160px">카테고리</th>
			<th style="width:450px">게시글 제목</th>
			<th style="width:120px">조회수</th>
		</tr>
			
			<c:forEach var="list" items="${list}">
				<c:if test="${list.board_type eq '자유 게시판'}">
				<tr class="list" onclick="window.open('about:black').location.href='/community/freeboard_content.do?free_board_no=${list.board_no}'">
				</c:if>
				<c:if test="${list.board_type eq '정보 나눔터'}">
				<tr class="list" onclick="window.open('about:black').location.href='/community/infoboard_content.do?info_board_no=${list.board_no}'">
				</c:if>
					<td onclick="event.cancelBubble=true"><input type="checkbox" class="check-box" value="${list.board_no }">
					<input type="hidden" id="board_type" value="${list.board_type }"></td>
					<td>${list.board_type}</td>
					<td style="text-align: left; padding-left:10px;">${list.board_title }</td>
					<td>${list.board_hit }</td>
				</tr>
			</c:forEach>
		<tr>
			<td colspan="7" class="noneLine">
			<div style="text-align: right;">
			<button type="submit" class="classic" style="width: 60px; height: 35px" id="delete">삭제</button></div>
			</td>		
		</tr>
		<tr>
			<td colspan="7" class="noneLine">
			<div class="PageNum">
			<c:if test="${page <= 1 }">
				<&nbsp;
				</c:if>
				
				<c:if test="${page >1 }">
				<a class="page" href="/contest/allList.mdo?page=${page-1 }"><</a>
				&nbsp;
				</c:if>
	
				<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
				<c:if test="${a ==page }">
					<b>${a }</b>&nbsp;
				</c:if>
				<c:if test="${a != page }">
				<a class="page" href="/contest/allList.mdo?page=${a }">${a}</a>
				&nbsp;
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage }">
				>
				</c:if>
				<c:if test="${page < maxpage }">
				<a class="page" href="/contest/allList.mdo?page=${page+1 }">></a>
			</c:if>
			</div>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>