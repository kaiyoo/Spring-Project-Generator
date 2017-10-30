<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#loginBtn').click(function(){
			var param = '?mem_id='+$('input[id=mem_id]').val()+'&mem_pass='+$('input[id=mem_pass]').val();
			$('form[name=loginForm]').attr('action','${pageContext.request.contextPath}/join/loginCheck.do'+params);
			alert(param);
			$('form[name=loginForm]').submit();
			
		});
		$('#joinBtn').click(function(){
			var param = '?mem_id='+$('input[id=mem_id]').val()+'&mem_pass='+$('input[id=mem_pass]').val();
			$('form[name=joinForm]').attr('action','${pageContext.request.contextPath}/param/insertMemberInfo.do'+param);
			$('form[name=joinForm]').submit();
			
		});
		$('a[name=findBtn]').click(function(){
			$(location).attr('href','${pageContext.request.contextPath}/join/findIdPass.do');
		});
		
	});
	
</script>
</head>
<body>
		<!-- 버튼 -->
		<button type="button" class="btn btn-primary btn-lg"
			data-toggle="modal" data-target="#modal_Login">로그인</button>
		<button type="button" class="btn btn-primary btn-lg"
			data-toggle="modal" data-target="#modal_join">회원가입</button>

		
		<!-- 로그인 -->
		<div class="modal" id="modal_Login" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h2 class="modal-title text-center fc-orange">Log in</h2>
					</div>
					<div class="modal-body">
						<form id="fo_login_widget" name="loginForm" method="post" action="${pageContext.request.contextPath}/join/loginCheck.do" ruleset="@login" role="form" class="clearfix">
							<fieldset id="acField">
								<!--
							<div cond="$XE_VALIDATOR_MESSAGE && $XE_VALIDATOR_ID == 'widgets/login_info/skins/default/login_form/1'" class="message {$XE_VALIDATOR_MESSAGE_TYPE}">
								<p>
									
								</p>
							</div>
							-->
								<div class="login-bar hidden-xs"></div>
								<div class="login-right">
									<div class="form-group">
										<label for="mem_id" >이메일주소</label> 
											<input type="email" name="mem_mail" id="mem_mail"  required class="form-control" placeholder="Your Email" />
									</div>
									<div class="form-group">
										<label for="mem_pass">비밀번호</label> 
										<input type="password" name="mem_pass" id="mem_pass" class="form-control"  required placeholder="Your Password" />
									</div>

									<button type="submit" class="btn btn-warning btn-block" id="loginBtn">로그인</button>
									<ul class="help list-unstyled list-inline">
										<li><a name="findBtn" href="#">ID/PW찾기</a></li>
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
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h2 class="modal-title text-center fc-orange">Join</h2>
					</div>
					<div class="modal-body">
						<form id="fo_login_widget" name="loginForm" method="post" action="${pageContext.request.contextPath}/param/insertMemberInfo.do" ruleset="@login" role="form" class="clearfix">
							<fieldset id="acField">
								<!--
							<div cond="$XE_VALIDATOR_MESSAGE && $XE_VALIDATOR_ID == 'widgets/login_info/skins/default/login_form/1'" class="message {$XE_VALIDATOR_MESSAGE_TYPE}">
								<p>
									
								</p>
							</div>
							-->
								<div class="login-bar hidden-xs"></div>
								<div class="login-right">
									<div class="form-group">
										<label for="mem_id">이름</label> 
											<input name="mem_id" id="mem_id"  required class="form-control" placeholder="Your Name" />
									</div>
									<div class="form-group">
										<label for="mem_mail" >이메일주소</label> 
											<input type="email" name="mem_mail" id="mem_mail"  required class="form-control" placeholder="Your Email" />
									</div>
									<div class="form-group">
										<label for="mem_pass">비밀번호</label> 
										<input type="password" name="mem_pass" id="mem_pass" class="form-control"  required placeholder="Your Password" />
										<ul class="help list-unstyled list-inline">
											<li><a href="#">이메일인증</a></li>
										</ul>
									</div>

									<button type="submit" class="btn btn-warning btn-block" id="joinBtn">로그인</button>
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
		
		
		
		
</body>
</html>