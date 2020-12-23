<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : </title>
<link href="../resources/css/client/basic.css" rel="stylesheet" />
<style>
input.log {
	height: 24px !important;
	width: 126px !important;
}

html { overflow-y:scroll; }

.file { color:gray; font-weight: bold; font-size: 14px; text-decoration: none}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td rowspan="3">
						<div class="l" style="width:672px; height:max-height; margin-left:20px; padding:50px; padding-bottom:30px;">
							<div style="text-align: center;">
							<span style="font-weight:bold; color:#6BC7BF; font-size:24px;">${vo.notice_title}</span>
							<br>
							<hr style="border:1px solid #6BC7BF; margin-top:20px;">
							</div>
							<div style="text-align: right; font-size:14px;">
							<span>조회수 : ${vo.notice_hit}</span>
							</div>
							<div>
							${vo.notice_content}
							<br><br>
							</div>
							<hr>
							<div><span style="font-size: 14px">첨부파일 : </span>
							<a class="file" href="/notice/downLoadFile.mdo?notice_no=${vo.notice_no}">
							${vo.notice_file_origin }</a></div>
							<hr>
							<div style="width: max-width; text-align: right;">
								<button type="button" onclick="history.back(-1);" style="width:50px; height:30px;">뒤로</button>
							</div>		
						</div>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align:top"> </td>
				</tr>						
			</table>		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>

</body>
</html>