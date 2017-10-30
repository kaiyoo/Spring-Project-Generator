$(function(){	
	var board_no = $('#board_no').val();
	var mem_id = $('#login_mem_id').val();
		
	showReplyList(board_no, mem_id);	
	
	
	/**
	 * 1. 메소드명 : showReplyForm
	 * 2. 작성일 : 2015. 11. 30. 오전 10:33:52
	 * 3. 작성자 : 유홍상
	 * 4. 설명 : 댓글 목록에서 개별 댓글에 대한 댓글을 등록하려고 할 때 등록 폼을 토글로 보여준다. 
	 */
	$("body").on("click", "#btn_toggle", function() {
		var reply_no = $(this).siblings('input[name=reply_no]').val();
		$("."+ reply_no).toggle();	
	 });	

	
	/**
	 * 1. 메소드명 : insertReply
	 * 2. 작성일 : 2015. 11. 30. 오전 10:33:52
	 * 3. 작성자 : 유홍상
	 * 4. 설명 : 댓글을 등록하는 ajax
	 */
	$("body").on("click", ".btn_reply", function() {
		if(mem_id == ""){
			alert("로그인해주세요");
			return false;
		}
		
		var btn_id = $(this).attr('id');
		
		if(btn_id == "btn_comment"){	//커멘트 등록
			var jsonStr = $('#commentInsertForm').serialize();		
			
			$.ajax({
				type:"post",
				url:getContextPath() + "/board/insertCommentInfo.do",
				dataType:"json",
				data:jsonStr,
				error:function(result){
				},	
				success:function(result){
					$('#comment_content').val("");
					showReplyList(board_no, mem_id);	
				}
			});
		}else{	//댓글 등록
			var replyForm_id = btn_id;
			var jsonStr = $("."+ replyForm_id).serialize(); 	
			
			$.ajax({
				type:"post",
				url: getContextPath() + "/board/insertReplyInfo.do",
				dataType:"json",
				data:jsonStr,
				error:function(result){
					},	
				success:function(result){
					showReplyList(board_no, mem_id);		
				}
			});	//ajax end			
		}	
	});// 댓글 등록 function end
	
	
	/**
	 * 1. 메소드명 : deleteReply
	 * 2. 작성일 : 2015. 11. 30. 오전 10:33:52
	 * 3. 작성자 : 유홍상
	 * 4. 설명 : 댓글을 삭제하는 ajax
	 */
	$("body").on("click", "#btn_delete", function() {
		var reply_no = $(this).siblings('input[name=reply_no]').val();
		var reply_group = $("form[class=" + reply_no + "] input[name=reply_group]").val();
		var reply_depth = $("form[class=" + reply_no + "] input[name=reply_depth]").val();
		//alert(reply_group);
		//alert(reply_group);
		
		var gubun = '';	
		var answer = window.confirm("정말 삭제하시겠습니까?");
		
		if(answer == true){	
			if(reply_depth==0){
				gubun = "reply_group";
			}else{
				gubun = "reply_no";
			}
			$.ajax({
				type:"post",
				url:getContextPath() + "/board/deleteReplyInfo.do",
				dataType:"json",
				data:{"gubun":gubun, "reply_group":reply_group, "reply_no":reply_no},
				error:function(result){
					alert(result);
				},	
				success:function(result){
					showReplyList(board_no, mem_id);	
				}
			});
		}
	});	//댓글 삭제 function end
	
});//$fn end


/**
 * 1. 메소드명 : showReplyList
 * 2. 작성일 : 2015. 11. 30. 오전 10:50:00
 * 3. 작성자 : 유홍상
 * 4. 설명 : 답글 목록을 ajax로 보여준다.
 */
