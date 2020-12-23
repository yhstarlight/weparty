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
.QA {background:#6BC7BF}
.qa {font-weight: bold;}
</style>
<script>
function answerSubmit(){
	
	var content=document.getElementById("content").value;
	
	if(!document.getElementById("content").value.length == 0){
		if(confirm('등록하시겠습니까?')){
			alert('등록되었습니다.');
			location.href="/QA/answer_success.mdo?answer_no="+${question.question_no}+"&content="+content;
		}
	}
}

function updateAnswer(){
	
	var content2=$('#content2').text();
	
	$(".answer").html("<td style='text-align: center;' colspan='4'>"+
	"<textarea id='content' name='answer_content' rows='10' cols='95'>"+content2+"</textarea><br>"+
	"<button style='width: 60px;' onclick='updateAnswerSuccess();' class='cancel'>수정</button> "+
	"<button style='width: 60px;' onclick='history.back(-1)'>뒤로</button></td>'");
}

function updateAnswerSuccess(){
	var content=document.getElementById("content").value;
	
	if(!document.getElementById("content").value.length == 0){
		if(confirm('수정하시겠습니까?')){
			alert('수정되었습니다.');
			location.href="/QA/answer_update.mdo?answer_no="+${question.question_no}+"&content="+content;
		}
	}
}
</script>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">고객센터</span><br>
	<div class="MainDiv">
	<div style="margin-left:5px; margin-bottom: 15px"><a class="qa" href="/location.href='/QA/allList.mdo'">답변 관리</a> ｜ 
	<a href="/QA/typeList.mdo">문의 유형 관리</a></div>

	<c:if test="${state eq 'all'}">
	<a href="/QA/allList.mdo"><img src="/resources/img/admin/all_click.png"></a>
	</c:if>
	<c:if test="${state ne 'all'}">
	<a href="/QA/allList.mdo"><img src="/resources/img/admin/all.png"></a>
	</c:if>
	<c:if test="${state eq 'y'}">
	<a href="/QA/answerList.mdo"><img src="/resources/img/admin/answer_ok_click.png"></a>
	</c:if>
	<c:if test="${state ne 'y'}">
	<a href="/QA/answerList.mdo"><img src="/resources/img/admin/answer_ok.png"></a>
	</c:if>
	<c:if test="${state eq 'n'}">
	<a href="/QA/waitList.mdo"><img src="/resources/img/admin/wait_click.png"></a>
	</c:if>
	<c:if test="${state ne 'n'}">
	<a href="/QA/waitList.mdo"><img src="/resources/img/admin/wait.png"></a>
	</c:if>
	<table class="ContentTable2" style="width:800px">
		<tr>
			<th style="width:150px">문의 유형</th>
			<td colspan="3">${question.question_type}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${question.question_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td style="width:150px">${question.question_writer_id}</td>
			<th style="width:150px">등록 시간</th>
			<td style="width:200px">${question.question_regdate }</td>
		</tr>
		<tr>
			<th colspan="4">내용</th>
		</tr>
		<tr>
			<td colspan="4">${question.question_content}</td>
		</tr>
		<tr>
			<th colspan="4">답변</th>
		</tr>
		<c:if test="${question.question_state eq 'n'}">
		<tr>
			<td style="text-align: center;" colspan="4"><textarea id="content" name="answer_content" rows="10" cols="95"></textarea><br>
			<button style="width: 60px;" class="approve" type="submit" onclick="answerSubmit();">작성</button>
			<button style="width: 60px;" onclick="history.back(-1)">뒤로</button></td>
		</tr>
		</c:if>
		<c:if test="${question.question_state eq 'y'}">
		<tr class="answer">
			<td colspan="4">
			<div style="width: max-width; text-align: right; margin-right:5px">
			${answer.answer_regdate}
			</div>
			<span id="content2">${answer.answer_content}</span><br>
			<div style="width: max-width; text-align: center;">
			<button style="width: 60px;" onclick="updateAnswer();" class="cancel">수정</button>
			<button style="width: 60px;" onclick="history.back(-1)">뒤로</button>
			</div>
			</td>
		</tr>
		</c:if>
	</table>
	</div>
	</div>
</body>
</html>