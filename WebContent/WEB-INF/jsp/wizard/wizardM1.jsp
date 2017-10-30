<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wizard/wizardM1.js"></script>
<style>
	.table-container {
	    height: 16em;
	}
	#repoList {
	    display: flex;
	    flex-flow: column;
	    height: 100%;
	    width: 100%;
	}
	#repoList thead {
	    /* head takes the height it requires, 
	    and it's not scaled when table is resized */
	    flex: 0 0 auto;
	    width: calc(100% - 1.5em);
	}
	#repoList tbody {
	    /* body takes all the remaining available space */
	    flex: 1 1 auto;
	    display: block;
	    overflow-y: scroll;
	}
	#repoList tbody tr {
	    width: 100%;
	}
	#repoList thead, #repoList tbody tr {
	    display: table;
	    table-layout: fixed;
	}
</style>
</head>
<body>
	<section id="section" class="container">
		<div class="center">
		      <ul class="procedure">
		         <li id="projectNav" class="nav-unselect">Project</li>
		         <li id="mavenNav" class="nav-select">Maven</li>
		         <li id="springNav" class="nav-unselect">Spring</li>
		         <li id="generatorNav" class="nav-unselect">Generator</li>
		      </ul>
   		</div>
		<form name="wizardM1Form" method="post" class="form-horizontal well bs-component" 
			<c:if test="${empty mavenInfoList}">
				action="${pageContext.request.contextPath}/wizard/insertMavenInfo.do"
			</c:if>
			<c:if test="${not empty mavenInfoList}">
				action="${pageContext.request.contextPath}/wizard/updateMavenInfo.do"		
			</c:if>
			>
			<fieldset>
				<div style="display: table-cell; width: 54%;height: 80%; vertical-align: middle;">
				<input type="hidden" name="pr_no" value="${pr_no}"/>
					<div class="left">
						<span style="font-size: 25px;">* Maven Repository InfoList</span>
					</div>
						<div class="table-container">
								<table id="repoList" border="1" >
									<thead>
										<tr>
											<th width="9%">
												check
											</th>
											<th width="20%">
												Repo ID
											</th>
											<th width="53%">
												Repo URL
											</th>
											<th width="15%">
												Release 
											</th>
											<th width="18%">
												Shapshots 
											</th>
										</tr>
									</thead>
									<tbody id="repoListTbody">
										<tr >
												<td width='9%'><input class='i_text' type='checkbox' checked="checked" disabled="disabled" ></td>	
												<td width='20%'>
													ADMIN
												</td>		
												<td width='53%'>
													http://192.168.202.135:8081/artifactory
												</td>		
												<td width='15%'>
													Y
												</td>		
												<td width='18%'>
													N
												</td>		
										</tr>
									<c:if test="${not empty mavenInfoList}">
										<c:forEach var="mavenInfo"  items="${mavenInfoList}" varStatus="status" >
											<tr >
												<td width='9%'><input class='i_text' type='checkbox' name='box'></td>		
												<td width='20%'>
													<input type='hidden' name='mavenList[${status.index}].pr_no' value="${mavenInfo.pr_no}"/>
													<input type='hidden' name='mavenList[${status.index}].pr_mav_rep_id' value="${mavenInfo.pr_mav_rep_id}" >
													${mavenInfo.pr_mav_rep_id}
												</td>		
												<td width='53%'>
													<input  type='hidden' name='mavenList[${status.index}].pr_mav_rep_url' value="${mavenInfo.pr_mav_rep_url}" >
													${mavenInfo.pr_mav_rep_url}
												</td>		
												<td width='15%'>
													<input  type='hidden' name='mavenList[${status.index}].pr_mav_rep_rel' value="${mavenInfo.pr_mav_rep_rel}" >
													${mavenInfo.pr_mav_rep_rel}
												</td>		
												<td width='18%'>
													<input  type='hidden' name='mavenList[${status.index}].pr_mav_rep_snap' value="${mavenInfo.pr_mav_rep_snap}" >
													${mavenInfo.pr_mav_rep_snap}
												</td>		
											</tr>
										</c:forEach>
									</c:if>
									</tbody>
								</table>						
						</div>
				</div>
						<div style="display: table-cell; width: 11%;height: 80%; vertical-align: middle;  padding-left: 9px; padding-right: 14px;">
								<div style="display:table-row; width:100%;  margin-bottom: 35px;">
												<input style=" width: 100px;     margin-top: 18px;" type="button" class="new" value="ADD">	
								</div>
								<div style="display:table-row; width:100%">	
												<input style=" width: 100px ; margin-top: 32px;" type="button" class="new" value="REMOVE" >	
								</div>
						</div>
						<div style="display: table-cell; width: 45%;height: 80%;">
								<table class="maven">
										<thead>
											<tr>
												<th class="left" colspan="2">
													<span style="font-size: 25px;">ADD REPOSITORY INFO</span>
												</th>
										</thead>
										<tbody>
											<tr>
												<th class="padding">
													<div class="action-button blue">Repository ID</div>
												</th>
												<td class="padding">
													<input style="width: 100%;" class="i_text" type="text" name="pr_mav_rep_id"/>
												</td>
											</tr>
											<tr>
												<th class="padding">
													<div class="action-button blue">URL</div>
												</th>
												<td class="padding">
													<div style="display:table-cell;">
														http://
													</div>
													<div style="display:table-cell;">
														<input class="i_text" type="text" name="pr_mav_rep_url"/>
													</div>
												</td>
											</tr>
											<tr>
												<th class="padding">
													<div  class="action-button blue">Release</div>
												</th>
												<td class="padding">
													<input type="hidden" name="pr_mav_rep_rel" value="">
													<label class="mavenLabel" ><input type="radio" value="Y" name="rep_rel" checked="checked">Y</label>
													<label class="mavenLabel" ><input type="radio" value="N" name="rep_rel">N</label>
												</td>
											</tr>
											<tr>
												<th class="padding">
													<div class="action-button blue">Snapshots</div>
												</th>
												<td class="padding">
													<input type="hidden" name="pr_mav_rep_snap" value="">
													<label class="mavenLabel" ><input type="radio" value="Y" name="rep_snap">Y</label>
													<label class="mavenLabel" ><input type="radio" value="N" name="rep_snap"checked="checked">N</label>
												</td>
											</tr>
										</tbody>
									</table>
						</div>
						<div style="display: table-row; width: 100%;height: 20%;">
							<div style="display: table-cell; width: 50%;height: 100%; text-align: left;">
									<input type="button" name="prev" class="btnLeft"  style=" text-align: left;">
							</div>
							<div style="display: table-cell;">
							</div>
							<div style="display: table-cell; width: 50%;height: 100%; text-align:right;">
									<input type="button" name="next" class="btnRight" style="text-align: right;">
							</div>
						</div>
				</fieldset>
			</form>
    </section>
</body>
</html>