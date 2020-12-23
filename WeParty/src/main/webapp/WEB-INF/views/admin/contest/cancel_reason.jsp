<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="/resources/css/admin/button.css" rel="stylesheet">
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<script type="text/javascript">

function Submit(){
	if(!document.getElementById("reason").value.length == 0){
		if(confirm('공모전 등록을 취소하시겠습니까?')){
			alert('취소 되었습니다.');
			var text = document.getElementById("reason").value;
			opener.document.location.href='/contest/cancel_success.mdo?no='+${no}+'&type='+'${type}'
					+'&cancel_reason='+text;
			window.close();
		}
	} else {
		alert("취소 샤유를 입력해주세요.");
	}
}
</script>
</head>
<body>

	<div style="background-color: #EFF4F4; height:max-height; text-align: center; padding:20px;">
		<div>
			<div style="margin-bottom:5px">
			<span style="font-weight: bold; font-size: 18px;">[ ${title} ]</span>
			</div>
			<div style="margin-bottom:10px">
			취소 사유
			</div>
			<textarea rows="11" cols="60" id="reason"></textarea>
		</div>
		<button style="margin-top:5px" onclick="Submit()">확인</button>
	</div>

</body>
</html>