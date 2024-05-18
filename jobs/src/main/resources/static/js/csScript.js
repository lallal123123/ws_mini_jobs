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

function isLoggedIn(callback) {
	fetch('/login_status_99')
	.then(response => response.json())
	.then(loggedIn => {
		if (loggedIn) {
			window.location.href = "../write_Form_99";
		} else {
			if(confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?')){
				window.location.href="../members/loginForm";
			}
		}
    	return false;
	});
	return false;	
};

