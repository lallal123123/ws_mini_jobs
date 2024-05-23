/**
 * 
 */
function noticeRegForm(){
	var category = document.getElementById("category").value;
	var title = document.getElementById("title").value;
	var content = document.getElementById("content").value;
	
	if(category === ""){
		alert("카테고리를 선택해주세요.");
		return false;
	}
	
	if(title === "" || content === ""){
		alert("빈칸을 입력해주세요.");
		return false;
	};
	
	return true;
};

function faqRegForm(){
	var category = document.getElementById("category").value;
	var title = document.getElementById("title").value;
	var content = document.getElementById("content").value;
	var memberRadio = document.getElementById("member");
	var companyRadio = document.getElementById("company");
	
	if(category === ""){
		alert("카테고리를 선택해주세요.");
		return false;
	}
	
	if(title === "" || content === ""){
		alert("빈칸을 입력해주세요.");
		return false;
	};
	
	if(!memberRadio.checked && !companyRadio.checked){
		alert("회원타입을 선택해주세요");
		return false;
	};
	
	return true;
}




