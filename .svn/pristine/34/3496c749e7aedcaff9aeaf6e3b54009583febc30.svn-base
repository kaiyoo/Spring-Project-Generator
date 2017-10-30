<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/board/boardList.js"></script>
</head>
<body>
<section id="section" class="container" >
	<div class="center">
    	<div class="col-xs-12 col-sm-99">
			<table class="table table-striped table-hover ">
				<colgroup>
					<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
						<col width="5%">
					</c:if>
					<col width="5%">
					<col width="35%">
					<col width="20%">
					<col width="15%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="success">
						<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
							<th scope="col"><input type="checkbox" id="allChecked"></th>
						</c:if>
						<th>No</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>DATE</th>
						<th>FILE</th>
						<th>HIT</th>
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
								<td align="center">
									<c:if test="${not empty boardInfo.fileList[0]}">
										<img alt="첨부파일" src="${pageContext.request.contextPath }/images/icons/file.png"></img>
									</c:if>
									<c:if test="${empty boardInfo.fileList[0]}">
										<font color="red">X</font>
									</c:if>
								</td>
								<td>									
									${boardInfo.board_hit }
								</td>
							</tr>
						</c:forEach>
					</c:if>
 				</tbody>
 			</table>
 			<div class="btn_area">
 				<div class="btn_left">
 					<c:if test="${LOGIN_MEMBERINFO.mem_gubun eq 'A'}">
	 					<input type="button" name="btn_delete" value="delete" class="btn-delete">
 					</c:if>
 				</div>
 				<div class="btn_right">
 					<input type="button" name="btn_insert" value="write" class="btn-write">
 				</div>
			</div>
			<ul class="pagination pagination-sm">
				${pagingHtml}
			</ul>
			<form action="${pageContext.request.contextPath }/board/${board_gubun}/boardList.do">
				<input type="hidden" id="board_gubun" value="${board_gubun}">
				<div class="right col-xs-98">
					<select name="search_keycode">
						<option value="ALL">전체</option>
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
						<option value="WRITER">작성자</option>
					</select>
					<input type="text" name="search_keyword">
					<input type="submit" name="btn_search" value="search" class="btn-search">
				</div>
			</form>
		</div>
	</div>
</section>
</body>
</html>