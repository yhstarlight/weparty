function registCheck(){
	var id = $("#id").val();
	var pw = $("#pw").val();
	var pwCheck = $("#pwCheck").val();
	var name = $("#name").val();

	if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $('#pw').val('').focus();
        return false;
    }    

    if(/(\w)\1\1\1/.test(pw)){
        alert('비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#pw').val('').focus();
        return false;
    }
        
    if(pw.search(id) > -1){
        alert("비밀번호에 아이디가 포함되지 않도록 해주세요.");
        $('#pw').val('').focus();
        return false;
    }
    
    if(pw != pwCheck){
    	alert("비밀번호가 일치하지 않습니다.");
    	$('#pw').focus();
    	return false;
    }
    
    if(name==''){
    	alert("이름을 입력해주세요.")
    	$('#user_name').focus();
    	return false;
    }
    
    return true;
}