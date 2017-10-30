<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wizard</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/wizardG2.js"></script>
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
	<div class="form-horizontal well bs-component minScreen">
		<div class="db_account_info">
			<form name="dbInfo_form" method="post" 
				action="${pageContext.request.contextPath}/wizard/insertGenInfo.do">
				<table>
					<tr>
						<th>DBMS</th>
						<td>
							<input type="radio" name="pr_db_type"  value="O" checked/>
							<label>Oracle</label>
						</td>
					</tr>
					<tr>
						<th>HOST</th>
						<td>
							<input type="text" name="pr_db_host" value="localhost" />
						</td>
					</tr>
					<tr>
						<th>PORT</th>
						<td>
							<input type="text" name="pr_db_port" value="1521" />
						</td>
					</tr>
					<tr>
						<th>Service Name</th>
						<td>
							<input type="text" name="pr_db_sn" value="xe" />
						</td>
					</tr>
					<tr>
						<th>Username</th>
						<td>
							<input type="text" name="pr_db_userId" value="pc23" />
						</td>
					</tr>
					<tr>
						<th>Password</th>
						<td>
							<input type="text" name="pr_db_pass" value="java" />
						</td>
					</tr>
				</table>
				<div class="right">
					<input type="button" name="btnTableLoad" value="LOAD YOUR TABLE" class="tableLoad"/>
				</div>
			</form>
		</div>
		<div class="file_select_area">
			<form name="genForm" method="post"
				action="">
				<table>
					<thead>
						<tr>
							<th>Table Name</th>
							<th>Controller</th>
							<th>Service</th>
							<th>Dao</th>
							<th>VO</th>
							<th>XML</th>
							<th class="checkedAll">ALL</th>
						</tr>
					</thead>
					<tbody class="tableList">
					</tbody>
				</table>
				<div class="left">
					<input type="button" name="btnAddTable" value="ADD TABLE" class="newtable" data-toggle="modal" data-target="#modal_newtable"/>
				</div>
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
	
	<!-- 모달창 -->
	<div class="modal fade" id="modal_newtable" tabindex="-1" role="dialog">
		<div class="modal-newtable">
			<div class="modal-content gradient">
				<div class="modal-header">
					<span class="left">New Table</span>
					<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body left">
					<div class="right">
						<input type="button" id="btnColAdd" class="plusBtn" />
						<input type="button" id="btnColDel" class="minusBtn" />
					</div>
					<div class="table-info">
						<table>
							<thead>
								<tr>
									<th>
										<input type="checkbox" name="checkedAll">
									</th>
									<th>Column</th>
									<th>Type</th>
									<th>Length</th>
									<th>PK</th>
									<th>Nullable</th>
								</tr>
							</thead>
							<tbody class="columnList">
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>
										<input type="text" name="column_name"> 
									</td>
									<td>
										<select name="data_type">
											<option value="VARCHAR2">VARCHAR2</option>
											<option value="NUMBER">NUMBER</option>
											<option value="DATE">DATE</option>
											<option value="CLOB">CLOB</option>
											<option value="CHAR">CHAR</option>
										</select> 
									</td>
									<td>
										<input type="text" name="data_size"> 
									</td>
									<td>
										<input type="checkbox" name="pk_yn"> 
									</td>
									<td>
										<input type="checkbox" name="nullable" checked> 
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<hr/>
					<div class="reference left">
						<div class="left-half">
							<input type="checkbox" name="reference_yn">
							<span>REFERENCE</span>	
							<select id="refTableList" disabled>
								<option>--------</option>
							</select>						
						</div>
						<table>
							<thead>
								<tr>
									<th>Table</th>
									<th>Column</th>
									<th>Type</th>
									<th>Size</th>
									<th>FK</th>
								</tr>
							</thead>
							<tbody>								
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" value="CREATE" data-dismiss="modal"/>
					<input type="button" class="btn btn-default" value="CANCEL" data-dismiss="modal"/>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>