<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티 ! 공모전 관리</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/table.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<style type="text/css">
.Contest {background:#6BC7BF}
</style>
<script type="text/javascript">

var popupX=(window.screen.width/2)-(400/2);
var popupY=(window.screen.height/2)-(200/2);

function CancelPopUp(){
	window.open("/contest/cancel_reason.mdo?title=${content.cancel_title}&no=${content.cancel_no}&type=대기","CancelPopUp","width=500, height=323, left="+ popupX + ", top="+ popupY);
}

function ApproveCheck(){
	if(confirm('승인하시겠습니까?')){
		alert('승인 되었습니다.');
		location.href="/contest/approve_success.mdo?no=${content.cancel_no}&type=취소";
	}
}
</script>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">공모전</span><br>
	<div class="MainDiv" style="position: relative;">
	<a href="/contest/allList.mdo"><img src="/resources/img/admin/all.png"></a>
	<a href="/contest/approveList.mdo"><img src="/resources/img/admin/contest_approve.png"></a>
	<a href="/contest/waitList.mdo"><img src="/resources/img/admin/wait.png"></a>
	<a href="/contest/cancelList.mdo"><img src="/resources/img/admin/contest_cancel_click.png"></a>
	
	<table class="MainTable ContentTable" style="width:800px">
		<tr>
			<th colspan="2">공모전 상세</th>
		</tr>
		<tr>
			<td class="title" colspan="2">${content.cancel_title}</td>
		</tr>
		<tr>
			<td class="noneLine" colspan="2" style="text-align: right">작성자 : ${content.cancel_writer_id}</td>
		</tr>
		<tr>
			<td><img style="width: 350px; height: 490px; margin-left: 10px;" src="/resources${content.cancel_poster}"></td>
			<td style="text-align: center; vertical-align: middle;">
			<table class="Detail">
				<tr>
					<th>분야</th>
					<td>${content.cancel_field}</td>
				</tr>
				<tr>
					<th>대상</th>
					<td>${content.cancel_target}</td>
				</tr>
				<tr>
					<th>주최</th>
					<td>${content.cancel_host}</td>
				</tr>
				<tr>
					<th>접수 기간</th>
					<td>20${content.cancel_startdate} ~ 20${content.cancel_enddate}</td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td>${content.cancel_homepage}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><a href="/contest/fileDownload.mdo?cancel_no=${content.cancel_no}">${content.cancel_file_origin}</a></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td style="text-align: left; "colspan="2">
				<span style="font-size: 18px; font-weight: bold;">상세 내용</span><br><br>
				${content.cancel_content}
			</td>
		</tr>
		<tr>
			<td style="text-align: left; "colspan="2">
				<span style="font-size: 18px; font-weight: bold; color: #EBA5AE">취소 사유</span><br><br>
				${content.cancel_reason}
			</td>
		</tr>
	</table>
	<div style="text-align: center; width:800px">
		<button style="width: 60px;" onclick="ApproveCheck()" class="approve">승인</button>
		<button style="width: 60px;" onclick="history.back(-1);">뒤로</button>
	</div>
	</div>
	</div>
</body>
</html>