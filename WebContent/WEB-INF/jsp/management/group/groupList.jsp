<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/management/group/groupList.js"></script>
</head>
<body>
<section id="section" class="container" >
	<div class="center">
    	<div class="col-xs-12 col-sm-99">
    	
    	<div class="groupContainer">
		<ul class="groupTabs">
			<li><a href="#tab1">그룹리스트</a></li>
			<li><a href="#tab2">신청내역</a></li>
			<li><a href="#tab3">등록</a></li>
		</ul>
	<div class="tab_container">
	
	<!-- 그룹리스트 -->
	<div id="tab1" class="tab_content">
	<table class="table table-striped table-hover ">
				<colgroup>
<%-- 					<col width="5%"> --%>
					<col width="5%">
					<col width="15%">
					<col width="25%">
					<col width="15%">
					<col width="5%">
					<col width="5%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr class="success">
<!-- 						<th scope="col"><input type="checkbox" id="allChecked"></th> -->
						<th>No</th>
						<th>Group Name</th>
						<th>Comment</th>
						<th>Creator</th>
						<th>Projects</th>
						<th>Members</th>
						<th>Date</th>
						<th>Authority</th>
					</tr>
 				</thead>
 				<tbody>
<%--  					<c:if test="${empty groupList }"> --%>
						<c:if test="${empty groupList }">
							<td colspan="8"><font>등록된 게시글이 없습니다.</font></td>
						</c:if>
<%--  					</c:if> --%>
	 				<c:if test="${not empty groupList}">
	 				<c:if test="${not empty LOGIN_MEMBERINFO }">
						<c:forEach var="groupInfo" items="${groupList }">
							<tr class="danger">							
