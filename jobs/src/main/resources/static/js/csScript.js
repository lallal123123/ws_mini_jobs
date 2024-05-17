/**
 * 
 */
function csRegForm(){
	var category = document.getElementById("category").value;
	var title = document.getElementById("title").value;
	var content = document.getElementById("content").value;
	var publicRadio = document.getElementById("public");
	var privateRadio = document.getElementById("private");
	
	if(category === "" || title === "" || content === ""){
		alert("빈칸을 입력해주세요.");
		return false;
	};
	
	if(!publicRadio.checked && !privateRadio.checked){
		alert("공개여부를 선택해주세요");
		return false;
	};
	
	return true;
};