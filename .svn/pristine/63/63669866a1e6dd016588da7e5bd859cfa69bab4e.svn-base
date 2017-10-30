/**
 * 
 */

$(function(){
		var i=$("#repoListTbody tr").length;
		//ADD 버튼 이벤트
	 	$("input[value=ADD]").click(function() {
	 		if($('input[name=pr_mav_rep_id]').val()=='') {
				alert('Repository ID 를 입력하세요');
				return ;
			}
			if($('input[name=pr_mav_rep_url]').val()==''){ 
				alert('URL를 입력하세요');
				return ; 
			}
			if($('input[name=pr_mav_rep_id]').val()!=''&&$('input[name=pr_mav_rep_url]').val()!='') {	
				var pr_mav_rep_rel="";
				$("input[name=rep_rel]:checked").each(function(){
					pr_mav_rep_rel =$(this).val();
				});
				var pr_mav_rep_snap="";
				$("input[name=rep_snap]:checked").each(function(){
					pr_mav_rep_snap =$(this).val();
				}); 
				
				var html="<tr >"
						+"<td width='9%'><input class='i_text' type='checkbox' name='box'></td>"		
						+"<td width='20%'>"
						+"<input type='hidden' name='mavenList["+i+"].pr_no' value='"+$('input[name=pr_no]').val()+"'/>"
						+"<input type='hidden' name='mavenList["+i+"].pr_mav_rep_id' value='"+$('#pr_mav_rep_id').val()+"' >"
						+$('#pr_mav_rep_id').val()+"</td>"		
						+"<td width='53%'>"
						+"<input  type='hidden' name='mavenList["+i+"].pr_mav_rep_url' value='http://"+$('#pr_mav_rep_url').val()+"'>"+
						"http://"+$('#pr_mav_rep_url').val()+"</td>"		
						+"<td width='15%'><input  type='hidden' name='mavenList["+i+"].pr_mav_rep_rel' value='"+pr_mav_rep_rel+"'>"
						+pr_mav_rep_rel+"</td>"		
						+"<td width='18%'><input  type='hidden' name='mavenList["+i+"].pr_mav_rep_snap' value='"+pr_mav_rep_snap+"'>"
						+pr_mav_rep_snap+"</td>"		
						+"</tr>";
				$("#repoListTbody").append(html);
				i++;
			}
		});
	 	
	 	// REMOVE 버튼 이벤트 
	 	$("input[value=REMOVE]").click(function() {
	 		$("input[name=box]:checked").each(function() {
	 			var tr = $(this).parent().parent();
				tr.remove();
	 		});
	 	});

	 	
	 	//wizardP1 으로 이동
	 	$("input[name=prev").click(function(){
	 		$("form[name=wizardM1Form]").attr("action",getContextPath()+"/wizard/wizardP1.do");
			$("form[name=wizardM1Form]").submit();
	 	});
	 	
	 	
	 	//wizardM2 으로 이동
	 	$("input[name=next]").click(function() {
	 		if($("#repoListTbody tr").length == 0){
	 			alert=confirm("Maven Repository 리스트가 없습니다 진행하시겠습니까?");
	 			if(alert==true){
	 				$("form[name=wizardM1Form]").submit();
	 			}
	 		}else{
	 			$("form[name=wizardM1Form]").submit();
	 		}
		});
});
	
	
	
	
	
