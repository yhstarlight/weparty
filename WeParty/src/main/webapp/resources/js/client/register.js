var popupX=(window.screen.width/2)-(400/2);
var popupY=(window.screen.height/2)-(200/2);

function checkInfo(){
	
	var user_pw = $("#user_pw").val();
	var check_pw = $("#pwCheck").val();
	var user_id = $("#user_id").val();
	var check_id = $("#idCheck").val();
	var user_email = $("#user_email").val();
	var check_email = $("#emailCheck").val();
	var user_name = $("#user_name").val();
	var user_nick = $("#user_nick").val();
	
	if(check_id == 'false') {
		alert('아이디 중복확인을 해주세요.');
		return false;
	}

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
 
    if(user_name==''){
    	alert("이름을 입력해주세요.")
    	$('#user_name').focus();
    	return false;
    }
    
    if(user_nick==''){
    	alert("닉네임을 입력해주세요.")
    	$('#user_name').focus();
    	return false;
    }
    
    if(check_email == 'false'){
    	alert("이메일 인증을 해주세요.");
    	return false;
    }
    
    if($("input:radio[name=user_gender]")==null){
    	alert("성별을 선택해주세요.");
    	return false;
    }
    
    return true;
}

$(document).ready(function(){

	  $("input[name=user_id]").keyup(function(event){ 
	   if (!(event.keyCode >=37 && event.keyCode<=40)) {
	    var inputVal = $(this).val();
	    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	   }
	  });
	});

