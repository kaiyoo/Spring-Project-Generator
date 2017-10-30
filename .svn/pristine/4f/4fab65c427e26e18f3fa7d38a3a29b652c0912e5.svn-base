<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/valueInspection.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messageCommons.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons/cookieControl.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		//로그인버튼 클릭시 이벤트
		$('#loginBtn').click(function(){
			var param = '?mem_id='+$('input[id=mem_id]').val()+'&mem_pass='+$('input[id=mem_pass]').val();
			$('form[name=loginForm]').attr('action','${pageContext.request.contextPath}/main/loginCheck.do'+params);
			alert(param);
			$('form[name=loginForm]').submit();
		});
		
		//회원가입버튼 클릭시 이벤트
		$('#joinBtn').click(function(){
			var param = '?mem_id='+$('input[id=mem_id]').val()+'&mem_pass='+$('input[id=mem_pass]').val();
			$('form[name=joinForm]').attr('action','${pageContext.request.contextPath}/param/insertMemberInfo.do'+param);
			$('form[name=joinForm]').submit();
		});
		
		//ID찾기버튼 클릭시 이벤트
		$('a[name=findBtnID]').click(function(){
			$(location).attr('href','${pageContext.request.contextPath}/join/findId.do');
		});

		//PW찾기버튼 클릭시 이벤트
		$('a[name=findBtnPW]').click(function(){
			$(location).attr('href','${pageContext.request.contextPath}/join/findPW.do');
		});
		
	});
	
	function idCheck() {
		if ($('input[name=mem_id]:eq(1)').val() == '') {
			alert($('input[name=mem_id]:eq(1)').val());
		} else {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/join/idCheck.do",
				dataType : "json",
				data : {
					mem_id : $('input[name=mem_id]:eq(1)').val()
				},
				error : function(result) {
					alert(result);

				},
				success : function(result) {
					if (eval(result.rtn)) {
						$('#idcheck').val('사용가능한 아이디입니다.');
						$('input[name=mem_id]:eq(1)').focus();
					} else {
						$('#idcheck').val('존재하는 아이디입니다.');
						$('input[name=mem_id]:eq(1)').focus();
					}
				}
			});
		};
	};
	
</script>
<style type="text/css">
	.name{
			text-align: left;
			float: left;
		 }
	#check{
			text-align: left;
			float: left;
		 }


</style>
</head>
<body>
<div id="content">
<div id="login-box">
		<c:if test="${empty LOGIN_MEMBERINFO}">	
			<form name="login" action="${pageContext.request.contextPath}/main/loginCheck.do" 
				method="post" >
				<!-- 로그인/회원가입 버튼 -->
				<button type="button" class="btn btn-primary btn-sm"
					data-toggle="modal" data-target="#modal_Login">로그인</button>
				<button type="button" class="btn btn-primary btn-sm"
					data-toggle="modal" data-target="#modal_join">회원가입</button>
			</form>
		</c:if>
		
		<c:if test="${!empty LOGIN_MEMBERINFO}">
			<form name="login" action="${pageContext.request.contextPath}/main/logout.do" 
				method="post">
				<div id="login-box-field">
					<font color="black">${LOGIN_MEMBERINFO.mem_id }</font><br/>
					<font color="black">환영합니다.</font>
				</div>
				<div>
					<button type="submit" class="btn btn-primary btn-sm">로그아웃</button>
				</div>
			</form>
		</c:if>	
	</div>

	
	<!-- 로그인 -->
	<div class="modal" id="modal_Login" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h2 class="modal-title text-center fc-orange">Log in</h2>
				</div>
				<div class="modal-body">
					<form id="fo_login_widget" name="loginForm" method="post" action="${pageContext.request.contextPath}/main/loginCheck.do"
						ruleset="@login" role="form" class="clearfix">
						<fieldset id="acField">
							<div class="login-bar hidden-xs"></div>
							<div class="login-right">
								<div class="form-group">
									<label class="name" for="mem_id">아이디</label> 
									<input name="mem_id" id="mem_id" required class="form-control" placeholder="Your Id" />
								</div>
								<div class="form-group">
									<label class="name" for="mem_pass">비밀번호</label> 
									<input type="password" name="mem_pass" id="mem_pass" class="form-control" required placeholder="Your Password" />
								</div>

								<button type="submit" class="btn btn-warning btn-block"
									id="loginBtn">로그인</button>
								<div>
									<button type="button" name="IDbtn" 
										class="btn btn-primary btn-sm" data-toggle="modal"
										data-target="#modal_ID">ID찾기</button>
									<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_PW">PW찾기</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- ID찾기 -->
	<div class="modal" id="modal_ID" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h2 class="modal-title text-center fc-orange">ID찾기</h2>
				</div>
				<div class="modal-body">
					<form id="fo_login_widget" name="loginForm" method="post"
						action="${pageContext.request.contextPath}/join/loginCheck.do"
						ruleset="@login" role="form" class="clearfix">
						<fieldset id="acField">
							<div class="login-bar hidden-xs"></div>
							<div class="login-right">
								<div class="form-group">
									<label class="name" for="mem_mail">이메일주소</label> 
									<input type="email" name="mem_mail" id="mem_mail" required class="form-control" placeholder="Your Email" />
								</div>
								<button type="submit" class="btn btn-warning btn-block" id="loginBtn">이메일 전송</button>
								<ul class="help list-unstyled list-inline">
								</ul>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- 회원가입 -->
	<div class="modal" id="modal_join" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h2 class="modal-title text-center fc-orange">Join</h2>
				</div>
				<div class="modal-body">
					<form id="fo_login_widget" name="loginForm" method="post"
						action="${pageContext.request.contextPath}/join/insertMemberInfo.do"
						ruleset="@login" role="form" class="clearfix">
						<fieldset id="acField">
							<div class="login-bar hidden-xs"></div>
							<div class="login-right">
								<div class="form-group">
									<label class="name" for="mem_id">아이디</label> 
									<input name="mem_id" id="mem_id" required class="form-control" placeholder="Your Name" />
									<a id="check" href="javascript:idCheck();">[ID 중복검사]</a>
									<input id="idcheck" border="none" disabled="disabled"></input>	
								</div>
								<br/>
								<div class="form-group">
									<label class="name" for="mem_mail">이메일주소</label> 
									<input type="email" name="mem_mail" id="mem_mail" required class="form-control" placeholder="Your Email" />
									<a id="check" href="#">[이메일 인증]</a>
								</div>
								<br/>
								<div class="form-group">
									<label class="name" for="mem_pass">비밀번호</label> 
									<input type="password" name="mem_pass" id="mem_pass" class="form-control" required placeholder="Your Password" />
								</div>
<!-- 								<div class="form-group"> -->
<!-- 									<label class="name" for="mem_pass"></label> <input type="password" -->
<!-- 										name="mem_pass" id="mem_pass" class="form-control" required -->
<!-- 										placeholder="Your Password Confirm" /> -->
<!-- 								</div> -->
								<button type="submit" class="btn btn-warning btn-block" id="joinBtn">가입</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>	


</body>
</html>