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
										style="vertical-align: top; padding: 20px; width: 5%;">
										<table>
											<tr>
												<td>
													<input type="button"class="springNavUn" value="webxml"/> 
												</td>
											</tr>
											<tr>
												<td>
													<input type="button"class="springNavUn" value="XmlPreview"/> 
												</td>
											</tr>
											<tr>
												<td>
													<input type="button"class="springNav" value="SpringConf"/> 
												</td>
											</tr>
										</table>
									</th>

									<td style="width: 45%;">
										<table>
											<tr>
												<th class="pad5 right"
													style="padding-bottom: 15px; width: 143px;"><a
													class="action-button blue magin5"> File </a></th>
												<td colspan="2" class="w200">
													<section>
														<input id="file" type="checkbox" class="invisible">
														<label for="file" class="side-label">&nbsp</label>
													</section>
												</td>
											</tr>
											<tr>
												<th class="pad5 right" style="padding-bottom: 15px;"><a
													class="action-button blue magin5"> Quartz </a></th>
												<td colspan="2" class="w200">
													<section>
														<input id="quartz" type="checkbox" class="invisible">
														<label for="quartz" class="side-label">&nbsp</label>
													</section>
												</td>
											</tr>
											<tr>
												<th class="pad5 right"><a
													class="action-button blue magin5"> iBatis </a></th>
												<td style="width: 70px;">
													<section>
														<input id="how-friend" name="how" type="radio"> <label
															for="how-friend" class="side-label">JNDI</label>
													</section>
												</td>
												<td style="width: 70px; padding-left: 10px">
													<section>
														<input id="how-internet" name="how" type="radio">
														<label for="how-internet" class="side-label">DBCP</label>
													</section>
												</td>
											</tr>
											<tr>
												<th class="pad5 right" style="padding-bottom: 15px;"><a
													class="action-button blue magin5"> Auto Commit </a></th>
												<td colspan="2" class="w200">
													<section>
														<input id="commit" type="checkbox" class="invisible">
														<label for="commit" class="side-label">&nbsp</label>
													</section>
												</td>
											</tr>
										</table>
									</td>
									<td style="width: 50%;">
										<table>
											<tr>
											<tr>
												<td colspan="3">
													<section class="well2" style="width: 400px;">
														<input id="how-other" type="radio"> <label
															for="how-other" class="side-label">set time
															schedule</label>
														<!-- set time schedule Box -->
														<div class="how-other-disclosure">
															<table>
																<tr>
																	<td class="padding14"><a class="new2">minutes</a>
																		<a class="new2">hourly</a> <a class="new2">daily</a> <br />
																		<a class="new2">weekly</a> <a class="new2">monthly</a>
																		<a class="new2">yearly</a></td>
																</tr>
																<tr>
																	<td class="padding14">Every <input
																		style="width: 70px;" class="i_text" type="text" />
																	</td>
																</tr>
																<tr>
																	<td class="padding14">start time <select
																		style="width: 45px;">
																			<option value="search-all">12</option>
																			<option value="search-title">11</option>
																	</select> <select style="width: 45px;">
																			<option value="search-all">00</option>
																			<option value="search-title">30</option>
																	</select>
																	</td>
																</tr>
																<tr>
																	<td class="padding14">Enter your cron expression <input
																		style="width: 100px;" class="i_text" type="text" />
																	</td>
																</tr>
																
															</table>
															<tr>
												<th class="pad5 right" style="padding-bottom: 15px;"><a
													class="action-button blue magin5"> View Resolver </a></th>
												<td colspan="2" class="">
													<section>
														<section>
															<input id="viewReolver" name="viewResolver" type="radio">
															<label for="viewReolver" class="side-label2">Internal
																Resource View Resolver</label> <input id="tile"
																name="viewResolver" type="radio"> <label
																for="tile" class="side-label2">Tiles</label>
														</section>
													</section>
												</td>
											</tr>
														</div>
													</section>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="next" colspan="4" style="text-align: left">
										<button class="btnLeft" onclick="location.href='wizard.html'"></button>
									</td>
									<td class="next" style="text-align: right">
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