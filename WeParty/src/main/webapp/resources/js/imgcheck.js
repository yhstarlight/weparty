function imgCheck(obj) {

	var file_kind = obj.value.lastIndexOf('.');
	var file_name = obj.value.substring(file_kind + 1, obj.length);
	var file_type = file_name.toLowerCase();
	var check_file_type = new Array();
	check_file_type = [ 'jpg', 'gif', 'png', 'jpeg', 'bmp', 'tif' ];

	if (check_file_type.indexOf(file_type) == -1) {
		alert('Only image file can be uploaded.');

		var parent_Obj = obj.parentNode;
		var node = parent_Obj.replaceChild(obj.cloneNode(true), obj);

		document.getElementById("file").value = ""; 
		document.getElementById("file").select();
		document.selection.clear(); 

		return false;
	}

}