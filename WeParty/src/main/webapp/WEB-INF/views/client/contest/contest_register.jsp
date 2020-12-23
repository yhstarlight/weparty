<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 공모전 등록</title>
<link href="../resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/contest_regist.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/imgcheck.js"></script>
<script src="/resources/js/client/contest_register.js"></script>
<style type="text/css">
a.al {font-weight:bold;}
</style>
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
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td style="vertical-align: top;" rowspan="3">
						<div class="l" style="margin-left:20px; width:772px;">
			<div style="margin-top:50px; margin-left:320px;
			font-size:24px; width:150px; text-align:center; color:#6BC7BF">
			<b>공모전 등록</b>
			<hr style="border:1px solid #6BC7BF">
			</div>
			<div style="margin-left:50px; margin-top:20px; margin-right:50px; text-align: center;">
				<form action="/contest/contest_register_success.do" onsubmit="return ContestRegistCheck();" method="post" enctype="multipart/form-data" >
				<table class="registTable">
					<tr>
						<th>공모전 이름</th>
						<td class="in"><input style="width:460px;" type="text" name="wait_title"></td>
					</tr>
					<tr>
						<th>주최사</th>
						<td class="in"><input style="width:460px;" type="text" name="wait_host"></td>
					</tr>
					<tr>
						<th>홈페이지 주소</th>
						<td class="in"><input style="width:460px;" type="url" name="wait_homepage"></td>
					</tr>
					<tr>
						<th>접수 기간</th>
						<td class="in"><input type='date' name='wait_startdate'/> ~ <input type='date' name='wait_enddate'/></td>
					</tr>
					<tr>
						<th>대상자</th>
						<td class="in">
						<table>
							<tr>
								<td class="check"><input type="checkbox" name="targetList" value="제한 없음"><span>제한 없음</span></td>
								<td class="check"><input type="checkbox" name="targetList" value="성인"><span>성인</span></td>
								<td class="check"><input type="checkbox" name="targetList" value="대학생"><span>대학생</span></td>
								<td class="check"><input type="checkbox" name="targetList" value="청소년"><span>청소년</span></td>
								<td class="check"><input type="checkbox" name="targetList" value="어린이"><span>어린이</span></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<th>분야</th>
						<td class="in">
						<table style="width:460px;">
							<tr>
								<td class="check"><input type="radio" name="wait_field" value="웹/모바일"><span>웹/모바일</span></td>
								<td class="check"><input type="radio" name="wait_field" value="글/문학"><span>글/문학</span></td>
								<td class="check"><input type="radio" name="wait_field" value="사진/UCC"><span>사진/UCC</span></td>
								<td><input type="radio" name="wait_field" value="서포터즈/대외활동"><span>서포터즈/대외활동</span></td>
							</tr>
							<tr>
								<td><input type="radio" name="wait_field" value="게임"><span>게임</span></td>
								<td><input type="radio" name="wait_field" value="건축"><span>건축</span></td>
								<td><input type="radio" name="wait_field" value="과학"><span>과학</span></td>
							</tr>
						</table>
						</td>
					</tr>		
					<tr>
						<th>포스터</th>
						<td class="in"><input type="file" name="poster" onchange="imgCheck(this)" accept="image/gif,image/jpeg,image/png"/></td>
					</tr>		
					<tr>
						<th>첨부 파일</th>
						<td class="in"><input type="file" name="file"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="in"><textarea id="content" name="wait_content" style="width:460px;" rows="25"></textarea></td>
					</tr>
				</table>
				<button type="submit" style="width:50px; height:35px; margin-bottom:50px;">등록</button>
				</form>
			</div>
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