/**
 * Spring Nav
 */

$(function(){
	
	$('input[id=projectBtn]').click(function(){
		$(location).attr('href', 
		getContextPath() + "/wizard/wizard.do");
	});
	
	$('input[id=mavenBtn]').click(function(){
		$(location).attr('href', 
		getContextPath() + "/wizard/wizard-M2.do");
	});
	
	$('input[id=springBtn]').click(function(){
		$(location).attr('href', 
		getContextPath() + "/wizard/wizard-S1.do");
	});
	
	$('input[id=mvcBtn]').click(function(){
		$(location).attr('href', 
		getContextPath() + "/wizard/wizard-V1.do");
	});
		
});

