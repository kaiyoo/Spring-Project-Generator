<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/ProjectNav.js"></script>
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
								<col width="25%">
								<col width="5%">
								<col width="70%">
							</colgroup>
							<tr>
								<td colspan="3">
									<table>
										<thead>
											<tr>
												<th class="left" colspan="2">
													<span style="font-size: 25px;">* Maven Information</span>
												</th>
											</tr>
											<tr>
												<th class="padding right" style="padding-bottom: 20px;" >
													<a href="#" class="action-button blue">Choose Repository ID</a>
												</th>
												<td style="width:40%; padding-bottom: 20px;" class="padding">
													<select style="width:35%">
													  <option value="search-all">ZICO</option>
													  <option value="search-title">PO</option>
													</select>
													<button class="new">NEW</button>
												</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th class="padding right">
													<a href="#" class="action-button blue">Repository ID</a>
												</th>
												<td style="width:70%;" class="padding">
													<input style="width:50%" class="i_text" type="text" />
												</td>
											</tr>
											<tr>
												<th class="padding right">
													<a href="#" class="action-button blue">Repository URL</a>
												</th>
												<td class="padding">
													<input style="width:50%"  class="i_text" type="text" />
												</td>
											</tr>
											<tr>
												<th class="padding right">
													<a href="#" class="action-button blue">Release-enabled</a>
												</th>
												<td class="padding">
													<input style="width:50%"  class="i_text" type="text" />
												</td>
											</tr>
											<tr>
												<th class="padding right">
													<a href="#" class="action-button blue">Snapshots-enabled</a>
												</th>
												<td class="padding">
													<input style="width:50%"  class="i_text" type="text" />
													<button class="new">ADD</button>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								
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