/**
 * index
 */
$(function(){
	
	$(".btn-login").click(function() {
		$("form[name=loginForm]").each(function() {
			this.reset();
		});
	});
	
	$(".btn-join").click(function() {
		$("form[name=joinForm]").each(function() {
			this.reset();
			$(".pwCheckResult font, .pwConfirmResult font").empty();
		});
	});
	
	$("#findBtn").click(function() {
		$("form[name=findForm]").each(function() {
			this.reset();
		});
	});
	
	// ID 찾기
	$("button[name=findID]").click(function() {
		if ($("input[name=mem_mail]:eq(0)").val() == "") {
			alert("이메일을 입력하시오.");
		} else {
			$.ajax({
				type : "post",
				url : getContextPath() + "/main/findID.do",
				dataType : "json",
				data : {
					mem_mail : $("input[name=mem_mail]:eq(0)").val()
				},
				error : function(result) {
						alert(result);
				},
				success : function(result) {
					
					//Controller에서 받아온 rtn값 체크.
					if (eval(result.rtn)) {
						$("#viewID").val("아이디가 존재하지 않습니다.");
						$("input[name=mem_mail]:eq(0)").focus();
					} else {
						
						//이메일값에 해당하는 아이디값 호출.
						$("#viewID").val("아이디는 " + result.mem_id + "입니다.");
						$("input[name=mem_mail]:eq(0)").focus();
					}
				}
			});
		}
	});
	
	// PW 찾기
	$("button[name=findPW]").click(function() {
		if ($("input[name=mem_mail]:eq(0)").val() == "") {
			alert("이메일을 입력하시오.");
		} else {
			$.ajax({
				type : "post",
				url : getContextPath() + "/main/findPW.do",
				dataType : "json",
				data : {
					mem_mail : $("input[name=mem_mail]:eq(0)").val()
				},
				error : function(result) {
				},
				success : function(result) {
					
					//Controller에서 받아온 rtn값 체크.
					if (eval(result.rtn)) {
						alert("이메일이 전송되었습니다.");
					} else {
						alert("존재하지 않는 이메일입니다.");
					}
				}
			});
		}
	});
	
	// PW 확인
	$("input[name=mem_pass]:eq(1), #check_mem_pass").keyup(function() {
		if($("input[name=mem_pass]:eq(1)").val().length > 0) {
			if (pwdCheck($("input[name=mem_pass]:eq(1)").val())) {
				$(".pwCheckResult font").empty().append("[사용 가능]").css("color", "blue");
			} else {
				$(".pwCheckResult font").empty().append("[사용 불가]").css("color", "red");				
			}
			if($("#check_mem_pass").val().length > 0) {
				if($("input[name=mem_pass]:eq(1)").val() == $("#check_mem_pass").val()) {
					$(".pwConfirmResult font").empty().append("[비밀번호 일치]").css("color", "blue");
					$("#pwCheckYn").val("Y");
				} else {
					$(".pwConfirmResult font").empty().append("[비밀번호 불일치]").css("color", "red");
					$("#pwCheckYn").val("N");
				}
			} else {
				$(".pwConfirmResult font").empty();
				$("#pwCheckYn").val("N");
			}
		} else {
			$("#pwCheckYn").val("N");
			$("#check_mem_pass").val("");
			$(".pwCheckResult font, .pwConfirmResult font").empty();
		}
	});
	
	//로그인 버튼 클릭시 이벤트
	$("#loginBtn").click(function() {
		if ($("input[name=mem_id]:eq(0)").val() == "" ) {
			alert("아이디를 입력하시오.");
			$("input[name=mem_id]:eq(0)").focus();
			return false;
		}
		if ($("input[name=mem_pass]:eq(0)").val() == "" ) {
			alert("비밀번호를 입력하시오.");
			$("input[name=mem_pass]:eq(0)").focus();
			return false;
		} 

		$.ajax({
			type : "post",
			url : getContextPath() + "/main/loginCheck.do",
			dataType : "json",
			data : {
				mem_id : $("input[name=mem_id]:eq(0)").val(),
				mem_pass : $("input[name=mem_pass]:eq(0)").val()
			},
			error : function(result) {
			},
			success : function(result) {
				//Controller에서 받아온 rtn값 체크.
				if (eval(result.flag)) {
					alert("회원 정보가 없습니다.");
					$("input[name=mem_id]:eq(0)").val("");
					$("input[name=mem_pass]:eq(0)").val("");
					$("input[name=mem_id]:eq(0)").focus();
				} else {
					location.reload();
				};
			}
		});
	});
	
	// logout
	$("#logoutBtn").click(function(){
		if(confirm("로그아웃하시겠습니까?")) {
			$(location).attr("href", getContextPath() + "/main/logout.do");
		}
	});
	
	// 아이디 체크.
	$("#idCheck").click(function() {
		//아이디값 null 비교.
		if($("input[name=mem_id]:eq(1)").val() == "") {
			alert("아이디를 입력하시오");
			$("input[name=mem_id]:eq(1)").focus();
			return false;
		} else {
			var id = $("input[name=mem_id]:eq(1)").val();
			
			//valueInspection.js에서 아이디 정규식 체크.
			if (idChecked(id)) {
				$.ajax({
					type : "post",
					url : getContextPath() + "/join/idCheck.do",
					dataType : "json",
					data : {
						mem_id : $("input[name=mem_id]:eq(1)").val()
					},
					error : function(result) {
					},
					success : function(result) {
						
						//Controller에서 받아온 rtn값 체크.
						if (eval(result.rtn)) {
							$(".idCheckResult font").empty().append("사용 가능합니다.").css("color", "blue");
							$("#idCheckYn").val("Y");
						} else {
							$(".idCheckResult font").empty().append("이미 사용중입니다.").css("color", "red");
							$("input[name=mem_id]:eq(1)").focus();
						};
					}
				});
			} else {
				alert("아이디 형식이 잘못되었습니다.\n영문 또는 숫자 5 ~ 20자 사이로 입력하시오.");
				$("input[name=mem_id]:eq(1)").val("");
			}
		}
	});
	
	// Join 창에서 아이디 변경시 idCheck 유무 초기화
	$("input[name=mem_id]:eq(1)").keyup(function() {
		$("#idCheckYn").val("N");
	});
	
	
	var code = -1;				// 인증키
	var mailCheckYn = false;	// 메일 인증 여부
	
	$("#send_mail").click(function() {
		if ($("input[name=mem_mail]:eq(1)").val() != "") {
			$.ajax({
				type : "post",
				url : getContextPath() + "/join/emailCheck.do",
				dataType : "json",
				data : {
					mem_mail : $("input[name=mem_mail]:eq(1)").val()
				},
				error : function(result) {
					alert("메일 발송 오류!");
				},
				success : function(result) {
					if (eval(result.rtn)) {
						alert("인증번호가 전송되었습니다.");
						//인증코드 호출.
						code = result.randomNumber1;
						$("input[name=mem_mail]:eq(1)").focus();
					} else{
						alert("존재하는 이메일입니다.");
						$("input[name=mem_mail]:eq(1)").val("");
						$("input[name=mem_mail]:eq(1)").focus();
					}
				}
			});
		} else {
			alert("이메일을 입력하시오.");
		}
	});

	// 이메일 인증번호 확인 체크.
	$("#mailCheck").click(function() {
		var number = $("input[id=check_number]").val();

		//입력한 인증코드값이 null인지 비교.
		if(number != "") {
			
			//메일 인증코드와 입력한 인증코드값이 일치한지 비교.
			if(number == code) {
				alert("인증되었습니다.");
				$("input[name=mem_mail]:eq(1)").prop("readonly",true);
				$("input[id=check_number]").prop("readonly",true);

				//두 값이 일치하면 true.(가입할 때 필요.)
				mailCheckYn = true;
			} else {
				alert("잘못된 인증번호입니다.");
				$("input[id=check_number]").val("");
				$("input[id=check_number]").focus();
				mailCheckYn = false;
			}
		} else {
			alert("인증번호를 입력하시오.");
			mailCheckYn = false;
		}
	});

	$("#joinBtn").click(function() {
		if($("#idCheckYn").val() != "Y") {
			alert("아이디를 확인 하세오.");
			$("input[name=mem_id]:eq(1)").val("");
			$("input[name=mem_id]:eq(1)").focus();
			return false;			
		}
		if($("#pwCheckYn").val() != "Y") {
			alert("비밀번호를 확인 하세요.");
			$("input[name=mem_pass]:eq(1)").val("");
			$("#check_mem_pass").val("");
			$("input[name=mem_pass]:eq(1)").focus();
			return false;			
		}
		if(!mailCheckYn) {
			alert("메일을 인증해야 합니다.");			
			$("input[name=mem_mail]:eq(1)").focus();
			return false;
		}
		
		if(confirm("가입하시겠습니까?")) {			
			$("form[name=joinForm]").submit();
		}	
	});
	
});

