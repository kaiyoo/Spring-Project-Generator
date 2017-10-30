/**
 * wizardG
 */
$(function(){
	// 테이블 정보 조회
	$("input[name=btnTableLoad]").click(function() {
		var valueCheck = true;
		var message = "";
		$(".db_account_info input[type=text]").each(function() {
			if($(this).val() == "") {
				message += (message == "" ? 
								$(this).parent().prev().html() : ", " + $(this).parent().prev().html());
				$(this).focus();
				valueCheck = false;
			} 
		});
		
		if(valueCheck) {
			setTableList();		
		} else {
			alert(message + " 항목을 입력하세요.");
		}
	});
	
	// 파일 생성 전체 선택/해제
	$("body").on("click", "input[name$=allChecked]", function() {
		$(this).toggleClass("checked");
		if($(this).attr("class") == "checked") {
			$(this).parent().prevAll().find("input[type=checkbox]").prop("checked", true);
		} else {
			$(this).parent().prevAll().find("input[type=checkbox]").prop("checked", false);
		}
	});
	
	// 모달 컬럼 추가
	$("#btnColAdd").click(function() {
		var html = "<tr>" +
						"<td>" +
							"<input type=\"checkbox\">" +
						"</td>" +
						"<td>" +
							"<input type=\"text\" name=\"column_name\">" + 
						"</td>" +
						"<td>" +
							"<select name=\"data_type\">" +
								"<option value=\"VARCHAR2\">VARCHAR2</option>" +
								"<option value=\"NUMBER\">NUMBER</option>" +
								"<option value=\"DATE\">DATE</option>" +
								"<option value=\"CLOB\">CLOB</option>" +
								"<option value=\"CHAR\">CHAR</option>" +
							"</select>" + 
						"</td>" +
						"<td>" +
							"<input type=\"text\" name=\"data_size\">" + 
						"</td>" +
						"<td>" +
							"<input type=\"checkbox\" name=\"pk_yn\">" + 
						"</td>" +
						"<td>" +
							"<input type=\"checkbox\" name=\"nullable\" checked>" + 
						"</td>" +
					"</tr>";
		$(".columnList").append(html);
		if($(".columnList").height() == 173) {
			$(".table-info th").css("padding-right", "20px");
			$(".table-info th:first-child").css("padding-right", "0px");
			$(".table-info th:nth-child(6)").css("padding-right", "30px");
		}
	});
	
	// 모달 선택된 컬럼 삭제
	$("#btnColDel").click(function() {
		$(".modal-newtable td:first-child input[type=checkbox]").each(function() {
			if($(this).prop("checked")) {
				$(this).parent().parent().remove();
			}
		});

		if($(".columnList").height() < 173) {
			$(".table-info th").css("padding-right", "0");
		}
	});
	
	// 모달 테이블 추가 컬럼 전체 선택/해제
	$("input[name=checkedAll]").click(function() {
		$(this).toggleClass("checked");
		if($(this).attr("class") == "checked") {
			$(".columnList td:first-child").find("input[type=checkbox]").prop("checked", true);
		} else {
			$(".columnList td:first-child").find("input[type=checkbox]").prop("checked", false);
		}
	});
	
	// 참조테이블 조회
	$("input[name=reference_yn]").click(function() {
		if($(this).prop("checked")) {
			$("#refTableList").prop("disabled", false);
			$.ajax({
				type:"post",
				url:getContextPath() + "/wizard/tableList.do",
				data: $("form[name=dbInfo_form]").serialize(),
				dataType:"json",
				error:function() {
					alert("Failed access to the DB.");
				},
				success:function(result) {
					var html = "";
					$(result).each(function() {
						html += "<option value=\"" + this.table_name + "\">" + this.table_name + "</option>";
					});
					$("#refTableList").empty().append(html);
				}
			});
		} else {
			var html = "<option value=\"\">--------</option>";
			$("#refTableList").empty().append(html);
			$("#refTableList").prop("disabled", true);
		}
	});
	
	// 선택된 참조 테이블의 pk 조회	
	$("#refTableList").change(function() {
		$.ajax({
			type:"post",
			url:getContextPath() + "/wizard/getPkList.do",
			data: $("form[name=dbInfo_form]").serialize() + "&table_name=" + $(this).val(),
			dataType:"json",
			error:function() {
				alert("Failed access to the DB.");
			},
			success:function(result) {
				var html = "";
				$(result).each(function() {
					html += "<tr>" +
								"<td>" + this.table_name + "</td>" +
								"<td>" + this.column_name + "</td>" +
								"<td>" + this.data_type + "</td>" +
								"<td>" + this.data_length + "</td>" +
								"<td>" +
									"<select>" +
										"<option>키선택</option>" +
									"</select>" +
								"</td>" +
							"</tr>";
				});
				$(".reference tbody").empty().append(html);
			}
		});
	});
	
	// 참조테이블 PK와 매핍할 컬럼 조회

});

// 사용자 계정 테이블 조회
function setTableList() {
	$.ajax({
		type:"post",
		url:getContextPath() + "/wizard/tableList.do",
		data: $("form[name=dbInfo_form]").serialize(),
		dataType:"json",
		error:function() {
			alert("Failed access to the DB.");
		},
		success:function(result) {
			var index = 0;
			$(".tableList").empty();
			$(result).each(function() {
				var tableList = "<tr>" +	
									"<td>" + this.table_name + "</td>" +
									"<td><input type=\"checkbox\" name=\"createTblList[" + index + "].pr_ctr_yn\" value=\"Y\"></td>" +
									"<td><input type=\"checkbox\" name=\"createTblList[" + index + "].pr_svc_yn\" value=\"Y\"></td>" +
									"<td><input type=\"checkbox\" name=\"createTblList[" + index + "].pr_dao_yn\" value=\"Y\"></td>" +
									"<td><input type=\"checkbox\" name=\"createTblList[" + index + "].pr_vo_yn\" value=\"Y\"></td>" +
									"<td><input type=\"checkbox\" name=\"createTblList[" + index + "].pr_xml_yn\" value=\"Y\"></td>" +
									"<td><input type=\"checkbox\" name=\"createTblList[" + index + "].allChecked\"></td>" +
								"</tr>";
				
				$(".tableList").append(tableList);
				
				if($(".tableList").height() == 240) {
					$(".file_select_area th:last-child").css("width", "88px").css("padding-right", "20px");
				}
			});
			
			$(".newtable").css("display", "inline-block");
		}
	});
}
