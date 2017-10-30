/**
 * boardList
 */
$(function() {
	$(".table td").not(".check").click(function(){
		var board_no = $(this).parent().find("input[type=hidden]").val();
		$(location).attr("href",  getContextPath() + "/board/boardView.do?board_no=" + board_no);
	});
	
	$("#allChecked").click(function() {
		$(this).toggleClass("checked");
		if($(this).attr("class") == "checked") {
			$("input[name=checkbox]").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$("input[name=checkbox]").each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	
	$("input[name=btn_delete]").click(function() {
		var checkedBoardInfo = "";
		$("input[name=checkbox]").each(function() {
			if($(this).is(":checked")) {
				checkedBoardInfo += (checkedBoardInfo != "" ? "," + $(this).val() : $(this).val());   
			}
		});
		if(checkedBoardInfo == "") {
			alert("삭제 항목을 선택하시오.");
		} else {
			if(confirm("선택된 항목을 삭제하시겠습니까?")) {
				$(location).attr("href"
						, getContextPath() + "/board/" + $("#board_gubun").val() + "/deleteAllBoardInfo.do?board_no=" + checkedBoardInfo);
			}
		}
		
	});
	
	$("input[name=btn_insert]").click(function() {
		$(location).attr("href"
				, getContextPath() + "/board/" + $("#board_gubun").val() + "/insertBoardForm.do");
	});

});
