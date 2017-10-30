<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wizard</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/wizardS1.js"></script>
</head>
<body>
<section id="section" class="container">
	<div class="center">
		<ul class="procedure">
			<li id="projectNav" class="nav-unselect">Project</li>
			<li id="mavenNav" class="nav-unselect">Maven</li>
			<li id="springNav" class="nav-select">Spring</li>
			<li id="generatorNav" class="nav-unselect">Generator</li>
		</ul>
	</div>
	<div class="form-horizontal well bs-component minScreen">
		<div class="left-nav">
			<ul>
				<li class="springNav">web.xml</li>				
				<li class="springNavUn">SpringConf</li>
			</ul>
		</div>
		<div class="folder-prev">
			* Folders, preview
			<div class="preview">
				<table>
					<colgroup>
						<col width="10px;">
						<col width="15px;">
						<col width="100px;">
					</colgroup>
					<tr>
						<td colspan="3">
							▼ <img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/folder (2).png"> WEB-INF
						</td>						
					</tr>
					<tr>
						<td></td>						
						<td colspan="2">
							▷ <img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/folder (2).png"> error
						</td>						
					</tr>
					<tr>
						<td></td>						
						<td colspan="2">
							▷ <img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/folder (2).png"> layout
						</td>						
					</tr>
					<tr>
						<td></td>						
						<td colspan="2">
							▼ <img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/folder (2).png">
							<span class="prev_base_folder">rootContext</span>
						</td>						
					</tr>
					<tr>
						<td></td><td></td>						
						<td>
							<img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/xml.png">													
							<span class="prev_base_file">application</span>-exception.xml
						</td>						
					</tr>
					<tr>
						<td></td><td></td>						
						<td>
							<img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/xml.png">													
							<span class="prev_base_file">application</span>-file.xml
						</td>						
					</tr>
					<tr>
						<td></td><td></td>						
						<td>
							<img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/xml.png">													
							<span class="prev_base_file">application</span>-ibatis.xml
						</td>						
					</tr>
					<tr>
						<td></td>						
						<td colspan="2">
							▼ <img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/folder (2).png">
							<span class="prev_servlet_folder">servletContext</span>
						</td>						
					</tr>
					<tr>
						<td></td><td></td>						
						<td>
							<img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/xml.png">													
							<span class="prev_servlet_file">servlet</span>-doDispatcher.xml
						</td>						
					</tr>
					<tr>
						<td></td><td></td>						
						<td>
							<img width="15px" height="15px" src="${pageContext.request.contextPath}/images/icons/xml.png">													
							<span class="prev_servlet_file">servlet</span>-transaction.xml
						</td>						
					</tr>
				</table> 
			</div>
		</div>
		<div class="spring-conf">
			<form name="webXMLForm" method="post" 
				<c:if test="${empty webXMLInfo}">
					action="${pageContext.request.contextPath}/wizard/insertWebXMLInfo.do"
				</c:if>
				<c:if test="${not empty webXMLInfo}">
					action="${pageContext.request.contextPath}/wizard/updateWebXMLInfo.do"
				</c:if>
				>
				<table>
					<tr>
						<td class="pad5 right">
							<span class="blue">Base Configuration Folder Name</span> 
						</td>
						<td>
							<input name="pr_ctx_conf_fld" maxlength="15" placeholder="rootContext" value="${webXMLInfo.pr_ctx_conf_fld }"/>
						</td>
					</tr>
					<tr>
						<td class="pad5 right">
							<span class="blue">Base Configuration File Name</span> 
						</td>
						<td>		
							<input name="pr_ctx_conf_file" maxlength="15" placeholder="application" value="${webXMLInfo.pr_ctx_conf_file }"/>
						</td>
					</tr>
					<tr>
						<td class="pad5 right">
							<span class="blue">Servlet Folder Name</span>
						</td>
						<td>
							<input name="pr_svlt_fld" maxlength="15" placeholder="servletContext" value="${webXMLInfo.pr_svlt_fld }"/>
						</td>
					</tr>
					<tr>
						<td class="pad5 right">
							<span class="blue">Servlet File Name</span>
						</td>
						<td>	
							<input name="pr_svlt_file" maxlength="15" placeholder="servlet" value="${webXMLInfo.pr_svlt_file }"/>
						</td>
					</tr>
					<tr>
						<td class="pad5 right">
							<span class="blue">Session Time</span>
						</td>
						<td> 
							<input class="half" name="pr_session_time" value="${webXMLInfo.pr_session_time }"/>&nbsp Minutes
						</td>
					</tr>
					<tr>
						<td class="pad5 right">
							<span class="blue">Expansion</span>
						</td>
						<td>
							<input class="half" name="pr_url_ptrn" maxlength="15" value="${webXMLInfo.pr_url_ptrn }"/>
						</td>
					</tr>
					<tr>
						<td class="pad5 right">
						</td>
						<td class="left">	
							<input type="button" class="btn_style" value="preview" data-toggle="modal" data-target="#modal_preview">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="btn-area">
			<div class="btn-left">
				<button class="btnLeft"></button>
			</div>
			<div class="btn-right">
				<button class="btnRight"></button>
			</div>
		</div>
	</div>	
</section>
</body>
<!-- 모달창 -->
<!-- 로그인 -->
<div class="modal" id="modal_preview" tabindex="-1" role="dialog">
	<div class="modal-preview">
		<div class="modal-content">
			<div class="modal-header">
				<span class="left">Preview</span>
				<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body left">
<pre>
	<font>&lt;context-param&gt;</font>
	  <font>&lt;param-name&gt;</font>contextConfigLocation<font>&lt;/param-name&gt;</font>
	  <font>&lt;param-value&gt;</font>/WEB-INF/<span class="prev_base_folder">rootContext</span>/<span class="prev_base_file">application</span>-*.xml<font>&lt;/param-value&gt;</font>
	<font>&lt;/context-param&gt;</font>
	<font>&lt;servlet&gt;</font>
	  <font>&lt;servlet-name&gt;</font>doDispatcher<font>&lt;/servlet-name&gt;</font>
	  <font>&lt;servlet-class&gt;</font>org.springframework.web.servlet.DispatcherServlet<font>&lt;/servlet-class&gt;</font>
	  <font>&lt;init-param&gt;</font>
	    <font>&lt;param-name&gt;</font>contextConfigLocation<font>&lt;/param-name&gt;</font>
	    <font>&lt;param-value&gt;</font>/WEB-INF/<span class="prev_servlet_folder">servletContext</span>/<span class="prev_servlet_file">servlet</span>-*.xml<font>&lt;/param-value&gt;</font>
	  <font>&lt;/init-param&gt;</font>
	<font>&lt;/servlet&gt;</font>
	<font>&lt;servlet-mapping&gt;</font>
	  <font>&lt;servlet-name&gt;</font>doDispatcher<font>&lt;/servlet-name&gt;</font>
	  <font>&lt;url-pattern&gt;</font>*.<span class="prev_url_ptrn">do</span><font>&lt;/url-pattern&gt;</font>
	<font>&lt;/servlet-mapping&gt;</font>
	<font>&lt;session-config&gt;</font>
	  <font>&lt;session-timeout&gt;</font><span class="prev_session_time">30</span><font>&lt;/session-timeout&gt;</font>
	<font>&lt;/session-config&gt;</font>
</pre>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</html>