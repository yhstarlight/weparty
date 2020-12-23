<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 정보나눔터</title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<style type="text/css">
a.i {font-weight:bold;}

a{color: gray; text-decoration: none;}

</style>
<script>

var info_board_no = ${board.info_board_no};
var info_board_writer_id= "${board.info_board_writer_id}";
var login_id= "${login_id}";

getAllList();
function getAllList(){ 
	$.getJSON("/reply/infoAll/" + info_board_no + ".do",function(data){
		var str="";
		$(data).each(function(){
			if(info_board_writer_id == this.info_reply_writer_id){
			str+="<tr id='rno"+ this.info_reply_no+"'><td><table class='replyTable'><tr><td><span style='color:#6BC7BF'><b>"+
			this.info_reply_writer_nick+"("+ this.info_reply_writer_id +")</b></span>";
			} else {
				str+="<tr id='rno"+ this.info_reply_no+"'><td><table class='replyTable'><tr><td><span><b>"+
				this.info_reply_writer_nick+"("+ this.info_reply_writer_id +")</b></span>";
			}
			str+=" <span style='font-size:12px'>"+this.info_reply_date+"</span>";
			if(this.info_reply_writer_id == login_id){
				str+="<td class='edit'><a class='reply' href='#' name='editBtn' data-rno='"+this.info_reply_no+"' data-rid='"+this.info_reply_writer_id+
				"' data-rnick='"+this.info_reply_writer_nick+"' data-rcont='"+ this.info_reply_content +"' data-rdate='"+this.info_reply_date+"'>수정</a> ｜ "
				+"<a class='reply' href='#' onclick='del()' name='deleteBtn' data-rno='"+this.info_reply_no+"'>삭제</a></td></tr>";
			} else {
				str+="<td></td></tr>";
			}
				str+="<tr><td colspan='2'>"+ this.info_reply_content + "</td></tr></table></td></tr>";
		});
		$(".replies").html(str);
	});
} 

$(document).ready(function(){
	
	$(document).on("click","a[name='deleteBtn']", function(){
		var info_reply_no=$(this).attr("data-rno");
		
		$.ajax({
			type:'delete',
			url:'/reply/info/'+info_reply_no +'.do',
			header:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"DELETE"
			},
			dataType:'text',
			success:function(result){
				if(result=='success'){
					alert('댓글이 삭제되었습니다.');
					location.reload();
					getAllList();
				}
			}
		});
	});
	
	$(document).on("click","a[name='editBtn']", function(){
		var rno=$(this).attr("data-rno");
		var rid=$(this).attr("data-rid");
		var rnick=$(this).attr("data-rnick");
		var rcont=$(this).attr("data-rcont");
		var rdate=$(this).attr("data-rdate");
		var html="<tr id='rno"+ rno+"'><td><table class='replyTable'>"+
		"<tr><td><span style='color:#6BC7BF'><b>"+rnick+"("+rid+")</b></span><span style='font-size:12px'> "+rdate+"</span></td><td class='edit'>"+
		"<a class='reply' href='#' name='editReplyBtn' data-rno='"+rno+"'>수정</a> ｜ "
		+"<a class='reply' href='#' onclick='del()' name='deleteBtn' data-rno='"+rno+"'>삭제</a></td></tr>"+
		"<tr><td colspan='2'><textarea id='replyEditContent' style='margin-top:5px;' rows='5' cols='79'>"+rcont+"</textarea></td></tr>"
		"</table></td></tr>";
		$("#rno"+rno).replaceWith(html);
	});
	
	$(document).on("click","a[name='editReplyBtn']", function(){
		
		if(document.getElementById("replyEditContent").value.length == 0){
			alert('댓글을 입력해주세요.');
		} else {
		
			var info_reply_no=$(this).attr("data-rno");
	
			var info_reply_content=$("#replyEditContent").val();
			
			$.ajax({
				type:'put',
				url:'/reply/info/'+info_reply_no+'.do',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data:JSON.stringify({
					info_reply_content:info_reply_content
				}),
				dataType:'text',
				success:function(result){
					if(result=='SUCCESS'){
						alert('댓글이 수정되었습니다.');
						getAllList();
					}
				}
			});
		}
	});	
	
	$('#replyBtn').on("click",function(){ 
		
		if(document.getElementById("replyContent").value.length == 0){
			alert('댓글을 입력해주세요.');
		} else {
			
		var info_reply_writer_id=("${login_id}");
		var info_reply_writer_nick=("${login_nick}");
		var info_reply_content=$('#replyContent').val();
		
			$.ajax({		
				type : 'post', 
				url : '/reply/info.do',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					info_board_no : info_board_no,
					info_reply_writer_id : info_reply_writer_id,
					info_reply_writer_nick : info_reply_writer_nick,
					info_reply_content : info_reply_content		
				}),
				success : function(result) {
					if(result == 'success') {
						alert('댓글이 등록되었습니다!');
						location.reload();
						getAllList();
					}
				}
			});
		}
	});
});

</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/client/include/header.jsp"/>
	
	<div style="width:max-width">
		<div style="width:1050px; margin:0 auto;">
			<table>
				<tr>
					<td style="height:95px"><jsp:include page="/WEB-INF/views/client/main/login.jsp"/></td>
					<td rowspan="3">
						<div class="l" style="width:739px; height:max-height; margin-left:20px; padding-left:33px; padding-top:10px; padding-bottom:20px;">
							<table class="comTable" style="width:652px;">
								<tr>
									<th>${board.info_board_title}</th>
								</tr>
								<tr>
									<td style="text-align: right; border:0">${board.info_board_writer_nick}(${board.info_board_writer_id}) | ${board.info_board_date} | ${board.info_board_hit}</td>
								</tr>
								<tr>
									<td style="text-align: left; padding:15px;">${board.info_board_content}</td>
								</tr>
								<c:if test="${not empty board.info_board_origin_file}">
								<tr>
									<td style="background-color: #ECF7F6; text-align: left; padding-left:15px;">
									
									첨부파일 : <a href="/community/infoFileDownload.do?info_board_no=${board.info_board_no }">${board.info_board_origin_file}</a>
									</td>
								</tr>
								</c:if>
								<tr>
									<td style="padding:0px; background-color: #ECF7F6">
										<table style="width:652px;" class="replies"></table>
										<textarea id="replyContent" style="margin-top:5px;" rows="5" cols="85"></textarea><br>
										<button class="replyBtn" style="margin-bottom:5px" id="replyBtn">댓글 입력</button>
									</td>
								</tr>
								<tr>
									<td style="text-align: right; border:0">
									<c:if test="${board.info_board_writer_id eq login_id}">
									<button type="button" onclick="
									if(confirm('삭제하시겠습니까?')){
									alert('삭제 되었습니다.');
									location.href='/community/infoboard_delete.do?info_board_no=${board.info_board_no}';}"
									style="width:50px; height:30px;">삭제</button>
									<button type="button" onclick="location.href='/community/infoboard_edit.do?info_board_no=${board.info_board_no}'"
									style="width:50px; height:30px;">수정</button>
									</c:if>
									<button type="button" onclick="history.back(-1);"
									style="width:50px; height:30px;">뒤로</button>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align:top"><jsp:include
							page="/WEB-INF/views/client/main/con_menu2.jsp" /></td>
			</table>		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/client/include/footer.jsp"/>
	
</body>
</html>