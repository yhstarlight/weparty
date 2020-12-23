<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 게시글 등록</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/comm_write.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<style type="text/css">
a.f {
	font-weight: bold;
}
</style>
<script>
	function FreeBoard_check(){
		if( $("input[name=freeboard_title]").val() == ''){
			alert('제목을 입력해주세요.');
			return false;
		}
		
		if(document.getElementById("freeboard_content").value.length == 0){
			alert('내용을 입력해주세요.');
			return false;
		}
		
	if(confirm('등록하시겠습니까?')){
		alert('등록 되었습니다.');
		return true;
	}
	return false;
	}
</script>
</head>
<body>

	<c:if test="${empty login_id}">
		<script>
			alert('로그인 후 이용가능합니다.');
			history.back();
		</script>
	</c:if>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp" />

	<div style="width: max-width">
		<div style="width: 1050px; margin: 0 auto;">
			<table>
				<tr>
					<td style="height: 95px"><jsp:include
							page="/WEB-INF/views/client/main/login.jsp" /></td>
					<td rowspan="3">
						<div class="l" style="margin-left:20px; width:772px;">
							<div
								style="margin-top: 50px; font-size: 24px; width: 220px; margin-left: 270px; text-align: center; color: #6BC7BF">
								<b>자유게시판 글 작성</b>
								<hr style="border: 1px solid #6BC7BF">
							</div>
							<div
								style="margin-left: 50px; margin-top: 20px; margin-right: 50px; text-align: center;">
								<form action="/community/freeboard_write_success.do" onsubmit="return FreeBoard_check()">
									<table class="writeTable">
										<tr>
											<th>제목</th>
											<td><input style="width: 560px;" type="text"
												name="free_board_title"></td>
										</tr>
										<tr>
											<th>내용</th>
											<td><textarea id="freeboard_content" name="free_board_content" style="font-family: Consolas; padding-left:5px;" rows="20"
													cols="70"></textarea></td>
										</tr>
									</table>
									<button type="submit"
										style="width: 60px; height: 35px; margin-bottom: 50px;">올리기</button>
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align: top"><jsp:include
							page="/WEB-INF/views/client/main/con_menu2.jsp" /></td>
				</tr>
			</table>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/client/include/footer.jsp" />

</body>
</html>