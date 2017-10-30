/**
 * wizard-S1
 */
$(function(){
	
	setPreview();
	
	$("input[name=pr_ctx_conf_fld]").keyup(function() {
		$(".prev_base_folder").empty().append($(this).val());
	});
	$("input[name=pr_ctx_conf_file]").keyup(function() {
		$(".prev_base_file").empty().append($(this).val());
	});
	$("input[name=pr_svlt_fld]").keyup(function() {
		$(".prev_servlet_folder").empty().append($(this).val());
	});
	$("input[name=pr_svlt_file]").keyup(function() {
		$(".prev_servlet_file").empty().append($(this).val());
	});
	$("input[name=pr_session_time]").keyup(function() {
		$(".prev_session_time").empty().append($(this).val());
	});
	$("input[name=pr_url_ptrn]").keyup(function() {
		$(".prev_url_ptrn").empty().append($(this).val());
	});
	
	/* preview */
	$("input[value=preview]").click(function() {
		setPreview();
	});
	
	$(".btnRight").click(function() {
		$("form[name=webXMLForm]").submit();
	});
	
});

function setPreview() {
	$(".prev_base_folder").empty().append($("input[name=pr_ctx_conf_fld]").val());
	$(".prev_base_file").empty().append($("input[name=pr_ctx_conf_file]").val());
	$(".prev_servlet_folder").empty().append($("input[name=pr_svlt_fld]").val());
	$(".prev_servlet_file").empty().append($("input[name=pr_svlt_file]").val());
	$(".prev_session_time").empty().append($("input[name=pr_session_time]").val());
	$(".prev_url_ptrn").empty().append($("input[name=pr_url_ptrn]").val());
}