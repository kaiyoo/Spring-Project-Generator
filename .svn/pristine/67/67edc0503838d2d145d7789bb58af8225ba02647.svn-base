/**
 * wizard-M2
 */
$(function(){
	
	//즐겨찾기 select box 선택시 input=search에 val값 출력.
	var searchVal = $("input[name=search]");
    $("#jarBookmark").change(function(){
    	searchVal.val($(this).val());
    }).triggerHandler("change");
    
    //검색입력창 초기화&readonly
    searchVal.focus(function(){
    if(searchVal.val() == $("#direct").val()){
    	searchVal.val("");
    	searchVal.prop("readonly", false);
	} else {
		searchVal.prop("readonly", true);
	}
    });
    
    
	//검색버튼 클릭시 이벤트.
	$("input[name=searchBtn]").click(function() {
		//검색버튼 val()값 변수 대입.
		var search = $("input[name=search]").val();
		
		$.ajax({
			type : "post",
			url : getContextPath() + "/wizard/searchJAR.do",
			dataType : "json",
			data : {
				search : search
			},
			error:function(result) {
			           alert(" 에러 ");
			},
			success:function(result) {
				//select box기본값 설정.
				$("#dependency").empty().append("<option disabled selected>선택</option>");        
				if (result != null) {
					//select box에 받은 값(dependency) 넣어줌.
					$(result).each(function(j,dependency) {
						//dependency값을 잘라서 jarName에 대입.
						var jarName = dependency.substring(dependency.lastIndexOf("/")+1);
						//<select>에 <option> html추가.
						$("#dependency").append("<option value='"+dependency+"'>"+jarName+"</option>");        
				});
					
				}else{
					alert("찾는 jar가 없습니다.");
					
				}
			}
		});
	});
	
	
	var index = $("#jarListArea tr").length;
	//추가버튼 클릭시 이벤트.
	$("#addBtn").click(function() {
		var count = 0;
		var selectedJar = $("#dependency option:selected").val();
		var jarName = selectedJar.substring(selectedJar.lastIndexOf("/")+1);
		
		//중복체크 중복시 1추가.
		$("#jarListArea input[name$=pr_grp_id]").each(function() {
			if($(this).val() == selectedJar) {
				count++;
			}
		});
		
		if(count == 0) {
			var html = "<tr><td width=\"10%\"><input type=\"checkbox\" id=\"delete\" class=\"check\" name=\"" + index + "\" />" +
			"</td><td width=\"65%\"><input type=\"hidden\" name=\"jarList[" + index + "].pr_grp_id\" value=\"" + selectedJar + "\">" + jarName +
			"</td><td width=\"25%\"><input type=\"checkbox\" class=\"check\" id=\"check\" name=\"jarList[" + index + "].pr_prop_yn\" value=\"Y\" /></td></tr>";
			$("#jarListArea").append(html);
			index++;
			 
			if(index > 2) {
				$(".dependency th:last-child").css("width", "72px");
		    	$(".dependency table").css("width", "472px");
			}
		}
	});

	
	$("#checkAll").click(function(){
        //클릭되었으면
		if($("#checkAll").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다.
			$("input[id=delete]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우.
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[id=delete]").prop("checked",false);
		}
    });
	
	
	//삭제버튼 클릭시 이벤트.
	$("#removeBtn").click(function() {
		var checked = $("input[id=delete]:checked");
		$(checked).parent().parent().remove();
	});
		
	
	//왼쪽next버튼 클릭시 이벤트.
	$("#leftBtn").click(function() {
		$(location).attr("href", getContextPath() + "/wizard/wizardM1.do");
	});
	
	
	//오른쪽next버튼 클릭시 이벤트.
	$("#rightBtn").click(function() {
		if($("#check").length == 0){
			alert = confirm("넘길 데이터가 없습니다. 그래도 넘어가시겠습니까?");
			if (alert == true) {
				$("form[name=wizardM2Form]").submit();
			}
		} else {
			$("form[name=wizardM2Form]").submit();
		}
	});
	
});