<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wizard</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/wizard/wizardM2.js"></script>
<style type="text/css">
 	.mavenRight { 
 		height:472px; 
 		line-height:20px;
 		text-align:center
 	} 
 	#jarList { 
		display: flex; 
	    flex-flow: column; 
 	    height: 80%; 
 	    width: 100%; 
 	} 
 	#jarList thead { 
 	    /* head takes the height it requires,  */
 	    flex: 0 0 auto; 
 	    width: calc(100% - 1.5em); 
 	} 
 	#jarList tbody { 
 	    /* body takes all the remaining available space */ 
 	    flex: 1 1 auto; 
 	    display: block; 
 	    overflow-y: scroll; 
 	} 
 	#jarList tbody tr { 
 	    width: 100%; 
 	} 
 	#jarList thead, #jarList tbody tr { 
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
			<li id="mavenNav" class="nav-unselect">Maven</li>
			<li id="springNav" class="nav-select">Spring</li>
			<li id="generatorNav" class="nav-unselect">Generator</li>
		</ul>
	</div>
		<form class="form-horizontal well bs-component" name="wizardM2Form"
			method="post" 
			<c:if test="${empty dependencyList}">
			action="${pageContext.request.contextPath }/wizard/insertJarInfo.do"
			</c:if>
			<c:if test="${not empty dependencyList}">
			action="${pageContext.request.contextPath }/wizard/updateJarInfo.do"
			</c:if>
			>
			<fieldset>
			<div class="mavenLeft">
<%-- 				<input type="hidden" name="pr_no" value="${pr_no}"/> --%>
						<table class="libstable" border="1">
							<tr>
								<td class="padding left" colspan="2" style="margin-left: auto; margin-right: auto; ">
									<div class="searchbox">
									<select style="width: 25%; " id="jarBookmark" class="jarBookmark" >
										<option id="direct">직접입력</option>
										<option id="optionJar" value="quartz">Quartz</option>
										<option id="optionJar" value="Javax-servlet">Javax-servlet</option>
										<option id="optionJar" value="commons-dbcp">commons-dbcp</option>
										<option id="optionJar" value="antlr">antlr</option>
										<option id="optionJar" value="tiles">tiles</option>
										<option id="optionJar" value="fileupload">fileupload</option>
										<option id="optionJar" value="tag-libs">tag-libs</option>
										<option id="optionJar" value="hsqldb">hsqldb</option>
										<option id="optionJar" value="slf4j">slf4j</option>
										<option id="optionJar" value="jackson">jackson</option>
										<option id="optionJar" value="log4j">log4j</option>
										<option id="optionJar" value="ojdbc6">ojdbc6</option>
									</select>
									<input id="search" name="search" type="search" style="background-color:transparent;" value=""/>
									<input name="searchBtn" type="button" value="" class="button2" style="border: 0; outline: 0"/>
									</div>
								</td>
							</tr>
							<tr>
								<td class="padding left" colspan="2" style="padding-bottom: 20px; margin-left: auto; margin-right: auto;">
								<div class="searchbox">
									<select style="width: 350px; " id="dependency" size="17" style="padding-bottom: 20px; margin-left: auto; margin-right: auto;">
										<option id="optionJar" disabled selected>jar 파일이 없습니다.</option>
									</select>
								</div>	
								</td>
							</tr>
						</table>
			</div>
			<div style="display: table-cell; width: 10%;height: 80%; vertical-align: middle">
				<div style="display:table-row; width:100%">
				<input id="addBtn" type="button" class="mavenJar" value="ADD" /> 
				</div>
				<div style="display:table-row; width:100%">	
				<input id="removeBtn" type="button" class="mavenJar" style="font-size: 15px;" value="REMOVE" />
				</div>
			</div>
			<div class="mavenRight">
				<div style="padding-bottom: 24px">
				<span style="font-size: 25px; text-align: center;">※Jar-file List</span>
				</div>
				<table id="jarList" border=1 class="dependency" >
					<thead>
					<tr height="5px">
						<th width="10%"><input type="checkbox" id="checkAll" class="check" name="checkAll"/></th>
						<th width="65%">JAR NAME</th>
						<th width="25%">PROP:Y/N</th>
					</tr>
					</thead>
					<tbody id="jarListArea">
					<c:if test="${!empty dependencyList}">
					<c:forEach var="jarInfo" items="${dependencyList }" varStatus="status">
					<tr>
						<td width="10%">
							<input type='hidden' name='jarList[${status.index}].pr_no' value="${jarInfo.pr_no}"/>
							<input type="checkbox" id="delete" class="check" name="${status.index}"/>
						</td>
						<td width="65%">
							<input type="hidden" name="jarList[${status.index}].pr_grp_id" value="${jarInfo.pr_grp_id}/${jarInfo.pr_arft_id}/${jarInfo.pr_version}/${jarInfo.pr_arft_id}-${jarInfo.pr_version}">${jarInfo.pr_arft_id}-${jarInfo.pr_version}</td>
						<td width="25%">
						<c:if test="${jarInfo.pr_prop_yn == 'N'}">
							<input type="checkbox" class="check" id="check" name="jarList[${status.index}].pr_prop_yn\" value="${jarInfo.pr_prop_yn}" />
						</c:if>
						<c:if test="${jarInfo.pr_prop_yn == 'Y'}">
							<input type="checkbox" class="check" id="check" name="jarList[${status.index}].pr_prop_yn\" value="${jarInfo.pr_prop_yn}" checked="checked" />
						</c:if>
						</td>
					</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>	
			<div style="display: table-row; width: 100%;height: 20%;">
			<div style="display: table-cell; width: 50%;height: 100%; text-align: left;">
				<input type="button" name="prev" class="btnLeft"  style=" text-align: left;" id="leftBtn">
			</div>
			<div style="display: table-cell;">
			</div>
			<div style="display: table-cell; width: 50%;height: 100%; text-align:right;">
				<input type="button" name="next" class="btnRight" style="text-align: right;" id="rightBtn">
			</div>
			</div>
			</fieldset>
		</form>
	</section>
</body>
</html>