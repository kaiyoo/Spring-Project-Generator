<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/board/boardView.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/board/reply.js"></script>
</head>
<section id="section" class="container">
	<div class="col-xs-12 col-sm-99">
		<table class="table table-striped solid">
			<form method="post" name="boardForm" enctype="multipart/form-data">
				<input type="hidden" id="board_no" value="${boardInfo.board_no }">
				<input type="hidden" id="board_gubun" value="${boardInfo.board_gubun }">
				<thead class="boardheader">
					<tr class="text tileview dashed">
						<td class="center">글 제목 &nbsp; &nbsp;|</td>
						<td id="board_title">
							${boardInfo.board_title }
							<!-- <input  id="board_title" value="${boardInfo.board_title }"> -->
						</td>
					</tr>
					<tr class="text dashed">
						<td class="center">글쓴이 &nbsp; &nbsp;|</td>
						<td id="borad-writer">${boardInfo.board_writer }</td>
					</tr>
				</thead>
				<tbody>
					<tr class="text">
						<td colspan="2">
							<div class="board_contents3" id="board_content">
								${boardInfo.board_content }
							</div>
						</td>
					</tr>
					<tr class="text tileview dashed">
						<td class="center">첨부 파일 &nbsp; &nbsp;|</td>
						<td>
							<c:forEach items="${boardInfo.fileList}" var="fileInfo">
								<a href="${pageContext.request.contextPath}/board/fileDownload.do?file_name=${fileInfo.file_save_name}&file_no=${fileInfo.file_no}">${fileInfo.file_name}</a>
							</c:forEach>
						</td>
					</tr>
				</tbody>
				<tr>
					<td colspan="2" class="right">
						<c:if test="${LOGIN_MEMBERINFO.mem_id eq boardInfo.board_writer }">
							<input type="button" value="수정" class="btn_view"> 
							<input type="button" value="삭제" class="btn_view"> 
						</c:if> 
						<input type="button" value="목록" class="btn_view">
					</td>
				</tr>
				<tr>
				</tr>
			</form>
			<tfoot class="reply">
				<tr class="text">
					<div class="col-xs-12 col-sm-99">
						<form name="commentForm" id="commentInsertForm" method="post">
							<input type="hidden" name="reply_board_no" value="${boardInfo.board_no}" /> 
							<input type="hidden" id="login_mem_id" name="reply_writer" value="${LOGIN_MEMBERINFO.mem_id}" />	
							<table class="table table-striped replyForm">
								<tr>
									<td scope="col" class="center">작성자</td>
									<td scope="col" class="reply-content" colspan="2">${LOGIN_MEMBERINFO.mem_id}</td>
								</tr>
								<tr id="comment">
									<th style="padding-top: 18px" scope="row" class="center">Comment</th>
									<td>
										<textarea id="comment_content" name="reply_content" cols="50px"></textarea>
									</td>
									<th style="padding-top: 18px">
										<input type="button" class="btn_reply btn_view" id="btn_comment"  value="댓글달기"  />
									</th>
								</tr>								
							</table>
						</form></br></br>
						<table class="table table-striped replyForm" id="replyArea" >
						</table>
					</div>
				</tr>
			</tfoot>
		</table>
	</div>
</section>
</html>