<!-- 								<td> -->
<%-- 									<input type="checkbox" name="checkbox" value="${groupInfo.grp_no }">										 --%>
<!-- 								</td> -->
								<td>
									${groupInfo.rnum}
									<input type="hidden" value="${groupInfo.grp_no }">
								</td>
								<td>${groupInfo.grp_name}</td>
								<td>${groupInfo.grp_comment}</td>
								<td>${groupInfo.grp_reg_mem_id}</td>
								<td>플젝수</td>
								<td>회원수</td>
								<td>${fn:substring(groupInfo.grp_reg_date, 0, 10)}</td>
								<c:if test="${LOGIN_MEMBERINFO.mem_id eq groupInfo.grp_reg_mem_id}">
									<td>
									<input type="button" value="삭제"/>
									<input type="button" value="초대">
									</td>
								</c:if>
								<c:if test="${LOGIN_MEMBERINFO.mem_id ne groupInfo.grp_reg_mem_id}">
									<td>
									<input type="button" value="탈퇴">
									</td>
								</c:if>
							</tr>
						</c:forEach>
	 				</c:if>
					</c:if>
 				</tbody>
 			</table>
			<div class="btn_area2">
 				<div class="btn_left">
 					<c:if test="${not empty LOGIN_MEMBERINFO}">
 						<input type="button" name="btn_insert" value="create" class="btn-write">
 					</c:if>
 				</div>
			</div>
			<ul class="pagination pagination-sm">
				${pagingHtml}
			</ul>
	</div>
	
	<!-- 신청내역 -->
	<div id="tab2" class="tab_content">
		<table class="table table-striped table-hover ">
				<colgroup>
					<c:if test="${LOGIN_MEMBERINFO.mem_id eq groupInfo.grp_reg_mem_id}">
						<col width="6%">
					</c:if>
					<col width="5%">
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="success">
						<c:if test="${LOGIN_MEMBERINFO.mem_id eq groupInfo.grp_reg_mem_id}">
							<th scope="col"><input type="checkbox" id="allChecked"></th>
						</c:if>
						<th>No</th>
						<th>Group Name</th>
						<th>Title</th>
						<th>Date</th>
						<th>Projects</th>
						<th>Members</th>
						<th>Creator</th>
					</tr>
 				</thead>
 				<tbody>
 					<c:if test="${empty groupList }">
 						<c:if test="${LOGIN_MEMBERINFO.mem_id eq 'groupInfo.grp_reg_mem_id'}">
							<td colspan="8"><font>등록된 게시글이 없습니다.</font></td>
						</c:if>
						<c:if test="${LOGIN_MEMBERINFO.mem_id ne 'groupInfo.grp_reg_mem_id'}">
							<td colspan="7"><font>등록된 게시글이 없습니다.</font></td>
						</c:if>
 					</c:if>
	 				<c:if test="${not empty groupList}">
						<c:forEach var="groupInfo" items="${groupList }">
							<tr class="danger">							
								<c:if test="${LOGIN_MEMBERINFO.mem_id eq 'groupInfo.grp_reg_mem_id'}">
									<td class="check">
										<input type="checkbox" name="checkbox" value="${groupInfo.grp_no }">										
									</td>
								</c:if>
								<td>
									${groupInfo.rnum}
									<input type="hidden" value="${groupInfo.grp_no }">
								</td>
								<td>${groupInfo.grp_name}</td>
								<td>${groupInfo.grp_comment}</td>
								<td>${fn:substring(groupInfo.grp_reg_date, 0, 10)}</td>
								<td>플젝수</td>
								<td>회원수</td>
								<td>${groupInfo.grp_reg_mem_id}</td>
							</tr>
						</c:forEach>
					</c:if>
 				</tbody>
 			</table>
 			 			<div class="btn_area2">
 				<div class="btn_left">
 					<c:if test="${LOGIN_MEMBERINFO.mem_id eq 'groupInfo.grp_reg_mem_id'}">
	 					<input type="button" name="btn_delete" value="delete" class="btn-delete">
 					</c:if>
 				</div>
 				<div class="btn_right">
 					<c:if test="${not empty LOGIN_MEMBERINFO}">
 						<input type="button" name="btn_insert" value="write" class="btn-write">
 					</c:if>
 				</div>
			</div>
			<ul class="pagination pagination-sm">
				${pagingHtml}
			</ul>
	</div>
	
	<!-- 등록 -->
	<div id="tab3" class="tab_content">
	<form method="post" name="groupForm" enctype="multipart/form-data" action="${pageContext.request.contextPath }/management/insertGroupInfo.do ">
		<input type="hidden" name="group_no"  value="${groupInfo.group_no}">
		<input type="hidden" name="grp_status" value="Y" />
		<div >
		<table id="boardTable" border="1" cellspacing="0" summary="게시판 작성.">
				<tbody>
					<tr>
						<th scope="row" class="Gtab3">Group Name</th>
						<td>
							<div class="item">
								<input class="i_text g_text" title="Group Name" type="text" name="grp_name" value="${groupInfo.grp_name }" />
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="Gtab3">Comment</th>
						<td>
							<div class="item">
								<input class="i_text g_text" style="width: 90%;" title="Comment" type="text" name="grp_comment" value="${groupInfo.grp_comment }">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="Gtab3">Creator</th>
						<td>
							<div class="item">
								<input class="i_text g_text" title="Creator" type="text" style="border:none"  name="grp_reg_mem_id" value="${LOGIN_MEMBERINFO.mem_id }" readonly="readonly">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="Gtab3">Date</th>
						<td>
							<div class="item">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<input class="i_text g_text" title="Date" type="text" style="border:none"  name="grp_reg_date" value="<fmt:formatDate pattern='yyyy-MM-dd' value="${now}"/>" readonly="readonly">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
		<div class="button_set center">
			<input class="btn_view" id="groupFormBtn" type="button" value="등록"/>
			<input class="btn_view" type="reset" value="취소" />
			<input class="btn_view" id="list_btn" type="button" value="목록"/>
		</div>
			</form>
		</div>
	</div>
	</div>
	</div>

		</div>
</section>
</body>
</html>