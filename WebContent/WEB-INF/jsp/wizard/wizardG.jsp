<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wizard</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/wizard/wizardG.js"></script>
</head>
<body>
	<section id="section" class="container">
		<div class="center">
      		<ul class="procedure">
	         	<li id="projectNav" class="nav-unselect">Project</li>
	         	<li id="mavenNav" class="nav-unselect">Maven</li>
	         	<li id="springNav" class="nav-unselect">Spring</li>
	            <li id="generatorNav" class="nav-select">Generator</li>
     		</ul>
   		</div>
		<form class="form-horizontal well bs-component minScreen"
			name="tableForm" method="post" action="${pageContext.request.contextPath}/wizard/insertGenInfo.do">
			<fieldset>
				<div>
				<input type="hidden" name="pr_no" value="4" />
					<table width="100%" class="wizard"
						style="overflow: auto; min-width: 300px;">
						<tr>
							<td style="width: 40%;">
								<table>
									<tr>
										<th class="padding left">
											<table>
												<tr>
													<td class="pad5 right">
														<a class="action-button blue magin5"> DBMS </a>
													</td>
													<td style="padding-right: 10px;">
														<section>
															<input id="how-friend" name="pr_db_type" type="radio" value="O"
																style="display: none" checked="checked"/>
															<label for="how-friend" class="side-label">Oracle</label>
														</section>
													</td>
												</tr>
												<tr>
													<td class="pad5 right"><a
														class="action-button blue magin5"> HOST </a></td>
													<td colspan="2">
														<section>
<!-- 															<input style="width: 100%" name="pr_db_host" -->
<!-- 																id="user_host" class="i_text" type="text" /> -->
															<input style="width: 100%" name="pr_db_host"
																id="user_host" class="i_text" type="text" value="localhost" />
														</section>
													</td>
												</tr>
												<tr>
													<td class="pad5 right"><a
														class="action-button blue magin5"> PORT </a></td>
													<td colspan="2">
														<section>
<!-- 															<input style="width: 100%" name="pr_db_port" -->
<!-- 																id="user_port" class="i_text" type="text" /> -->
															<input style="width: 100%" name="pr_db_port"
																id="user_port" class="i_text" type="text" value="1521" />
														</section>
													</td>
												</tr>
												<tr>
													<td class="pad5 right"><a
														class="action-button blue magin5"> Service Name </a></td>
													<td colspan="2">
														<section>
<!-- 															<input style="width: 100%" name="pr_db_sn" id="user_sn" -->
<!-- 																class="i_text" type="text" /> -->
															<input style="width: 100%" name="pr_db_sn" id="user_sn"
																class="i_text" type="text" value="xe" />
														</section>
													</td>
												</tr>
												<tr>
													<td class="pad5 right"><a
														class="action-button blue magin5"> DB Username </a></td>
													<td colspan="2">
														<section>
<!-- 															<input style="width: 100%" name="pr_db_userId" -->
<!-- 																id="user_name" class="i_text" type="text" /> -->
															<input style="width: 100%" name="pr_db_userId"
																id="user_name" class="i_text" type="text" value="pc03" />
														</section>
													</td>
												</tr>

												<tr>
													<td class="pad5 right"><a
														class="action-button blue magin5"> DB Password </a></td>
													<td colspan="2">
														<section>
