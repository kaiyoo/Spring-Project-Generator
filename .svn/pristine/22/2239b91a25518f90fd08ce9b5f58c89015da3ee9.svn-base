$(function(){
	
//	$("#ibatis").click(function(){
//		$("#a1").toggleClass("accordion-toggle");
//		if($(this).is(":checked")){
//			$("#a1").attr("href", "#collapseIbatis");
//			$("#i1").show();
//		}else{
//			$("#a1").attr("href", "#");
//			$("#i1").hide();
//		}
//	});
//	$("#vwResolver").click(function(){
//		$("#a2").toggleClass("accordion-toggle");
//		if($(this).is(":checked")){
//			$("#a2").attr("href", "#collapseVwResolver");
//			$("#i2").show();
//		}else{
//			$("#a2").attr("href", "#");
//			$("#i2").hide();
//		}
//	});	
	
//	$("#a1").toggleClass("accordion-toggle");
	$("#a1").attr("href", "#collapseIbatis");
	$("#i1").show();
//	$("#a2").toggleClass("accordion-toggle");
	$("#a2").attr("href", "#collapseVwResolver");
	$("#i2").show();	

	
	$("#file").click(function(){
//		$("#div3").toggleClass("active");
	});	
	
//	if($("#file").is(":checked")){
//		$("#div3").attr("class", "panel-heading panel-Gray active");
//	}
	
	$("#quartz").click(function(){
//		$("#div4").toggleClass("active");
//		$("#a4").toggleClass("accordion-toggle");
		if($(this).is(":checked")){
			$("#a4").attr("href", "#collapseQuartz");
			$("#i4").show();
		}else{
			$("#a4").attr("href", "#");
			$("#i4").hide();
		}
	});
	
//	if($("#quartz").is(":checked")){
//		$("#div4").attr("class", "panel-heading active");
//		$("#a4").toggleClass("collapsed accordion-toggle");
//		$("#a4").attr("href", "#collapseQuartz");
//		$("#i4").show();
//	}
	
	
/**
 * 1. 메소드명 :  $(".time_tab").click
 * 2. 작성일 : 2015. 12. 12. 오전 11:30:00
 * 3. 작성자 : 유홍상
 * 4. 설명 :  쿼츠에서 탭 바꾸면 css입히고, 선택되었다는 값 매핑
 */ 
	 $(".time_tab").click(function () {
		$(".time_tab").css("font-weight", "").css({"color": "", "background-color":"#0B4961"});
		$(".time_tab").val("");
	    $(this).css("font-weight", "bold").css({"color":"blue", "background-color":"#98133E"});
	    $(this).val("selected");
	 });
	 $(".tab_select").val("selected");
	 
	 
/**
 * 1. 메소드명 : $("form[name=springForm]").submit
 * 2. 작성일 : 2015. 12. 12. 오전 11:33:52
 * 3. 작성자 : 유홍상
 * 4. 설명 :  화면에서 다음 버튼을 클릭하면 폼 submit하면서 정보 체크하고 폼의 값 매핑
 */ 
	$("body").on("click", ".btnRight", function(){
		$('form[name=springForm]').submit();
	});	
	
	$("form[name=springForm]").submit(function (){
		var dayString = "";
		var idVal = "";
		var dayList = [];
		var cron_txt = $("#cron_txt").val();		
		var hour = $("#sel_hour option:selected").val();
		var minute = $("#sel_minute option:selected").val();
		
		//체크박스 값 받기 : 
		$(".ckb").each(function(){
			if($(this).is(":checked")){				
				idVal= $(this).attr("id");
				
				if(idVal == "file"){
					$("#file_yn").val("Y");
				}
				if(idVal == "jndi"){
					$("#ibatis_type").val("jndi");
				}
				if(idVal == "dbcp"){
					$("#ibatis_type").val("dbcp");
				}
				if(idVal == "tiles"){
					$("#tiles_yn").val("Y");
					$("#inter_yn").val("N");
				}
				if(idVal == "autocommit"){
					$("#auto").val("Y");
				}							
				if(idVal == "internalView"){
					$("#inter_yn").val("Y");//test
					$("#tiles_yn").val("N");//test
				}
				//쿼츠를 선택했으면
				if(idVal.indexOf("quartz")!= -1){
					if($("#btn_cron").is(":checked")){	//사용자가 직접 쿼츠 표현식을 알고있으면
						var cron_ex = "cr_" + cron_txt;
						$("#quartz_ex").val(cron_ex); //test
					}
					
					if($("#btn_time").is(":checked")){	// 위에 달력식으로 체크했으면
						if($("#minutes").val() == "selected"){
							var txt_min = $("#txt_min").val();
							var user_ex = "user_n_0 0/" + txt_min + " * 1/1 * ? *";	
							$("#quartz_ex").val(user_ex); //test
						}
						if($("#hourly").val() == "selected"){
							if($("#radio_hour").is(":checked")){
								var txt_hour = $("#txt_hour").val();
								var user_ex = "user_h1_0 0 0/" + txt_hour + " 1/1 * ? *";	
								$("#quartz_ex").val(user_ex); 
							}
							if($("#t_area").is(":checked")){
								var user_ex = "user_h2_0 " + minute + " " + hour + " 1/1 * ? *";	
								$("#quartz_ex").val(user_ex); 
							}
						}
						if($("#daily").val() == "selected"){
							if($("#daily_first").is(":checked")){
								var txt_daily = $("#txt_daily").val();
								idVal += "&" + "time"+ "&" + "0 " + minute + " " + hour +  " 1/" + txt_daily + " * ? *";
								var user_ex = "user_d1_0 " + minute + " " + hour +  " 1/" + txt_daily + " * ? *";	
								$("#quartz_ex").val(user_ex); //test
							}
							if($("#daily_second").is(":checked")){
								idVal += "&" + "time"+ "&" + "0 " + minute + " " + hour + " ? * MON-FRI *";
								var user_ex = "user_d2_0 " + minute + " " + hour + " ? * MON-FRI *";	
								$("#quartz_ex").val(user_ex); //test
							}
						}
						if($("#weekly").val() == "selected"){
							$(".dayckb").each(function(){
								if($(this).is(":checked")){				
									dayVal = $(this).attr("id");
									dayList.push(dayVal);
								}
							});
							for(var i=0; i<dayList.length; i++){
								if(i == dayList.length-1){
									dayString += dayList[i];
								}else{
									dayString += dayList[i] + ",";
								}
							}
							var user_ex = "user_w_0 " + minute + " " + hour + " ? * " + dayString + " *";	
							$("#quartz_ex").val(user_ex); 
						}
						if($("#monthly").val() == "selected"){
							if($("#monthly_first").is(":checked")){
								var monthly_first_date = $("#monthly_first_date").val();
								var monthly_first_month = $("#monthly_first_month").val();
								var user_ex = "user_m1_0 " + minute + " " + hour +  " " 
								  + monthly_first_date + " 1/" + monthly_first_month + " ? *";	
								$("#quartz_ex").val(user_ex); 	
							}
							if($("#monthly_second").is(":checked")){
								var monthly_second_month = $("#monthly_second_month").val();
								var monthly_second_order = $("#monthly_second_order option:selected").val();
								var monthly_second_day = $("#monthly_second_day option:selected").val();
								var user_ex = "user_m2_0 " + minute + " " + hour + " ? 1/" 
								  + monthly_second_month + " " + monthly_second_day + monthly_second_order + " *";	//test
								$("#quartz_ex").val(user_ex); 	
							}
						}
						if($("#yearly").val() == "selected"){
							if($("#yearly_first").is(":checked")){
								var yearly_first_date = $("#yearly_first_date").val();
								var yearly_first_month = $("#yearly_first_month option:selected").val();
								var user_ex = "user_y1_0 " + minute + " " + hour +  " " 
								  + yearly_first_date + " " + yearly_first_month + " ? *";	//test
								$("#quartz_ex").val(user_ex); 	//test
							}
							if($("#yearly_second").is(":checked")){
								var yearly_second_month = $("#yearly_second_month").val();
								var yearly_second_order = $("#yearly_second_order option:selected").val();
								var yearly_second_day = $("#yearly_second_day option:selected").val();
								var user_ex = "user_y2_0 " + minute + " " + hour + " ? " 
								  + yearly_second_month + " " +  yearly_second_day + yearly_second_order + " *";	//test
								$("#quartz_ex").val(user_ex); 	//test
							}
						}				
					}
				}//quartz if문 end
			}//":checked" end 			
		});// 체크박스 선택 : $(".ckb").each(function() end

		
	
		// 쿼츠 선택시 필수사항 미입력시 경고창	
		if($("#quartz").is(":checked")){
			if($("#qz_name").val() == ""){
				alert("쿼츠 클래스명을 입력해주세요");
				return false;
			}
			if($("#qz_path").val() == ""){
				alert("쿼츠 클래스 패스를 입력해주세요");
				return false;
			}
			
			if($("#minutes").val() == "selected"){
				if($("#txt_min").val()==""){
					alert("분을 입력해주세요");
					return false;
				}
			}
			if($("#hourly").val() == "selected"){
				if(!$("#radio_hour").is(":checked") && !$("#t_area").is(":checked")){
					alert("옵션을 선택해주세요");
					return false;
				}
				if($("#radio_hour").is(":checked")){
					if($("#txt_hour").val()==""){
						alert("시간을 입력해주세요");
						return false;
					}
				}
			}
			if($("#daily").val() == "selected"){
				if(!$("#daily_first").is(":checked") && !$("#daily_second").is(":checked")){
					alert("옵션을 선택해주세요");
					return false;;
				}
				if($("#daily_first").is(":checked")){
					if($("#txt_daily").val()==""){
						alert("날을 입력해주세요");
						return false;
					}
				}
			}
			if($("#weekly").val() == "selected"){
				if(!$(".dayckb").is(":checked")){
					alert("요일을 선택해주세요");
					return false;
				}
			}
			if($("#monthly").val() == "selected"){
				if(!$("#monthly_first").is(":checked") && !$("#monthly_second").is(":checked")){
					alert("옵션을 선택해주세요");
					return false;
				}
				if($("#monthly_first").is(":checked")){
					if($("#monthly_first_date").val()==""||$("#monthly_first_month").val()==""){
						alert("날짜를 입력해주세요");
						return false;
					}
				}
				if($("#monthly_second").is(":checked")){
					if($("#monthly_second_month").val()==""){
						alert("날짜를 입력해주세요");
						return false;
					}
				}	
			}
			if($("#yearly").val() == "selected"){
				if(!$("#yearly_first").is(":checked") && !$("#yearly_second").is(":checked")){
					alert("옵션을 선택해주세요");
					return false;
				}
				if($("#yearly_first").is(":checked")){
					if($("#yearly_first_date").val()==""){
						alert("날짜를 입력해주세요");
						return false;
					}
				}
			}		
		}//쿼츠 alert end	
		
	});	//btn_Right submit end
	
	
	 
/**
 * 1. 메소드명 : $("body").on("click",
 * 2. 작성일 : 2015. 12. 12. 오후 11:52:00
 * 3. 작성자 : 유홍상
 * 4. 설명 :  버튼 클릭시 hidden 영역 토글
 */ 
	$("body").on("click", "#quartz", function() {
		if($("#quartz").is(":checked")){
			$("#time_area").show();
			$("#well2").show();
			$("#close").show();
		}else{	//unchecked
			$("#time_area").hide();
			$("#well2").hide();
			$("#close").hide();
		}
	});	
	
	$("#close").click(function(){
		$("#time_area").hide();
		$(this).hide();
	});
	
	$("body").on("click", "#tiles", function() {
		$("#internal_area").hide();	
	 });
	if($("#tiles").is(":checked")){
		$("#internal_area").hide();	
	 };
	$("body").on("click", "#internalView", function() {
		$("#internal_area").show();	
	 });
	

	
	//쿼츠 set Time Schedule의 탭 클릭시 보여지는 화면
	$("#minutes").click(function(){
		$(".area").attr("style", "display:none;");
		$("#radio_minute").prop("checked", true);
		$("#start_time").hide();
		$(".txt_time").val("");
		$(".btn_time").prop("checked", false);
		$(".sel_time").prop("selected", false);
		$("#minutes_area").show();
	});
	
	$("#hourly").click(function(){
		timeZoneClick();
		$("#hourly_area").show();
		$("#radio_start").show();
	});
	
	$("#daily").click(function(){
		timeZoneClick();
		$("#daily_area").show();
	});
	

	$("#weekly").click(function(){
		timeZoneClick();
		$("#weekly_area").show();
	});

	$("#monthly").click(function(){
		timeZoneClick();
		$("#monthly_area").show();
	});

	$("#yearly").click(function(){
		timeZoneClick();
		$("#yearly_area").show();
	});
	
});//$(fn) end


/**
 * 1. 메소드명 : timeZoneClick
 * 2. 작성일 : 2015. 12. 12. 오후 11:53:00
 * 3. 작성자 : 유홍상
 * 4. 설명 :  쿼츠 set time schedule에서 공통으로 쓰이는 부분 function화
 */ 
function timeZoneClick(){
	$(".area").attr("style", "display:none;");
	$("#start_time").show();
	$(".txt_time").val("");
	$(".btn_time").prop("checked", false);
}



