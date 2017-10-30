/**
 * boardView
 */
//$(function() {
//	$("li[name=" + $("#board_gubun").val() + "]").siblings().removeClass("active");
//	$("li[name=" + $("#board_gubun").val() + "]").addClass("active");
//});
$(function(){
	$("input[value=수정]").click(function(){
		$(location).attr('href', 
				getContextPath() + "/board/" + $("#board_gubun").val() + "/updateBoardForm.do?board_no="+$("#board_no").val());
	});
	$("input[value=삭제]").click(function(){
		$(location).attr('href', 
				getContextPath() + "/board/" + $("#board_gubun").val() + "/deleteBoardInfo.do?board_no="+$("#board_no").val());
	});
	$("input[value=목록]").click(function(){
		$(location).attr('href', 
				getContextPath() + "/board/" + $("#board_gubun").val() + "/boardList.do");
	});
	
	
	
});

