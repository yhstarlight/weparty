function editPasswordCheck(){
	var id = $("#id").val();
	var pw = $("#new_pw").val();
	var pwCheck = $("#new_pw_check").val();

	if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
		$("#popup_err2").css("display", "block");
		$("#mask").css("display", "block");
        $('#new_pw').val('').focus();
        return false;
    }    

    if(/(\w)\1\1\1/.test(pw)){
    	$("#popup_err3").css("display", "block");
		$("#mask").css("display", "block");
        $('#new_pw').val('').focus();
        return false;
    }
        
    if(pw.search(id) > -1){
    	$("#popup_err4").css("display", "block");
		$("#mask").css("display", "block");
        $('#new_pw').val('').focus();
        return false;
    }
    
    if(pw != pwCheck){
    	$("#popup_err5").css("display", "block");
		$("#mask").css("display", "block");
    	return false;
    }
    
    return true;
}

function errPopupClose(){
		$("[id *= 'err']").css("display", "none");
		$("#mask").css("display", "none"); 
}

function successPopupClose(){
	window.close();
	opener.parent.location.reload();
}