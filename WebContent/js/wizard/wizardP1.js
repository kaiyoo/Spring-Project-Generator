/**
 * 	wizard js
 */


$(function(){
	
	$('form').each(function(){
		this.reset();
	});
	
	
	$("input[name=next]").click(function() {
		if($('input[name=pr_name').val() == ""){
			alert("프로젝트 이름을 입력하세요.");
			return;
		}else{
			var pr_name=$("input[name=pr_name").val();
			if(!projectCheck(pr_name)){
				alert("처음은 숫자로 입력 될수 없으며 길이는 4~20 입니다.");
				return;
			}
		}
		if($('input[name=pr_pkg_nm]').val()==""){
			alert("지정할 패키지 명을 입력하세요.");
			return;
		}else{
			var pr_pkg_nm = $("input[name=pr_pkg_nm").val();
			if(!projectCheck(pr_pkg_nm)) {
				alert("처음은 숫자로 입력 될수 없으며 길이는 4~20 입니다.");
				return;
			}
		}
		
		$("form[name=wizardP1Form]").submit();
	});
	
		
});
