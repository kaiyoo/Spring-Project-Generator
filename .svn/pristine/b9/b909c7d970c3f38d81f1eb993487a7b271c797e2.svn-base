/**
 * MVC Nav
 */

$(function(){
	$("input[name=add_tbl]").hide();
	
	
	var oracleChk = "";
	var user_host = "";
	var user_port = "";
	var user_sn = "";
	var user_name = "";
	var user_pass = "";
	
	var serialData = $("form[name=tableForm]").serialize();
	
	/**
	 * Table List Load
	 */
	$("#loadTable").click(function(){
		oracleChk = $(":radio[name='how']:checked").val();
		user_host = $("#user_host").val();
		user_port = $("#user_port").val();
		user_sn = $("#user_sn").val();
		user_name = $("#user_name").val();
		user_pass = $("#user_pass").val();

		if(user_host == "" || user_port == "" || user_sn == "" || user_name == "" || user_pass == ""){
			alert("빈칸을 채워주세요");
			return false;
		}else{
			loadTableAjax();
		}
//		$("form[name=tableForm]").submit();
	});
	
	/**
	 * All Checkbox  클릭 시 해당 tr checkbox 모두 체크
	 */
	$("body").on("click", "#all", function(){
		$(this).parent().siblings().find("input[value=Y]").attr("checked", true);
	});
	
	
	/**
	 * TableCreate
	 */
	var chk_file = "";
	$("body").on("click", "input[value=COMPLETE]", function(){
		$(".chk_each").each(function(){
			$(this).find("input[type=checkbox]").each(function(){
				
				if($(this).prop("checked")){
					$(this).parent().siblings().find("input[id=yn_chk_tbl]").val("Y");
				}else{
					chk_file += "N";
				}
				
			});
		});
		
		$("form[name=tableForm]").submit();
	});
	
	
	/**
	 * 테이블 생성시 Column plus
	 */
	var plusTable = $("#tableAddArea");
	var i = $("#tableAddArea tr").size() + 1;
	$(".plusBtn").click(function(){
		var tableAdd = "";
		tableAdd += '<tr class="table_col" style="text-align: center; border: 1px white solid;">';
		tableAdd += '<td><input type="checkbox" name="rem_chk" id="rem_chk"/></td>';
		tableAdd += '<td><input type="text" name="column_name" id="column_name"/></td>';
		tableAdd += '<td><select name="data_type" id="data_type"><option value="char">char</option><option value="varchar2">varchar2</option><option value="clob">clob</option><option value="number">number</option><option value="date">date</option></select></td>';
		tableAdd += '<td><input type="text" name="data_size" id="data_size"/></td>';
		tableAdd += '<td><input type="checkbox" name="nullable"/></td>';
		tableAdd += '<td><input type="checkbox" name="table_pk" id="table_pk"/></td>';
		tableAdd += '<td><input type="checkbox" name="table_fk" id="table_fk"/></td>';
		tableAdd += '<td colspan="2" style="text-align: center;">';
		tableAdd += '<select name="tbl_name">';
		tableAdd += '<option>TABLE</option></select>';
		tableAdd += '<select name="col_name">';
		tableAdd += '<option>COLUMN</option></select></td></tr>';

		plusTable.append(tableAdd);
		i++;
		return false;
		
	});
	
	/**
	 * 테이블 생성시 Column minus
	 */
	$(".minusBtn").click(function(){
		alert($("input[name=rem_chk]:checked").val());
		if($("input[name=rem_chk]:checked").val() == null){
			alert("삭제할 Column을 선택해주세요");
		}else{
			$.each($("input[name=rem_chk]:checked").closest('tr').remove());
		}
	});
	
	/**
	 * fk 클릭시 TABLE SELECT 활성화
	 */
	$("body").on("click", "input[name=table_fk]", function() {
		var tblType  = $(this).parent().siblings().find("select[name=data_type]").val();
		tblType = tblType.toUpperCase();
		
			if($(this).prop("checked")) {
					var colNm = $(this).parent().siblings().find("input[name=column_name]").val();
					var pos = -1;
					$("input[name=column_name]").each(function(idx) {
						if($(this).val() == colNm) {
							pos = idx;
						}
					});
					if(colNm == ""){
						alert("Column Name을 입력하세요");
						$(this).closest('tr').find("input[name=table_fk]").prop("checked",false);
						return fales;
					}else{
					$.ajax({
						type: "post",
						url: getContextPath() + "/wizard/createTableList.do",
						dataType : "json",
						data : serialData+"&tblType="+tblType,
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						},
						success:function(result){
							$("select[name=tbl_name]:eq(" + pos + ")").empty();
							$("select[name=tbl_name]:eq(" + pos + ")").append("<option value='TABLE'>TABLE</option>");
							$(result).each(function() {
								console.log(this.table_name);
								$("select[name=tbl_name]:eq(" + pos + ")").append("<option value='"+this.table_name+"'>"+this.table_name+"</option>");
							});
						}
						
					});
				}
			}
	});
	
	/**
	 * TABLE SELECT 선택 시 COLUMN SELECT 활성화
	 */
	$("body").on("change", "select[name=tbl_name]", function() {
		var tblNm = ($(this).parent().find("select[name=tbl_name]").val());
		var colNm = $(this).parent().siblings().find("input[name=column_name]").val();
		var pos = -1;
		var loadColumnList = "";
		
		$("input[name=column_name]").each(function(idx) {
			if($(this).val() == colNm) {
				pos = idx;
			}
		});
		
		loadColumnList += "SELECT COLUMN_NAME \n";
		loadColumnList += "FROM  USER_TAB_COLUMNS WHERE 1=1 \n";
		loadColumnList += "AND COLUMN_NAME IN (select C.COLUMN_NAME from USER_CONS_COLUMNS C, USER_CONSTRAINTS S \n";
		loadColumnList += "WHERE C.CONSTRAINT_NAME = S.CONSTRAINT_NAME and S.CONSTRAINT_TYPE = 'P' \n";
		loadColumnList += "AND C.TABLE_NAME = '" + tblNm + "') \n";
		loadColumnList += "AND TABLE_NAME = '" + tblNm + "' \n";
		loadColumnList += "order by TABLE_NAME, COLUMN_ID";
		
		console.log(loadColumnList);
		$.ajax({
			type: "post",
			url: getContextPath() + "/wizard/createColumnList.do",
			dataType : "json",
			data : serialData+"&tblNm="+tblNm+"&loadColumnList="+loadColumnList,
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success:function(result){
				$("select[name=col_name]:eq(" + pos + ")").empty();
				$(result).each(function() {
					console.log(this.column_name);
					$("select[name=col_name]:eq(" + pos + ")").append("<option value='"+this.column_name+"'>"+this.column_name+"</option>");
				});
			}
			
		});
	});
	
	/**
	 * Modal창 테이블 생성 버튼
	 */
	$("input[value=DONE]").click(function() {
		var columnList = "";
		var pkList = "";
		var addQue = "";
		
		addQue = "CREATE TABLE " + $("input[name=table_name]").val() + "\n (";
		$(".table_col").each(function() {
			columnList += (columnList != "" ? ", " : "");
			columnList += $(this).find("input[name=column_name]").val(); 
			columnList += " " + $(this).find("select[name=data_type]").val();
			if($(this).find("select[name=data_type]").val() != "number" 
				&& $(this).find("select[name=data_type]").val() != "date"
				&& $(this).find("select[name=data_type]").val() != "clob") {
				columnList += "(" + $(this).find("input[name=data_size]").val() + ")";
			}
			columnList += " " + ($(this).find("input[name=nullable]").prop("checked") ? "NOT NULL" : "");
			columnList += "\n";
			
			if($(this).find("input[name=table_pk]").prop("checked")) {
				pkList += (pkList != "" ? ", " : "");
				pkList += $(this).find("input[name=column_name]").val();
			}
		});
		
		columnList += ",  CONSTRAINT PK_" + $("input[name=table_name]").val() + " PRIMARY KEY(" + pkList + ") \n";
		
		$("input[name=table_fk]").each(function() {
			if($(this).prop("checked")) {
				columnList += ",  CONSTRAINT FK_" + $("input[name=table_name]").val() + 
				"_" + $(this).parent().siblings().find("select[name=tbl_name]").val() +
				" FOREIGN KEY (" + $(this).parent().siblings().find("input[name=column_name]").val() + ")" +
				" REFERENCES " + $(this).parent().siblings().find("select[name=tbl_name]").val() + 
				"(" + $(this).parent().siblings().find("select[name=col_name]").val() + ") \n"; 
			}
		});
		columnList += ")";
		
		alert(columnList);
		
		$.ajax({
			type : "post",
			url : getContextPath() + "/wizard/createTableInfo.do",
			dataType : "json",
			data : serialData+"&addQue="+addQue+"&columnList="+columnList,
			error:function(){
			},
			success : function(){
			}
			
		});
		loadTableAjax();
	});
	
});

