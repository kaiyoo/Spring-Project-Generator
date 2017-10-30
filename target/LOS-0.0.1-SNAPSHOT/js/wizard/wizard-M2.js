/**
 * wizard-M2
 */
$(function(){
	$("input[name=searchBtn]").click(function(){
		var search = $("input[name=search]").val();
		$.ajax({
			type : "post",
			url : getContextPath() + "/wizard/searchJAR.do",
			dataType : "json",
			data : {
				search : search
			},
			error:function(result){
			           alert(" 에러 ");
			    },
			success:function(result) {
				$("#dependency").empty().append("<option disabled selected>선택</option>");        
				if(result != null){
					$(result).each(function(j,dependency){
						var jarName = dependency.substring(dependency.lastIndexOf("/")+1);
						$("#dependency").append("<option value='"+dependency+"'>"+jarName+"</option>");        
					});
					
				}else{
					alert("찾는 jar가 없습니다.");
					
				}
			}
		});
	});
	
	
	$("input[name=jarBtn]").click(function(){
		var jar = $(this).val();
		var search = $("input[name=search]").val(jar);
		$.ajax({
			type : "post",
			url : getContextPath() + "/wizard/searchJAR.do",
			dataType : "json",
			data : {
				jar : jar
			},
			error:function(result){
				alert(" 에러 ");
			},
			success:function(result) {
				$("#dependency").empty().append("<option disabled selected>선택</option>");        
				if(result != null){
					$(result).each(function(j,dependency){
						var jarName = dependency.substring(dependency.lastIndexOf("/")+1);
						$("#dependency").append("<option value='"+dependency+"'>"+jarName+"</option>");              
					});
					
				}else{
					alert("찾는 jar가 없습니다.");
				}
			}
		});
	});
		
	
	var count = 0;
	$("#addBtn").click(function() {
		count += 1;
		var dependency = $("#dependency option:selected").val();
		alert(dependency);
		var jarName = dependency.substring(dependency.lastIndexOf("/")+1);
		var jarListhtml = "";
		//var count = $("#dependency option:selected").length;
		if(dependency != null){
			
			jarListhtml +=	"<li><input type=\"checkbox\" class=\"check\"" +
							"id=\"c"+count+
							"\" name=\"cc\" value=\""+dependency+"\"/>"+jarName+"</li>";
		} 
		$('#jarListArea').append(jarListhtml);
	});

	
	$("#removeBtn").click(function(){
		var checked = $("input[name=cc]:checked");
		$(checked).parent().remove();
	});
		
	
	
	$("#nextLeft").click(function(){
		$(location).attr('href', 
				getContextPath() + "/wizard/wizard-M1.do");
	});
	$("#nextRight").click(function(){
		$(location).attr('href', 
				getContextPath() + "/wizard/wizard-S1.do");
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});