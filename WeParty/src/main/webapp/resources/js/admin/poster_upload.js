$("#posterUpload").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $("#prev_poster").attr("src", data.target.result);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });

$("#edit_poster1").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $("#prev_poster1").attr("src", data.target.result);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });

$("#edit_poster2").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $("#prev_poster2").attr("src", data.target.result);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });

$("#edit_poster3").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $("#prev_poster3").attr("src", data.target.result);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });

$("#edit_poster4").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $("#prev_poster4").attr("src", data.target.result);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });

$("#edit_poster5").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $("#prev_poster5").attr("src", data.target.result);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });

$("#prev_poster").click(function(){
	$("input[name='add_poster']").click();
})

$("#prev_poster1").click(function(){
	$("#edit_poster1").click();
})

$("#prev_poster2").click(function(){
	$("#edit_poster2").click();
})

$("#prev_poster3").click(function(){
	$("#edit_poster3").click();
})

$("#prev_poster4").click(function(){
	$("#edit_poster4").click();
})

$("#prev_poster5").click(function(){
	$("#edit_poster5").click();
})