<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 관리자 로그인</title>
<link href="/resources/css/admin/login.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<script>

	$(document).ready(function(){
		var success = "${success}";

		if(success == "error2"){
			$('.e2').css('display', 'inline-block');
			return false;
		}
		
		if(success == "error3"){
			$('.e3').css('display', 'inline-block');
			$("input[name=manager_id]").val("${manager_id}");
			return false;
		}
	});

	function loginCheck(){
		
		if($("input[name=manager_id]").val()==''){
			$('.e1').css('display', 'inline-block');
			return false;
		}	
		return true;
	}
</script>
</head>
<body>
	<div class="Wrap">
		<div>
			<table class="LoginTable">
				<tr>
					<td rowspan="3"><img src="/resources/img/wp.png"></td>
					<td>
						<form action="/login_success.mdo" method="post" onsubmit="return loginCheck();">
						<table class="LoginWrap">
							<tr>
								<td><div class="LoginText">로그인</div></td>
							</tr>
							<tr>
								<td><div class="Ex">아이디</div><input type="text" name="manager_id"></td>
							</tr>
							<tr>
								<td><div class="Ex">비밀번호</div><input type="password" name="manager_pw"></td>
							</tr>
							<tr>
								<td><button type="submit">login</button></td>
							</tr>
							<tr>
								<td>
								<span class="error e1">아이디를 입력해주세요.</span>
								<span class="error e2">등록된 아이디가 아닙니다.</span>
								<span class="error e3">입력정보가 일치하지 않습니다.</span>　
								</td>
							</tr>
						</table>
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>