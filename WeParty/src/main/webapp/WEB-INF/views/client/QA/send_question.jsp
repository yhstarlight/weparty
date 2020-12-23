<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 고객센터</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/send_question.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<script>
	
	function questionCheck(){
		if( $("input[name=question_title]").val() == ''){
			alert('제목을 입력해주세요.');
			return false;
		}
		
		if(document.getElementById("content").value.length == 0){
			alert('내용을 입력해주세요.');
			return false;
		}
	
	if(confirm('문의하시겠습니까?')){
		alert('문의 내용은 마이페이지>Q&A란에서 확인하실 수 있습니다.');
		return true;
	}
	return false;
	}
	
</script>
</head>
<body>

	<c:if test="${empty login_id}">
		<script>
			alert('로그인 후 이용가능한 메뉴입니다.');
			history.back();
		</script>
	</c:if>
	
	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>

	<div style="width:max-width">
		<div class="l" style="width:850px; margin-top:23px;">
			<div style="margin-top:50px; margin-left:380px;
			font-size:24px; width:100px; text-align:center; color:#6BC7BF">
			<b>문의하기</b>
			<hr style="border:1px solid #6BC7BF">
			</div>
			<div style="margin-left:100px; margin-top:20px; margin-right:100px; text-align: center;">
				<form action="/QA/send_question_success.do" method="post" onsubmit="return questionCheck();">
				<table class="sendQaTable">
					<tr>
						<th>문의 유형</th>
						<td style="text-align: left">
							<select name="question_type">
								<c:forEach var="type" items="${questionTypeList}">
									<option value="${type.question_type_name}"><c:out value="${type.question_type_name}"/></option>
								</c:forEach>	
							</select>
						</td>
						
					</tr>
					<tr>
						<th>제목</th>
						<td><input style="width:510px;" type="text" name="question_title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="content" name="question_content" style="font-family: Consolas;" rows="20" cols="63"></textarea>
						</td>
					</tr>
				</table>
				<button type="submit" style="width:60px; height:35px; margin-bottom:50px;">보내기</button>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>

</body>
</html>