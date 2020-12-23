<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위파티! : 자유게시판 </title>
<link href="/resources/css/client/basic.css" rel="stylesheet" />
<link href="/resources/css/client/board_list.css" rel="stylesheet" />
<script src="/resources/js/jquery.js"></script>
<style type="text/css">
a.f {font-weight:bold;}

a.reply{color: gray; text-decoration: none;}

</style>
<script>

var free_board_no = ${board.free_board_no};
var free_board_writer_id= "${board.free_board_writer_id}";
var login_id= "${login_id}";

getAllList();
function getAllList(){ 
	$.getJSON("/reply/freeAll/" + free_board_no + ".do",function(data){
		var str="";
		$(data).each(function(){
			if(free_board_writer_id == this.free_reply_writer_id){
			str+="<tr id='rno"+ this.free_reply_no+"'><td><table class='replyTable'><tr><td><span style='color:#6BC7BF'><b>"+
			this.free_reply_writer_nick+"("+ this.free_reply_writer_id +")</b></span>";
			} else {
				str+="<tr id='rno"+ this.free_reply_no+"'><td><table class='replyTable'><tr><td><span><b>"+
				this.free_reply_writer_nick+"("+ this.free_reply_writer_id +")</b></span>";
			}
			str+=" <span style='font-size:12px'>"+this.free_reply_date+"</span>";
			if(this.free_reply_writer_id == login_id){
				str+="<td class='edit'><a class='reply' href='#' name='editBtn' data-rno='"+this.free_reply_no+"' data-rid='"+this.free_reply_writer_id+
				"' data-rnick='"+this.free_reply_writer_nick+"' data-rcont='"+ this.free_reply_content +"' data-rdate='"+this.free_reply_date+"'>수정</a> ｜ "
				+"<a class='reply' href='#' onclick='del()' name='deleteBtn' data-rno='"+this.free_reply_no+"'>삭제</a></td></tr>";
			} else {
				str+="<td></td></tr>";
			}
				str+="<tr><td colspan='2'>"+ this.free_reply_content + "</td></tr></table></td></tr>";
		});
		$(".replies").html(str);
	});
} 

$(document).ready(function(){
	
	$(document).on("click","a[name='deleteBtn']", function(){
		var free_reply_no=$(this).attr("data-rno");
		
		$.ajax({
			type:'delete',
			url:'/reply/free/'+free_reply_no +'.do',
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
		"<tr><td><span><b>"+rnick+"("+rid+")</b></span><span style='font-size:12px'> "+rdate+"</span></td><td class='edit'>"+
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
		
			var free_reply_no=$(this).attr("data-rno");
	
			var free_reply_content=$("#replyEditContent").val();
			
			$.ajax({
				type:'put',
				url:'/reply/free/'+free_reply_no+'.do',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data:JSON.stringify({
					free_reply_content:free_reply_content
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
			
		var free_reply_writer_id=("${login_id}");
		var free_reply_writer_nick=("${login_nick}");
		var free_reply_content=$('#replyContent').val();
		
			$.ajax({		
				type : 'post', 
				url : '/reply/free.do',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					free_board_no : free_board_no,
					free_reply_writer_id : free_reply_writer_id,
					free_reply_writer_nick : free_reply_writer_nick,
					free_reply_content : free_reply_content		
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
									<th>${board.free_board_title}</th>
								</tr>
								<tr>
									<td style="text-align: right; border:0">${board.free_board_writer_nick}(${board.free_board_writer_id}) | ${board.free_board_date} | ${board.free_board_hit}</td>
								</tr>
								<tr>
									<td style="text-align: left; padding:15px;">${board.free_board_content}</td>
								</tr>
								<tr>
									<td style="padding:0px; background-color: #ECF7F6">
										<table style="width:652px;" class="replies"></table>
										<textarea id="replyContent" style="margin-top:5px;" rows="5" cols="85"></textarea><br>
										<button class="replyBtn" style="margin-bottom:5px" id="replyBtn">댓글 입력</button>
									</td>
								</tr>
								<tr>
									<td style="text-align: right; border:0">
									<c:if test="${board.free_board_writer_id eq login_id}">
									<button type="button" onclick="
									if(confirm('삭제하시겠습니까?')){
									alert('삭제 되었습니다.');
									location.href='/community/freeboard_delete.do?free_board_no=${board.free_board_no}';}"
									style="width:50px; height:30px;">삭제</button>
									<button type="button" onclick="location.href='/community/freeboard_edit.do?free_board_no=${board.free_board_no}'"
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