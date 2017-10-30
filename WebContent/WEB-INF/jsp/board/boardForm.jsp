<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/board/boardForm.js"></script>

</head>
<body>
<section id="section" class="container">
	<form method="post" name="boardForm"
	   enctype="multipart/form-data" class="col-xs-12 col-sm-99">
		<input type="hidden" id="board_gubun" name="board_gubun" value="${board_gubun}">
		<input type="hidden" id="gubun" value="${gubun}">
		<input type="hidden" name="board_no"  value="${boardInfo.board_no}">
		<div class="form_table">
			<table id="boardTable" border="1" cellspacing="0" summary="게시판 작성." class="board-form solid center">
				<tbody>
					<tr>
						<th scope="row">제 목</th>
						<td>
							<div class="item">
								<input class="i_text" title="제목" type="text" name="board_title" value="${boardInfo.board_title }" />
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">작성자 대화명</th>
						<td>
							<div class="item">
								<input class="i_text" title="작성자대화명" type="text"  name="board_writer" value="${LOGIN_MEMBERINFO.mem_id }" readonly="readonly">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td>
							<div class="item">
								<textarea name="board_content" id="board_content" rows="10" style="width:100%; border: 0;">${boardInfo.board_content }</textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td>
							<div class="item left">
								<input type="file" name="files" id="files" class="i_file"><br/>
								<c:forEach items="${boardInfo.fileList}" var="fileInfo">
									<a class="btn" href="${pageContext.request.contextPath}/board/fileDownload.do?file_name=${fileInfo.file_save_name}&file_no=${fileInfo.file_no}">
										<div class="file-down"><span>${fileInfo.file_name}</span></div>
									</a>
									<a class="file-delete" href="#"><img src="${pageContext.request.contextPath}/images/icons/delete.png" width="15" height="15" title="파일삭제"/></a>
								</c:forEach>
								<input type="hidden" name="orgFileDelYn" value="N"/>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="button_set center">
			<input class="btn_view" type="button" value="등록"/>
			<input class="btn_view" type="reset" value="취소" />
			<input class="btn_view" type="button" value="목록"/>
		</div>
	</form>
</section>
</body>
</html>