function showReplyList(board_no, mem_id){
	$.ajax({
		type:"post",
		url : getContextPath()+ "/board/showReplyList.do",
		dataType:"json",
		data:{"board_no":board_no},
		error:function(result){
		},
		success:function(result){
			$('#replyArea').html("");
			var replyhtml = "";
			
			$(result).each(function(k,replyInfo){ 
				//첫번째 tr 시작(td 4개 : 글쓴이, 내용, 등록일, 버튼)
				replyhtml += "<tr>";
				
				//td1 시작 : 글쓴이
				replyhtml += "<td scope=\"col\" style=\"padding-left:20px\" >"; 
				for(var i=0; i<replyInfo.reply_depth; i++){	//뎁스당 들여쓰기
					replyhtml += "&nbsp;&nbsp;&nbsp;";					
				}
				if(replyInfo.reply_depth > 0){	//뎁스가 0보다 크면 화살표 이미지
					replyhtml += " <img src=\"" + getContextPath() + "/images/icons/ico_reply.gif\"/>";
				}
				replyhtml += replyInfo.reply_writer;				
				for(var i=0; i<replyInfo.reply_depth; i++){
					replyhtml += "&nbsp;&nbsp;&nbsp;";					
				}				
				replyhtml += "</td>";	// td1끝	
					
				
				//td2 시작 : 내용
				replyhtml += "<td scope=\"col\" class=\"left\" class=\"reply-content\">";	// td2시작			
				replyhtml += replyInfo.reply_content;				
				replyhtml += "</td>";	//td2 끝
				
				
				//td3 시작 : 등록일
				replyhtml += "<td scope=\"col\" class=\"right\">"; 
				replyhtml += replyInfo.reply_reg_date.split(" ")[0];
				replyhtml += "</td>";	//td3 끝	
							
				
				//td4시작 : 등록버튼, 삭제버튼
				replyhtml += "<td scope=\"col\" class=\"right\">"; 
				if(replyInfo.reply_depth < 1){	// 뎁스 0일때만 댓글 버튼 보이도록
					replyhtml += "<input type=\"button\" align=\"right\" " +
								 "class=\"btn_view\" value=\"댓글달기\" id=\"btn_toggle\"/>";
				}
				replyhtml += "<input type=\"hidden\" value=\"" + replyInfo.reply_no + "\" name=\"reply_no\"/>";
				if(mem_id == replyInfo.reply_writer){
					replyhtml += "<input type=\"button\" align=\"right\" " +
								 "class=\"btn_view\" id=\"btn_delete\" value=\"삭제\"/>";
				}
				replyhtml += "</td>";	//td4 끝
				
				
				replyhtml += "</tr>";	//첫째 tr끝			
				
				//가운데 빈tr(색깔 맞추기 위한 용도)
				replyhtml += "<tr style=\"display:none;\"><td></td></tr>";
				
				//두번째 tr(감춰진 폼)
				replyhtml += "<tr>";
				replyhtml += "<td colspan=\"4\">";
				replyhtml += "<form name=\"replyForm\" class=\"" + replyInfo.reply_no + "\" style=\"display:none;\">";
				replyhtml += "<input type=\"hidden\" name=\"reply_group\" value=\"" + replyInfo.reply_group + "\"/>";
				replyhtml += "<input type=\"hidden\" name=\"reply_depth\" value=\"" + replyInfo.reply_depth + "\"/>";
				replyhtml += "<input type=\"hidden\" name=\"reply_seq\"   value=\"" + replyInfo.reply_seq + "\"/>";
				replyhtml += "<input type=\"hidden\" name=\"reply_board_no\" value=\"" + board_no + "\"/>";
				replyhtml += "<input type=\"hidden\" name=\"reply_writer\" value=\"" + mem_id + "\"/>";
				replyhtml += "<table>";				
				replyhtml += "<tr id=\"comment\" style=\"border-top:1px solid #ccc\";>";	
				replyhtml += "<th style=\"padding-top: 18px\" scope=\"row\" class=\"center\">Comment</th>";
				replyhtml += "<td>";
				replyhtml += "<textarea id=\"reply_content\" name=\"reply_content\" cols=\"50px\"></textarea>";
				replyhtml += "</td>";
				replyhtml += "<th style=\"padding-top: 18px\">";
				//replyhtml += "<img style=\"visibility:hidden\" src=\""+ getContextPath() + "/images/icons/ico_reply.gif\"/>";
				replyhtml += "<input type=\"button\" id=\"" + replyInfo.reply_no + "\" " +
							 "value=\"등록\" class=\"btn_view btn_reply\"/>";
				replyhtml += "</th>";
				replyhtml += "</tr>";				
				replyhtml += "</table>"; 
				replyhtml += "</form>";
				replyhtml += "</td>";
				replyhtml += "</tr>";
				//두번째 tr끝(감춰진 폼)
			});			
		$('#replyArea').append(replyhtml);
		}//success end
	});//ajax end
}// showReplyList end

