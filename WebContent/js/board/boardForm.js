/**
 * boardForm
 */
$(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "board_content",
	    sSkinURI: getContextPath() + "/smarteditor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2",
	    htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,				
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true
	    }
	});
	$("input[value=등록]").click(function() {
		if($("input[name=board_gubun]").val() == "A") {
			if($("input[name=files]").val() == "" 
				&& $("input[name=orgFileDelYn]").val() == "Y") {
				alert("파일을 추가하시오");
				return false;
			}
		}
		
		oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		
		if($("#gubun").val() == "insert") {
			$("form[name=boardForm]").attr("action", getContextPath() + "/board/insertBoardInfo.do");
		} else {
			$("form[name=boardForm]").attr("action", getContextPath() + "/board/updateBoardInfo.do");
		}
		
		$("form[name=boardForm]").submit();
	});
	$("input[value=목록]").click(function(){
		$(location).attr('href', 
				getContextPath() + "/board/" + $("#board_gubun").val() + "/boardList.do");
	});
	$("input[value=취소]").click(function(){
		$(location).attr('href', 
				getContextPath() + "/board/" + $("#board_gubun").val() + "/boardList.do");
	});
	
	$(".file-delete").click(function(){
		$("input[name=orgFileDelYn]").val("Y");
		$(".btn, .file-delete").hide();
	});
	
	
});