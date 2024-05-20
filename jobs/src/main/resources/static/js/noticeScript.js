/**
 * 
 */
function noticeRegForm(){
	var category = document.getElementById("category").value;
	var title = document.getElementById("title").value;
	var content = document.getElementById("content").value;
	
	if(category === "" || title === "" || content === ""){
		alert("빈칸을 입력해주세요.");
		return false;
	};
	
	return true;
};




