/**
 * Spring Nav
 */

$(function(){
	
	$("input[value=XmlPreview]").click(function(){
		$(location).attr('href', 
				getContextPath()+"/wizard/wizard-S2.do");
	});
	
	$("input[value=SpringConf]").click(function(){
		$(location).attr('href', 
				getContextPath()+"/wizard/wizard-S3.do");
	});
	
	$("input[value=webxml]").click(function(){
		$(location).attr('href', 
				getContextPath()+"/wizard/wizard-S1.do");
	});
	
	
});