function loadTableAjax(){
	
	var serialData = $("form[name=tableForm]").serialize();

	$("#tableArea").load();
	var index= 0;						
	$.ajax({
		type:"post",
		url:getContextPath() + "/wizard/tableList.do",
		data: serialData,
		dataType:"json",
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success:function(result){
			$("#tableArea").html("");
			var tablehtml = "";
			tablehtml += '';
			tablehtml += '<tr style="background-color: rgba(167, 39, 115, 0.66);">';
			tablehtml += '	<td class="width22" >Table Name</td>                                   ';
			tablehtml += '	<td class="width13" >Dao</td>                                          ';
			tablehtml += '	<td class="width13">Service</td>                                      ';
			tablehtml += '	<td class="width13">Controller</td>                                   ';
			tablehtml += '	<td class="width13">Xml</td>                                          ';
			tablehtml += '	<td class="width13">Vo</td>                                           ';
			tablehtml += '	<td class="width13">All</td>                                          ';
			tablehtml += '</tr>                                                   ';
			$(result).each(function(j, tableInfo){                    
				tablehtml += '<tr height=50px class="chk_each">                                                    ';
				tablehtml += '	<td>'+tableInfo.table_name+'                     ';
				tablehtml += '			<input name="createTblList['+index+'].yn_chk_tbl" id="yn_chk_tbl" type="hidden" value=""> </td>             ';
				tablehtml += '	<td>                                                  ';
				tablehtml += '			<input name="createTblList['+index+'].pr_tbl_nm" type="hidden" value="'+tableInfo.table_name+'">              ';
				tablehtml += '			<input id="dao" name="createTblList['+index+'].pr_dao_yn" type="checkbox" value="Y">              ';
				tablehtml += '	</td>                                                 ';
				tablehtml += '	<td>                                                  ';
				tablehtml += '			<input id="service" name="createTblList['+index+'].pr_svc_yn" type="checkbox" value="Y">          ';
				tablehtml += '	</td>                                                 ';
				tablehtml += '	<td>                                                  ';
				tablehtml += '			<input id="controller" name="createTblList['+index+'].pr_ctr_yn" type="checkbox" value="Y">       ';
				tablehtml += '	</td>                                                 ';
				tablehtml += '	<td>                                                  ';
				tablehtml += '			<input id="xml" name="createTblList['+index+'].pr_xml_yn" type="checkbox" value="Y">              ';
				tablehtml += '	</td>                                                 ';
				tablehtml += '	<td>                                                  ';
				tablehtml += '			<input id="vo" name="createTblList['+index+'].pr_vo_yn" type="checkbox" value="Y">               ';
				tablehtml += '	</td>                                                 ';
				tablehtml += '	<td>                                                  ';
				tablehtml += '			<input id="all" type="checkbox" >              ';
				tablehtml += '	</td>                                                 ';
				tablehtml += '</tr>                                                  ';
				index++;
			});
		$('#tableArea').append(tablehtml);
		$("input[name=add_tbl]").show();
		}
	});
}