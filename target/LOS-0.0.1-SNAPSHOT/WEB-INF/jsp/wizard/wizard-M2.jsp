<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wizard</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/wizard-M2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/ProjectNav.js"></script>
<style>
ul {
    float: left; 
    text-align: left;
}
</style>
</head>
<body>
	<section id="section" class="container">
		<div class="center" style="padding-bottom: 10px">
			<input type="button" id="projectBtn" class="btnUnselect" value="Project" onclick=""/>
			<input type="button" id="mavenBtn" class="btnSelect" value="Maven" onclick=""/>
			<input type="button" id="springBtn" class="btnUnselect" value="Spring" onclick=""/>
			<input type="button" id="mvcBtn" class="btnUnselect" value="MVC" onclick=""/>
		</div>
		<form class="form-horizontal well bs-component">
			<form>
				<fieldset>
					<div>
						<table width="100%" class="wizard">
							<colgroup>
								<col width="50%">
								<col width="5%">
								<col width="45%">
							</colgroup>
							<tr>
								<td>
									<table>
										<thead>
											<tr>
												<th class="padding left" colspan="2"
													style="padding-bottom: 20px; margin-left: auto;margin-right: auto;">
													<div class="searchbox" style="margin-left: auto;margin-right: auto;">
														<input name="search" type="search" placeholder="Search" />
														<input name="searchBtn" type="button" value="" class="button2"/>
													</div>
												</th>
											</tr>
											<tr>
												<th>
													<input type="button" name="jarBtn" class="new2" value="Quartz"/>
													<input type="button" name="jarBtn" class="new2" style="width: 105px; font-size: 12px;" value="Javax-servlet"> 
													<input type="button" name="jarBtn" class="new2" style="width: 105px; font-size: 12px;" value="commons-dbcp">
													<input type="button" name="jarBtn" class="new2" value="antlr">
												</th>
											</tr>
											<tr>
												<th>
													<input type="button" name="jarBtn" class="new2" value="tiles"/>
													<input type="button" name="jarBtn" class="new2" style="width: 105px; font-size: 12px;" value="fileUpload"/>
													<input type="button" name="jarBtn" class="new2" value="tag-libs"/>
													<input type="button" name="jarBtn" class="new2" value="hsqldb"/>
												</th>
											</tr>
											<tr>
												<th>
													<input type="button" name="jarBtn" class="new2" value="slf4j"/>
													<input type="button" name="jarBtn" class="new2" value="jackson"/>
													<input type="button" name="jarBtn" class="new2" value="log4j"/>
													<input type="button" name="jarBtn" class="new2" value="ojdbc6"/>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th style="padding: 34px;">
													<a class="action-button blue"
														style="width: 100px; font-size: 15px;">Dependency
													</a> 
													<select style="width: 150px; padding-left: 5px;" id="dependency">
														<option disabled selected>없음</option>
													</select>
												</th>
											</tr>
										</tbody>
									</table>
								</td>

								<td rowspan="5" class="padding"
									style="height: 100%; vertical-align: middle;">
									<input id="addBtn" type="button" class="new" value="ADD"/>
									<input id="removeBtn" type="button" class="new" style="font-size: 15px;" value="REMOVE"/>
								</td>
								
								<th>
									<table width=480 border=0 align=center summary=""> 
										<tr>
											<td style="text-align: initial; padding: 11px;">
												<a class="action-button blue" style="width: 105px; font-size: 20px;">
													Your Jar-file List </a>
											</td>
										</tr>
										<tr> 
											<td>
											<span class="scrollArea">
											<ul id="jarListArea">
											</ul>
											</span>
											</td>
										</tr>
									</table> 
								</th>
							</tr>
							<tr>
								<td class="next" colspan="2" style="text-align: left">
									<input type="button" class="btnLeft" id="nextLeft"/>
								</td>
								<td class="next" style="text-align: right">
									<input type="button" class="btnRight" id="nextRight"/>
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
			</form>
		</form>
	</section>
</body>
</html>