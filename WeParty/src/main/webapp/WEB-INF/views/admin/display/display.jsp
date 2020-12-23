<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/basic.css" rel="stylesheet">
<link href="/resources/css/admin/button.css" rel="stylesheet">
<script src="/resources/js/imgcheck.js"></script>
<script src="/resources/js/jquery.js"></script>
<style>
.Display {background:#6BC7BF}
</style>
<script>
	function addPoster(){
		document.getElementById("prev_poster").style.display="block";
		document.getElementById("prev_poster").style.marginBottom="5px";
		document.getElementById("add_link").style.display="inline-block";
		document.getElementById("addBtn2").style.display="inline-block";
		document.getElementById("addBtn1").style.display="none";
	}
	
	function CheckPoster(){
		
		var PosterCheck = document.getElementById("posterUpload").value;
		if(PosterCheck==''){
			alert('포스터를 선택해주세요.');
			return false;
		}

		var linkCheck = document.getElementById("add_link").value;
		if(linkCheck==''){
			alert('링크를 입력해주세요.');
			return false;
		}
		
		if(!confirm('새로운 화면을 등록하시겠습니까?')){
			return false; 
		}
		return true;
	}
	
	function deleteCheck(no){
		
		if(confirm('해당 화면을 삭제하시겠습니까?')){
			location.href='/display/delete.mdo?display_no='+no;
		}	
	}
	
	function editPoster(){
		if(!confirm('해당 화면을 수정하시겠습니까?')){
			return false; 
		}
		return true;
	}
</script>
</head>
<body>
	<div class="Menu">
		<jsp:include page="/WEB-INF/views/admin/menu/menu.jsp"></jsp:include>
	</div>
	<div class="MainBackDiv">
	<span style="font-size:24px; color:gray">화면</span><br>
	<div class="MainDiv">
	<div style="width:1280px; text-align: left;">
	<span style="font-size: 12px">&nbsp;※ 최대 다섯개까지 등록 가능합니다.</span>
	<table style="margin-top:5px">
		<c:forEach var="l" items="${list}">
			<tr>
				<td>
					<div>
					<form action="/display/edit.mdo" enctype="multipart/form-data" method="post" onsubmit="return editPoster();">
					<input type="file" id="edit_poster${l.display_no}" name="edit_poster" style="display:none;" onchange="imgCheck(this)" accept="image/gif,image/jpeg,image/png">
					<input type="text" style="display:none;" value="${l.display_no}" name="display_no">
					<img id="prev_poster${l.display_no}" src="/resources/${l.display_poster }" style="width:200px; height:260px; display: block; margin-bottom: 5px">
					<input type="url" name="edit_link" value="${l.display_link}" placeholder="포스터 클릭시 이동할 주소를 입력해주세요." style="width: 350px; height: 32px">
					<button type="submit" style="width:50px"> 수정</button> 
					<button type="button" onclick="deleteCheck(${l.display_no})" style="width:50px" class="cancel">삭제</button>
					</form>
					<hr style="border-color: gray; border-width: 1px 0 0 0; margin: 10px 0 10px 0">	
					</div>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
			<div style="text-align: left;">	
				<form action="/display/add.mdo" enctype="multipart/form-data" method="post" onsubmit="return CheckPoster();">
				<input type="file" id='posterUpload' name="add_poster" style="display:none;" onchange="imgCheck(this)" accept="image/gif,image/jpeg,image/png">
				<img src='/resources/img/admin/no_img.png' id="prev_poster" style="display:none; width:200px; height:260px;">
				<input type="url" id="add_link" name="add_link" placeholder="포스터 클릭시 이동할 주소를 입력해주세요." style="display:none; width: 350px; height: 32px" >
				<button class="approve" id="addBtn2" style="width: 50px; display:none" type="submit">추가</button>
				</form>
			</div>
			<script src="/resources/js/admin/poster_upload.js"></script>
			</td>
		</tr>
		<tr>
			<td>
			<div style="text-align: center;">
			<c:if test="${fn:length(list)==5}">
			<span style="font-size: 14px; color:gray">추가하시려면 기존 화면을 삭제해주세요.</span>
			</c:if>
			<c:if test="${fn:length(list)!=5}">
			<a href="#" onclick="addPoster()" id="addBtn1" style="color:#6BC7BF; font-weight: bold">추가</a>
			</c:if>	
			</div>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</body>
</html>