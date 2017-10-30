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
													<input type="button"class="springNav" value="webxml"/> 
												</td>
											</tr>
											<tr>
												<td>
													<input type="button"class="springNavUn" value="XmlPreview"/> 
												</td>
											</tr>
											<tr>
												<td>
													<input type="button"class="springNavUn" value="SpringConf"/> 
												</td>
											</tr>
										</table>
									</th>
									<td style="width: 150px; padding-right: 10px;">* You can
										add, remove and rename folder 
									<span class="scrollArea">
											<ul>
												<li><input type="checkbox"/>
														Check Box 1
												</li>
												<li><input type="checkbox"/>
														Check Box 1
												</li>
												<li><input type="checkbox"/>
														Check Box 1
												</li>
												<li><input type="checkbox"/>
														Check Box 1
												</li>
												<li><input type="checkbox"/>
														Check Box 1
												</li>
												<li><input type="checkbox"/>
														Check Box 1
												</li>
											</ul>
									</span>
									</td>
									<td>
										<table>
											<tr>
												<th class="padding left">
													<table>
														<tr>
															<td class="pad5 right"><a
																class="action-button blue"
																style="font-size: 12px; width: 100px;">Base
																	Configuration folder name </a> 
															</td>
															<td>
																<input style="width: 40%" />
															</td>
														</tr>
														<tr>
															<td class="pad5 right"><a
																class="action-button blue"
																style="font-size: 12px; width: 100px;">Base
																	Configuration file name </a> 
															</td>
															<td>		
															<input style="width: 40%" />
															</td>
														</tr>
														<tr>
															<td class="pad5 right"><a
																class="action-button blue"
																style="font-size: 12px; width: 100px;">
																Servlet folder name </a> 
															</td>
															<td>
																<input style="width: 50%" />
															</td>
														</tr>
														<tr>
															<td class="pad5 right"><a
																class="action-button blue"
																style="font-size: 12px; width: 100px;">Servlet file
																	name </a> 
															</td>
															<td>	
																<input style="width: 50%" />
															</td>
														</tr>
														<tr>
															<td class="pad5 right"><a
																class="action-button blue"
																style="font-size: 12px; width: 100px;">Expansion </a> 
															</td>
															<td>
																<input style="width: 30%" />
															</td>
														</tr>
														<tr>
															<td class="pad5 right"><a
																class="action-button blue"
																style="font-size: 12px; width: 100px;">Encoding Type
																</a> 
															</td>
															<td>
																<select style="width: 150px; padding-left: 5px;">
																		<option>블락비</option>
																		<option>엑소</option>
																		<option>아이콘</option>
																		<option>위너</option>
																</select>
															</td>
														</tr>
														<tr>
															<td class="pad5 right" style="width: 212px"><a
																class="action-button blue"
																style="font-size: 12px; width: 100px;">Session Time
															</a>
														</td>
														<td> 
															<input style="width: 50px;" />&nbsp minutes</td>
														</tr>
													</table>
												</th>
											</tr>
										</table>
									</td>
								<tr>
									<td class="next" colspan="2" style="text-align: left">
										<button class="btnLeft" onclick="location.href='wizard.html'"></button>
									</td>
									<td class="next" colspan="2" style="text-align: right">
										<button class="btnRight"
											onclick="location.href='wizard-S2.html'"></button>
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