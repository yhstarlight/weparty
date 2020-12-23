<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 회원정보 수정</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<link href="/resources/css/client/register.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<script>
function checkEdit(){
	var user_pw = $("#user_pw").val();
	var check_pw = $("#pwCheck").val();
	var user_id = $("#user_id").val();
	
	if(user_pw.length != 0) {
		
		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(user_pw)){            
	        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
	        $('#user_pw').val('').focus();
	        return false;
	    }    
	
	    if(/(\w)\1\1\1/.test(user_pw)){
	        alert('비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.');
	        $('#user_pw').val('').focus();
	        return false;
	    }
	        
	    if(user_pw.search(user_id) > -1){
	        alert("비밀번호에 아이디가 포함되지 않도록 해주세요.");
	        $('#user_pw').val('').focus();
	        return false;
	    }
	    
	    if(user_pw != check_pw){
	    	alert("비밀번호가 일치하지 않습니다.");
	    	$('#user_pw').focus();
	    	return false;
	    }
	}
    return true;
}
</script>
<style type="text/css">
.edit {font-weight:bold;}
</style>
</head>
<body>

	<c:if test="${empty login_id}">
		<script>location.href="/home.do"</script>
	</c:if>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td rowspan="3" style="vertical-align: top;">
					<form action="/mypage/edit_success.do" onsubmit="return checkEdit();">
						<div class="l" style="margin-top:20px; width:722px; height:max-height; margin-left:20px; padding-left:50px; padding-bottom:50px;">
							<div style="margin-top:50px; font-size:24px; width:672px; text-align:left; color:#6BC7BF">
							<b>회원정보 수정</b>
							<hr style="border:1px solid #6BC7BF">
							</div>
							<table style="margin-left:50px; margin-top:30px; vertical-align: middle">
					<tr>
						<td class="fontA">아이디</td>
						<td><input class="in" type="text" id="user_id" name="user_id" value="${user.user_id}" disabled/></td>
					</tr>		
					<tr>
						<td class="fontA">비밀번호</td>
						<td><input class="in pw" type="password" id="user_pw" name="user_pw"/></td>
						<td class="fontB">비밀번호를 변경하실 경우<br>영문,숫자,특수문자를 포함해 8자리 이상입력해주세요.</td>
					</tr>
					<tr>
						<td class="fontA">비밀번호 확인 &nbsp;</td>
						<td><input class="in pw" type="password" id="pwCheck"/></td>
						<td class="fontC">&nbsp;비밀번호를 확인해주세요.</td>
					</tr>
					<tr>
						<td class="fontA">이름</td>
						<td><input class="in" type="text" id="user_name" name="user_name" value="${user.user_name}"/></td>
					</tr>
					<tr>
						<td class="fontA">닉네임</td>
						<td><input class="in" type="text" id="user_nick" name="user_nick" value="${user.user_nick}"/></td>
					</tr>
					<tr>
						<td class="fontA">이메일</td>
						<td><input class="in" type="email" id="user_email" name="user_email" value="${user.user_email}" disabled/></td>
					</tr>
					<tr>
						<td class="fontA">나이</td>
						<td>
							<select name="user_age" style="height:30px;">
								<option value="10">10대</option>
								<c:choose>
									<c:when test="${user.user_age eq '20'}"><option value="20" selected="selected">20대</option></c:when>
									<c:otherwise><option value="20">20대</option></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${user.user_age eq '30'}"><option value="30" selected="selected">30대</option></c:when>
									<c:otherwise><option value="30">30대</option></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${user.user_age eq '40'}"><option value="40" selected="selected">40대</option></c:when>
									<c:otherwise><option value="40">40대</option></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${user.user_age eq '50'}"><option value="50" selected="selected">50대</option></c:when>
									<c:otherwise><option value="50">50대</option></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${user.user_age ne '10' and user.user_age ne '20' and user.user_age ne '30' and user.user_age ne '40' and user.user_age ne '50'}"><option value="other" selected="selected">그외</option></c:when>
									<c:otherwise><option value="other">그외</option></c:otherwise>
								</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<td class="fontA">성별</td>
						<td>
							<c:choose>
									<c:when test="${user.user_gender eq 'f'.charAt(0)}"><input type="radio" name="user_gender" value="f" checked="checked"><span style="font-size:14px;">여자</span></c:when>
									<c:otherwise><input type="radio" name="user_gender" value="f"><span style="font-size:14px;">여자</span></c:otherwise>
							</c:choose>
							<c:choose>
									<c:when test="${user.user_gender eq 'm'.charAt(0)}"><input type="radio" name="user_gender" value="m" checked="checked"><span style="font-size:14px;">남자</span></c:when>
									<c:otherwise><input type="radio" name="user_gender" value="m"><span style="font-size:14px;">남자</span></c:otherwise>
							</c:choose>

						</td>
					</tr>
					<tr>
						<td colspan="3">
						<br><br><b>관심 분야</b><br><hr>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<table style="width:560px"> 
								<tr>
									<td class="checkBox">
									<c:choose>
										<c:when test="${interest.web eq 'y'.charAt(0)}"><input type="checkbox" name="interest" value="web" checked="checked"><span>웹/모바일</span></c:when>
										<c:otherwise><input type="checkbox" name="interest" value="web"><span>웹/모바일</span></c:otherwise>
									</c:choose>
									<td class="checkBox">
									<c:choose>
										<c:when test="${interest.scenario eq 'y'.charAt(0)}"><input type="checkbox" name="interest" value="scenario" checked="checked"><span>글/문학</span></c:when>
										<c:otherwise><input type="checkbox" name="interest" value="scenario"><span>글/문학</span></c:otherwise>
									</c:choose>
									<td class="checkBox">
									<c:choose>
										<c:when test="${interest.ucc eq 'y'.charAt(0)}"><input type="checkbox" name="interest" value="ucc" checked="checked"><span>사진/UCC</span></c:when>
										<c:otherwise><input type="checkbox" name="interest" value="ucc"><span>사진/UCC</span></c:otherwise>
									</c:choose>
									<td class="checkBox">
									<c:choose>
										<c:when test="${interest.science eq 'y'.charAt(0)}"><input type="checkbox" name="interest" value="science" checked="checked"><span>과학</span></c:when>
										<c:otherwise><input type="checkbox" name="interest" value="science"><span>과학</span></c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<td class="checkBox">
									<c:choose>
										<c:when test="${interest.game eq 'y'.charAt(0)}"><input type="checkbox" name="interest" value="game" checked="checked"><span>게임</span></c:when>
										<c:otherwise><input type="checkbox" name="interest" value="game"><span>게임</span></c:otherwise>
									</c:choose>
									<td class="checkBox">
									<c:choose>
										<c:when test="${interest.architecture eq 'y'.charAt(0)}"><input type="checkbox" name="interest" value="architecture" checked="checked"><span>건축</span></c:when>
										<c:otherwise><input type="checkbox" name="interest" value="architecture"><span>건축</span></c:otherwise>
									</c:choose>
									<td class="checkBox">
									<c:choose>
										<c:when test="${interest.supporters eq 'y'.charAt(0)}"><input type="checkbox" name="interest" value="supporters" checked="checked"><span>서포터즈/대외활동</span></c:when>
										<c:otherwise><input type="checkbox" name="interest" value="supporters"><span>서포터즈/대외활동</span></c:otherwise>
									</c:choose>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
						<br><input class="regist" type="submit" value="수정"/>
						</td>
					</tr>
				</table>
						</div>
						</form>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align:top"><jsp:include
							page="/WEB-INF/views/client/main/con_menu3.jsp" /></td>
				</tr>						
			</table>		
		</div>
	</div>
	
	<script>
	$('.pw').focusout(function(){
		var pwd1 = $("#user_pw").val();
		var pwd2 = $("#pwCheck").val();
		if ( pwd1 != '' && pwd2 == '' ) {
	           null;
	     } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	            	$('.fontC').css('display', 'none');
	            } else {
	                $('.fontC').css('display', 'inline-block');
	            }
	        }
	    });
	</script>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>

</body>
</html>