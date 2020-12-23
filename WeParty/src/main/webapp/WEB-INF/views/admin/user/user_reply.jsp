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
				  param="reply_no="+$(this).val();
			  } else {
				  param = param + "&reply_no="+$(this).val();
			  }
			  
			  param = param + "&reply_type=" + $(this).parent().children("#reply_type").val();	  
		  });
		  
		  $.ajax({
		      url: '/user/reply_delete.mdo'
		      , type: 'post'
		      , dataType: 'text'
		      , data: param
		  });

	  });
});
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
	<span style="vertical-align: middle;">회원 아이디 : ${id}</span>
	</div>
	
	<table style="margin-top:10px" class="MainTable">
		<tr>
			<th style="width:50px"><input type="checkbox" class="check-all"></th>
			<th style="width:600px">댓글 목록</th>
		</tr>
		<c:forEach items="${list }" var="l">
		<c:if test="${l.reply_type eq '자유'}">
			<tr class="list" onclick="window.open('about:black').location.href='/community/freeboard_content.do?free_board_no=${l.board_no}'">
		</c:if>
		<c:if test="${l.reply_type eq '정보'}">
			<tr class="list" onclick="window.open('about:black').location.href='/community/infoboard_content.do?info_board_no=${l.board_no}'">
		</c:if>
			<td onclick="event.cancelBubble=true"><input type="checkbox" class="check-box" value="${l.reply_no }">
			<input type="hidden" id="reply_type" value="${l.reply_type }"></td>
			<td style="text-align: left; padding-left:10px">
			<span style="font-size: 14px">
			<c:if test="${l.reply_type eq '자유'}">
			자유 게시판 : 
			</c:if>
			<c:if test="${l.reply_type eq '정보'}">
			정보 나눔터 : 
			</c:if>
			${l.board_title }</span><br>
			${l.reply_content }
			</td>
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