<!-- 															<input style="width: 100%" name="pr_db_pass" -->
<!-- 																id="user_pass" class="i_text" type="text" /> -->
															<input style="width: 100%" name="pr_db_pass"
																id="user_pass" class="i_text" type="text" value="java" />
														</section>
													</td>
												</tr>
												<tr>
													<td colspan="3" class="padding right"
													style="height: 100%; padding-bottom: 20px">
														<input class="new" id="loadTable" type="button"
														style="width: 300px; height: 30px; MARGIN-BOTTOM: 20PX; MARGIN-TOP: 10PX; font-size: 15px; BACKGROUND-COLOR: peru;"
														value="LOAD YOUR TABLE" /> 
														<input type="button"
														class="new"
														style="width: 100px; height: 30px; font-size: 15px"
														data-target="#layerpop" data-toggle="modal"
														value="NEW TABLE" name ="add_tbl" />
													</td>
												</tr>
											</table>
										</th>
									</tr>
								</table>
							</td>
							<td>
								<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="20px"
										height="60px" viewBox="5 0 80 60">
										    <path id="wave" fill="none" stroke="#fff" stroke-width="4"
											stroke-linecap="round">
										    </path>
										  </svg>
								</div>
							</td>
							<th style="width: 55%;" class="left">* Table List
								<div style="width: 550px; height: 340px; overflow: auto" >
									<table class="well2 center" id="tableArea"></table>
								</div>
							</th>
						</tr>
<!-- 						<tr> -->
<!-- 							<td colspan="3" class="padding right" -->
<!-- 								style="height: 100%; padding-bottom: 20px"> -->
<!-- 								<input type="button" class="new"  -->
<!-- 									style="width: 200px; height: 40px; font-size: 20px;" value="COMPLETE"/> -->
<!-- 							</td> -->
<!-- 						</tr> -->
						<tr>
							<td class="next" colspan="2" style="text-align: left"><input
								type="button" class="btnLeft"
								onclick="location.href='wizard.html'" /></td>
							<td class="next" style="text-align: right">
								<input type="button" class="new" value="COMPLETE"
								style="width: 200px; height: 40px; font-size: 20px;" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<!-- 모달창 -->
		<form name="modalForm" method="post" action="${pageContext.request.contextPath}/main/index.do">
			<div class="modal fade" id="layerpop">
				<div class="modal-newtable">
					<div class="modal-content gradient" style="width: 900px;">
						<div class="modal-header"
							style="border-bottom: none; height: 50px;">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">X</button>
							<!-- header title -->
						</div>
						<!-- body -->
						<div class="modal-body well2" style="margin: 15px">
							<table>
								<tr>
									<th
										style="text-align: right; font-size: 20px; padding-right: 10px">
										NEW TABLE</th>
									<td style="text-align: left;"><input type="text"
										name="table_name" id="table_name" /></td>
								</tr>
								<tr>
									<td colspan="2">
										<table style="border: 1px white solid;" id="tableAddArea">
											<tr
												style="text-align: center; background-color: rgba(255, 255, 255, 0.68); color: #4e5d6c; font-size: 15px;">
												<th></th>
												<th>Column Name</th>
												<th>Data Type</th>
												<th>Data Size</th>
												<th>Not Null</th>
												<th>Primary Key</th>
												<th>Foreign Key</th>
												<th>Join Table</th>
											</tr>
											<tr class="table_col"
												style="text-align: center; border: 1px white solid;">
												<td><input type="checkbox" name="rem_chk" /></td>
												<td><input type="text" name="column_name" /></td>
												<td><select name="data_type">
														<option value="char">char</option>
														<option value="varchar2">varchar2</option>
														<option value="clob">clob</option>
														<option value="number">number</option>
														<option value="date">date</option>
												</select></td>
												<td><input type="text" name="data_size" /></td>
												<td><input type="checkbox" name="nullable" /></td>
												<td><input type="checkbox" name="table_pk" /></td>
												<td><input type="checkbox" name="table_fk" /></td>
												<td colspan="2" style="text-align: center;">
													<select name="tbl_name">
														<option>TABLE</option>
													</select> 
													<select name="col_name">
														<option>COLUMN</option>
													</select>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<th colspan="2" class="left"><input type="button"
										class="plusBtn" /> <input type="button" class="minusBtn" />
									</th>
								</tr>

							</table>
						</div>
						<!-- Footer -->
						<div class="modal-footer" style="border-top: none; margin: 20px">
							<input id="createResult" border="none" disabled="disabled" /> 
							<input type="button" class="btn btn-default" value="TABLE_CREATE"/> 
							<input type="button" class="btn btn-default" value="DONE" data-dismiss="modal" style="font-weight: bold;" />
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>