/**
 * MVC Nav
 */

$(function(){
	
	$("#loadTable").click(function(){
		var oracleChk = $(":radio[name='how']:checked").val();
		alert(oracleChk);
		var user_host = $("#user_host").val();
		var user_port = $("#user_port").val();
		var user_sn = $("#user_sn").val();
		var user_name = $("#user_name").val();
		var user_pass = $("#user_pass").val();
		
		if(user_host == "" || user_port == "" || user_sn == "" || user_name == "" || user_pass == ""){
			alert(user_pass);
			alert("빈칸을 채워주세요");
			return false;
		}else{
//			$("form[name=tableForm]").attr("action",
//					getContextPath() + "/wizard/" + oracleChk +"/tableList.do");
			alert(oracleChk);
			$.ajax({
				type:"post",
				url:getContextPath() + "/wizard/" + oracleChk + "/tableList.do",
				dataType:"json",
				data:{"pr_db_host":user_host,"pr_db_port":user_port,
					"pr_db_sn":user_sn,"pr_db_userId":user_name,"pr_db_pass":user_pass},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success:function(result){
					$("#tableArea").html("");
					var tablehtml = "";
					tablehtml += '<tr style="background-color: rgba(167, 39, 115, 0.66);">';
					tablehtml += '	<th>Table Name</th>                                             ';
					tablehtml += '	<td>Dao</td>                                          ';
					tablehtml += '	<td>Service</td>                                      ';
					tablehtml += '	<td>Controller</td>                                   ';
					tablehtml += '	<td>Xml</td>                                          ';
					tablehtml += '	<td>Vo</td>                                           ';
					tablehtml += '	<td>All</td>                                          ';
					tablehtml += '</tr>                                                   ';
					
					$(result).each(function(j, tableInfo){
						console.log(tableInfo.table_name);
						tablehtml += '<tr>                                                    ';
						tablehtml += '	<th>'+tableInfo.table_name+'</th>                     ';
						tablehtml += '	<td>                                                  ';
						tablehtml += '		<section>                                         ';
						tablehtml += '			<input id="dao" type="checkbox">              ';
						tablehtml += '		</section>                                        ';
						tablehtml += '	</td>                                                 ';
						tablehtml += '	<td>                                                  ';
						tablehtml += '		<section>                                         ';
						tablehtml += '			<input id="service" type="checkbox">          ';
						tablehtml += '		</section>                                        ';
						tablehtml += '	</td>                                                 ';
						tablehtml += '	<td>                                                  ';
						tablehtml += '		<section>                                         ';
						tablehtml += '			<input id="controller" type="checkbox">       ';
						tablehtml += '		</section>                                        ';
						tablehtml += '	</td>                                                 ';
						tablehtml += '	<td>                                                  ';
						tablehtml += '		<section>                                         ';
						tablehtml += '			<input id="xml" type="checkbox">              ';
						tablehtml += '		</section>                                        ';
						tablehtml += '	</td>                                                 ';
						tablehtml += '	<td>                                                  ';
						tablehtml += '		<section>                                         ';
						tablehtml += '			<input id="vo" type="checkbox">               ';
						tablehtml += '		</section>                                        ';
						tablehtml += '	</td>                                                 ';
						tablehtml += '	<td>                                                  ';
						tablehtml += '		<section>                                         ';
						tablehtml += '			<input id="all" type="checkbox">              ';
						tablehtml += '		</section>                                        ';
						tablehtml += '	</td>                                                 ';
						tablehtml += '</tr>                                                   ';
					});
				$('#tableArea').append(tablehtml);
				}
			});
		
		
		}
//		$("form[name=tableForm]").submit();
	});
	
	
	$("input[value=DONE]").click(function(){
		$("form[name=tableForm]").each(function(index){
			$("input[name=column_name]").attr("name", "createListVO["+index+"].column_name");
			$("input[name=data_type]").attr("name", "createListVO["+index+"].data_type");
			$("input[name=data_size]").attr("name", "createListVO["+index+"].data_size");
		});
		
		$("form[name=tableForm]").attr("action", getContextPath() + "/wizard/createTableInfo.do");
		$("form[name=tableForm]").submit();
		
		
	});
	
	
	
	
});