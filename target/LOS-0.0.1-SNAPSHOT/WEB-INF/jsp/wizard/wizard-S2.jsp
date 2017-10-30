<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wizard</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/wizardSpringNav.js"></script>
</head>
<body>
<section id="section" class="container">
		<div class="center" style="padding-bottom: 10px">
			<button class="btnUnselect" onclick="location.href='wizard.html'">Project</button>
			<button class="btnUnselect" onclick="location.href='wizard-M1.html'">Maven</button>
			<button class="btnSelect" onclick="location.href='wizard-S1.html'">Spring</button>
			<button class="btnUnselect" onclick="location.href='wizard-V1.html'">MVC</button>
		</div>
		<form class="form-horizontal well bs-component minScreen">
			<form>
				<fieldset>
					<div>
						<form>
							<table width="100%" class="wizard"
								style="overflow: auto; min-width: 300px;">

								<tr>

									<th class="padding" colspan="2"
										style="vertical-align: top; padding: 20px;">
										<table>
											<tr>
												<td>
													<input type="button"class="springNavUn" value="webxml"/> 
												</td>
											</tr>
											<tr>
												<td>
													<input type="button"class="springNav" value="XmlPreview"/> 
												</td>
											</tr>
											<tr>
												<td>
													<input type="button"class="springNavUn" value="SpringConf"/> 
												</td>
											</tr>
										</table>
									</th>

									<th style="padding-top: 20px; text-align:left;">
										<a class="action-button blue"
										style="font-size: 20px; width: 150px; margin-left: 20px;">CODE PREBIEW </a> 
										<span class="codeArea"> 
											<textarea class="codeText" rows="100%" cols=100%"></textarea>
										</span>
									</th>
								<tr>
									<td class="next" colspan="2" style="text-align: left">
										<button class="btnLeft" onclick="location.href='wizard.html'"></button>
									</td>
									<td class="next" style="text-align: right">
										<button class="btnRight"
											onclick="location.href='wizard-M2.html'"></button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</fieldset>
			</form>
		</form>
	</section>
</body>
</html>