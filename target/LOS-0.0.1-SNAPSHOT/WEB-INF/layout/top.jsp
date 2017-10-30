<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>		
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main/index.js"></script>
<header id="header"> 
	<nav class="navbar navbar-inverse"	role="banner">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/LOS/main/index.do">
					<img src="${pageContext.request.contextPath }/images/logo.png" alt="logo">
				</a>
			</div>
			<div class="collapse navbar-collapse navbar-right">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/wizard/wizard-M2.do">Wizard</a></li>
					<li><a href="management.html">Management</a></li>
					<li class="dropdown">
						<a href="/LOS/board/F/boardList.do" class="dropdown-toggle" data-toggle="dropdown">Community 
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="/LOS/board/N/boardList.do">Notice</a></li>
							<li><a href="/LOS/board/F/boardList.do">Board</a></li>
							<li><a href="/LOS/board/Q/boardList.do">QnA</a></li>
							<li><a href="/LOS/board/A/boardList.do">Archive</a></li>
						</ul>
					</li>
					<li><a href="about-us.html">About Us</a></li>
					<c:if test="${!empty LOGIN_MEMBERINFO }">
						<li><a class="btn-slide animation animated-item-3" id="logoutBtn" href="#">Logout</a></li>
					</c:if>
					<c:if test="${empty LOGIN_MEMBERINFO }">
						<li class="btn-login"><a data-toggle="modal" data-target="#modal_Login" href="#">Login</a></li>
						<li class="btn-join"><a data-toggle="modal" data-target="#modal_join" href="#">Sign up</a></li>
					</c:if>
				</ul>
			</div>
		</div>	<!--/.container--> 
	</nav>		<!--/nav--> 
</header>		<!--/header-->
<!-- 모달창 -->
<!-- 로그인 -->
	<div class="modal" id="modal_Login" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="reset" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h2 class="modal-title text-center fc-orange">Log in</h2>
				</div>
				<div class="modal-body">
					<form id="fo_login_widget" name="loginForm" method="post" 
						ruleset="@login" role="form" class="clearfix" >
						<fieldset id="acField">
							<div class="login-bar hidden-xs"></div>
							<div class="login-right">
								<div class="form-group">
									<label class="name" for="mem_id" style="color: black;">아이디</label> 
									<input name="mem_id" id="mem_id" required class="form-control" placeholder="Your Id" />
								</div>
								<div class="form-group">
									<label class="name" for="mem_pass" style="color: black;">비밀번호</label> 
									<input type="password" name="mem_pass" id="mem_pass" class="form-control" required placeholder="Your Password" />
								</div>

								<button type="button" class="btn btn-warning btn-block" id="loginBtn">로그인</button>
								<div>
									<a id="findBtn" class="btn-slide animation animated-item-3" data-toggle="modal" data-target="#modal_ID">ID/PW찾기</a>
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


<!-- ID/PW찾기 -->
	<div class="modal" id="modal_ID" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h2 class="modal-title text-center fc-orange">ID/PW찾기</h2>
				</div>
				<div class="modal-body">
					<form id="fo_find_widget" name="findForm" method="post"
						action="#"
						ruleset="@login" role="form" class="clearfix">
						<fieldset id="acField">
							<div class="login-bar hidden-xs"></div>
							<br>
							<div class="login-right">
								<div class="form-group">
									<label class="name" for="mem_mail" style="color: black;">이메일주소</label> 
									<input type="email" name="mem_mail" id="mem_mail" required class="form-control" placeholder="Your Email" />
									<br>
									<button name="findID" type="button" class="btn btn-warning btn-block" id="idBtn">ID 찾기</button>
									<input id="viewID" disabled="disabled" style="height:25px; width:260px;text-align:center; border: none;"></input>
									<button name="findPW" type="button" class="btn btn-warning btn-block" id="pwBtn">PW 찾기</button>
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


	<!-- 회원가입 -->
	<div class="modal" id="modal_join" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h2 class="modal-title text-center fc-orange">Join</h2>
				</div>
				<div class="modal-body">
					<form id="fo_join_widget" name="joinForm" method="post" 
						action="${pageContext.request.contextPath}/join/insertMemberInfo.do"
						ruleset="@login" role="form" class="clearfix">
						<input type="hidden" id="idCheckYn" value="N"/>
						<fieldset id="acField">
							<div class="login-bar hidden-xs"></div>
							<div class="login-right">
								<div class="form-group">
									<label class="name" for="mem_id" style="color: black;">아이디</label> 
									<input name="mem_id" id="mem_id" required class="form-control" placeholder="Please enter your ID." />
									<a id="idCheck" href="#">[ID 중복검사]</a>&nbsp;&nbsp;
									<span class="idCheckResult"><font></font></span>
								</div>
								<div class="form-group">
									<label class="name" for="mem_pass" style="color: black;">비밀번호</label> 
									<input type="password" id="mem_pass" name="mem_pass" class="form-control" required placeholder="Please enter the password.(5~20)" />
									<input type="password" id="check_mem_pass" class="form-control" required placeholder="Please Re-enter the password." />
									<span class="pwCheckResult"><font></font></span>
									<span class="pwConfirmResult"><font></font></span>
									<input type="hidden" id="pwCheckYn" value="N">									
								</div>
								<div class="form-group">
									<label class="name" for="mem_mail" style="color: black;">이메일주소</label> 
									<input type="email" name="mem_mail" id="mem_mail" class="form-control" placeholder="Please enter the mail." />
									<a id="send_mail" href="#">[인증 메일 발송]</a>
									<input id="check_number" size="4" maxlength="4"/>
									<a id="mailCheck" class="btn-slide animation animated-item-3" href="#">[확인]</a>
								</div>
								<input type="button" id="joinBtn" value="가입" class="btn btn-warning btn-block">가입</button>
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

</html>