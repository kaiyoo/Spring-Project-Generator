<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wizard</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/ProjectNav.js"></script>
</head>
<body>
<section id="section" class="container">
		<div class="center" style="padding-bottom: 10px">
			<input type="button" id="projectBtn" class="btnUnselect" value="Project" />
	        <input type="button" id="mavenBtn" class="btnUnselect" value="Maven" />
	        <input type="button" id="springBtn" class="btnUnselect" value="Spring" />
	        <input type="button" id="mvcBtn" class="btnSelect" value="MVC" />
		</div>
		<form class="form-horizontal well bs-component minScreen">
			<form>
				<fieldset>
					<div>
						<form>
							<table width="100%" class="wizard"
								style="overflow: auto; min-width: 300px;">
								<tr>
									<th colspan="3" style="padding: 50px;width: 100%;" class="left">* Table List
										<table class="well2 center">
											<tr style="background-color: rgba(167, 39, 115, 0.66);">
												<th style="width: 350px">Table Name</th>
												<td style="width: 300px">Dao</td>
												<td style="width: 300px">Service</td>
												<td style="width: 300px">Controller</td>
												<td style="width: 300px">Xml</td>
												<td style="width: 300px">Vo</td>
												<td style="width: 300px">All</td>
											</tr>
											<tr>
												<th>MEMBER</th>
												<td>
													<section>
														<input id="dao" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="service" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="controller" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="xml" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="vo" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="all" type="checkbox">
													</section>
												</td>
											</tr>
											<tr>
												<th>BUYER</th>
												<td>
													<section>
														<input id="dao-b" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="service-b" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="controller-b" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="xml-b" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="vo-b" type="checkbox">
													</section>
												</td>
												<td>
													<section>
														<input id="all-b" type="checkbox">
													</section>
												</td>
											</tr>
										</table>
									</th>
									</tr>
									<tr>
										<td colspan="2" class="padding left"
																style="height: 100%; padding-bottom: 20px; padding-left: 100px;">
											<input type="button" class="new"
																	style="width: 100px; height: 30px; font-size: 15px"
																	data-target="#layerpop" data-toggle="modal" value="NEW TABLE">
										<div class="modal fade" id="layerpop">
																	<div class="modal-dialog">
																		<div class="modal-content gradient"
																			style="width: 600px">
																			<div class="modal-header"
																				style="border-bottom: none; height: 50px;">
																				<!-- 닫기(x) 버튼 -->
																				<button type="button" class="close"
																					data-dismiss="modal">×</button>
																				<!-- header title -->
																			</div>
																			<!-- body -->
																			<div class="modal-body well2" style="margin: 15px">
																				<table>
																					<tr>
																						<th
																							style="text-align: right; font-size: 20px; padding-right: 10px">
																							NEW TABLE</th>
																						<td style="text-align: left;"><input
																							type="text" /></td>
																					</tr>
																					<tr>
																						<td colspan="2">
																							<table style="border: 1px white solid;">
																								<tr
																									style="text-align: center; background-color: rgba(255, 255, 255, 0.68); color: #4e5d6c; font-size: 15px;">
																									<th>Column Name</th>
																									<th>Data Type</th>
																									<th>Primary Key</th>
																									<th>Foreign Key</th>
																								</tr>
																								<tr
																									style="text-align: center; border: 1px white solid;">
																									<th>ID</th>
																									<th><select>
																											<option>1</option>
																											<option>2</option>
																									</select></th>
																									<th><input type="checkbox"></th>
																									<th><input type="checkbox"></th>
																								</tr>
																								<tr
																									style="text-align: center; border: 1px white solid;">
																									<th>NAME</th>
																									<th><select>
																											<option>1</option>
																											<option>2</option>
																									</select></th>
																									<th><input type="checkbox"></th>
																									<th><input type="checkbox"></th>
																								</tr>
																								<tr
																									style="text-align: center; border: 1px white solid;">
																									<th>AGE</th>
																									<th><select>
																											<option>1</option>
																											<option>2</option>
																									</select></th>
																									<th><input type="checkbox"></th>
																									<th><input type="checkbox"></th>
																								</tr>
																								<tr
																									style="text-align: center; border: 1px white solid;">
																									<th>JOB</th>
																									<th><select>
																											<option>1</option>
																											<option>2</option>
																									</select></th>
																									<th><input type="checkbox"></th>
																									<th><input type="checkbox"></th>
																								</tr>
																								<tr
																									style="text-align: center; border: 1px white solid;">
																									<th>HODDY</th>
																									<th><select>
																											<option>1</option>
																											<option>2</option>
																									</select></th>
																									<th><input type="checkbox"></th>
																									<th><input type="checkbox"></th>
																								</tr>
																							</table>
																						</td>
																					</tr>
																					<tr>
																						<th colspan="2" style="text-align: center;">
																							*FK the column <input type="text"> refers
																						</th>
																					</tr>
																					<tr>
																						<th colspan="2" style="text-align: center;">
																							to the table 
																								<select>
																									<option>JOBGROUP</option>
																									<option>MEMBER</option>
																									<option>CART</option>
																								</select> 
																								's 
																								<select >
																									<option>jobfield</option>
																									<option>column2</option>
																									<option>column3</option>
																								</select>
																						</th>
																					</tr>
																				</table>
																			</div>
																			<!-- Footer -->
																			<div class="modal-footer"
																				style="border-top: none; margin: 20px">
																				<button type="button" class="btn btn-default"
																					data-dismiss="modal" style="font-weight: bold;">DONE</button>
																			</div>
																		</div>
																	</div>
																</div>
										</td>
										<td class="padding right"
																style="height: 100%; padding-bottom: 20px;  padding-right: 100px;">
											<input type="button" class="new"
											style="width: 200px; height: 40px; font-size: 20px;" value="COMPLETE">
										</td>
									</tr>
								<tr>
									<td class="next" colspan="2" style="text-align: left">
									
										<input type="button" class="btnLeft" onclick="location.href='wizard.html'"/>
									</td>
									<td class="next" style="text-align: right">
										<input type="button" class="btnRight"
											onclick="location.href='wizard-S2.html'"/>
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