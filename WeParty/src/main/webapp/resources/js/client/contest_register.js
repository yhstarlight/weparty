	function ContestRegistCheck(){
		
	
		if( $("input[name=wait_title]").val() == ''){
			alert('공모전 이름을 입력해주세요.');
			return false;
		}
		
		if( $("input[name=wait_host]").val() == ''){
			alert('주최사를 입력해주세요.');
			return false;
		}
		
		if( $("input[name=wait_homepage]").val() == ''){
			alert('홈페이지를 입력해주세요.');
			return false;
		}
		
		if( $("input[name=wait_startdate]").val() == ''){
			alert('시작 날짜를 입력해주세요.');
			return false;
		}
		
		if( $("input[name=wait_enddate]").val() == ''){
			alert('끝나는 날짜를 입력해주세요.');
			return false;
		}		
	
		if(!$(':input:checkbox[name=targetList]:checked').val()) {   
			   alert("대상자를 선택해주세요.");
			   return false; 
			}
		
	    if(!$(":input:radio[name=wait_field]:checked").val()){
	    	alert("분야를 선택해주세요.");
	    	return false;
	    }
	
		if( $("input[name=poster]").val() == ''){
			alert('포스터를 선택해주세요.');
			return false;
		}
		
		if(document.getElementById("content").value.length == 0){
			alert('내용을 입력해주세요.');
			return false;
		}
		
		if(confirm('등록하시겠습니까?')){
			alert('공모전 등록 진행 상황은 마이페이지 > 작성한 글에서 확인하실 수 있습니다.');
			return true;
		}
		return false;
	}