/**
 * groupList
 */
$(function(){
	    //Default Action
	    $(".tab_content").hide(); //Hide all content
	    $("ul.groupTabs li:first").addClass("active").show(); //Activate first tab
	    $(".tab_content:first").show(); //Show first tab content
	     
	    //tab버튼 클릭 이벤트
	    $("ul.groupTabs li").click(function() {
	        $("ul.groupTabs li").removeClass("active"); //Remove any "active" class
	        $(this).addClass("active"); //Add "active" class to selected tab
	        $(".tab_content").hide(); //Hide all tab content
	        var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
	        $(activeTab).fadeIn(); //Fade in the active content
	        return false;
	    });
	    
	    //등록 tab숨기기.
	    $("ul.groupTabs li:eq(2)").hide();
	    
	    //삭제.
//	    $("input[name=btn_delete]").click(function() {
//			var checkedGroupInfo = "";
//			$("input[name=checkbox]").each(function() {
//				if($(this).is(":checked")) {
//					checkedGroupInfo += (checkedGroupInfo != "" ? "," + $(this).val() : $(this).val());   
//				}
//			});
//			if(checkedGroupInfo == "") {
//				alert("삭제 항목을 선택하시오.");
//			} else {
//				if(confirm("선택된 항목을 삭제하시겠습니까?")) {
//					$(location).attr("href"
//							, getContextPath() + "/management/deleteAllGroupInfo.do?grp_no=" + checkedGroupInfo);
//				}
//			}
//		});
	    
	    //groupList tab의 write버튼 누르면 등록 tab으로 이동.
	    $(".btn-write").click(function(){
	    	 $(".tab_content").hide();
	    	 $("ul.groupTabs li:first").addClass("active").show();
	    	 $(".tab_content:eq(2)").show();
		});
	    
	    //등록 tab의 목록버튼 누르면 groupList tab으로 이동.
	    $("#list_btn").click(function(){
	    	$(".tab_content:eq(2)").hide();
	    	$(".tab_content:first").show(); //Show first tab content
	    	
	    });
	    
	    //등록 tab의 등록버튼 누르면 submit처리.
	    $("#groupFormBtn").click(function(){
	    	$("form[name=groupForm]").submit();
	    });
	 
});