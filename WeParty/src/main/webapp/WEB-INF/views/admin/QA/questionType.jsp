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
<script type="text/javascript">
function InsertQuestionType(){
	$(".insert").html("<input style='height:28px; text-align:center; width:202px' type='text' id='insert'>"+
	"<a href='#' onclick='insertSuccess()'><span style='color:#6BC7BF; font-weight: bold;'> 추가</span></a>"+
	"<a href='#' onclick='cancelInput()'><span style='color:#EBA5AE; font-weight: bold;'> 취소</span></a>");
}

function cancelInput() {
	$(".insert").html("<a href='#' onclick='InsertQuestionType()'><span style='color:#6BC7BF; font-weight: bold;''>추가</span></a>");
}

function insertSuccess(){
	
	var insert = $("#insert").val();
	
	if(!insert==""){
		if(confirm('추가하시겠습니까?')){
			location.href='/QA/insertType.mdo?insert='+insert;
		}
	}
}

function updateBtn(rno,type) {
	$("#updateInput"+rno).replaceWith("<tr><td colspan='2'>"+
			"<input style='height:28px; width:202px; text-align:center' type='text' value="+type+" id='update'>&nbsp"+
			"<button onclick='updateSuccess("+rno+")' class='approve'> 수정</button> <button onclick='updateCancel()' class='cancel'>취소</button></td></tr>");
	
}

function deleteBtn(rno){
	if(confirm('삭제하시겠습니까?')){
		location.href='/QA/deleteType.mdo?question_type_no='+rno;
	}	
}

function updateCancel(){
	location.reload();
}

function updateSuccess(rno){
	var update = $("#update").val();
	
	if(!update==""){
		if(confirm('수정하시겠습니까?')){
			location.href='/QA/updateType.mdo?update='+update+'&question_type_no='+rno;
		}
	}
}

</script>
<style>
.QA {background:#6BC7BF}
.qaType {font-weight: bold;}
</style>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">고객센터</span><br>
	<div class="MainDiv">
	<div style="margin-left:5px; margin-bottom: 15px"><a class="qa" href="/QA/allList.mdo">답변 관리</a> ｜ 
	<a class="qaType" href="/QA/typeList.mdo">문의 유형 관리</a></div>

	<table style="margin-top:5px" class="MainTable">
		<tr>
			<th style="width: 200px">문의 유형</th>
			<th style="width: 300px">관리</th>
		</tr>
		<c:forEach items="${list}" var="l">
			<tr id="updateInput${l.question_type_no}">
				<td style="vertical-align:middle;">${l.question_type_name}</td>
				<td><button onclick="updateBtn(${l.question_type_no},'${l.question_type_name}')">수정</button> 
				<button onclick="deleteBtn(${l.question_type_no})" class="cancel">삭제</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td style="height: 40px; vertical-align: middle;" colspan="2">
			<div class="insert">
			<a href="#" onclick="InsertQuestionType()">
			<span style="color:#6BC7BF; font-weight: bold;">추가</span></a>	
			</div>
			</td>
		</tr>
	</table>
	</div>
	</div>
</body>
</html>