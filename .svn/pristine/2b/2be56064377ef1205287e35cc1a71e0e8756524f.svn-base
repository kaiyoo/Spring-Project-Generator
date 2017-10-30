<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/wizardP1.js"></script>
</head>
<body>
 <section id="section" class="container">
		<div class="center">
		      <ul class="procedure">
		         <li id="projectNav" class="nav-select">Project</li>
		         <li id="mavenNav" class="nav-unselect">Maven</li>
		         <li id="springNav" class="nav-unselect">Spring</li>
		         <li id="generatorNav" class="nav-unselect">Generator</li>
		      </ul>
   		</div>
		<form name="wizardP1Form" method="post" class="form-horizontal well bs-component" 
			<c:if test="${empty projectInfo}">
				action="${pageContext.request.contextPath}/wizard/insertWizardP1.do"
			</c:if>
			<c:if test="${not empty projectInfo}">
				action="${pageContext.request.contextPath}/wizard/updateWizardP1.do"
			</c:if>
		>
				<fieldset>
					<div>
						<input type="hidden" name="pr_grp_no" value="${projectInfo.pr_grp_no}"/>
						<input type="hidden" name="pr_no" value="${projectInfo.pr_no}"/>
						<table class="wizard">
							<colgroup>
								<col width="45%">
								<col width="10%">
								<col width="35%">
							</colgroup>
							<tr>
								<td colspan="3" >
									<table>
										<tr>
											<th style="width:20%; margin: auto;" class="padding right">
												<span class="action-button blue right">Project Name</span>
											</th>
											<td style="width: 30%;padding-left: 20px;">
												<input style="width:50%" class="i_text" type="text" name="pr_name" value="${projectInfo.pr_name}"/>
											</td>
										</tr>
										<tr>
											<th class="padding right">
												<span class="action-button blue">Base Package</span>
											</th>
											<td style="width: 30%;padding-left: 20px;">
												<input style="width:50%"  class="i_text" type="text" name="pr_pkg_nm" value="${projectInfo.pr_pkg_nm}" />
											</td>
										</tr>
										<tr>
											<th class="padding right">
												<span class="action-button blue">Group ID</span>
											</th>
											<td style="width: 30%;padding-left: 20px;">
												<select style="width:35%">
												  <option value="search-all">ZICO</option>
												  <option value="search-title">PO</option>
												</select>
											</td>
										</tr>
									</table>
								</td>
								
							</tr>
							<tr>
								<td class="next" colspan="2" style="text-align: left">
									<input type="button" class="btnLeft" name="prev"/>
								</td>
								<td class="next" style="text-align: right">
									<input type="button" class="btnRight" name="next"/>
								</td>
							</tr>										
						</table>
					</div>
				</fieldset>
		</form>
    </section>
</body>
</html>