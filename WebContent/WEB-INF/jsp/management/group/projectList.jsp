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
<style>
.pinky{
	background-color:#FF8295;
}
</style>
</head>
<body>
<section id="section" class="container" >
<div class="center">
<div class="col-xs-12 col-sm-99">
<div class="groupContainer">
	<ul class="groupTabs">
		<li><a href="#tab1">그룹리스트</a></li>
		<li><a href="#tab2">신청내역</a></li>
	</ul>
	<div class="tab_container tab_content">
	
	<!--1 커멘트 테이블 -->
	<div id="tab2" class="grpComment" >
		<table class="table table-striped table-hover" style="width:100%; height:80px;">
			<colgroup>
				<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
					<col width="5%">
				</c:if>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr class="success">
					<th>Comment</th>
				</tr>
			</thead>
			<tbody>
					<c:if test="${empty LOGIN_MEMBERINFO}">
						<td colspan="7"><font>등록된 게시글이 없습니다.</font></td>
					</c:if>
				<c:if test="${not empty groupInfo}">
					<c:if test="${!empty LOGIN_MEMBERINFO}">
							<tr class="danger">							
								<td>
									${groupInfo.grp_comment}
									<input type="hidden" value="">
								</td>
							</tr>
					</c:if>
				</c:if>
			</tbody>
		</table>
	</div>
	<!-- 커멘트 테이블 end  -->
	<!-- 2프로젝트 테이블 -->
	<div id="tab1" class="grpProject" >
		<font>프로젝트 상세정보</font>
		<table class="table table-striped table-hover"  >
			<colgroup>
				<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
					<col width="5%">
				</c:if>
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr class="success">
					<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
						<th scope="col"><input type="checkbox" id="allChecked"></th>
					</c:if>
					<th>Project Name</th>
					<th>Package Name</th>
					<th>Date</th>
				</tr>
			</thead>
				<tbody >
					<c:if test="${empty projectList }">
						<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
							<td colspan="7"><font>등록된 게시글이 없습니다.</font></td>
						</c:if>
						<c:if test="${LOGIN_MEMBERINFO.mem_gubun ne 'A'}">
							<td colspan="6"><font>등록된 게시글이 없습니다.</font></td>
						</c:if>
					</c:if>
 				<c:if test="${not empty projectList}">
					<c:forEach var="projectInfo" items="${projectList}">
						<tr class="danger">							
							<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
								<td class="check">
									<input type="checkbox" name="checkbox" value="${projectInfo.pr_no }">										
								</td>
							</c:if>
							<td>
								${projectInfo.pr_name}
							</td>
							<td class="left">${projectInfo.pr_pkg_nm}</td>
							<td>${fn:split(projectInfo.pr_reg_date, " ")[0]}</td>
							<td> count </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
<!-- 프로젝트 테이블 end  -->
<!-- 3회원 테이블  -->
	<div id="tab2" class="grpMember">
		<font>회원 정보</font>
		<table class="table table-striped table-hover">
			<colgroup>
				<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
					<col width="5%">
				</c:if>
				<col width="25%">
				<col width="53%">
				<col width="70px;">			
			</colgroup>
			<thead>
				<tr class="success" >
					<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
						<th scope="col"><input type="checkbox" id="allChecked"></th>
					</c:if>
					<th style="background-color:#FF8295;">ID</th>
					<th style="background-color:#FF8295;">Mail</th>
					<th style="background-color:#FF8295;">Date</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty boardList }">
					<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
					<td colspan="7"><font>등록된 게시글이 없습니다.</font></td>
				</c:if>
				<c:if test="${LOGIN_MEMBERINFO.mem_gubun ne 'A'}">
					<td colspan="6"><font>등록된 게시글이 없습니다.</font></td>
				</c:if>
				</c:if>
				<c:if test="${not empty boardList}">
					<c:forEach var="boardInfo" items="${boardList }">
						<tr class="danger">							
							<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
								<td class="check">
									<input type="checkbox" name="checkbox" value="${boardInfo.board_no }">										
								</td>
							</c:if>
							<td>
								${boardInfo.rnum}
								<input type="hidden" value="${boardInfo.board_no }">
							</td>
							<td class="left">${boardInfo.board_title}</td>
							<td>${boardInfo.board_writer}</td>
							<td>${fn:substring(boardInfo.board_reg_date, 0, 10) }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
<!-- 회원테이블 end  -->

</div>
</div>
</div>
</div>
</section>
</body>
</html>